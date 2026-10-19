package com.hhgy.dao;

import com.hhgy.model.User;
import com.hhgy.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/** Data Access Object for the 'users' (and joined 'volunteers') table. */
public class UserDAO {

    /** Register a Senior or Volunteer. Returns generated user_id, or -1 on failure. */
    public int register(User u) {
        String sql = "INSERT INTO users (name, age, gender, phone, email, address, password, role) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setString(1, u.getName());
            ps.setInt   (2, u.getAge());
            ps.setString(3, u.getGender());
            ps.setString(4, u.getPhone());
            ps.setString(5, u.getEmail());
            ps.setString(6, u.getAddress());
            ps.setString(7, u.getPassword());
            ps.setString(8, u.getRole());

            int rows = ps.executeUpdate();
            if (rows > 0) {
                try (ResultSet keys = ps.getGeneratedKeys()) {
                    if (keys.next()) return keys.getInt(1);
                }
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return -1;
    }

    /** Authenticate by email + password. Returns null if no match. */
    public User login(String email, String password) {
        String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {

            ps.setString(1, email);
            ps.setString(2, password);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return map(rs);
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return null;
    }

    public User findById(int userId) {
        String sql = "SELECT * FROM users WHERE user_id = ?";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return map(rs);
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return null;
    }

    public List<User> findByRole(String role) {
        List<User> list = new ArrayList<>();
        String sql = "SELECT * FROM users WHERE role = ? ORDER BY user_id DESC";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, role);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) list.add(map(rs));
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }

    /** Returns volunteers along with verification status. */
    public List<User> findAllVolunteers() {
        List<User> list = new ArrayList<>();
        String sql = "SELECT u.*, v.id_proof_number, v.verification_status "
                   + "FROM users u JOIN volunteers v ON u.user_id = v.user_id "
                   + "WHERE u.role = 'VOLUNTEER' ORDER BY u.user_id DESC";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                User u = map(rs);
                u.setIdProofNumber(rs.getString("id_proof_number"));
                u.setVerificationStatus(rs.getString("verification_status"));
                list.add(u);
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }

    public boolean deleteUser(int userId) {
        String sql = "DELETE FROM users WHERE user_id = ?";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, userId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); }
        return false;
    }

    public boolean updateProfile(User u) {
        String sql = "UPDATE users SET name=?, age=?, gender=?, phone=?, address=? WHERE user_id=?";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, u.getName());
            ps.setInt   (2, u.getAge());
            ps.setString(3, u.getGender());
            ps.setString(4, u.getPhone());
            ps.setString(5, u.getAddress());
            ps.setInt   (6, u.getUserId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); }
        return false;
    }

    private User map(ResultSet rs) throws SQLException {
        User u = new User();
        u.setUserId  (rs.getInt   ("user_id"));
        u.setName    (rs.getString("name"));
        u.setAge     (rs.getInt   ("age"));
        u.setGender  (rs.getString("gender"));
        u.setPhone   (rs.getString("phone"));
        u.setEmail   (rs.getString("email"));
        u.setAddress (rs.getString("address"));
        u.setPassword(rs.getString("password"));
        u.setRole    (rs.getString("role"));
        return u;
    }
}
