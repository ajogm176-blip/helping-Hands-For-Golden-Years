-- ============================================================
-- Helping Hands for Golden Years - MySQL Database Schema
-- ============================================================
-- Run this script in MySQL Workbench or command line:
--   mysql -u root -p < schema.sql
-- ============================================================

DROP DATABASE IF EXISTS hhgy_db;
CREATE DATABASE hhgy_db;
USE hhgy_db;

-- ---------------------------
-- Users Table (Senior, Volunteer, Admin)
-- ---------------------------
CREATE TABLE users (
    user_id     INT AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(100) NOT NULL,
    age         INT,
    gender      VARCHAR(10),
    phone       VARCHAR(15),
    email       VARCHAR(100) NOT NULL UNIQUE,
    address     VARCHAR(255),
    password    VARCHAR(100) NOT NULL,
    role        VARCHAR(20)  NOT NULL,   -- SENIOR / VOLUNTEER / ADMIN
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ---------------------------
-- Volunteers Table (extra info + admin approval)
-- ---------------------------
CREATE TABLE volunteers (
    volunteer_id        INT AUTO_INCREMENT PRIMARY KEY,
    user_id             INT NOT NULL,
    id_proof_number     VARCHAR(50),
    verification_status VARCHAR(20) DEFAULT 'PENDING', -- PENDING / APPROVED / REJECTED
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- ---------------------------
-- Requests Table
-- ---------------------------
CREATE TABLE requests (
    request_id      INT AUTO_INCREMENT PRIMARY KEY,
    senior_id       INT NOT NULL,
    volunteer_id    INT DEFAULT NULL,
    category        VARCHAR(50)  NOT NULL,
    description     TEXT,
    address         VARCHAR(255),
    request_date    DATE,
    emergency_level VARCHAR(20),                   -- LOW / MEDIUM / HIGH
    status          VARCHAR(20) DEFAULT 'PENDING', -- PENDING / ACCEPTED / COMPLETED
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (senior_id)    REFERENCES users(user_id)  ON DELETE CASCADE,
    FOREIGN KEY (volunteer_id) REFERENCES users(user_id)  ON DELETE SET NULL
);

-- ---------------------------
-- Emergency Contacts Table
-- ---------------------------
CREATE TABLE emergency_contacts (
    contact_id    INT AUTO_INCREMENT PRIMARY KEY,
    senior_id     INT NOT NULL,
    contact_name  VARCHAR(100),
    relationship  VARCHAR(50),
    phone         VARCHAR(15),
    FOREIGN KEY (senior_id) REFERENCES users(user_id) ON DELETE CASCADE
);

-- ---------------------------
-- Default Admin Account
-- Email: admin@hhgy.com  |  Password: admin123
-- ---------------------------
INSERT INTO users (name, age, gender, phone, email, address, password, role)
VALUES ('System Admin', 35, 'Other', '9999999999',
        'admin@hhgy.com', 'HQ Office', 'admin123', 'ADMIN');
