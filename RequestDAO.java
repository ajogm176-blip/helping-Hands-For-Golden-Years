package com.hhgy.dao;

import com.hhgy.model.Request;
import com.hhgy.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/** DAO for the 'requests' table. */
public class RequestDAO {

    public boolean createRequest(Request r) {
        String sql = "INSERT INTO requests (senior_id, category, description, address, request_date, emergency_level, status) "
                   + "VALUES (?, ?, ?, ?, ?, ?, 'PENDING')";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt   (1, r.getSeniorId());
            ps.setString(2, r.getCategory());
            ps.setString(3, r.getDescription());
            ps.setString(4, r.getAddress());
            ps.setDate  (5, r.getRequestDate());
            ps.setString(6, r.getEmergencyLevel());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); }
        return false;
    }

    /** Senior's own requests. */
    public List<Request> getBySenior(int seniorId) {
        String sql = "SELECT r.*, v.name AS volunteer_name "
                   + "FROM requests r LEFT JOIN users v ON r.volunteer_id = v.user_id "
                   + "WHERE r.senior_id = ? ORDER BY r.request_id DESC";
        return query(sql, seniorId);
    }

    /** All PENDING requests for volunteers to pick. */
    public List<Request> getAvailable() {
        String sql = "SELECT r.*, s.name AS senior_name, NULL AS volunteer_name "
                   + "FROM requests r JOIN users s ON r.senior_id = s.user_id "
                   + "WHERE r.status = 'PENDING' ORDER BY r.request_id DESC";
        return queryNoParam(sql);
    }

    /** Requests a particular volunteer has accepted. */
    public List<Request> getByVolunteer(int volunteerId) {
        String sql = "SELECT r.*, s.name AS senior_name "
                   + "FROM requests r JOIN users s ON r.senior_id = s.user_id "
                   + "WHERE r.volunteer_id = ? ORDER BY r.request_id DESC";
        return query(sql, volunteerId);
    }

    /** Admin: every request in the system. */
    public List<Request> getAll() {
        String sql = "SELECT r.*, s.name AS senior_name, v.name AS volunteer_name "
                   + "FROM requests r "
                   + "JOIN users s ON r.senior_id = s.user_id "
                   + "LEFT JOIN users v ON r.volunteer_id = v.user_id "
                   + "ORDER BY r.request_id DESC";
        return queryNoParam(sql);
    }

    public boolean acceptRequest(int requestId, int volunteerId) {
        String sql = "UPDATE requests SET status='ACCEPTED', volunteer_id=? "
                   + "WHERE request_id=? AND status='PENDING'";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, volunteerId);
            ps.setInt(2, requestId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); }
        return false;
    }

    public boolean completeRequest(int requestId, int volunteerId) {
        String sql = "UPDATE requests SET status='COMPLETED' "
                   + "WHERE request_id=? AND volunteer_id=? AND status='ACCEPTED'";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, requestId);
            ps.setInt(2, volunteerId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); }
        return false;
    }

    // -------- helpers --------
    private List<Request> query(String sql, int param) {
        List<Request> list = new ArrayList<>();
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, param);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) list.add(map(rs));
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }

    private List<Request> queryNoParam(String sql) {
        List<Request> list = new ArrayList<>();
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) list.add(map(rs));
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }

    private Request map(ResultSet rs) throws SQLException {
        Request r = new Request();
        r.setRequestId     (rs.getInt   ("request_id"));
        r.setSeniorId      (rs.getInt   ("senior_id"));
        r.setVolunteerId   (rs.getInt   ("volunteer_id"));
        r.setCategory      (rs.getString("category"));
        r.setDescription   (rs.getString("description"));
        r.setAddress       (rs.getString("address"));
        r.setRequestDate   (rs.getDate  ("request_date"));
        r.setEmergencyLevel(rs.getString("emergency_level"));
        r.setStatus        (rs.getString("status"));
        // Optional joined columns
        try { r.setSeniorName   (rs.getString("senior_name"));    } catch (SQLException ignored) {}
        try { r.setVolunteerName(rs.getString("volunteer_name")); } catch (SQLException ignored) {}
        return r;
    }
}
