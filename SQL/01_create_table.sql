-- Create table

CREATE TABLE zepto_sales_data (
    product_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    product_name VARCHAR(255),
    category VARCHAR(100),
    city VARCHAR(100),
    original_price NUMERIC(10,2),
    current_price NUMERIC(10,2),
    discount NUMERIC(5,2),
    orders INTEGER,
    total_revenue NUMERIC(15,2),
    influencer_active BOOLEAN
);