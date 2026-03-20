/*
	Practice Problem 7
	
	Find the count of the number of remote job postings per skill
		- Display the top 5 skills by their demand in remote jobs
		- Include skill ID, name, and count of postings requiring the skill
*/

SELECT
	skills_dim.skill_id,
	skills AS skill_name,
	COUNT(job_postings_fact.job_id) AS number_of_job_postings
FROM
	job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
	job_work_from_home AND
	job_title_short = 'Data Analyst'
GROUP BY
	skill_name, skills_dim.skill_id
ORDER BY
	number_of_job_postings DESC
LIMIT 5;