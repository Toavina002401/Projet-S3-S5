package source.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import source.connexion.Seconnecter;

public class Stocks {
    private int id_produit;
    private String nom_produit;
    private double stock_actuel;

    public Stocks(int id_produit, String nom_produit, double stock_actuel) {
        this.id_produit = id_produit;
        this.nom_produit = nom_produit;
        this.stock_actuel = stock_actuel;
    }

    public Stocks() {
    }

    public int getId_produit() {
        return id_produit;
    }

    public void setId_produit(int id_produit) {
        this.id_produit = id_produit;
    }

    public String getNom_produit() {
        return nom_produit;
    }

    public void setNom_produit(String nom_produit) {
        this.nom_produit = nom_produit;
    }

    public double getStock_actuel() {
        return stock_actuel;
    }
    
    public void setStock_actuel(double stock_actuel) {
        this.stock_actuel = stock_actuel;
    }

    public static Vector<Stocks> getStockDisponible(int idLaboratoire , String date_mvt)throws Exception{
        Vector<Stocks> valiny = new Vector<Stocks>();
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rsl = null;
        try {
            conn = Seconnecter.connect();
            String sql = "SELECT p.id AS id_produit, "
                + "p.nom_produit, "
                + "COALESCE(SUM(ms.entree), 0) - COALESCE(SUM(ms.sortie), 0) AS stock_actuel "
                + "FROM Produits p "
                + "LEFT JOIN MvtStocks ms ON p.id = ms.id_produit "
                + "WHERE ms.date_mvt <= ? "
                + "AND ms.id_laboratoire = ? "
                + "GROUP BY p.id, p.nom_produit";

            pstm = conn.prepareStatement(sql);
            pstm.setString(1, date_mvt);
            pstm.setInt(2, idLaboratoire);
            rsl = pstm.executeQuery();
            while (rsl.next()) {
                Stocks stk = new Stocks();
                stk.setId_produit(rsl.getInt(1));
                stk.setNom_produit(rsl.getString(2));
                stk.setStock_actuel(rsl.getDouble(3));
                valiny.add(stk);
            }
        } catch (SQLException e) {
            throw e;
        }finally{
            if (rsl != null) {
                rsl.close();
                pstm.close();
                conn.close();
            }
        }
        return valiny;
    }
}
