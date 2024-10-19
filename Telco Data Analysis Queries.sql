USE churn_customers_data;
select * from ibm_telco_customer_churn_dataset;

select count(*) from ibm_telco_customer_churn_dataset where `Customer Status` = 'Churned' and `Payment Method` = 'Bank Withdrawal';

/* Query 1: Considering the top 5 groups with the highest
average monthly charges among churned customers,
how can personalized offers be tailored based on age,
gender, and contract type to potentially improve
customer retention rates?*/

select count(*),
AVG(`Monthly Charge`) as Average_Monthly_charge, age, gender, contract, `Customer Status`
from churn_customers_data.ibm_telco_customer_churn_dataset 
where `Customer Status` = 'churned' 
group  by 3,4,5,6
order by 2 desc 
limit 5;

/*Recommendations:
As per our analysis we have 5 customers who are paying us approximately 557 Dollars monthly are older than 40 and all are male. These all customers are on yearly contracts So we must improve our Yearly Subscriptions
services for older people to retain these customers. Here are some steps to improve our services for these customers
1. Personalized Offers for Older Customers
Tailored Discounts or Incentives: Offer discounts on renewals or bonuses (e.g., extra data, enhanced customer support) to customers over 40, who are already paying high monthly charges.
Customized Plans: Develop new yearly subscription plans targeting specific needs of older customers, such as flexible data usage or dedicated customer service channels.
2. Customer Engagement and Retention Programs
Loyalty Programs: Introduce loyalty programs that reward long-term customers with perks like free add-ons or exclusive offers.
Health and Wellness Packages: Consider bundling services related to health or wellness , as this demographic may be more inclined towards these services.*/

with top_customers AS (
select count(*),
AVG(`Monthly Charge`) as Average_Monthly_charge, age, gender, contract, `Customer Status`
from churn_customers_data.ibm_telco_customer_churn_dataset 
where `Customer Status` = 'churned' 
group  by 3,4,5,6
order by 2 desc 
limit 5)

Select c.`Monthly Charge`, c.age, `churn Reason` from churn_customers_data.ibm_telco_customer_churn_dataset  c join top_customers t
where c.age = t.age and 
c.gender = t.gender and
c.contract = t.contract and 
c.`Customer Status` = t.`Customer Status` order by 1 desc, age desc;


/*We have following Feedback from customers 
2 Customers stopped using our services because of Attitude of service provider. So we need to improve our customer services where client interacts with us.
2 Customers don't know the reason why they are leaving which suggest that we must improve our feedback survey and include more options so that customers can relate and give reason
Extra data charges, Network Reliability and Competitor Offers are other reason of these churn customers*/

select count(*) as Total_Customers, `Customer Status`, `Payment Method`
, Round((Count(*) * 100) / SUM(count(*)) over(),2) as Churn_Rate
from churn_customers_data.ibm_telco_customer_churn_dataset where `Customer Status` = 'Churned' group by `Payment Method`, `Customer Status` order by 1 desc;

select count(*) as Total_Customers, `Customer Status`, `Payment Method`, `Churn Reason`
, Round((Count(*) * 100) / SUM(count(*)) over(),2) as Churn_Rate
from churn_customers_data.ibm_telco_customer_churn_dataset where `Customer Status` = 'Churned' group by `Payment Method`, `Customer Status`,`Churn Reason` order by 1 desc;

