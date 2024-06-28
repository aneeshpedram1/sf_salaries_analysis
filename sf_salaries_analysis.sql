-- Link to dataset on kaggle: https://www.kaggle.com/datasets/kaggle/sf-salaries/data

create database sf_salaries;
use sf_salaries;

-- 1 Show all columns and rows in the table
select * from salaries;

-- 2 Show only the EmployeeName and JobTitle column
select EmployeeName, JobTitle from salaries;

-- 3 Show the number of employees in the table
select count(*) as number_of_employees from salaries;

-- 4 Show the unique job titles in the table
select distinct JobTitle from salaries;

-- 5 Show the job title and overtime pay for all employees with overtime pay greater than 50000
select EmployeeName, JobTitle, OvertimePay from salaries where OvertimePay > 5000;

-- 6 Show the average base pay for all employees
select avg(BasePay) as "Avg Base Pay" from salaries;

-- 7 Show the top 10 highest paid employees
select EmployeeName, TotalPay from salaries 
order by TotalPay desc
limit 10;

-- 8 Show the average of BasePay, OvertimePay and OtherPay for each employee
select EmployeeName, (BasePay + OvertimePay + OtherPay)/3 as "Avg of all pays" from salaries;

-- 9 Show all employees who have the word "Manager" in it
select EmployeeName, JobTitle
from salaries
where JobTitle LIKE "%manager%";

-- 10 Show all employees with a job title equal to "Manager"
select EmployeeName, JobTitle
from salaries
where JobTitle NOT LIKE "%manager%";

-- 11 Show all employees with a total pay between 50,00 to 75,000
-- solution 1
select EmployeeName, JobTitle, TotalPay
from salaries
where TotalPay >  50000 and TotalPay < 75000;
-- solution 2
select EmployeeName, JobTitle, TotalPay
from salaries
where TotalPay >  50000 and TotalPay < 75000;

-- 12 Show all employees with a base pay less than 50,000 or a total pay greater than 100,000
select EmployeeName, BasePay, TotalPay
from salaries
where BasePay < 50000 or TotalPay > 100000;

-- 13 Show all employees with the total pay benefits value between 125000 and 150000 and a job title containing the word "Director"
select * 
from salaries 
where TotalPayBenefits between 125000 and 150000
and JobTitle like "%Director%";

-- 14 Show all employees ordered by their total pay benefits in descending order
select * 
from salaries
order by TotalPayBenefits desc;

-- 15 Show all job titles with an average base pay of at least 100,000 and order them by average base pay in descending order
select JobTitle, avg(BasePay) as "Avg BasePay"
from salaries 
group by JobTitle
having avg(BasePay) > 100000
order by avg(BasePay) desc;

-- 16 Drop notes column
alter table salaries
drop column Notes;
select * from salaries;

-- 17 Update base pay of all employees with the job title containing "Manager" by increasing it by 10 percent
set SQL_SAFE_UPDATES = 0;
update salaries
set BasePay = BasePay*1.1
where JobTitle Like "%Manager%";

-- 18 Delete all employees who have no overtime pay
delete from salaries where OvertimePay = 0;
