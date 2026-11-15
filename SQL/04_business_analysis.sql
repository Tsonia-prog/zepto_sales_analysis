-- Question 1: Which products generate the highest number of orders?

SELECT
    product_name,
    SUM(orders) AS total_orders
FROM zepto_sales_clean
GROUP BY product_name
ORDER BY total_orders DESC
LIMIT 10;

-- Question 2:Which products have the highest average order volume?

SELECT
    product_name,
    ROUND(AVG(orders), 2) AS average_orders
FROM zepto_sales_clean
GROUP BY product_name
ORDER BY average_orders DESC
LIMIT 10;

-- Question 3: Which products perform best across different cities?

SELECT
    city,
    product_name,
    SUM(orders) AS total_orders
FROM zepto_sales_clean
GROUP BY
    city,
    product_name
ORDER BY
    city,
    total_orders DESC;

-- Question 4: Which product categories receive the highest number of orders?

SELECT
    category,
    SUM(orders) AS total_orders
FROM zepto_sales_clean
GROUP BY category
ORDER BY total_orders DESC;

-- Question 5: Which categories have the highest average order volume?

SELECT
    category,
    ROUND(AVG(orders), 2) AS average_orders
FROM zepto_sales_clean
GROUP BY category
ORDER BY average_orders DESC;

-- Question 6: Which categories contribute the most to reported revenue?

SELECT
    category,
    SUM(total_revenue) AS total_reported_revenue
FROM zepto_sales_clean
GROUP BY category
ORDER BY total_reported_revenue DESC;

-- Question 7: Which cities generate the highest number of orders?

SELECT
    city,
    SUM(orders) AS total_orders
FROM zepto_sales_clean
GROUP BY city
ORDER BY total_orders DESC;

-- Question 8: Which cities have the highest average order volume?

SELECT
    city,
    ROUND(AVG(orders), 2) AS average_orders
FROM zepto_sales_clean
GROUP BY city
ORDER BY average_orders DESC;

-- Question 10: Do products with active influencer campaigns receive more orders?

SELECT
    influencer_active,
    SUM(orders) AS total_orders,
    COUNT(*) AS total_records,
    ROUND(AVG(orders), 2) AS average_orders
FROM zepto_sales_clean
GROUP BY influencer_active
ORDER BY influencer_active DESC;

-- Question 11: Which product categories benefit most from influencer activity?

SELECT
    category,
    influencer_active,
    COUNT(*) AS total_records,
    ROUND(AVG(orders), 2) AS average_orders,
    SUM(orders) AS total_orders
FROM zepto_sales_clean
GROUP BY
    category,
    influencer_active
ORDER BY
    category,
    influencer_active DESC;

-- Question 12: How do declared discounts vary across product categories?

SELECT
    category,
    ROUND(AVG(discount), 2) AS average_discount,
    MIN(discount) AS minimum_discount,
    MAX(discount) AS maximum_discount,
    COUNT(*) AS total_records
FROM zepto_sales_clean
GROUP BY category
ORDER BY average_discount DESC;

-- Question 13: Is there a relationship between declared discounts and order volume?

SELECT
    discount,
    COUNT(*) AS total_records,
    ROUND(AVG(orders), 2) AS average_orders,
    SUM(orders) AS total_orders
FROM zepto_sales_clean
GROUP BY discount
ORDER BY discount;

-- Question 14: How do original prices and current prices compare across products?

SELECT
    product_name,
    ROUND(AVG(original_price), 2) AS average_original_price,
    ROUND(AVG(current_price), 2) AS average_current_price,
    ROUND(
        AVG(current_price - original_price),
        2
    ) AS average_price_difference
FROM zepto_sales_clean
GROUP BY product_name
ORDER BY average_price_difference DESC;