package source.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

import source.connexion.Seconnecter;

public class Corps {
    private int id;
    private String partie;

    public Corps(int id, String partie) {
        this.id = id;
        this.partie = partie;
    }

    public Corps() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPartie() {
        return partie;
    }

    public void setPartie(String partie) {
        this.partie = partie;
    }

    
    public static Vector<Corps> getAll() throws Exception {
        Vector<Corps> valiny=new Vector<Corps>();
        Connection conn = null;
        Statement stm = null;
        ResultSet rsl = null;
        try {
            conn = Seconnecter.connect();
            stm = conn.createStatement();
            rsl = stm.executeQuery("select * from Corps");
            while (rsl.next()) {
                Corps prod = new Corps();
                prod.setId(rsl.getInt(1));
                prod.setPartie(rsl.getString(2));
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
