package source.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import source.connexion.Seconnecter;

public class Vente {
    private int id;
    private String date_vente;
    private int idproduits;
    private int idlabo;
    private int quantite;
    private int idclient;


    public Vente(int id, String date_vente, int idproduits, int idlabo, int quantite) {
        this.id = id;
        this.date_vente = date_vente;
        this.idproduits = idproduits;
        this.idlabo = idlabo;
        this.quantite = quantite;
    }

    public int getIdclient() {
        return idclient;
    }


    public void setIdclient(int idclient) {
        this.idclient = idclient;
    }

    public Vente() {
    }


    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public String getDate_vente() {
        return date_vente;
    }

    public void setDate_vente(String date_vente) {
        this.date_vente = date_vente;
    }

    public int getIdproduits() {
        return idproduits;
    }

    public void setIdproduits(int idproduits) {
        this.idproduits = idproduits;
    }

    public int getIdlabo() {
        return idlabo;
    }

    public void setIdlabo(int idlabo) {
        this.idlabo = idlabo;
    }

    public int getQuantite() {
        return quantite;
    }

    public void setQuantite(int quantite) {
        this.quantite = quantite;
    }

    public void save()throws Exception {
        Connection conn = null;
        PreparedStatement pstm = null;
        try {
            conn = Seconnecter.connect();
            String dateTime = this.getDate_vente();
            java.sql.Timestamp timestamp = java.sql.Timestamp.valueOf(dateTime);
            pstm = conn.prepareStatement("INSERT INTO Vente (date_vente, quantite, id_laboratoire, id_produits, id_client) VALUES (?,?,?,?,?)");
            pstm.setTimestamp(1, timestamp);
            pstm.setInt(2, this.getQuantite());
            pstm.setInt(3, this.getIdlabo());
            pstm.setInt(4, this.getIdproduits());
            pstm.setInt(5, this.getIdclient());
            pstm.executeUpdate();
        } catch (SQLException e) {
            conn.rollback();
            throw e;
        }finally{
            if (pstm != null) {
                pstm.close();
                conn.close();
            }
        }
    }
    
    
}