--TELCO CUSTOMER CHURN ANALYSIS PROJECT
---------------------------------------------------------------------------------------------------------
-----------------
---1.TOTAL CUSTOMERS
----------------------------------------------------------------------------------------------------------
--------------------------
SELECT COUNT(*) AS total_customers
FROM
 analog-forest-496117-i2.churn_analysis.customer_churn;
------------------------------------------------------------------------------------------------------------
------------------------------
--2.CHURN RATE
------------------------------------------------------------------------------------------------------------
-------------------
SELECT
 COUNTIF(Churn = true) * 100.0/ COUNT(*) AS churn_rate
FROM
 analog-forest-496117-i2.churn_analysis.customer_churn;
 ---------------------------------------------------------------------------------------------------------------
 ---------------------------------
 --3.CONTRACT V/S CHURN
 ----------------------------------------------------------------------------------------------------------------
 -------------------------
 SELECT
 Contract,
 COUNT(*) AS total_customers,
 COUNTIF(Churn = true) AS churned_customers
 FROM
 analog-forest-496117-i2.churn_analysis.customer_churn
 GROUP BY Contract
 ORDER BY churned_customers DESC;
--------------------------------------------------------------------------------------------------------------------
----------------------------------
--4.AVERAGE CHARGE V/S CHURN
---------------------------------------------------------------------------------------------------------------------
-----------------------------
SELECT
 Churn,
AVG(MonthlyCharges) As avg_monthly_charge
FROM
 analog-forest-496117-i2.churn_analysis.customer_churn
GROUP BY Churn;
------------------------------------------------------------------------------------------------------------------------
-----------------------------------
--5.TenureGroup ANALYSIS
--------------------------------------------------------------------------------------------------------------------------
------------------------------------
SELECT
 CASE
  WHEN tenure <= 12 THEN '0-12 Months'
  WHEN tenure <= 24 THEN '12-24 Months'
  ELSE '24+ Months'
END AS tenure_group,
COUNT(*) AS total_customers,
COUNTIF(Churn = true) AS churned_customers
FROM
 analog-forest-496117-i2.churn_analysis.customer_churn
GROUP BY tenure_group;
--------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------
--6. HIGH RISK CUSTOMERS
---------------------------------------------------------------------------------------------------------------------------------
--------------------------
SELECT
 customerID,
 MonthlyCharges,
 Contract
FROM
 analog-forest-496117-i2.churn_analysis.customer_churn
WHERE MonthlyCharges > 70 
AND Contract = 'Month-to-month'
AND Churn = true ;

 

