-- Monthly Revenue by churn vs non-churn

SELECT
    CASE 
        WHEN Churn_Reason IS NULL THEN 'No Churn Reason'
        ELSE 'Has Churn Reason'
    END AS ChurnReasonStatus,
    SUM(Monthly_Charge) AS MonthlyRevenue
FROM telecom_customer_churn
GROUP BY
    CASE 
        WHEN Churn_Reason IS NULL THEN 'No Churn Reason'
        ELSE 'Has Churn Reason'
    END;