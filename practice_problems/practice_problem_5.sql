/*
	Practice Problem 5
	
	Question:
	- Find the average salary and number of job postings for each skill for this
		- Write a query to list each skill from the skills_dim table.
		- Count how many jobs postings mention each skill from the skills_to_job_dim table.
		- Calculate the average yearly salary for job postings accosiated with each skill.
		- Group the results by the skill name.
		Order by the average salary
	- Why?
		- Understand the demand and pay for skills.
*/


SELECT
	skills AS skill_name,
	COUNT(job_postings_fact.job_id) AS number_of_job_postings,
	AVG(job_postings_fact.salary_year_avg) AS average_salary_for_skill
FROM
	job_postings_fact
LEFT JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
LEFT JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
	job_postings_fact.salary_year_avg IS NOT NULL
GROUP BY
	skill_name
ORDER BY
	average_salary_for_skill DESC;