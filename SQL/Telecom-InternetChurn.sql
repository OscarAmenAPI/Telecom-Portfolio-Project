-- Internet Service Churn Rate
WITH TotalChurn AS
(
SELECT
	Internet_Type,
	COUNT(DISTINCT Customer_ID) AS Total,
	COUNT(CASE WHEN Customer_Status = 'Churned' THEN 1 END) AS ChurnedCustomers
FROM telecom_customer_churn
GROUP BY Internet_Type
)

SELECT
	Internet_Type,
	ROUND 
	(
	SUM(
		ChurnedCustomers * 100.0 / Total
		)
		,2
	) AS ChurnRate
FROM TotalChurn
GROUP BY Internet_Type