
# Zepto Sales Analysis | SQL & PostgreSQL

## Project Overview

This project explores a Zepto dataset using SQL and PostgreSQL to identify patterns in product performance, category activity, city-level results, influencer marketing, and pricing.

The objective was to analyse the available data, answer relevant business questions, identify trends, and turn query results into meaningful business insights.

The project also includes data quality checks to assess the reliability of the information before drawing conclusions.

**Dataset size:** 300 records  
**Database:** PostgreSQL 18  
**Tools:** SQL, pgAdmin, VS Code

## 1. Dataset Description

**Source:** [Zepto Sales Dataset on Kaggle](https://www.kaggle.com/code/devraai/zepto-sales-data-analysis-and-prediction/input)

The dataset contains the following columns:

| Column | Description |
|---|---|
| `product_name` | Product name |
| `category` | Product category |
| `city` | City associated with the record |
| `original_price` | Original listed price |
| `current_price` | Current listed price |
| `discount` | Declared discount percentage |
| `orders` | Reported order value |
| `total_revenue` | Reported revenue value |
| `influencer_active` | Indicates whether influencer activity is active |

**Data note:** The observation period, currency, and exact calculation rules for some fields are not documented. Order and revenue figures are therefore treated as reported values, not independently verified transactions or realized sales.

## 2. Data Exploration and Quality Assessment

Before analysing business performance, I explored the dataset and checked its quality.

The main checks covered:

- Missing and NULL values.
- Exact duplicate records.
- Repeated product, category, and city combinations.
- Price and discount consistency.
- The relationship between reported revenue, prices, and orders.

### Data Quality Results

| Check | Result |
|---|---:|
| Total records | 300 |
| Missing values | 0 |
| Exact duplicate business records | 0 |
| Current price higher than original price | 220 |
| Records with a positive declared discount | 193 |
| Revenue matching orders × current price | 107 |
| Revenue matching orders × (current price − 10) | 102 |
| Records matching neither calculation | 91 |

Several inconsistencies were identified, particularly in the relationship between original prices, current prices, declared discounts, and reported revenue.

Rather than changing values without knowing the source's calculation rules, I kept the original data and created a diagnostic SQL view to flag potential issues.

## 3. SQL Skills Applied

Throughout this project, I used PostgreSQL to explore, clean, and analyse the dataset.

The main SQL skills applied include:

- **SELECT:** Retrieving data from tables.
- **WHERE:** Filtering records based on specific conditions.
- **GROUP BY:** Grouping data by products, categories, and cities.
- **ORDER BY:** Sorting results to identify top-performing products.
- **Aggregate Functions:** Using `SUM()`, `AVG()`, `COUNT()`, `MIN()`, and `MAX()` to calculate key metrics.
- **CASE WHEN:** Identifying pricing and revenue inconsistencies.
- **Subqueries:** Organising analytical queries.
- **CREATE TABLE AS:** Creating a working copy of the original dataset.
- **CREATE VIEW:** Building a diagnostic view to identify potential data quality issues.
- **Data Quality Checks:** Investigating missing values, duplicates, repeated records, and inconsistent pricing.


## 4. Business Questions

The analysis was structured around five business areas and 14 questions.

### Product Performance

1. Which products generate the highest number of orders?
2. Which products have the highest average order volume?
3. Which products perform best across different cities?

### Category Performance

4. Which product categories receive the highest number of orders?
5. Which categories have the highest average order volume?
6. Which categories contribute the most to reported revenue?

### City Performance

7. Which cities generate the highest number of orders?
8. Which cities have the highest average order volume?
9. How does product performance vary across different cities?

### Influencer Marketing

10. Do products with active influencer campaigns receive more orders?
11. Which product categories benefit most from influencer activity?

### Pricing and Discounts

12. How do declared discounts vary across product categories?
13. Is there a relationship between declared discounts and order volume?
14. How do original prices and current prices compare across products?

## 5. Key Findings

### Product Performance

- Coca Cola 1L has the highest total reported order volume, with 6,175 orders.
- Parle-G ranks second, with 5,789 orders.
- Oreo Biscuits has the highest average order volume per record, at 194.30.
- The leading product differs across cities.

### Category Performance

- Snacks is the leading category, with 14,406 reported orders.
- It also has the highest average order volume per record, at 175.68.
- Snacks records the highest reported revenue, at 1,712,447.

### City Performance

- Hyderabad has the highest total reported order volume, with 10,132 orders.
- Delhi has the highest average order volume per record, at 180.91.
- Chennai has the lowest total reported order volume, with 6,854 orders.

### Influencer Marketing

Records with active influencer activity have an average order volume of 158.16, compared with 172.44 for records without active influencer activity.

The same general pattern appears across the analysed categories. However, this does not prove that influencer campaigns reduce orders or are ineffective.

### Pricing and Discounts

- Average declared discounts range from 4.58% to 5.63% across categories.
- Records with no declared discount have the highest average order volume, at 171.93.
- Average current prices are higher than average original prices across all analysed products.

These findings should be interpreted carefully because of the pricing inconsistencies identified during the data quality assessment.

## 6. Business Insights

**Snacks stands out as the strongest category.**

It leads in both reported order volume and reported revenue. This makes it a category worth investigating further when reviewing product assortment and availability.

**Product preferences vary across cities.**

The leading product changes from one city to another. This suggests that local demand patterns should be considered when making product and marketing decisions.

**Total volume and average performance tell different stories.**

Hyderabad ranks first in total reported orders, while Delhi ranks first in average order volume per record. Looking at both metrics provides a more complete picture of regional performance.

**Influencer activity requires further investigation.**

Records with active influencer activity do not show higher average order volume. More detailed campaign information would be needed to evaluate campaign effectiveness.

**Pricing information needs validation.**

The inconsistencies between original prices, current prices, declared discounts, and reported revenue make it difficult to draw reliable financial conclusions.

## 7. Limitations

The analysis has several limitations:

- The dataset contains only 300 records.
- The observation period is not specified.
- The currency is unknown.
- The meaning and calculation rules behind `orders` and `total_revenue` are not fully documented.
- Some price and discount values appear inconsistent.
- The analysis is descriptive and does not establish cause-and-effect relationships.
- Average order volume refers to the average reported value per dataset record, not per customer or verified transaction.

These limitations do not make the analysis useless, but they affect how confidently the results can be interpreted.

## 8. Conclusion

This project allowed me to practise the main stages of SQL-based data analysis, from exploring raw data and checking data quality to answering business questions and interpreting results.

The analysis revealed differences in product, category, and city performance, while also highlighting inconsistencies that could have affected the conclusions.

One of the main lessons is that data analysis is not only about writing queries. It also requires questioning unexpected results, understanding the limits of the available information, and avoiding conclusions that the data cannot support.

## 9. Future Improvements

Possible extensions of this project include:

- Working with a larger dataset covering more products and cities.
- Including a clearly defined observation period to analyse trends over time.
- Investigating pricing and discount inconsistencies using verified source data.
- Analysing influencer campaign performance with more detailed campaign information.
- Exploring relationships between product prices and reported order volumes.
- Creating additional SQL views for recurring business analyses.
- Building an interactive dashboard using Power BI or Tableau.
- Performing more advanced statistical analysis to explore patterns in the data.


## 10. Author
Sonia Tsago

**Project:** Zepto Sales Data Analysis

**Purpose:** An educational portfolio project demonstrating PostgreSQL, SQL querying, data exploration, data quality assessment, and business analysis.

**Technologies:** PostgreSQL 18, SQL, pgAdmin, Visual Studio Code, GitHub.

---
