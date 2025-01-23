package source.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import source.connexion.Seconnecter;

public class Vendeurs {
    private int id;
    private String nom;
    private String adresse;
    private String date_vente;
    private double totalVente;
    private double totalCommision;

    
    public Vendeurs() {
    }

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getNom() {
        return nom;
    }
    public void setNom(String nom) {
        this.nom = nom;
    }
    public String getAdresse() {
        return adresse;
    }
    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }
    public String getDate_vente() {
        return date_vente;
    }
    public void setDate_vente(String date_vente) {
        this.date_vente = date_vente;
    }
    public double getTotalVente() {
        return totalVente;
    }
    public void setTotalVente(double totalVente) {
        this.totalVente = totalVente;
    }
    public double getTotalCommision() {
        return totalCommision;
    }
    public void setTotalCommision(double totalCommision) {
        this.totalCommision = totalCommision;
    }

    public static Vector<Vendeurs> getCommissionsVendeurs(String dateDebut, String dateFin, double commission) throws Exception{
        Vector<Vendeurs> resultats = new Vector<Vendeurs>();

        String query = """
                SELECT 
                    l.id AS vendeur_id,
                    l.nom_laboratoire AS vendeur_nom,
                    l.adresse AS vendeur_adresse,
                    SUM(v.quantite * p.prix) AS total_vente,
                    SUM(v.quantite * p.prix) * ? AS total_commission
                FROM 
                    Vente v
                INNER JOIN Laboratoires l ON v.id_laboratoire = l.id
                INNER JOIN Produits p ON v.id_produits = p.id
                WHERE 
                    v.date_vente BETWEEN ? AND ?
                GROUP BY 
                    l.id, l.nom_laboratoire, l.adresse
                ORDER BY 
                    total_commission DESC
                """;

        try (Connection conn = Seconnecter.connect(); 
            PreparedStatement stmt = conn.prepareStatement(query)) {

            // Lier les paramètres de la requête
            stmt.setDouble(1, commission / 100); // Convertir le pourcentage en valeur décimale
            stmt.setDate(2, java.sql.Date.valueOf(dateDebut));
            stmt.setDate(3, java.sql.Date.valueOf(dateFin));

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Vendeurs vendeur = new Vendeurs();
                    vendeur.setId(rs.getInt("vendeur_id"));
                    vendeur.setNom(rs.getString("vendeur_nom"));
                    vendeur.setAdresse(rs.getString("vendeur_adresse"));
                    vendeur.setTotalVente(rs.getDouble("total_vente"));
                    vendeur.setTotalCommision(rs.getDouble("total_commission"));

                    resultats.add(vendeur);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Erreur lors de l'exécution de la recherche des commissions : " + e.getMessage());
        }

        return resultats;
    }


    
}
