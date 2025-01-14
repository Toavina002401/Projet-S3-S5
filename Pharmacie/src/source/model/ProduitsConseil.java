package source.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.Vector;
import java.util.stream.Collectors;

import source.connexion.Seconnecter;

public class ProduitsConseil {
    private int id;
    private String nom_produit;
    private String description;
    private double prix;
    private String mois;
    private int annees;

    public ProduitsConseil() {
    }

    public int getAnnees() {
        return annees;
    }

    public void setAnnees(int annees) {
        this.annees = annees;
    }

    public String getMois() {
        return mois;
    }

    public void setMois(String mois) {
        this.mois = mois;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom_produit() {
        return nom_produit;
    }

    public void setNom_produit(String nom_produit) {
        this.nom_produit = nom_produit;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrix() {
        return prix;
    }

    public void setPrix(double prix) {
        this.prix = prix;
    }

    public static Vector<ProduitsConseil> getAll(List<Integer> lesmois, String annees) throws Exception {
        Vector<ProduitsConseil> valiny = new Vector<>();
        Connection conn = null;
        Statement stm = null;
        ResultSet rsl = null;

        try {
            conn = Seconnecter.connect();
            stm = conn.createStatement();

            // Construction dynamique de la clause WHERE pour les mois
            String moisFilter = lesmois.isEmpty() ? "" : "AND c.id_mois IN (" + lesmois.stream().map(String::valueOf).collect(Collectors.joining(",")) + ")";
            String query = """
                SELECT 
                    p.id AS id_produit,
                    p.nom_produit,
                    p.description,
                    p.prix,
                    m.libele AS mois,
                    c.annees
                FROM 
                    Produits p
                JOIN 
                    ConseilProduits c ON p.id = c.id_produits
                JOIN 
                    LesMois m ON c.id_mois = m.id
                WHERE 
                    c.annees = '%s' %s
                ORDER BY 
                    c.annees, m.id
            """.formatted(annees, moisFilter);

            rsl = stm.executeQuery(query);

            while (rsl.next()) {
                ProduitsConseil prod = new ProduitsConseil();
                prod.setId(rsl.getInt("id_produit"));
                prod.setNom_produit(rsl.getString("nom_produit"));
                prod.setDescription(rsl.getString("description"));
                prod.setPrix(rsl.getDouble("prix"));
                prod.setMois(rsl.getString("mois"));
                prod.setAnnees(rsl.getInt("annees"));
                valiny.add(prod);
            }
        } catch (SQLException e) {
            throw e;
        } finally {
            if (rsl != null) {
                rsl.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return valiny;
    }

}
