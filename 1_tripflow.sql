CREATE DATABASE tripflow;

use tripflow;

-- 1. CITIES TABLE
CREATE TABLE cities (
    city_id INT AUTO_INCREMENT PRIMARY KEY,
    city_name VARCHAR(100) NOT NULL,
    state VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL
);

INSERT INTO cities (
    city_id,
    city_name,
    state,
    country
)
VALUES
    (1, 'Chandigarh', 'Chandigarh', 'India'),
    (2, 'Mohali', 'Punjab', 'India'),
    (3, 'Panchkula', 'Haryana', 'India'),
    (4, 'Delhi', 'Delhi', 'India'),
    (5, 'Zirakpur', 'Punjab', 'India');

-- 2.CUSTOMERS TABLE

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    phone VARCHAR(15) NOT NULL UNIQUE,
    age INT,
    city_id INT,
    signup_date DATE,

    CONSTRAINT fk_customer_city
        FOREIGN KEY (city_id)
        REFERENCES cities(city_id)
);

INSERT INTO customers (
    customer_id,
    first_name,
    last_name,
    email,
    phone,
    age,
    city_id,
    signup_date
)
VALUES
    (1, 'Vikram', 'Bhatia', 'vikram.bhatia@gmail.com', '9876512341', 32, 1, '2025-01-18'),
    (2, 'Karan', 'Malhotra', 'karan.malhotra@gmail.com', '9876512342', 27, 2, '2025-02-06'),
    (3, 'Riya', 'Chawla', 'riya.chawla@gmail.com', '9876512343', 24, 1, '2025-02-22'),
    (4, 'Deepak', 'Sethi', 'deepak.sethi@gmail.com', '9876512344', 35, 3, '2025-03-14'),
    (5, 'Nisha', 'Kapoor', 'nisha.kapoor@gmail.com', '9876512345', 29, 4, '2025-03-29'),
    (6, 'Harpreet', 'Gill', 'harpreet.gill@gmail.com', '9876512346', 26, 2, '2025-04-11'),
    (7, 'Manish', 'Arora', 'manish.arora@gmail.com', '9876512347', 33, 5, '2025-04-27'),
    (8, 'Pooja', 'Saini', 'pooja.saini@gmail.com', '9876512348', 25, 1, '2025-05-09'),
    (9, 'Sahil', 'Ahuja', 'sahil.ahuja@gmail.com', '9876512349', 30, 3, '2025-05-24'),
    (10, 'Meenakshi', 'Grewal', 'meenakshi.grewal@gmail.com', '9876512350', 28, 4, '2025-06-08'),
    (11, 'Tarun', 'Bhalla', 'tarun.bhalla@gmail.com', '9876512351', 36, 2, '2025-06-21');

-- 3. DRIVERS TABLE

CREATE TABLE drivers (
    driver_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    phone VARCHAR(15) NOT NULL UNIQUE,
    city_id INT,
    rating DECIMAL(2,1),
    joining_date DATE,
    status VARCHAR(20),

    CONSTRAINT fk_driver_city
        FOREIGN KEY (city_id)
        REFERENCES cities(city_id)
);

INSERT INTO drivers (
    driver_id,
    first_name,
    last_name,
    email,
    phone,
    city_id,
    rating,
    joining_date,
    status
)
VALUES
    (1, 'Naveen', 'Khanna', 'naveen.khanna@gmail.com', '9876521042', 2, 4.6, '2024-02-09', 'ACTIVE'),
    (2, 'Pankaj', 'Sood', 'pankaj.sood@gmail.com', '9876521043', 3, 4.7, '2024-03-17', 'ACTIVE'),
    (3, 'Rohit', 'Agarwal', 'rohit.agarwal@gmail.com', '9876521044', 1, 4.3, '2024-04-06', 'ACTIVE'),
    (4, 'Mohit', 'Duggal', 'mohit.duggal@gmail.com', '9876521045', 4, 4.5, '2024-05-21', 'INACTIVE'),
    (5, 'Jaspreet', 'Brar', 'jaspreet.brar@gmail.com', '9876521046', 2, 4.9, '2024-06-13', 'ACTIVE'),
    (6, 'Abhishek', 'Mittal', 'abhishek.mittal@gmail.com', '9876521047', 5, 4.2, '2024-07-08', 'ACTIVE'),
    (7, 'Shivam', 'Joshi', 'shivam.joshi@gmail.com', '9876521048', 3, 4.4, '2024-08-19', 'ACTIVE'),
    (8, 'Akash', 'Tiwari', 'akash.tiwari@gmail.com', '9876521049', 4, 4.7, '2024-09-11', 'ACTIVE'),
    (9, 'Varun', 'Mehra', 'varun.mehra@gmail.com', '9876521050', 1, 4.1, '2024-10-03', 'INACTIVE'),
    (10, 'Kunal', 'Sethi', 'kunal.sethi@gmail.com', '9876521051', 5, 4.6, '2024-10-27', 'ACTIVE'),
    (11, 'Ankit', 'Wadhwa', 'ankit.wadhwa@gmail.com', '9876521052', 2, 4.8, '2024-11-15', 'ACTIVE');

