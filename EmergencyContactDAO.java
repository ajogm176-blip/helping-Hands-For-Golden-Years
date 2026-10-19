package com.hhgy.dao;

import com.hhgy.model.EmergencyContact;
import com.hhgy.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/** DAO for the 'emergency_contacts' table. */
public class EmergencyContactDAO {

    public boolean add(EmergencyContact e) {
        String sql = "INSERT INTO emergency_contacts (senior_id, contact_name, relationship, phone) VALUES (?, ?, ?, ?)";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt   (1, e.getSeniorId());
            ps.setString(2, e.getContactName());
            ps.setString(3, e.getRelationship());
            ps.setString(4, e.getPhone());
            return ps.executeUpdate() > 0;
        } catch (SQLException ex) { ex.printStackTrace(); }
        return false;
    }

    public List<EmergencyContact> getBySenior(int seniorId) {
        List<EmergencyContact> list = new ArrayList<>();
        String sql = "SELECT * FROM emergency_contacts WHERE senior_id = ? ORDER BY contact_id DESC";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, seniorId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    EmergencyContact ec = new EmergencyContact();
                    ec.setContactId   (rs.getInt   ("contact_id"));
                    ec.setSeniorId    (rs.getInt   ("senior_id"));
                    ec.setContactName (rs.getString("contact_name"));
                    ec.setRelationship(rs.getString("relationship"));
                    ec.setPhone       (rs.getString("phone"));
                    list.add(ec);
                }
            }
        } catch (SQLException ex) { ex.printStackTrace(); }
        return list;
    }

    public boolean delete(int contactId, int seniorId) {
        String sql = "DELETE FROM emergency_contacts WHERE contact_id = ? AND senior_id = ?";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, contactId);
            ps.setInt(2, seniorId);
            return ps.executeUpdate() > 0;
        } catch (SQLException ex) { ex.printStackTrace(); }
        return false;
    }
}
