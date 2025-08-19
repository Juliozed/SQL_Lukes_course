-- top paying skills based on salary
-- what skills gte you more money

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 2) AS salary_avg
FROM 
    job_postings_fact 
INNER JOIN 
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN 
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' 
AND 
    salary_year_avg IS NOT NULL 
AND 
    job_work_from_home = true 
GROUP BY
    skills
ORDER BY 
    salary_avg DESC
limit 25


/*
Based on the provided data on high-paying skills in data analysis, we can derive several trends and insights regarding the current landscape of skills that command higher salaries. Here are some key observations:

1. Top Earners:
PySpark leads the list with an average salary of $208,172.25, indicating a strong demand for big data processing skills. PySpark is often associated with handling large datasets in a distributed computing environment, which is crucial for data analysis in enterprise settings.
Bitbucket and Couchbase, both over $160,000, highlight the importance of version control and NoSQL databases in data-centric roles.
2. Emerging Technologies:
Skills like Watson and DataRobot are indicative of a growing trend toward artificial intelligence and automated machine learning. Organizations are increasingly looking for professionals who can implement AI solutions effectively.
The presence of Databricks, a cloud-based platform for big data processing, suggests a shift towards cloud-based analytics solutions and integrated data platforms.
3. Programming and Scripting Languages:
Languages such as Swift and Golang appear on the list, reflecting the need for versatile programming skills in data analysis and software development. Swift is particularly relevant in mobile app development, and Golang is gaining traction for its performance in cloud environments.
Python libraries like Pandas and NumPy are essential for data manipulation and numerical analysis, reinforcing Python's dominance in the data analysis field.
4. Data Engineering and Infrastructure Skills:
Skills related to data engineering, such as Kubernetes, Linux, and Elasticsearch, show that data analysts are increasingly expected to understand the infrastructure that supports data processing and storage.
The inclusion of tools like Airflow and Jenkins indicates a focus on workflow orchestration and continuous integration/continuous deployment (CI/CD) practices.
5. Collaboration and Project Management Tools:
Tools like Atlassian and Notion reflect the importance of collaboration in data projects. As data teams become more cross-functional, the ability to manage projects and communicate effectively is crucial.
GitLab and Bitbucket emphasize the need for version control, which is essential for collaborative coding and maintaining code integrity in data projects.
6. Cloud Platforms and Data Management:
Skills related to cloud platforms, such as GCP (Google Cloud Platform), highlight the ongoing migration of data analytics to cloud environments. Organizations are looking for professionals who can leverage cloud services for scalability and efficiency.
PostgreSQL and MicroStrategy indicate a focus on relational databases and business intelligence tools, respectively, showing that traditional data management skills remain valuable.
7. Machine Learning and Data Science:
The presence of machine learning libraries like Scikit-learn suggests that data analysts are expected to have a foundational understanding of machine learning principles and applications.
Overall, the trend points toward a convergence of data analysis, machine learning, and big data technologies, indicating that professionals need to be well-versed in both analytical and engineering aspects.
Conclusion
The data analysis job market is evolving, with a clear emphasis on advanced technologies, programming skills, and collaborative tools. Professionals in this field need to cultivate a diverse skill set that encompasses data engineering, machine learning, cloud computing, and software development practices to remain competitive and command high salaries. As companies continue to leverage data for strategic decision-making, the demand for these skills is likely to grow.



*/