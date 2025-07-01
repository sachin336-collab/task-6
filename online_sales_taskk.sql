
-- STEP 1: Create database
DROP DATABASE IF EXISTS sales_db;
CREATE DATABASE sales_db;
USE sales_db;

-- STEP 2: Create the table
CREATE TABLE online_sales (
    order_date DATE,
    amount DECIMAL(10,2),
    product_id INT
);

-- STEP 3: Insert sample data
INSERT INTO online_sales VALUES
-- Original 10 rows
('2024-01-10', 1000.00, 101),
('2024-01-15', 1500.00, 102),
('2024-02-05', 1200.00, 101),
('2024-02-20', 900.00, 103),
('2024-03-01', 1800.00, 104),
('2024-03-15', 1100.00, 105),
('2024-04-05', 1350.00, 106),
('2024-04-18', 1600.00, 107),
('2024-05-01', 1900.00, 108),
('2024-05-22', 1700.00, 109),

-- 15 More Rows (Extended Sample)
('2023-11-05', 750.00, 201),
('2023-12-15', 880.00, 202),
('2024-06-03', 2200.00, 110),
('2024-06-28', 2400.00, 111),
('2024-07-02', 1300.00, 112),
('2024-07-18', 1450.00, 113),
('2024-08-01', 1650.00, 114),
('2024-08-19', 1750.00, 115),
('2024-09-05', 1850.00, 116),
('2024-10-12', 1950.00, 117),
('2024-11-15', 2050.00, 118),
('2024-12-30', 2150.00, 119),
('2025-01-10', 2250.00, 120),
('2025-02-14', 2350.00, 121),
('2025-03-25', 2450.00, 122);

-- STEP 4: Sample query using all hints

-- A. Extract year and month
SELECT EXTRACT(YEAR FROM order_date) AS year,
       EXTRACT(MONTH FROM order_date) AS month
FROM online_sales
GROUP BY year, month;

-- B. Total revenue
SELECT SUM(amount) AS total_revenue FROM online_sales;

-- C. Total orders
SELECT COUNT(*) AS order_volume FROM online_sales;

-- D. Sales trend grouped by month
SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(*) AS order_volume
FROM online_sales
GROUP BY year, month
ORDER BY year DESC, month DESC
LIMIT 6;
