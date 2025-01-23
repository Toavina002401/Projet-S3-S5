package source.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

import source.connexion.Seconnecter;

public class Genre {
    private int id;
    private String sexe;

    
    public Genre() {
    }

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getSexe() {
        return sexe;
    }
    public void setSexe(String sexe) {
        this.sexe = sexe;
    }

    public static Vector<Genre> getAll() throws Exception {
        Vector<Genre> valiny=new Vector<Genre>();
        Connection conn = null;
        Statement stm = null;
        ResultSet rsl = null;
        try {
            conn = Seconnecter.connect();
            stm = conn.createStatement();
            rsl = stm.executeQuery("select * from genre");
            while (rsl.next()) {
                Genre prod = new Genre();
                prod.setId(rsl.getInt(1));
                prod.setSexe(rsl.getString(2));
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
