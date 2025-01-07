package source.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

import source.connexion.Seconnecter;

public class Maladies {
    private int id;
    private String nom_maladie;
    private String symptomes;

    public Maladies(int id, String nom_maladie, String symptomes) {
        this.id = id;
        this.nom_maladie = nom_maladie;
        this.symptomes = symptomes;
    }

    public Maladies() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom_maladie() {
        return nom_maladie;
    }

    public void setNom_maladie(String nom_maladie) {
        this.nom_maladie = nom_maladie;
    }

    public String getSymptomes() {
        return symptomes;
    }
    
    public void setSymptomes(String symptomes) {
        this.symptomes = symptomes;
    }

 
    public static Maladies getById(int id)throws Exception {
        Maladies maladie = new Maladies();
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rsl = null;
        try {
            conn = Seconnecter.connect();
            pstm = conn.prepareStatement("select * from maladies where id=?");
            pstm.setInt(1, id);
            rsl = pstm.executeQuery();
            while (rsl.next()) {
                maladie.setId(rsl.getInt(1));
                maladie.setNom_maladie(rsl.getString(2));
                maladie.setSymptomes(rsl.getString(3));
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
        return maladie;
    }

    public static Vector<Maladies> getAll() throws Exception {
        Vector<Maladies> valiny=new Vector<Maladies>();
        Connection conn = null;
        Statement stm = null;
        ResultSet rsl = null;
        try {
            conn = Seconnecter.connect();
            stm = conn.createStatement();
            rsl = stm.executeQuery("select * from maladies");
            while (rsl.next()) {
                Maladies maladie = new Maladies();
                maladie.setId(rsl.getInt(1));
                maladie.setNom_maladie(rsl.getString(2));
                maladie.setSymptomes(rsl.getString(3));
                valiny.add(maladie);
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
            pstm = conn.prepareStatement("INSERT INTO Maladies (nom_maladie, symptomes) VALUES (?,?)");
            pstm.setString(1, this.getNom_maladie());
            pstm.setString(2, this.getSymptomes());
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
            pstm = conn.prepareStatement("delete from Maladies where id=?");
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
            pstm = conn.prepareStatement("delete from Maladies where id=?");
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

    public static void update(Maladies maladies)throws Exception{
        Connection conn = null;
        PreparedStatement pstm = null;
        try {
            conn = Seconnecter.connect();
            pstm = conn.prepareStatement("update Maladies set nom_maladie=? , symptomes=? where id=?");
            pstm.setString(1, maladies.getNom_maladie());
            pstm.setString(2, maladies.getSymptomes());
            pstm.setInt(3, maladies.getId());
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
            pstm = conn.prepareStatement("update Maladies set nom_maladie=? , symptomes=? where id=?");
            pstm.setString(1, this.getNom_maladie());
            pstm.setString(2, this.getSymptomes());
            pstm.setInt(3, this.getId());
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
