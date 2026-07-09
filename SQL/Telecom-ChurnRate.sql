-- Churn Rate
WITH TotalChurn AS
(
SELECT
	Contract,
	COUNT(DISTINCT Customer_ID) AS Total,
	COUNT(CASE WHEN Customer_Status = 'Churned' THEN 1 END) AS ChurnedCustomers
FROM telecom_customer_churn
GROUP BY Contract
)

SELECT
	
	Contract,
	Total,
	ROUND 
	(
	SUM(
		ChurnedCustomers * 100.0 / Total
		)
		,2
	) AS ChurnRate
FROM TotalChurn
GROUP BY Contract, Total