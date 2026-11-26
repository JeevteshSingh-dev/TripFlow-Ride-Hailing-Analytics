
-- 7. Total fare of completed rides
SELECT ROUND(SUM(r.fare), 2) AS completed_ride_fares
FROM rides AS r
JOIN ride_statuses AS rs
    ON r.status_id = rs.status_id
WHERE rs.status_code = 'RIDE_COMPLETED';

-- 8. Average completed-ride fare
SELECT ROUND(AVG(r.fare), 2) AS average_fare
FROM rides AS r
JOIN ride_statuses AS rs
    ON r.status_id = rs.status_id
WHERE rs.status_code = 'RIDE_COMPLETED';

-- 9. Highest completed-ride fare
SELECT MAX(r.fare) AS highest_fare
FROM rides AS r
JOIN ride_statuses AS rs
    ON r.status_id = rs.status_id
WHERE rs.status_code = 'RIDE_COMPLETED';

-- 10. Average distance of completed rides
SELECT ROUND(AVG(r.distance_km), 2) AS average_distance_km
FROM rides AS r
JOIN ride_statuses AS rs
    ON r.status_id = rs.status_id
WHERE rs.status_code = 'RIDE_COMPLETED';

-- 11. Average fare per kilometre
SELECT
    ROUND(
        SUM(r.fare) / NULLIF(SUM(r.distance_km), 0),
        2
    ) AS weighted_fare_per_km
FROM rides AS r
JOIN ride_statuses AS rs
    ON r.status_id = rs.status_id
WHERE rs.status_code = 'RIDE_COMPLETED'
  AND r.fare IS NOT NULL
  AND r.distance_km > 0;
