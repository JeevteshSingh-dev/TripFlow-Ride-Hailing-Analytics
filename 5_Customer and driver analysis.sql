
-- 12. Customers by city
SELECT
    ci.city_name,
    COUNT(c.customer_id) AS total_customers
FROM cities AS ci
LEFT JOIN customers AS c
    ON ci.city_id = c.city_id
GROUP BY ci.city_id, ci.city_name
ORDER BY total_customers DESC;

-- 13. Drivers by city
SELECT
    ci.city_name,
    COUNT(d.driver_id) AS total_drivers
FROM cities AS ci
LEFT JOIN drivers AS d
    ON ci.city_id = d.city_id
GROUP BY ci.city_id, ci.city_name
ORDER BY total_drivers DESC;

-- 14. Top 10 customers by completed rides
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(*) AS completed_rides
FROM customers AS c
JOIN rides AS r
    ON c.customer_id = r.customer_id
JOIN ride_statuses AS rs
    ON r.status_id = rs.status_id
WHERE rs.status_code = 'RIDE_COMPLETED'
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY completed_rides DESC
LIMIT 10;

-- 15. Drivers and their completed rides
SELECT
    d.driver_id,
    CONCAT(d.first_name, ' ', d.last_name) AS driver_name,
    COUNT(r.ride_id) AS completed_rides
FROM drivers AS d
LEFT JOIN rides AS r
    ON d.driver_id = r.driver_id
   AND r.status_id = (
       SELECT status_id
       FROM ride_statuses
       WHERE status_code = 'RIDE_COMPLETED'
   )
GROUP BY d.driver_id, d.first_name, d.last_name
ORDER BY completed_rides DESC;
