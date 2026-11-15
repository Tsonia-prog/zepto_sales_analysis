SELECT
    COUNT(*) FILTER (
        WHERE product_name IS NULL
           OR TRIM(product_name) = ''
    ) AS invalid_product_names,
    COUNT(*) FILTER (
        WHERE category IS NULL
           OR TRIM(category) = ''
    ) AS invalid_categories,
    COUNT(*) FILTER (
        WHERE city IS NULL
           OR TRIM(city) = ''
    ) AS invalid_cities
FROM zepto_sales_clean;

SELECT
    product_name,
    category,
    city,
    COUNT(*) AS occurrences
FROM zepto_sales_clean
GROUP BY
    product_name,
    category,
    city
HAVING COUNT(*) > 1
ORDER BY occurrences DESC;

SELECT
    product_id,
    product_name,
    city,
    original_price,
    current_price,
    discount,
    orders,
    total_revenue,
    influencer_active
FROM zepto_sales_clean
WHERE product_name = 'Nestle Munch'
  AND city = 'Hyderabad'
ORDER BY product_id;

CREATE OR REPLACE VIEW zepto_sales_quality_check AS
SELECT
    product_id,
    product_name,
    category,
    city,
    original_price,
    current_price,
    discount,
    orders,
    total_revenue,
    influencer_active,
    CASE
        WHEN current_price > original_price
        THEN 'Current price higher'
        WHEN current_price < original_price
        THEN 'Current price lower'
        ELSE 'Prices equal'
    END AS price_status,
    CASE
        WHEN discount > 0
             AND current_price >= original_price
        THEN 'Discount inconsistency'
        ELSE 'No obvious inconsistency'
    END AS discount_status,
    CASE
        WHEN total_revenue = orders * current_price
        THEN 'Matches current price'
        WHEN total_revenue = orders * (current_price - 10)
        THEN 'Matches price minus 10'
        ELSE 'Revenue formula unclear'
    END AS revenue_status
FROM zepto_sales_clean;

SELECT *
FROM zepto_sales_quality_check
LIMIT 10;

SELECT
    price_status,
    COUNT(*) AS total_records
FROM zepto_sales_quality_check
GROUP BY price_status
ORDER BY total_records DESC;

SELECT
    discount_status,
    COUNT(*) AS total_records
FROM zepto_sales_quality_check
GROUP BY discount_status;

SELECT
    revenue_status,
    COUNT(*) AS total_records
FROM zepto_sales_quality_check
GROUP BY revenue_status;