package source.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

import source.connexion.Seconnecter;

public class TypeAge {
    private int id;
    private String libele;
    
    public TypeAge(int id, String libele) {
        this.id = id;
        this.libele = libele;
    }

    public TypeAge() {
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

    public static Vector<TypeAge> getAll() throws Exception {
        Vector<TypeAge> valiny=new Vector<TypeAge>();
        Connection conn = null;
        Statement stm = null;
        ResultSet rsl = null;
        try {
            conn = Seconnecter.connect();
            stm = conn.createStatement();
            rsl = stm.executeQuery("select * from typeage");
            while (rsl.next()) {
                TypeAge prod = new TypeAge();
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
