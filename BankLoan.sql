select * from bank_loan_data;

-- Total Loan Applications

Select count(id) as Total_Loan_Applications
from bank_loan_data;

-- MTD Loan Applications

Select count(id) as MTD_Total_Loan_Applications
from bank_loan_data
where month(issue_date) = 12 and year(issue_date) = 2021;

-- MTM Loan Applications 

Select count(id) as PMTD_Total_Loan_Applications
from bank_loan_data
where month(issue_date) = 11 and year(issue_date) = 2021;

--Total Funded Amount

Select sum(loan_amount) as Total_Funded_Amount
from bank_loan_data;

-- Total Funded Amount ( MOD)

Select sum(loan_amount) as MTD_Total_Funded_Amount
from bank_loan_data
where month(issue_date) = 12 and year(issue_date) = 2021;

-- Total Funded Amount ( PMTD) 

Select sum(loan_amount) as PMTD_Total_Funded_Amount
from bank_loan_data
where month(issue_date) = 11 and year(issue_date) = 2021;

-- Total Amount Recieved 

Select sum(total_payment) as Total_Amount_Recieved
from bank_loan_data;

-- Total Amount Recieved  (MTD)


Select sum(total_payment) as MTD_Total_Amount_Recieved
from bank_loan_data
WHERE MONTH(issue_date) = 12 and year(issue_date) = 2021;

-- Total Amount Recieved  (PMTD)

Select sum(total_payment) as PMTD_Total_Amount_Recieved
from bank_loan_data
WHERE MONTH(issue_date) = 11 and year(issue_date) = 2021;

-- Average Interest Rate 

 USE BankLoanDB;

SELECT ROUND(AVG(int_rate),4) * 100 as Avg_Interest_Rate 
from bank_loan_data;


-- MTD Average Interest Rate

SELECT ROUND(AVG(int_rate),4) * 100 as MTD_Avg_Interest_Rate 
from bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021;

-- PMTD Average Interest Rate

SELECT ROUND(AVG(int_rate),4) * 100 as PMTD_Avg_Interest_Rate 
from bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021;

-- Average DTI

SELECT ROUND(AVG(dti),4) * 100 As Avg_DTI from bank_loan_data

-- MTD Average DTI

SELECT ROUND(AVG(dti),4) * 100 As MTD_Avg_DTI from bank_loan_data
WHERE MONTH(issue_date) = 12 and year (issue_date) = 2021;

--PMTD Average DTI

SELECT ROUND(AVG(dti),4) * 100 As PMTD_Avg_DTI from bank_loan_data
WHERE MONTH(issue_date) = 11 and year (issue_date) = 2021;


-- GOOD LOAN PERCENTAGE

SELECT 
	(COUNT( case when loan_status ='Fully Paid' or loan_status = 'Current' then id END)* 100)
	/ 
	count(id) as Good_loan_percentage
	from bank_loan_data;


-- GOOD LOAN APPLICATIONS

SELECT COUNT(id)  as Good_loan_applications FROM bank_loan_data
where loan_status ='Fully Paid' or loan_status = 'Current';

-- Good Loan Funded AMOUNT
SELECT SUM(loan_amount)  as Good_loan_funded_Amount FROM bank_loan_data
where loan_status ='Fully Paid' or loan_status = 'Current';

--Good Loan Payment Recieved 
SELECT SUM(total_payment)  as Good_loan_Total_Payment_Recieved FROM bank_loan_data
where loan_status ='Fully Paid' or loan_status = 'Current';

-- BAD LOAN PERCENTAGE

SELECT 
	(COUNT( case when loan_status = 'Charged off' then id END)* 100.0)
	/
	count(id) as Bad_loan_percentage
	from bank_loan_data;

-- BAD LOAN APPLICATIONS
SELECT COUNT(id) as Bad_loan_applications FROM bank_loan_data 
where loan_status ='Charged off';

-- Bad Loan Funded AMOUNT
SELECT SUM(loan_amount)  as Bad_loan_funded_Amount FROM bank_loan_data
where loan_status ='Charged off'

--Bad Loan Payment Recieved 
SELECT SUM(total_payment)  as Bad_loan_Total_Payment_Recieved FROM bank_loan_data
where loan_status ='Charged off';

-- Loan Status

Select loan_status, count(id) as Total_Loan_Applications , sum(total_payment) as Total_Amount_Recieved, sum(loan_amount) as Total_Funded_Amount, round(avg(int_rate *100),2) as Interest_Rate, round(avg( dti * 100),2) as DTI
from bank_loan_data
group by loan_status;


-- Loan Status - MTD 

Select loan_status , sum(total_payment) as MTD_Total_Amount_Recieved, sum(loan_amount) as MTD_Total_Funded_Amount
from bank_loan_data
WHERE MONTH(issue_date) = 12 
group by loan_status;


-- 2nd Dashboard 

SELECT 
		MONTH(issue_date) as Month_Num,
		DATENAME ( MONTH, issue_date) as Month_Name,
		COUNT(id) as Total_Loan_Applications,
		SUM(loan_amount) AS Total_Funded_Amount ,
		SUM(total_payment) AS Total_Recieved_Amount
from bank_loan_data
Group by MONTH(issue_date),DATENAME ( MONTH, issue_date)
order by MONTH(issue_date) ;

 -- Region 

SELECT 
		address_state,
		COUNT(id) as Total_Loan_Applications,
		SUM(loan_amount) AS Total_Funded_Amount ,
		SUM(total_payment) AS Total_Recieved_Amount
from bank_loan_data
Group by address_state 
order by SUM(loan_amount) desc;

-- Term

SELECT 
		term,
		COUNT(id) as Total_Loan_Applications,
		SUM(loan_amount) AS Total_Funded_Amount ,
		SUM(total_payment) AS Total_Recieved_Amount
from bank_loan_data
Group by  term
order by term;

 -- Employee-Length

 SELECT 
		emp_length,
		COUNT(id) as Total_Loan_Applications,
		SUM(loan_amount) AS Total_Funded_Amount ,
		SUM(total_payment) AS Total_Recieved_Amount
from bank_loan_data
Group by  emp_length
order by count(id)desc;


-- Purpose
 SELECT 
		purpose,
		COUNT(id) as Total_Loan_Applications,
		SUM(loan_amount) AS Total_Funded_Amount ,
		SUM(total_payment) AS Total_Recieved_Amount
from bank_loan_data
Group by purpose
order by count(id)desc;

-- Home Ownership

SELECT 
		home_ownership,
		COUNT(id) as Total_Loan_Applications,
		SUM(loan_amount) AS Total_Funded_Amount ,
		SUM(total_payment) AS Total_Recieved_Amount
from bank_loan_data
where GRADE = 'A'
Group by home_ownership
order by count(id)desc;


