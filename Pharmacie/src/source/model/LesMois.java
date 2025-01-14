package source.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

import source.connexion.Seconnecter;

public class LesMois {
    private int id;
    private String libele;

    public LesMois(int id, String libele) {
        this.id = id;
        this.libele = libele;
    }

    public LesMois() {
    }

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getLibele() {
        return libele;
    }
    public void setLibele(String libele) {
        this.libele = libele;
    }

    public static Vector<LesMois> getAll() throws Exception {
        Vector<LesMois> valiny=new Vector<LesMois>();
        Connection conn = null;
        Statement stm = null;
        ResultSet rsl = null;
        try {
            conn = Seconnecter.connect();
            stm = conn.createStatement();
            rsl = stm.executeQuery("select * from lesmois");
            while (rsl.next()) {
                LesMois prod = new LesMois();
                prod.setId(rsl.getInt(1));
                prod.setLibele(rsl.getString(2));
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
