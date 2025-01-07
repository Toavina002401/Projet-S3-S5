package source.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

import source.connexion.Seconnecter;

public class Produits {
    private int id;
    private String nom_produit;
    private String description;
    private double prix;

    public Produits(int id, String nom_produit, String description, double prix) {
        this.id = id;
        this.nom_produit = nom_produit;
        this.description = description;
        this.prix = prix;
    }

    public Produits() {
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


    public static Produits getById(int id)throws Exception {
        Produits prod = new Produits();
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rsl = null;
        try {
            conn = Seconnecter.connect();
            pstm = conn.prepareStatement("select * from produits where id=?");
            pstm.setInt(1, id);
            rsl = pstm.executeQuery();
            while (rsl.next()) {
                prod.setId(rsl.getInt(1));
                prod.setNom_produit(rsl.getString(2));
                prod.setDescription(rsl.getString(3));
                prod.setPrix(rsl.getDouble(4));
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
        return prod;
    }

    public static Vector<Produits> getAll() throws Exception {
        Vector<Produits> valiny=new Vector<Produits>();
        Connection conn = null;
        Statement stm = null;
        ResultSet rsl = null;
        try {
            conn = Seconnecter.connect();
            stm = conn.createStatement();
            rsl = stm.executeQuery("select * from produits");
            while (rsl.next()) {
                Produits prod = new Produits();
                prod.setId(rsl.getInt(1));
                prod.setNom_produit(rsl.getString(2));
                prod.setDescription(rsl.getString(3));
                prod.setPrix(rsl.getDouble(4));
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

    public void save()throws Exception {
        Connection conn = null;
        PreparedStatement pstm = null;
        try {
            conn = Seconnecter.connect();
            pstm = conn.prepareStatement("INSERT INTO Produits (nom_produit, description, prix) VALUES (?,?,?)");
            pstm.setString(1, this.getNom_produit());
            pstm.setString(2, this.getDescription());
            pstm.setDouble(3, this.getPrix());
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

    public void delete()throws Exception{
        Connection conn = null;
        PreparedStatement pstm = null;
        try {
            conn = Seconnecter.connect();
            pstm = conn.prepareStatement("delete from Produits where id=?");
            pstm.setInt(1, this.getId());
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

    public static void delete(int id)throws Exception{
        Connection conn = null;
        PreparedStatement pstm = null;
        try {
            conn = Seconnecter.connect();
            pstm = conn.prepareStatement("delete from Produits where id=?");
            pstm.setInt(1, id);
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

    public static void update(Produits prod)throws Exception{
        Connection conn = null;
        PreparedStatement pstm = null;
        try {
            conn = Seconnecter.connect();
            pstm = conn.prepareStatement("update Produits set nom_produit=? , description=? , prix=? where id=?");
            pstm.setString(1, prod.getNom_produit());
            pstm.setString(2, prod.getDescription());
            pstm.setDouble(3, prod.getPrix());
            pstm.setInt(4, prod.getId());
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
    
    public void update()throws Exception{
        Connection conn = null;
        PreparedStatement pstm = null;
        try {
            conn = Seconnecter.connect();
            pstm = conn.prepareStatement("update Produits set nom_produit=? , description=? , prix=? where id=?");
            pstm.setString(1, this.getNom_produit());
            pstm.setString(2, this.getDescription());
            pstm.setDouble(3, this.getPrix());
            pstm.setInt(4, this.getId());
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

    public static Vector<Produits> getRechercheMulticriter(int corps,int typeAge,String symptome) throws Exception {
        Vector<Produits> valiny=new Vector<Produits>();
        Connection conn = null;
        Statement stm = null;
        ResultSet rsl = null;
        try {
            conn = Seconnecter.connect();
            stm = conn.createStatement();
            String sql = "SELECT * FROM VueProduitsmulticritaire where 1=1 ";
            if (corps != -1) {
                sql += " And id_corps = "+corps;
            }
            if (typeAge != -1) {
                sql += " And id_age= "+typeAge;
            }
            if (symptome != null && !symptome.equals("")) {
                sql += "And symptomes LIKE '%"+symptome+"%'";
            }
            rsl = stm.executeQuery(sql);
            while (rsl.next()) {
                Produits prod = new Produits();
                prod.setId(rsl.getInt(1));
                prod.setNom_produit(rsl.getString(2));
                prod.setDescription(rsl.getString(3));
                prod.setPrix(rsl.getDouble(4));
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
