# Customer Churn Analysis Project

## Overview

Customer churn, or attrition, is a significant challenge for businesses, especially in the telecommunications industry. It refers to the loss of customers or subscribers, resulting in decreased revenue and growth potential. For telecommunication companies, understanding customer churn is essential to reduce marketing costs for acquiring new customers and to improve customer retention rates.

In this project, we will be analyzing the **IBM Telco Customer Churn dataset** to identify patterns that contribute to customer churn. By addressing key issues like customer service, billing, and network coverage, we can provide actionable insights that will help improve customer satisfaction and loyalty.

## Dataset

We are using the **IBM Telco Customer Churn dataset**, which provides details about 7,043 customers in California. The data captures information related to customer demographics, services subscribed (internet, phone), billing methods, contract type, and more.

This dataset was obtained from [Pranjali's GitHub repository](https://github.com/Pranjali) and has been cleaned using Excel. The data cleaning process involved using `INDEX` and `MATCH` functions to join tables and removing unnecessary columns. The cleaned dataset can be downloaded from [Google Drive](#link).

### Entity-Relationship Diagram (ERD)

We’ve created an ERD using **MIRO** to visualize the relationships between various entities in the dataset, which will help us design and execute SQL queries efficiently.

## Getting Started

To begin your analysis, you can:

1. Download the cleaned dataset as a CSV file from [Google Drive](#link).
2. Import it into **MySQL Workbench** using the `Table Data Import Wizard`.
3. Alternatively, you can download the SQL file and import it using the `SQL Data Export and Import Wizard`.

## SQL Queries and Analysis

In this project, we will explore various aspects of customer churn through a set of hypothetical SQL-based questions. Each query aims to provide deeper insights into the factors influencing churn behavior and suggest actionable steps for retention.

### Query 1: Identifying Churn Patterns for High-Paying Customers

**Question:**  
What are the top 5 groups with the highest average monthly charges among churned customers, and how can personalized offers be tailored based on their age, gender, and contract type to improve retention?

### Query 2: Analyzing Customer Feedback

**Question:**  
What are the most common complaints or feedback from churned customers, and how can these insights guide future service improvements?

### Query 3: Payment Method Influence on Churn

**Question:**  
How does the customer’s payment method influence their churn behavior, and what steps can be taken to address any negative trends?

## Tools and Technologies

- **SQL (MySQL Workbench)**: Used for querying the dataset and performing analysis.
- **Excel**: Used for data cleaning and initial preparation of the dataset.
- **MIRO**: Used for creating the ERD.
- **GitHub**: Version control and project collaboration.
- **Google Drive**: Dataset hosting.

## How to Contribute

Feel free to fork this repository and submit pull requests with your suggestions or improvements. We welcome contributions that improve the project or expand on the analysis.

## License

This project is licensed under the MIT License.
