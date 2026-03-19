/*
Question: What are the most in-demand skills for Data Analyst?
- Join job postings to inner table similar to query 2.
- Identify the top 5 in-demand skills for a Data Analyst.
- Focus on all job postings.
- Why? Retrieve the top 5 skills with the highest demand in the job market,
    providing insights into the most valuable skills for job seekers.
*/

WITH top_10_paying_jobs_skills AS (
	SELECT
		jpc.job_id,
		jpc.job_title,
		sd.skill_id,
		sd.skills,
		sd.type
	FROM 
		job_postings_fact AS jpc
	INNER JOIN skills_job_dim AS sjd
		ON jpc.job_id = sjd.job_id
	INNER JOIN skills_dim AS sd
		ON sd.skill_id = sjd.skill_id
	WHERE
		job_title_short = 'Data Analyst' AND
		salary_year_avg IS NOT NULL AND
		job_location = 'Anywhere'
	ORDER BY
		salary_year_avg DESC
)
SELECT
	COUNT(job_id) AS total_jobs,
	skills
FROM
	top_10_paying_jobs_skills
GROUP BY
	skills
ORDER BY
	total_jobs DESC
LIMIT 5;

/*
	Queries would be as simpler as possible
	Here a CTE is not useful
*/

SELECT
	skills,
	COUNT(job_postings_fact.job_id) AS total_jobs
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE
	job_title_short = 'Data Analyst' AND
	job_work_from_home
GROUP BY
	skills
ORDER BY
	total_jobs DESC
LIMIT 5;