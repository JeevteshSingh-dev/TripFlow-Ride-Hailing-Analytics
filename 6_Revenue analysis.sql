
-- 16. Revenue by pickup city
SELECT
    c.city_name,
    COUNT(*) AS completed_rides,
    ROUND(SUM(r.fare), 2) AS total_fare_revenue,
    ROUND(AVG(r.fare), 2) AS average_fare
FROM rides AS r
JOIN cities AS c
    ON r.pickup_city_id = c.city_id
JOIN ride_statuses AS rs
    ON r.status_id = rs.status_id
WHERE rs.status_code = 'RIDE_COMPLETED'
GROUP BY c.city_id, c.city_name
ORDER BY total_fare_revenue DESC;

--  Revenue by drop city
SELECT
    c.city_name,
    ROUND(SUM(r.fare), 2) AS total_fare_revenue
FROM rides AS r
JOIN cities AS c
    ON r.drop_city_id = c.city_id
JOIN ride_statuses AS rs
    ON r.status_id = rs.status_id
WHERE rs.status_code = 'RIDE_COMPLETED'
GROUP BY c.city_id, c.city_name
ORDER BY total_fare_revenue DESC;

--  Drivers generating more than ₹50,000 in fare
SELECT
    d.driver_id,
    CONCAT(d.first_name, ' ', d.last_name) AS driver_name,
    COUNT(*) AS completed_rides,
    ROUND(SUM(r.fare), 2) AS total_fare
FROM drivers AS d
JOIN rides AS r
    ON d.driver_id = r.driver_id
JOIN ride_statuses AS rs
    ON r.status_id = rs.status_id
WHERE rs.status_code = 'RIDE_COMPLETED'
GROUP BY d.driver_id, d.first_name, d.last_name
HAVING SUM(r.fare) > 50000
ORDER BY total_fare DESC;

--  Average fare by pickup city
SELECT
    c.city_name,
    ROUND(AVG(r.fare), 2) AS average_fare,
    COUNT(*) AS completed_rides
FROM rides AS r
JOIN cities AS c
    ON r.pickup_city_id = c.city_id
JOIN ride_statuses AS rs
    ON r.status_id = rs.status_id
WHERE rs.status_code = 'RIDE_COMPLETED'
GROUP BY c.city_id, c.city_name
HAVING AVG(r.fare) > 250
ORDER BY average_fare DESC;

--  Fare distribution by distance band
SELECT
    CASE
        WHEN r.distance_km < 5 THEN 'Under 5 km'
        WHEN r.distance_km < 10 THEN '5–9.99 km'
        WHEN r.distance_km < 20 THEN '10–19.99 km'
        ELSE '20 km and above'
    END AS distance_band,
    COUNT(*) AS completed_rides,
    ROUND(AVG(r.fare), 2) AS average_fare,
    ROUND(AVG(r.fare / NULLIF(r.distance_km, 0)), 2)
        AS average_fare_per_km
FROM rides AS r
JOIN ride_statuses AS rs
    ON r.status_id = rs.status_id
WHERE rs.status_code = 'RIDE_COMPLETED'
  AND r.distance_km > 0
GROUP BY distance_band
ORDER BY MIN(r.distance_km);
