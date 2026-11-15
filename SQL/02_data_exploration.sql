
-- 1. Total number of records: 300

SELECT COUNT(*) AS total_records
FROM zepto_sales_data;

-- 2. Number of distinct product names: 10

SELECT COUNT(DISTINCT product_name) AS distinct_products
FROM zepto_sales_data;

-- 3. Number of categories and cities: 6 and 6

SELECT
    COUNT(DISTINCT category) AS total_categories,
    COUNT(DISTINCT city) AS total_cities
FROM zepto_sales_data;


-- 4. Check missing values

SELECT
    COUNT(*) FILTER (WHERE product_name IS NULL) AS missing_product_name,
    COUNT(*) FILTER (WHERE category IS NULL) AS missing_category,
    COUNT(*) FILTER (WHERE city IS NULL) AS missing_city,
    COUNT(*) FILTER (WHERE original_price IS NULL) AS missing_original_price,
    COUNT(*) FILTER (WHERE current_price IS NULL) AS missing_current_price,
    COUNT(*) FILTER (WHERE discount IS NULL) AS missing_discount,
    COUNT(*) FILTER (WHERE orders IS NULL) AS missing_orders,
    COUNT(*) FILTER (WHERE total_revenue IS NULL) AS missing_revenue,
    COUNT(*) FILTER (WHERE influencer_active IS NULL) AS missing_influencer_status
FROM zepto_sales_data;


-- 5. Check duplicate records

SELECT
    product_name,
    category,
    city,
    COUNT(*) AS duplicate_count
FROM zepto_sales_data
GROUP BY
    product_name,
    category,
    city
HAVING COUNT(*) > 1
ORDER BY duplicate_count DESC;

SELECT
    product_name,
    category,
    city,
    original_price,
    current_price,
    discount,
    orders,
    total_revenue,
    influencer_active,
    COUNT(*) AS duplicate_count
FROM zepto_sales_data
GROUP BY
    product_name,
    category,
    city,
    original_price,
    current_price,
    discount,
    orders,
    total_revenue,
    influencer_active
HAVING COUNT(*) > 1
ORDER BY duplicate_count DESC;

-- 6. Check Data Consistency

SELECT *
FROM zepto_sales_data
WHERE
    original_price < 0
    OR current_price < 0
    OR discount < 0
    OR discount > 100
    OR orders < 0
    OR total_revenue < 0
    OR current_price > original_price;

-- 7. Investigate Price and Discount Inconsistencies

SELECT
    product_id,
    product_name,
    original_price,
    current_price,
    discount,
    ROUND(
        ((original_price - current_price)
        / NULLIF(original_price, 0)) * 100,
        2
    ) AS calculated_discount
FROM zepto_sales_data
WHERE current_price > original_price
ORDER BY product_id
LIMIT 20;

-- 8. Compare Declared and Calculated Discounts

SELECT
    product_id,
    product_name,
    original_price,
    current_price,
    discount AS declared_discount,
    ROUND(
        ((original_price - current_price)
        / NULLIF(original_price, 0)) * 100,
        2
    ) AS calculated_discount,
    ROUND(
        ABS(
            discount -
            ((original_price - current_price)
            / NULLIF(original_price, 0)) * 100
        ),
        2
    ) AS discount_difference
FROM zepto_sales_data
WHERE original_price > 0
ORDER BY discount_difference DESC
LIMIT 20;

-- 9. Overall Price and Discount Consistency Check

SELECT
    COUNT(*) AS total_records,
    COUNT(*) FILTER (
        WHERE current_price > original_price
    ) AS current_price_higher,
    COUNT(*) FILTER (
        WHERE current_price < original_price
    ) AS current_price_lower,
    COUNT(*) FILTER (
        WHERE current_price = original_price
    ) AS prices_equal,
    COUNT(*) FILTER (
        WHERE discount = 0
    ) AS zero_declared_discount,
    COUNT(*) FILTER (
        WHERE discount > 0
    ) AS positive_declared_discount,
    ROUND(
        100.0 * COUNT(*) FILTER (
            WHERE current_price > original_price
        ) / NULLIF(COUNT(*), 0),
        2
    ) AS percentage_price_anomalies
FROM zepto_sales_data;

-- 10. Analyze Price and Discount Relationships

SELECT
    CASE
        WHEN current_price > original_price
            THEN 'Current price higher'
        WHEN current_price < original_price
            THEN 'Current price lower'
        ELSE 'Prices equal'
    END AS price_status,
    CASE
        WHEN discount = 0
            THEN 'No declared discount'
        ELSE 'Positive declared discount'
    END AS discount_status,
    COUNT(*) AS total_records
FROM zepto_sales_data
GROUP BY
    price_status,
    discount_status
ORDER BY
    price_status,
    discount_status;

-- 11. Analyze Discount Distribution

SELECT
    discount,
    COUNT(*) AS total_records,
    ROUND(
        100.0 * COUNT(*) /
        (SELECT COUNT(*) FROM zepto_sales_data), 2
    ) AS percentage_of_records,
    ROUND(AVG(original_price), 2) AS avg_original_price,
    ROUND(AVG(current_price), 2) AS avg_current_price
FROM zepto_sales_data
GROUP BY discount
ORDER BY discount;

-- 12. Price Consistency by Declared Discount

SELECT
    discount,
     COUNT(*) AS total_records,
    COUNT(*) FILTER (
        WHERE current_price > original_price
    ) AS price_higher,
    COUNT(*) FILTER (
        WHERE current_price < original_price
    ) AS price_lower,
    COUNT(*) FILTER (
        WHERE current_price = original_price
    ) AS prices_equal,
    ROUND(
        AVG(current_price - original_price),2
    ) AS avg_price_difference
FROM zepto_sales_data
GROUP BY discount
ORDER BY discount;

-- 13. Check Revenue Consistency

SELECT
    product_id,
    product_name,
    current_price,
    orders,
    total_revenue,
    ROUND(
        orders * current_price, 2
    ) AS calculated_revenue,
    ROUND(
        total_revenue - (orders * current_price), 2
    ) AS revenue_difference
FROM zepto_sales_data
ORDER BY ABS(
    total_revenue - (orders * current_price)
) DESC
LIMIT 20;

-- 14. Investigate Revenue Calculation Pattern

SELECT
    COUNT(*) AS total_records,
    COUNT(*) FILTER (
        WHERE total_revenue = orders * (current_price - 10)
    ) AS revenue_matches_price_minus_10,
    COUNT(*) FILTER (
        WHERE total_revenue = orders * current_price
    ) AS revenue_matches_current_price,
    COUNT(*) FILTER (
        WHERE orders > 0
        AND total_revenue / orders = current_price - 10
    ) AS revenue_per_order_minus_10,
    ROUND(
        AVG(
            total_revenue / NULLIF(orders, 0)
        ), 2
    ) AS avg_revenue_per_order,
    ROUND(
        AVG(current_price), 2
    ) AS avg_current_price
FROM zepto_sales_data;

-- 15. Analyze Orders Distribution

SELECT
    MIN(orders) AS minimum_orders,
    MAX(orders) AS maximum_orders,
    ROUND(AVG(orders), 2) AS average_orders,
    PERCENTILE_CONT(0.5)
        WITHIN GROUP (ORDER BY orders) AS median_orders,
    COUNT(*) FILTER (
        WHERE orders = 0
    ) AS zero_order_records
FROM zepto_sales_data;