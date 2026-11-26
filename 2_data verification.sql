
#The output of the row-count query.
SELECT 'cities' AS table_name, COUNT(*) AS total_rows FROM cities
UNION ALL
SELECT 'customers', COUNT(*) FROM customers
UNION ALL
SELECT 'drivers', COUNT(*) FROM drivers
UNION ALL
SELECT 'vehicle_types', COUNT(*) FROM vehicle_types
UNION ALL
SELECT 'vehicles', COUNT(*) FROM vehicles
UNION ALL
SELECT 'ride_statuses', COUNT(*) FROM ride_statuses
UNION ALL
SELECT 'rides', COUNT(*) FROM rides
UNION ALL
SELECT 'payments', COUNT(*) FROM payments
UNION ALL
SELECT 'ratings', COUNT(*) FROM ratings;

#The output of the ride-status query.
SELECT
    rs.status_code,
    COUNT(*) AS total_rides,
    SUM(r.driver_id IS NULL) AS rides_without_driver,
    SUM(r.start_time IS NULL) AS rides_without_start_time,
    SUM(r.end_time IS NULL) AS rides_without_end_time,
    SUM(r.fare IS NULL) AS rides_without_fare
FROM rides AS r
JOIN ride_statuses AS rs
    ON r.status_id = rs.status_id
GROUP BY rs.status_code
ORDER BY total_rides DESC;
