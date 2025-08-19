-- What are the top paying data analyst jobs?
-- 1. identify top ten highest paying data analyst and HomeOffice
-- 2. focus on post with job salaries, no nulls.
-- 3. why? offer insights on the opportunities for a good job. 


SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date::DATE,
    name AS company_name 
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id 

WHERE
    job_title_short = 'Data Analyst' 
    AND 
    job_location = 'Anywhere'
    AND 
    salary_year_avg IS NOT NULL
    ORDER BY 
    salary_year_avg DESC
    limit 10


















