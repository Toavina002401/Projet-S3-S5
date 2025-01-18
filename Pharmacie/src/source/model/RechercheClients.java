package source.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import source.connexion.Seconnecter;

public class RechercheClients {
    private int id;
    private String nomClient;
    private String dateDeVente;
    private String nomProduits;
    private int quantite;
    
    public RechercheClients() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNomClient() {
        return nomClient;
    }

    public void setNomClient(String nomClient) {
        this.nomClient = nomClient;
    }

    public String getDateDeVente() {
        return dateDeVente;
    }

    public void setDateDeVente(String dateDeVente) {
        this.dateDeVente = dateDeVente;
    }

    public String getNomProduits() {
        return nomProduits;
    }

    public void setNomProduits(String nomProduits) {
        this.nomProduits = nomProduits;
    }

    public int getQuantite() {
        return quantite;
    }

    public void setQuantite(int quantite) {
        this.quantite = quantite;
    }

    public static Vector<RechercheClients> rechercheClient(String dateDonne) throws Exception {
        Vector<RechercheClients> resultats = new Vector<>();

        // SQL pour récupérer les données nécessaires
        String query = """
                SELECT 
                    c.id AS client_id,
                    c.nom AS client_nom,
                    v.date_vente,
                    p.nom_produit,
                    v.quantite
                FROM 
                    Vente v
                INNER JOIN Client c ON v.id_client = c.id
                INNER JOIN Produits p ON v.id_produits = p.id
                WHERE 
                    DATE(v.date_vente) = ?
                """;

        try (Connection conn = Seconnecter.connect(); // Connexion à la base
            PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setDate(1, java.sql.Date.valueOf(dateDonne));
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    RechercheClients rc = new RechercheClients();
                    rc.setId(rs.getInt("client_id"));
                    rc.setNomClient(rs.getString("client_nom"));
                    rc.setDateDeVente(rs.getString("date_vente"));
                    rc.setNomProduits(rs.getString("nom_produit"));
                    rc.setQuantite(rs.getInt("quantite"));
                    // Ajouter l'objet au vecteur
                    resultats.add(rc);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Erreur lors de l'exécution de la recherche : " + e.getMessage());
        }

        return resultats;
    }

    public static Vector<RechercheClients> rechercheClient2(String dateDebut, String dateFin) throws Exception {
        Vector<RechercheClients> resultats = new Vector<>();
        
        // SQL pour récupérer les données entre deux dates
        String query = """
                SELECT 
                    c.id AS client_id,
                    c.nom AS client_nom,
                    v.date_vente,
                    p.nom_produit,
                    v.quantite
                FROM 
                    Vente v
                INNER JOIN Client c ON v.id_client = c.id
                INNER JOIN Produits p ON v.id_produits = p.id
                WHERE 
                    DATE(v.date_vente) BETWEEN ? AND ?
                """;

        try (Connection conn = Seconnecter.connect();
            PreparedStatement stmt = conn.prepareStatement(query)) {

            // Lier les dates au paramètre de la requête
            stmt.setDate(1, java.sql.Date.valueOf(dateDebut));
            stmt.setDate(2, java.sql.Date.valueOf(dateFin));

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    RechercheClients rc = new RechercheClients();
                    rc.setId(rs.getInt("client_id"));
                    rc.setNomClient(rs.getString("client_nom"));
                    rc.setDateDeVente(rs.getString("date_vente"));
                    rc.setNomProduits(rs.getString("nom_produit"));
                    rc.setQuantite(rs.getInt("quantite"));
                    
                    // Ajouter l'objet au vecteur
                    resultats.add(rc);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Erreur lors de l'exécution de la recherche : " + e.getMessage());
        }

        return resultats;
    }

    
}
