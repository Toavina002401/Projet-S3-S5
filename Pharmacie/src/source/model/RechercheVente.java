package source.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

import source.connexion.Seconnecter;

public class RechercheVente {
    private int id;
    private String nomProduits;
    private String dateVente;
    private double prixUnitaire;
    private int quantite;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNomProduits() {
        return nomProduits;
    }

    public void setNomProduits(String nomProduits) {
        this.nomProduits = nomProduits;
    }

    public String getDateVente() {
        return dateVente;
    }
    
    public void setDateVente(String dateVente) {
        this.dateVente = dateVente;
    }

    public double getPrixUnitaire() {
        return prixUnitaire;
    }

    public void setPrixUnitaire(double prixUnitaire) {
        this.prixUnitaire = prixUnitaire;
    }

    public int getQuantite() {
        return quantite;
    }

    public void setQuantite(int quantite) {
        this.quantite = quantite;
    }

    public static Vector<RechercheVente> getRecherche(int type,int typeAge) throws Exception {
        Vector<RechercheVente> valiny=new Vector<RechercheVente>();
        Connection conn = null;
        Statement stm = null;
        ResultSet rsl = null;
        try {
            conn = Seconnecter.connect();
            stm = conn.createStatement();
            String query = "SELECT v.id AS vente_id, v.date_vente, v.quantite, p.nom_produit, p.description, p.prix, "
                        + "ta.id AS type_age_id, tp.id AS type_produit_id "
                        + "FROM Vente v "
                        + "JOIN Produits p ON v.id_produits = p.id "
                        + "JOIN Produits_TypeAge pta ON p.id = pta.id_produit "
                        + "JOIN TypeAge ta ON pta.id_age = ta.id "
                        + "JOIN Produits_Type pt ON p.id = pt.id_produits "
                        + "JOIN TypeProduits tp ON pt.id_typeProduit = tp.id "
                        + "JOIN Laboratoires l ON v.id_laboratoire = l.id "
                        + "WHERE 1 = 1 ";
            if (type != -1) {
                query += " AND tp.id = "+ type;
            }
            if (typeAge != -1) {
                query += " AND ta.id = "+ typeAge;
            }
            rsl = stm.executeQuery(query);
            while (rsl.next()) {
                RechercheVente prod = new RechercheVente();
                prod.setId(rsl.getInt(1));
                prod.setNomProduits(rsl.getString(4));
                prod.setPrixUnitaire(rsl.getDouble(6));
                prod.setQuantite(rsl.getInt(3));
                prod.setDateVente(rsl.getString(2));
                valiny.add(prod);
            }
        } catch (SQLException e) {
            throw e;
        }finally{
            if (rsl != null) {
                rsl.close();
                stm.close();
                conn.close();
            }
        }
        return valiny;
    }
    
}
