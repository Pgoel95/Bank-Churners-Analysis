-- Retrieving data
select * from churn_analysis;

-- The Churn Rate (percentage of customers who have exited the bank)
select 
round((count(case when exited = 1 then 1 end)*100)/count(*),2) as Churn_Rate
from churn_analysis;

-- Churn rates across different genders
select Gender,
round((count(case when exited = 1 then 1 end)*100)/count(*),2) as Churn_Rate
from churn_analysis
group by Gender;

-- Churn rates across different geographies
select Geography,
round((count(case when exited = 1 then 1 end)*100)/count(*),2) as Churn_Rate
from churn_analysis
group by Geography;

-- Relationship between churn and age
select Exited,
round(avg(Age)) as Avg_age,
min(age) as Min_age,
max(age) as max_age
from churn_analysis
group by Exited;

-- Distribution of age between churned and non-churned customers
select Exited, Age,
count(*) as Customers
from churn_analysis
group by Exited, Age
order by Exited, Age;

-- Relationship between churn and credit score
select Exited,
round(avg(creditscore)) as Avg_creditscore,
min(CreditScore) as Min_creditscore,
max(CreditScore) as max_creditscore
from churn_analysis
group by Exited;

-- Distribution of Creditscore between churned and non-churned customers
select Exited, CreditScore,
count(*) as Customers
from churn_analysis
group by Exited, CreditScore
order by Exited, CreditScore;

-- Relationship between churn and Tenure
select Exited,
round(avg(Tenure)) as Avg_tenure,
min(Tenure) as Min_tenure,
max(Tenure) as Max_tenure
from churn_analysis
group by Exited;

-- Distribution of tenure between churned and non-churned customers
select Exited, Tenure,
count(*) as Customers
from churn_analysis
group by Exited, Tenure
order by Exited, Tenure;

-- Churn rates by age group.
select 
case 
when age < 30 then 'Under 30'
when age >=30 and age < 40 then '30-39'
when age >=40 and age < 50 then '40-49'
else '50 and above'
end as age_group,
round(avg(Exited),2) as Avg_exited
from churn_analysis
group by age_group;
