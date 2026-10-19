package com.hhgy.dao;

import com.hhgy.util.DBConnection;
import java.sql.*;

/** DAO for the 'volunteers' table (extra info + admin approval). */
public class VolunteerDAO {

    public boolean insertVolunteer(int userId, String idProof) {
        String sql = "INSERT INTO volunteers (user_id, id_proof_number, verification_status) VALUES (?, ?, 'PENDING')";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setString(2, idProof);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); }
        return false;
    }

    public boolean updateStatus(int userId, String status) {
        String sql = "UPDATE volunteers SET verification_status = ? WHERE user_id = ?";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, status);
            ps.setInt(2, userId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); }
        return false;
    }

    public String getStatus(int userId) {
        String sql = "SELECT verification_status FROM volunteers WHERE user_id = ?";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return rs.getString(1);
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return null;
    }
}
