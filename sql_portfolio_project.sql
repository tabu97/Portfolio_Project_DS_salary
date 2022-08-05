use portfolio_project;
select * from dbo.ds_salaries$;

-- salary vs work_year and highly paid job_title
select work_year, salary_in_usd from dbo.ds_salaries$ 
order by salary_in_usd desc
;
select work_year, floor(avg(salary_in_usd)) as total_salary from dbo.ds_salaries$ 
group by work_year 
order by total_salary desc
-- hence salary increased with time in field of data science

select work_year,job_title,salary_in_usd 
from dbo.ds_salaries$
where work_year='2020' 
order by salary_in_usd desc;
--hence in 2020 top paid job_title were Research scientist,data scientist and director of data science

select work_year,job_title,salary_in_usd 
from dbo.ds_salaries$ where work_year='2021' 
order by salary_in_usd desc;
--hence in 2021 top paid job_title were principal data engineer, financial data analyst and applied ML scientist

select work_year,job_title,salary_in_usd 
from dbo.ds_salaries$ where work_year='2022' 
order by salary_in_usd desc;
-- hence in 2022 top paid job_title were data analytics lead, applied data scientist and data engineer

select max(salary_in_usd) as maximum_salary,job_title 
from dbo.ds_salaries$ group by job_title 
order by maximum_salary desc;
-- all over highly paid job profile are principle data engineer, research scientist, financial data analyst, 
-- applied ML scientist,principle data scientist,data scientist

-- employment_type vs salary

select * from dbo.ds_salaries$;
select employment_type ,floor(avg(salary_in_usd)) as avg_salary 
from dbo.ds_salaries$ group by employment_type 
order by avg_salary desc;
-- contract basis and full_time employement types are highly paid 

-- count of employment type
select count(*)  as number_of_employee, employment_type 
from dbo.ds_salaries$ 
group by employment_type 
order by count(*) desc;
-- mostly employees are enrolled in full time job

-- mostly  paid currency
select count(*), salary_currency 
from dbo.ds_salaries$ 
group by salary_currency 
order by  count(*) desc ;
-- mostly paid currency is USD

select * from dbo.ds_salaries$;
--experience level wise ,job title with avg salary 

select experience_level,job_title ,salary_in_usd,employment_type
from dbo.ds_salaries$ 
where experience_level = 'Entry-level / Junior' 
order by salary_in_usd desc;
-- entry level full time highly paid job_title are ML engineer,computer vision software engineer,data scientist,data analyst.

select experience_level,job_title ,salary_in_usd,employment_type
from dbo.ds_salaries$ 
where experience_level = 'Senior-level / Expert' 
order by salary_in_usd  desc;
-- senior level full time highly paid job_title are data scientist,lead data analytics, data engineer


-- most sought after jobs
select count(*) as most_worked_job_title, job_title 
from dbo.ds_salaries$
group by job_title 
order by  most_worked_job_title desc;
-- data scientist, data engineer, data analyst are most sought after jobs

-- top residence country
select count(*) as top_residence,employee_residence from dbo.ds_salaries$
group by employee_residence
order by top_residence desc;
-- as this data is from US so top residences are US,GB,IN

-- employee residence and company_location
select count(*) as no_of_employee , same_location from dbo.ds_salaries$
group by same_location;
-- 556 people have same residence and company location

--frequency of remote_work
select count(*) as frequency_of_remote_work,remote_ratio 
from dbo.ds_salaries$
group by remote_ratio
order by count(*) desc;
--this is the data from 2020 to 2022( pandemic time) hence most of the companies provided remote job during this period.

-- job_title wise Remote_ratio

select job_title, cast(remote_ratio as varchar) as remote_ratio, count(cast(remote_ratio as varchar)) as count_of_Remote_ratio
from dbo.ds_salaries$
group by job_title, remote_ratio
order by job_title, count(cast(remote_ratio as varchar)) desc ;


-- employment type wise remote_ratio
select employment_type, cast(remote_ratio as varchar) as remote_ratio, count(cast(remote_ratio as varchar)) as count_of_Remote_ratio
from dbo.ds_salaries$
group by employment_type, remote_ratio
order by employment_type, count(cast(remote_ratio as varchar)) desc ;



--same_location vs remote_ratio
select same_location, cast(remote_ratio as varchar) as remote_ratio, count(cast(remote_ratio as varchar)) as count_of_Remote_ratio
from dbo.ds_salaries$
group by same_location, remote_ratio
order by same_location, count(cast(remote_ratio as varchar)) desc ;


--COMPANY SIZE WISE REMOTE_RATIO
select company_size, cast(remote_ratio as varchar) as remote_ratio, count(cast(remote_ratio as varchar)) as count_of_Remote_ratio
from dbo.ds_salaries$
group by company_size, remote_ratio
order by company_size, count(cast(remote_ratio as varchar)) desc ;


--EMPLOYMENT_TYPE, COMPANY_SIZE WISE REMOTE_RATIO
select employment_type, company_size, cast(remote_ratio as varchar) as remote_ratio, count(cast(remote_ratio as varchar)) as count_of_Remote_ratio
from dbo.ds_salaries$
group by employment_type,company_size, remote_ratio
order by employment_type,company_size, count(cast(remote_ratio as varchar)) desc ;

