package source.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import source.connexion.Seconnecter;

public class Commision {
    private int id;
    private String date_maj;
    private double pourcentage;
    
    public Commision() {
    }

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getDate_maj() {
        return date_maj;
    }
    public void setDate_maj(String date_maj) {
        this.date_maj = date_maj;
    }
    public double getPourcentage() {
        return pourcentage;
    }
    public void setPourcentage(double pourcentage) {
        this.pourcentage = pourcentage;
    }

    
    public static Commision getCommisionParDate(String datedonne)throws Exception {
        Commision commission = null;

        String query = """
                SELECT id, date_maj, pourcentage
                FROM Commision
                WHERE date_maj <= ?
                ORDER BY date_maj DESC
                LIMIT 1
                """;

        try (Connection conn = Seconnecter.connect(); 
             PreparedStatement stmt = conn.prepareStatement(query)) {
            // Lier la date donnée
            stmt.setDate(1, java.sql.Date.valueOf(datedonne));

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    commission = new Commision();
                    commission.setId(rs.getInt("id"));
                    commission.setDate_maj(rs.getString("date_maj"));
                    commission.setPourcentage(rs.getDouble("pourcentage"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Erreur lors de la récupération de la commission : " + e.getMessage());
        }

        return commission;
    }
    
}