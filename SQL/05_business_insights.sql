

/*
=========================================================
PROJECT: ZEPTO SALES DATA ANALYSIS
FILE: 09_business_insights.sql
PURPOSE: Key findings and business insights
=========================================================

1. PRODUCT PERFORMANCE
----------------------

Coca Cola 1L stands out as the product with the highest
reported order volume, reaching 6,175 orders. Parle-G
follows with 5,789 orders, while Oreo Biscuits records
the highest average order volume per dataset record.

Product performance also changes from one city to another.
For example, Coca Cola 1L leads in Mumbai, while Oreo
Biscuits performs best in Delhi. Other cities have
different leading products.

Business insight:
There is no single product leading in every city.
This suggests that customer demand may vary by location.
A more local approach to product selection and marketing
could therefore be worth exploring.


2. CATEGORY PERFORMANCE
-----------------------

Snacks is the strongest category in the dataset, with
14,406 reported orders and the highest average order
volume per record (175.68).

It also records the highest reported revenue, at
1,712,447. Beverages and Grocery follow behind, while
Dairy has the lowest reported revenue.

Business insight:
Snacks consistently performs well across the main
indicators analysed. It could be a priority when reviewing
product availability and category strategy.

However, revenue figures should be treated with caution
because some inconsistencies were found in the dataset.


3. CITY PERFORMANCE
-------------------

Hyderabad has the highest total reported order volume,
with 10,132 orders, followed by Pune with 9,638.

Delhi tells a slightly different story. Although it ranks
fourth in total order volume, it has the highest average
order volume per record (180.91).

Bangalore has the lowest average, at 163.13, while Chennai
records the lowest total order volume.

Business insight:
Looking only at total orders does not give the full picture.
Average order volume adds another perspective and shows
that cities can perform differently depending on the
metric used.

Both indicators should be considered when comparing
regional performance.


4. INFLUENCER MARKETING
-----------------------

The analysis does not show higher average order volume
for records associated with active influencer campaigns.

Records with influencer activity have an average of
158.16 orders, compared with 172.44 for records without
influencer activity.

This pattern is also visible across the product categories
analysed, although the number of records varies between
groups.

Business insight:
Based on this dataset alone, there is no clear evidence
that influencer activity is associated with higher
order volume.

This does not mean that influencer campaigns are
ineffective. To assess their real impact, we would need
more information, such as campaign costs, dates,
audience reach, and performance before and after campaigns.


5. PRICING AND DISCOUNTS
------------------------

Declared discounts vary slightly across categories.
Confectionery has the highest average declared discount
(5.63%), while Instant Food has the lowest (4.58%).

Interestingly, records with no declared discount have
the highest average order volume (171.93). Records with
a 10% discount have a lower average of 165.75.

The analysis also shows that average current prices are
higher than average original prices across all products.

Business insight:
The results do not suggest a clear positive relationship
between declared discounts and order volume.

However, this should not be interpreted as proof that
discounts have no effect. The inconsistencies in the
price fields make it difficult to draw reliable conclusions
about pricing strategies.


6. DATA QUALITY AND LIMITATIONS
-------------------------------

Before interpreting the results, several data quality
checks were performed.

The dataset contains 300 records, with no missing values
or exact duplicate business records identified.

However, some inconsistencies were found:

- In 220 records, the current price is higher than the
  original price.
- In 193 records, a positive discount is declared.
- Reported revenue matches orders multiplied by current
  price in 107 records.
- In 102 records, it matches orders multiplied by
  current price minus 10.
- The remaining 91 records match neither calculation.

These results raise questions about how prices, discounts,
and revenue were originally calculated.

The original values were kept unchanged because there
was not enough information to determine the correct
values or the source's calculation rules.

The dataset also does not clearly specify its observation
period or currency. For this reason, the results should
be understood as patterns found in the available data,
rather than verified sales or financial performance.


7. OVERALL CONCLUSION
---------------------

This analysis highlights several interesting patterns
in product, category, and city performance.

Snacks is the leading category across multiple indicators,
while the best-performing products differ between cities.
The analysis also raises questions about the relationship
between influencer activity, discounts, and order volume.

One important finding is that the dataset itself has
limitations, particularly in its pricing and revenue
fields. These issues make it difficult to draw strong
financial conclusions.

Overall, this project shows that analysing data is not
just about writing queries and calculating results.
It also means checking whether the data makes sense,
questioning unexpected patterns, and being clear about
what the results can and cannot tell us.

=========================================================
END OF FILE
=========================================================
*/