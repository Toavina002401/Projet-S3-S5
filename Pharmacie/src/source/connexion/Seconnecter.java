package source.connexion;

import java.sql.Connection;
import java.sql.DriverManager;

public class Seconnecter {
    private static String url = "jdbc:postgresql://localhost:5432/Pharmacie";
    private static String user = "postgres";
    private static String password = "Belouh";

    public static Connection connect() throws Exception {
        Class.forName("org.postgresql.Driver");
        Connection connect = DriverManager.getConnection(url, user, password);
        return connect;
    }
}
