-- Total Data --
SELECT
	COUNT(DISTINCT Id) AS total
FROM customer_data;

-- MAIN
SELECT
	COUNT(DISTINCT id) AS total_customers,
    AVG(age) AS average_age,
    AVG(income) AS average_income,
    AVG(satisfaction_score) AS avg_satisfaction_score,
    SUM(
		CASE
			WHEN promotion_usage = 1 THEN 1
            ELSE 0
		END) / COUNT(*) * 100 AS pct_use_promo
FROM customer_data;

-- DEMOGRAPHY ANALYSIS --
-- CUSTOMER AGE DISTRIBUTION
SELECT
	age,
    COUNT(*) AS total_customers
FROM customer_data
GROUP BY age
ORDER BY age;

-- FREQUENCY OF PURCHASE BY CUSTOMER
SELECT
    purchase_frequency,
    COUNT(*) AS total_customer
FROM customer_data
GROUP BY purchase_frequency;


-- PURCHASE AMOUNT BASED ON EDUCATION AND INCOME
SELECT
	education,
    AVG(income) AS avg_income,
    AVG(purchase_amount) AS avg_purchase
FROM customer_data
GROUP BY education;

-- REGIONAL ANALYSIS
SELECT
	region,
    COUNT(*) AS total_customers,
    SUM(purchase_amount) AS total_purchase
FROM customer_data
GROUP BY region;

-- CUSTOMER BEHAVIOR ANALYSIS --
-- POPULAR PRODUCT
SELECT
	product_category,
	COUNT(*) AS total_transaction,
    SUM(purchase_amount) AS total_purchase
FROM customer_data
GROUP BY product_category
ORDER BY total_purchase DESC;

-- TOTAL PROMOTION USAGE
SELECT
	promotion_usage,
    COUNT(*) AS total_transaction
FROM customer_data
GROUP BY promotion_usage;

-- CUSTOMER LOYALTY AND SATISFACTION
SELECT
	loyalty_status,
    COUNT(*) AS total_customers,
    AVG(satisfaction_score) AS avg_satisfaction_score
FROM customer_data
GROUP BY loyalty_status;

-- SATISFACTION CORRELATION WITH PURCHASE AMOUNT
SELECT
	satisfaction_score,
    ROUND(AVG(purchase_amount),2) AS avg_purchase
FROM customer_data
GROUP BY satisfaction_score
ORDER BY satisfaction_score;

-- CUSTOMER SEGMENTATION
SELECT 
    CASE 
        WHEN income < 15000 THEN 'Low Income'
        WHEN income BETWEEN 15000 AND 30000 THEN 'Middle Income'
        ELSE 'High Income'
    END AS income_segment,
    CASE 
        WHEN purchase_frequency = 'frequent' THEN 'High Frequency'
        WHEN purchase_frequency = 'rare' THEN 'Low Frequency'
        ELSE 'Medium Frequency'
    END AS frequency_segment,
    COUNT(*) AS total_customers
FROM customer_data
GROUP BY income_segment, frequency_segment
ORDER BY total_customers DESC;