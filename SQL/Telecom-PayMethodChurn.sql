-- Churn by Payment Method
WITH TotalChurn AS
(
SELECT
	Payment_Method,
	COUNT(DISTINCT Customer_ID) AS Total,
	COUNT(CASE WHEN Customer_Status = 'Churned' THEN 1 END) AS ChurnedCustomers
FROM telecom_customer_churn
GROUP BY Payment_Method
)

SELECT
	Payment_Method,
	ROUND 
	(
	SUM(
		ChurnedCustomers * 100.0 / Total
		)
		,2
	) AS ChurnRate
FROM TotalChurn
GROUP BY Payment_Method