
USE ibm_telco_churn; -- calling the schema 

-- ========== START FOR QUERY 1 ========== 
-- Considering the top 5 groups with the highest average monthly charges among churned customers, 
-- How can personalized offers be tailored based on age, gender, and contract type 
-- To potentially improve customer retention rates?

SELECT Age, Gender, Contract, AVG(a.monthly_charge) AS avg_charge
FROM ibm_churn_dataset AS a
JOIN ibm_customer_churn_cleaned AS b -- joining data from two tables 
ON a.customer_id = b.customer_id -- joining based on common columns 
WHERE b.churn_label = 'yes' -- to get results only for churned customers 
GROUP BY a.Age, a.Gender, a.Contract
ORDER BY avg_charge DESC 
LIMIT 5;

-- Customer retention can be imporved by focusing on older age groups (above 60) as they are the highest spending groups. Also as they prefer month-to-month subscriptiosn more, then more focus can be put on imporving these subscriptions to retain high paying clients. 

-- Q2 -- What are the feedback or complaints from those churned customers?

SELECT a.Age, a.Gender, a.Contract, b.Churn_Reason, AVG(a.monthly_charge) AS avg_charge
FROM ibm_churn_dataset AS a
JOIN ibm_customer_churn_cleaned AS b
ON a.customer_id = b.customer_id
WHERE b.churn_label = 'yes' 
GROUP BY a.Age, a.Gender, a.Contract,b.Churn_Reason -- to view reason for churn for various age groups, genders and contract types 
ORDER BY avg_charge DESC
LIMIT 5;

-- ========== START OF QUERY 3 ========== 
-- How does the payment method influence churn behavior?
SELECT 
    a.Payment_Method,
    COUNT(a.customer_id) AS total_customers, -- finding total customers 
    ROUND(SUM(CASE WHEN b.Churn_Label = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(a.customer_id), 2) AS churn_rate_percentage -- finding churn_rate for each payment method
FROM 
    ibm_churn_dataset AS a 
JOIN 
    ibm_customer_churn_cleaned AS b 
ON 
    a.customer_id = b.customer_id
GROUP BY 
    a.Payment_Method;

