/*
Question: What skills are required the top-paying Data Analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query.
- Add the specific skills required for these roles.
- Why? It provides a detailed look at wich high-paying jobs deman certain skills,
    helping jo seekers understand wich skills to develop that align with top salaries.
*/

SELECT
	jpc.job_id,
	jpc.job_title,
	sd.skills,
	sd.type
FROM 
	job_postings_fact AS jpc
INNER JOIN skills_job_dim AS sjd ON jpc.job_id = sjd.job_id
INNER JOIN skills_dim AS sd ON sd.skill_id = sjd.skill_id
WHERE
	job_title_short = 'Data Analyst' AND
	salary_year_avg IS NOT NULL AND
	job_location = 'Anywhere'
ORDER BY
	salary_year_avg DESC
LIMIT 10;

/*
	This exercise would be to do it with a CTE
	Then this temporary result table could be double-joined with skills_job_dim and skills_dim
*/

WITH top_10_paying_jobs AS (
	SELECT
		job_id,
		job_title,
		salary_year_avg,
		name AS company_name
	FROM 
		job_postings_fact
	LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
	WHERE
		job_title_short = 'Data Analyst' AND
		salary_year_avg IS NOT NULL AND
		job_location = 'Anywhere'
	ORDER BY
		salary_year_avg DESC
	LIMIT 10
)
SELECT
	top_10_paying_jobs.*, -- I decided to show everything from the CTE
	skills
FROM top_10_paying_jobs
INNER JOIN skills_job_dim ON top_10_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
ORDER BY
	salary_year_avg DESC;