-- CUSTOMER KPIS --

-- Total Customers
SELECT
	COUNT(DISTINCT Customer_ID) AS TotalCustomers
FROM telecom_customer_churn

-- Active Customers
SELECT
	Customer_Status,
	COUNT(DISTINCT Customer_ID) AS Total
FROM telecom_customer_churn
WHERE Customer_Status = 'Stayed'
GROUP BY Customer_Status

-- Churned Customers
SELECT
	Customer_Status,
	COUNT(DISTINCT Customer_ID) AS Total
FROM telecom_customer_churn
WHERE Customer_Status = 'Churned'
GROUP BY Customer_Status

-- Average Customer Tenure
SELECT
	AVG(Tenure_in_months * 1.0) AS AverageTenure
FROM telecom_customer_churn

-- Average Monthly Revenue by Customer
SELECT
	AVG(Monthly_Charge) AS AverageMonthlyRevenue
FROM telecom_customer_churn

-- Top Churn Reasons
SELECT TOP 5
	Churn_reason,
	COUNT(DISTINCT Customer_ID) AS TotalCustomers
FROM telecom_customer_churn
WHERE Churn_Reason IS NOT NULL
GROUP BY Churn_Reason
ORDER BY TotalCustomers DESC