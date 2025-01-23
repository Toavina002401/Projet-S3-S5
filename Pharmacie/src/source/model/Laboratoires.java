package source.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

import source.connexion.Seconnecter;

public class Laboratoires {
    private int id;
    private String nom_laboratoire;
    private String adresse;
    private int idGenre;

    public int getIdGenre() {
        return idGenre;
    }

    public void setIdGenre(int idGenre) {
        this.idGenre = idGenre;
    }

    public Laboratoires(int id, String nom_laboratoire, String adresse) {
        this.id = id;
        this.nom_laboratoire = nom_laboratoire;
        this.adresse = adresse;
    }

    public Laboratoires() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom_laboratoire() {
        return nom_laboratoire;
    }

    public void setNom_laboratoire(String nom_laboratoire) {
        this.nom_laboratoire = nom_laboratoire;
    }

    public String getAdresse() {
        return adresse;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    public static Laboratoires getById(int id)throws Exception {
        Laboratoires labo = new Laboratoires();
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rsl = null;
        try {
            conn = Seconnecter.connect();
            pstm = conn.prepareStatement("select * from Laboratoires where id=?");
            pstm.setInt(1, id);
            rsl = pstm.executeQuery();
            while (rsl.next()) {
                labo.setId(rsl.getInt(1));
                labo.setNom_laboratoire(rsl.getString(2));
                labo.setAdresse(rsl.getString(3));
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
        return labo;
    }

    public static Vector<Laboratoires> getAll() throws Exception {
        Vector<Laboratoires> valiny=new Vector<Laboratoires>();
        Connection conn = null;
        Statement stm = null;
        ResultSet rsl = null;
        try {
            conn = Seconnecter.connect();
            stm = conn.createStatement();
            rsl = stm.executeQuery("select * from Laboratoires");
            while (rsl.next()) {
                Laboratoires labo = new Laboratoires();
                labo.setId(rsl.getInt(1));
                labo.setNom_laboratoire(rsl.getString(2));
                labo.setAdresse(rsl.getString(3));
                labo.setIdGenre(rsl.getInt(4));
                valiny.add(labo);
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
            pstm = conn.prepareStatement("INSERT INTO Laboratoires (nom_laboratoire, adresse,id_sexe) VALUES (?,?,?)");
            pstm.setString(1, this.getNom_laboratoire());
            pstm.setString(2, this.getAdresse());
            pstm.setInt(3, this.getIdGenre());
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
            pstm = conn.prepareStatement("delete from Laboratoires where id=?");
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
            pstm = conn.prepareStatement("delete from Laboratoires where id=?");
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

    public static void update(Laboratoires labo)throws Exception{
        Connection conn = null;
        PreparedStatement pstm = null;
        try {
            conn = Seconnecter.connect();
            pstm = conn.prepareStatement("update Laboratoires set nom_laboratoire=? , adresse=? , id_sexe = ? where id=?");
            pstm.setString(1, labo.getNom_laboratoire());
            pstm.setString(2, labo.getAdresse());
            pstm.setInt(3, labo.getIdGenre());
            pstm.setInt(4, labo.getId());
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
            pstm = conn.prepareStatement("update Laboratoires set nom_laboratoire=? , adresse=? , id_sexe = ? where id=?");
            pstm.setString(1, this.getNom_laboratoire());
            pstm.setString(2, this.getAdresse());
            pstm.setInt(3, this.getIdGenre());
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

}
