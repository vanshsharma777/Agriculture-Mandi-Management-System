-- =========================================================
-- AGRICULTURE PRODUCE MARKET (MANDI) MANAGEMENT SYSTEM
-- Complete Database
-- =========================================================
-- CREATE DATABASE
CREATE DATABASE IF NOT EXISTS mandi_management;

USE mandi_management;


-- =========================================================
-- 2. REMOVE OLD TABLES
-- =========================================================

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS daily_prices;
DROP TABLE IF EXISTS farmers;
DROP TABLE IF EXISTS traders;
DROP TABLE IF EXISTS commodities;
DROP TABLE IF EXISTS users;

SET FOREIGN_KEY_CHECKS = 1;


-- =========================================================
-- 3. USERS TABLE
-- Used for Login
-- =========================================================

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL
);


-- Default Admin Login
INSERT INTO users (username, password)
VALUES ('admin', 'admin123');


-- =========================================================
-- 4. FARMERS TABLE
-- =========================================================

CREATE TABLE farmers (
    farmer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    address VARCHAR(200)
);


-- =========================================================
-- 5. TRADERS TABLE
-- =========================================================

CREATE TABLE traders (
    trader_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    business_name VARCHAR(150)
);


-- =========================================================
-- 6. COMMODITIES TABLE
-- =========================================================

CREATE TABLE commodities (
    commodity_id INT PRIMARY KEY AUTO_INCREMENT,
    commodity_name VARCHAR(100) NOT NULL,
    unit VARCHAR(20) DEFAULT 'Quintal'
);


-- =========================================================
-- 7. DAILY PRICES TABLE
-- =========================================================

CREATE TABLE daily_prices (
    price_id INT PRIMARY KEY AUTO_INCREMENT,
    commodity_id INT NOT NULL,
    price_date DATE NOT NULL,
    min_price DOUBLE NOT NULL,
    max_price DOUBLE NOT NULL,
    modal_price DOUBLE NOT NULL,

    FOREIGN KEY (commodity_id)
    REFERENCES commodities(commodity_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


-- =========================================================
-- 8. TRANSACTIONS TABLE
-- =========================================================

CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,

    farmer_id INT NOT NULL,
    trader_id INT NOT NULL,
    commodity_id INT NOT NULL,

    quantity DOUBLE NOT NULL,
    price_per_quintal DOUBLE NOT NULL,
    total_amount DOUBLE NOT NULL,

    transaction_date DATE NOT NULL,

    FOREIGN KEY (farmer_id)
    REFERENCES farmers(farmer_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,

    FOREIGN KEY (trader_id)
    REFERENCES traders(trader_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,

    FOREIGN KEY (commodity_id)
    REFERENCES commodities(commodity_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


-- =========================================================
-- 9. INSERT SAMPLE COMMODITIES
-- =========================================================

INSERT INTO commodities
(commodity_name, unit)
VALUES
('Wheat', 'Quintal'),
('Mustard', 'Quintal'),
('Bajra', 'Quintal'),
('Barley', 'Quintal'),
('Soybean', 'Quintal'),
('Gram', 'Quintal'),
('Maize', 'Quintal');


-- =========================================================
-- 10. INSERT SAMPLE FARMERS
-- =========================================================

INSERT INTO farmers
(name, phone, address)
VALUES
('Ramesh Kumar', '9876543210', 'Kota, Rajasthan'),
('Suresh Sharma', '9876543211', 'Bundi, Rajasthan'),
('Mohan Lal', '9876543212', 'Baran, Rajasthan');


-- =========================================================
-- 11. INSERT SAMPLE TRADERS
-- =========================================================

INSERT INTO traders
(name, phone, business_name)
VALUES
('Rajesh Gupta', '9876543220', 'Gupta Agro Traders'),
('Amit Jain', '9876543221', 'Jain Mandi Traders');


-- =========================================================
-- 12. INSERT SAMPLE DAILY PRICES
-- =========================================================

INSERT INTO daily_prices
(commodity_id, price_date, min_price, max_price, modal_price)
VALUES

(1, '2026-09-15', 2100, 2400, 2250),
(1, '2026-09-16', 2150, 2450, 2300),
(1, '2026-09-17', 2200, 2500, 2350),
(1, '2026-09-18', 2180, 2480, 2320),
(1, '2026-09-19', 2250, 2550, 2400),

(2, '2026-09-15', 4800, 5200, 5000),
(2, '2026-09-16', 4900, 5300, 5100),
(2, '2026-09-17', 5000, 5400, 5200),
(2, '2026-09-18', 4950, 5350, 5150),
(2, '2026-09-19', 5100, 5500, 5300);


-- =========================================================
-- 13. INSERT SAMPLE TRANSACTIONS
-- =========================================================

INSERT INTO transactions
(
    farmer_id,
    trader_id,
    commodity_id,
    quantity,
    price_per_quintal,
    total_amount,
    transaction_date
)
VALUES

(1, 1, 1, 10, 2250, 22500, '2026-09-15'),

(2, 2, 2, 5, 5000, 25000, '2026-09-16'),

(3, 1, 1, 8, 2350, 18800, '2026-09-17');


-- =========================================================
-- 14. CHECK TABLES
-- =========================================================

SHOW TABLES;


-- =========================================================
-- 15. CHECK DATA
-- =========================================================

SELECT * FROM users;

SELECT * FROM farmers;

SELECT * FROM traders;

SELECT * FROM commodities;

SELECT * FROM daily_prices;

SELECT * FROM transactions;