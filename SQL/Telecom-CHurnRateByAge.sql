-- Age Group Churn
WITH AgeGroups AS
(
    SELECT
        Customer_ID,
        Customer_Status,
        CASE
            WHEN Age >= 60 THEN '60+'
            WHEN Age >= 45 THEN '45-59'
            WHEN Age >= 31 THEN '31-44'
            WHEN Age >= 25 THEN '25-30'
            WHEN Age >= 22 THEN '22-24'
            ELSE 'Under 22'
        END AS AgeGroup
    FROM telecom_customer_churn
)

SELECT
    AgeGroup,
    COUNT(DISTINCT Customer_ID) AS TotalCustomers,
    COUNT(DISTINCT CASE WHEN Customer_Status = 'Churned' THEN Customer_ID END) AS ChurnedCustomers,
    ROUND(
        COUNT(DISTINCT CASE WHEN Customer_Status = 'Churned' THEN Customer_ID END) * 100.0
        / COUNT(DISTINCT Customer_ID),
        2
    ) AS ChurnRate
FROM AgeGroups
GROUP BY AgeGroup
ORDER BY ChurnRate DESC;