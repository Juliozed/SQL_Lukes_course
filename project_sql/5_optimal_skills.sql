-- optimal skills, what high-demand skills get you the high paying jobs
-- here we're puttin in 3 database quiries. 3 and 4 
-- concentrate on on remote postion with specified salary 

WITH skills_demand AS (
    SELECT 
        skills_dim.skills,
        skills_dim.skill_id,
        COUNT(skills_job_dim.job_id) as demand_count
    FROM 
        job_postings_fact 
    INNER JOIN 
        skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN 
        skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' 
        AND job_work_from_home = true 
        AND salary_year_avg IS NOT NULL
    GROUP BY
        skills_dim.skill_id
 
),  average_salary AS (
    SELECT 
        skills_job_dim.skill_id,
        ROUND(AVG(salary_year_avg), 0) AS salary_avg
    FROM 
        job_postings_fact 
    INNER JOIN 
        skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN 
        skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' 
        AND job_work_from_home = true 
        AND salary_year_avg IS NOT NULL 
    GROUP BY
        skills_job_dim.skill_id

) 
-- now join these CTE's
SELECT 
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    average_salary
FROM 
    skills_demand 
INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id
WHERE 
    demand_count > 10
ORDER BY 
    average_salary DESC,
    demand_count DESC
LIMIT 30