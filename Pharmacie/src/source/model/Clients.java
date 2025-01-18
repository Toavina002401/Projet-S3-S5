package source.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

import source.connexion.Seconnecter;

public class Clients {
    private int id;
    private String nom;
    private String telephone;
    private String adresse;
    
    public Clients() {
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
    public String getTelephone() {
        return telephone;
    }
    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }
    public String getAdresse() {
        return adresse;
    }
    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    public static Vector<Clients> getAll() throws Exception {
        Vector<Clients> valiny=new Vector<Clients>();
        Connection conn = null;
        Statement stm = null;
        ResultSet rsl = null;
        try {
            conn = Seconnecter.connect();
            stm = conn.createStatement();
            rsl = stm.executeQuery("select * from client");
            while (rsl.next()) {
                Clients clie = new Clients();
                clie.setId(rsl.getInt(1));
                clie.setNom(rsl.getString(2));
                clie.setTelephone(rsl.getString(3));
                clie.setAdresse(rsl.getString(4));
                valiny.add(clie);
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
