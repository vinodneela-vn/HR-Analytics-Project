create database hr;

-- 1 Average Attrition rate for all Departments
show tables;
select * from hr1;
select Department,round(avg(case when attrition="yes" then 1 else 0 end)*100,2)as attrition_rate_percentage
from hr1 group by department;

-- 2 Average Hourly rate of Male Research Scientist
select * from hr1;
select avg(hourlyrate) as Average_hour_rate from hr1 where gender="male" and jobrole="research scientist";

-- 3 Attrition rate Vs Monthly income stats
select * from hr2;
select h1.attrition,
round(avg(h2.monthlyincome),2) as average_monthly_income,
round(min(h2.monthlyincome),2) as min_monthly_income,
round(max(h2.monthlyincome),2) as max_monthly_income
from hr1 h1 join hr2 h2 on h1.employeenumber=h2.employeeID
group by attrition;

-- 4 Average working years for each Department
select h1.department,
round(avg(h2.totalworkingyears),2)as avg_working_years from hr1 h1 join hr2 h2 
on h1.EmployeeNumber=h2.EmployeeID group by h1.department;

-- 5Job Role Vs Work life balance
select *  from hr1;
select * from hr2;
select h1.jobrole,
round(avg(h2.worklifebalance),2) as avg_job_role from hr1 h1 join hr2 h2
on h1.EmployeeNumber=h2.EmployeeID group by h1.jobrole;

-- 6 Attrition rate Vs Year since last promotion relation
select * from hr1;
select * from hr2;
select h2.yearssincelastpromotion,
round( avg(case when h1.attrition="yes" then 1 else 0 end)*100,2) as attrition_rate_percentage
from hr1 h1 join hr2 h2 on h1.EmployeeNumber=h2.EmployeeID group by YearsSinceLastPromotion 
order by YearsSinceLastPromotion;

-- 7 Average Monthly Income by Job Level
select * from hr1;
select * from hr2;
select h1.joblevel, round(avg(h2.monthlyincome),2) as average_monthly_income from hr1 h1 join hr2 h2
on h1.EmployeeNumber=h2.EmployeeID group by h1.Joblevel;


-- 8 Average Training Times vs Performance Rating
select * from hr2;
select PerformanceRating,
round(avg(trainingtimeslastyear),2) as average_training_times  from hr2 group by PerformanceRating 
order by PerformanceRating;





