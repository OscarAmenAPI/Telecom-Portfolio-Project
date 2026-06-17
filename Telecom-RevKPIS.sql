-- REVENUE KPIS ---

-- Total Revenue
SELECT
	SUM(Total_Revenue) AS TotalRevenue
FROM telecom_customer_churn

-- Monhtly Revenue lost to churn
SELECT
	SUM(Monthly_Charge) AS Churn
FROM telecom_customer_churn
WHERE Customer_Status = 'Churned'

-- Revenue Lost to churn percentage
SELECT
	SUM(CASE WHEN Customer_Status = 'Churned' THEN Monthly_Charge END) * 100.0
	/
	SUM(Monthly_Charge) AS RevLostChurnPercentage
FROM telecom_customer_churn

-- Average Revenue Per Customer
SELECT
	SUM(Total_Revenue) / COUNT(Customer_ID) AS AverageRevPerCustomer
FROM telecom_customer_churn

-- Revenue By Contract Type
SELECT
	Contract,
	SUM(Total_Revenue) AS TotalRevenue
FROM telecom_customer_churn
GROUP BY Contract
ORDER BY TotalRevenue DESC

-- Revenue By Product
SELECT
	Internet_Type,
	SUM(Total_Revenue) AS TotalRevenue
FROM telecom_customer_churn
GROUP BY Internet_Type
ORDER BY TotalRevenue DESC