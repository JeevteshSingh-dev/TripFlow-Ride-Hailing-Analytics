

-- 1. Total rides
SELECT COUNT(*) AS total_rides
FROM rides;

-- 2. Total customers
SELECT COUNT(*) AS total_customers
FROM customers;

-- 3. Total drivers
SELECT COUNT(*) AS total_drivers
FROM drivers;

-- 4. Number of rides by status
SELECT
    rs.status_code,
    COUNT(*) AS total_rides
FROM rides AS r
JOIN ride_statuses AS rs
    ON r.status_id = rs.status_id
GROUP BY rs.status_code
ORDER BY total_rides DESC;

-- 5. Total rides by pickup city
SELECT
    c.city_name,
    COUNT(*) AS total_rides
FROM rides AS r
JOIN cities AS c
    ON r.pickup_city_id = c.city_id
GROUP BY c.city_id, c.city_name
ORDER BY total_rides DESC;

-- 6. Total rides by drop city
SELECT
    c.city_name,
    COUNT(*) AS total_rides
FROM rides AS r
JOIN cities AS c
    ON r.drop_city_id = c.city_id
GROUP BY c.city_id, c.city_name
ORDER BY total_rides DESC;