-- 4. VEHICLES TABLE

CREATE TABLE vehicles (
    vehicle_id INT AUTO_INCREMENT PRIMARY KEY,
    driver_id INT UNIQUE,
    vehicle_type VARCHAR(30) NOT NULL,
    make VARCHAR(50),
    model VARCHAR(50),
    registration_number VARCHAR(20) NOT NULL UNIQUE,
    manufacturing_year YEAR,

    CONSTRAINT fk_vehicle_driver
        FOREIGN KEY (driver_id)
        REFERENCES drivers(driver_id)
);

INSERT INTO vehicles (
    vehicle_id,
    driver_id,
    vehicle_type,
    make,
    model,
    registration_number,
    manufacturing_year
)
VALUES
    (1, 1, 'SEDAN', 'Honda', 'City', 'CH01BX4821', 2022),
    (2, 2, 'SUV', 'Hyundai', 'Creta', 'PB65MN7314', 2023),
    (3, 3, 'HATCHBACK', 'Maruti Suzuki', 'Swift', 'HR05KT6298', 2021),
    (4, 4, 'SEDAN', 'Skoda', 'Slavia', 'CH01QP3157', 2022),
    (5, 5, 'SUV', 'Kia', 'Seltos', 'DL01RV8642', 2023),
    (6, 6, 'SEDAN', 'Honda', 'Amaze', 'PB65HL2946', 2021),
    (7, 7, 'HATCHBACK', 'Tata', 'Altroz', 'HR26CN5173', 2022),
    (8, 8, 'SEDAN', 'Hyundai', 'Verna', 'CH01ZX6835', 2023),
    (9, 9, 'SUV', 'Tata', 'Nexon', 'HR26FG9412', 2022),
    (10, 10, 'HATCHBACK', 'Maruti Suzuki', 'Baleno', 'DL01JK3569', 2021),
    (11, 11, 'SEDAN', 'Volkswagen', 'Virtus', 'PB65TR7284', 2023);

-- 5. RIDES TABLE

CREATE TABLE rides (
    ride_id INT AUTO_INCREMENT PRIMARY KEY,

    customer_id INT NOT NULL,
    driver_id INT,

    pickup_city_id INT NOT NULL,
    drop_city_id INT NOT NULL,

    pickup_location VARCHAR(150),
    drop_location VARCHAR(150),

    request_time DATETIME NOT NULL,
    start_time DATETIME,
    end_time DATETIME,

    distance_km DECIMAL(6,2),
    fare DECIMAL(10,2),

    status VARCHAR(30) NOT NULL,

    CONSTRAINT fk_ride_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),

    CONSTRAINT fk_ride_driver
        FOREIGN KEY (driver_id)
        REFERENCES drivers(driver_id),

    CONSTRAINT fk_ride_pickup_city
        FOREIGN KEY (pickup_city_id)
        REFERENCES cities(city_id),

    CONSTRAINT fk_ride_drop_city
        FOREIGN KEY (drop_city_id)
        REFERENCES cities(city_id)
);

INSERT INTO rides (
    ride_id,
    customer_id,
    driver_id,
    pickup_city_id,
    drop_city_id,
    pickup_location,
    drop_location,
    request_time,
    start_time,
    end_time,
    distance_km,
    fare,
    status
)
VALUES
    (
        1, 1, 1, 1, 2,
        'Sector 35 Chandigarh',
        'Phase 5 Mohali',
        '2026-09-30 07:45:00',
        '2026-09-30 07:53:00',
        '2026-09-30 08:19:00',
        11.80,
        238.00,
        'RIDE_COMPLETED'
    ),

    (
        2, 2, 2, 2, 1,
        'Phase 3B2 Mohali',
        'Sector 22 Chandigarh',
        '2026-09-30 08:20:00',
        '2026-09-30 08:29:00',
        '2026-09-30 08:57:00',
        13.60,
        267.00,
        'RIDE_COMPLETED'
    ),

    (
        3, 3, 3, 3, 1,
        'Sector 8 Panchkula',
        'Sector 17 Chandigarh',
        '2026-09-30 08:50:00',
        '2026-09-30 09:01:00',
        '2026-09-30 09:28:00',
        9.40,
        218.00,
        'RIDE_COMPLETED'
    ),

    (
        4, 4, 4, 1, 3,
        'Sector 34 Chandigarh',
        'Sector 11 Panchkula',
        '2026-09-30 09:15:00',
        '2026-09-30 09:23:00',
        '2026-09-30 09:51:00',
        12.10,
        252.00,
        'RIDE_COMPLETED'
    ),

    (
        5, 5, NULL, 2, 1,
        'Phase 7 Mohali',
        'Sector 34 Chandigarh',
        '2026-09-30 09:40:00',
        NULL,
        NULL,
        NULL,
        NULL,
        'SEARCHING_DRIVER'
    ),

    (
        6, 6, 6, 1, 2,
        'Sector 43 Chandigarh',
        'Phase 8 Mohali',
        '2026-09-30 10:05:00',
        '2026-09-30 10:14:00',
        '2026-09-30 10:46:00',
        15.70,
        312.00,
        'RIDE_COMPLETED'
    ),

    (
        7, 7, 7, 3, 1,
        'Sector 20 Panchkula',
        'Sector 15 Chandigarh',
        '2026-09-30 10:30:00',
        '2026-09-30 10:39:00',
        NULL,
        8.90,
        NULL,
        'RIDE_STARTED'
    ),

    (
        8, 8, 8, 1, 2,
        'Sector 17 Chandigarh',
        'Phase 7 Mohali',
        '2026-09-30 11:00:00',
        NULL,
        NULL,
        NULL,
        NULL,
        'DRIVER_CANCELLED'
    ),

    (
        9, 9, 9, 2, 3,
        'Phase 1 Mohali',
        'Sector 9 Panchkula',
        '2026-09-30 11:25:00',
        '2026-09-30 11:34:00',
        '2026-09-30 12:08:00',
        17.30,
        345.00,
        'RIDE_COMPLETED'
    ),

    (
        10, 10, 10, 1, 4,
        'Sector 22 Chandigarh',
        'Golf Course Road Gurugram',
        '2026-09-30 12:10:00',
        '2026-09-30 12:18:00',
        '2026-09-30 13:05:00',
        38.50,
        725.00,
        'RIDE_COMPLETED'
    ),

    (
        11, 11, 11, 4, 3,
        'Sector 11 Panchkula',
        'Sector 26 Chandigarh',
        '2026-09-30 12:45:00',
        '2026-09-30 12:54:00',
        '2026-09-30 13:21:00',
        10.60,
        229.00,
        'RIDE_COMPLETED'
    );

