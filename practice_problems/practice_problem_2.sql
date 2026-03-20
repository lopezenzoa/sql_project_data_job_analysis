/*
	Practice Problem 2
	
	Question:
	- Look for non-senior data analyst or business analyst roles
		- Only get job titles that include either 'Data' or 'Business'
		- Also include those with 'Analyst' in any part of the title
		- Don't include any job titles with 'Senior' followed by any character
	- Get the job title, location, and average yearly salary
*/

SELECT
	job_title,
	job_location,
	job_via,
	salary_year_avg
FROM
	job_postings_fact
WHERE
	(job_title LIKE '%Data%' OR job_title LIKE '%Business%') AND
	job_title LIKE '%Analyst%' AND
	job_title NOT LIKE 'Senior%';

/*
	Problems found:
	- There's no aliases so name columns are hard to read
*/

SELECT
	job_title AS title,
	job_location AS location,
	job_via AS via,
	salary_year_avg AS salary
FROM
	job_postings_fact
WHERE
	(job_title LIKE '%Data%' OR job_title LIKE '%Business%') AND
	job_title LIKE '%Analyst%' AND
	job_title NOT LIKE 'Senior%';