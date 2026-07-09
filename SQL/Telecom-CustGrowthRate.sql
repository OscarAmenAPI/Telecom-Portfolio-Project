
-- Customer Growth Rate
WITH TotalChurn AS
(
SELECT
	COUNT(DISTINCT Customer_ID) AS Total,
	COUNT(CASE WHEN Customer_Status = 'Joined' THEN 1 END) AS NewCustomers,
	COUNT(CASE WHEN Customer_Status = 'Churned' THEN 1 END) AS ChurnedCustomers
FROM telecom_customer_churn
)

SELECT
	ROUND 
	(
	SUM(
		(NewCustomers - ChurnedCustomers) * 100.0 / Total
		)
		,2
	) AS ChurnRate
FROM TotalChurn