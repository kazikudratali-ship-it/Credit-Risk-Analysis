
-- Create Database 

create database credit_db ;

use credit_db

-- Select All records 

select * from credit_risk_dataset

-- delete Record where Employeement length > 80 

delete  from credit_risk_dataset where person_emp_length >80 

-- Select Records where Person age more than 100. 

select person_age from credit_risk_dataset where person_age > 100 

-- delete The Record where Person Age more than 100.

delete from credit_risk_dataset where person_age > 100  

-- Find Average Emp length .

SELECT Round(AVG(CAST(person_emp_length AS FLOAT)),2) AS Mean_Emp_Length
FROM credit_risk_dataset
WHERE person_emp_length IS NOT NULL; 

-- Update person_emp_lenght Null values with Average emp_length.

UPDATE credit_risk_dataset
SET person_emp_length = (
    SELECT Round( AVG(CAST(person_emp_length AS FLOAT)),0)
    FROM credit_risk_dataset
    WHERE person_emp_length IS NOT NULL
)
WHERE person_emp_length IS NULL;

-- Update loan_int_rate Null values with Average loan_int_rate .

UPDATE credit_risk_dataset
SET loan_int_rate = (
    SELECT Round( AVG(CAST(loan_int_rate AS FLOAT)),2)
    FROM credit_risk_dataset
    WHERE loan_int_rate IS NOT NULL
)
WHERE loan_int_rate IS NULL;


-- Overall Default Rate

SELECT
    AVG(CAST(loan_status AS FLOAT))*100 AS Default_Rate
FROM credit_risk_dataset;


-- Default Rate by Home Ownership

SELECT
    person_home_ownership,
    AVG(CAST(loan_status AS FLOAT))*100 AS Default_Rate
FROM credit_risk_dataset
GROUP BY person_home_ownership
ORDER BY Default_Rate DESC;

-- Default Rate by Loan Grade

SELECT
    loan_grade,
    AVG(CAST(loan_status AS FLOAT))*100 AS Default_Rate
FROM credit_risk_dataset
GROUP BY loan_grade
ORDER BY loan_grade;