/* 
What are the top deman skills, what companies want more, not necessarily 
the top paying jobs.
1.all job psotings and 5 top deman skills
*/



SELECT 
    skills,
    COUNT(skills_job_dim.job_id) as Demand_count
FROM 
    job_postings_fact 
INNER JOIN 
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN 
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' 
AND
    job_work_from_home = true 
GROUP BY
    skills
ORDER BY 
    Demand_count DESC
limit 20