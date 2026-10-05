CREATE DATABASE IF NOT EXISTS carpool_db;
USE carpool_db;

CREATE TABLE IF NOT EXISTS tbl_members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    account_type VARCHAR(20) DEFAULT 'PASSENGER'
);

CREATE TABLE IF NOT EXISTS tbl_automobiles (
    auto_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT,
    model_details VARCHAR(100) NOT NULL,
    registration_number VARCHAR(50) NOT NULL UNIQUE,
    FOREIGN KEY (member_id) REFERENCES tbl_members(member_id)
);

CREATE TABLE IF NOT EXISTS tbl_journeys (
    journey_id INT AUTO_INCREMENT PRIMARY KEY,
    driver_id INT,
    origin VARCHAR(100) NOT NULL,
    destination VARCHAR(100) NOT NULL,
    fare_per_seat DOUBLE NOT NULL,
    seat_count INT NOT NULL,
    departure_time DATETIME NOT NULL,
    FOREIGN KEY (driver_id) REFERENCES tbl_members(member_id)
);

CREATE TABLE IF NOT EXISTS tbl_reservations (
    reservation_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT NOT NULL,
    journey_id INT NOT NULL,
    seats INT NOT NULL,
    booking_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (member_id) REFERENCES tbl_members(member_id),
    FOREIGN KEY (journey_id) REFERENCES tbl_journeys(journey_id)
);