-- 6 PAYMENTS TABLE

CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,

    ride_id INT NOT NULL UNIQUE,

    payment_method VARCHAR(30) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_status VARCHAR(20) NOT NULL,
    payment_time DATETIME,

    CONSTRAINT fk_payment_ride
        FOREIGN KEY (ride_id)
        REFERENCES rides(ride_id)
);

INSERT INTO payments (
    ride_id,
    payment_method,
    amount,
    payment_status,
    payment_time
)
VALUES
    (1, 'UPI', 238.00, 'PAID', '2026-09-30 08:20:00'),
    (2, 'CREDIT_CARD', 267.00, 'PAID', '2026-09-30 08:58:00'),
    (3, 'UPI', 218.00, 'PAID', '2026-09-30 09:29:00'),
    (4, 'CASH', 252.00, 'PAID', '2026-09-30 09:52:00'),
    (6, 'UPI', 312.00, 'PAID', '2026-09-30 10:47:00'),
    (9, 'DEBIT_CARD', 345.00, 'PAID', '2026-09-30 12:09:00'),
    (10, 'UPI', 725.00, 'PAID', '2026-09-30 13:06:00'),
    (11, 'CASH', 229.00, 'PAID', '2026-09-30 13:22:00');

-- 7. RATINGS TABLE

CREATE TABLE ratings (
    rating_id INT AUTO_INCREMENT PRIMARY KEY,

    ride_id INT NOT NULL UNIQUE,
    customer_id INT NOT NULL,
    driver_id INT NOT NULL,

    rating DECIMAL(2,1) NOT NULL,
    comment VARCHAR(255),
    rating_time DATETIME,

    CONSTRAINT fk_rating_ride
        FOREIGN KEY (ride_id)
        REFERENCES rides(ride_id),

    CONSTRAINT fk_rating_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),

    CONSTRAINT fk_rating_driver
        FOREIGN KEY (driver_id)
        REFERENCES drivers(driver_id)
);

INSERT INTO ratings (
    ride_id,
    customer_id,
    driver_id,
    rating,
    comment,
    rating_time
)
VALUES
    (1, 1, 1, 5.0, 'Excellent ride and very professional driver.', '2026-09-30 08:21:00'),

    (2, 2, 2, 4.5, 'Smooth ride and good driving.', '2026-09-30 08:59:00'),

    (3, 3, 3, 4.0, 'Good experience and comfortable ride.', '2026-09-30 09:30:00'),

    (4, 4, 4, 4.5, 'Driver was polite and reached on time.', '2026-09-30 09:53:00'),

    (6, 6, 6, 5.0, 'Very good driver and clean vehicle.', '2026-09-30 10:48:00'),

    (9, 9, 9, 4.0, 'Good ride but travel time was slightly long.', '2026-09-30 12:10:00'),

    (10, 10, 10, 5.0, 'Excellent long-distance ride.', '2026-09-30 13:07:00'),

    (11, 11, 11, 4.5, 'Comfortable ride and professional driver.', '2026-09-30 13:23:00');

SHOW TABLES;

SELECT * FROM cities;

SELECT * FROM customers;

SELECT * FROM drivers;

SELECT * FROM vehicles;

SELECT * FROM rides;

SELECT * FROM payments;

SELECT * FROM ratings;