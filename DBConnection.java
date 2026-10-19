package com.hhgy.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Simple JDBC connection helper.
 * Update USER and PASS to match your local MySQL installation.
 */
public class DBConnection {

    private static final String URL  = "jdbc:mysql://localhost:3306/hhgy_db?useSSL=false&serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PASS = "root";   // <-- change this to your MySQL password

    public static Connection getConnection() throws SQLException {
        try {
            // Load the MySQL JDBC driver (mysql-connector-j-*.jar must be in WEB-INF/lib)
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL JDBC Driver not found", e);
        }
        return DriverManager.getConnection(URL, USER, PASS);
    }
}
