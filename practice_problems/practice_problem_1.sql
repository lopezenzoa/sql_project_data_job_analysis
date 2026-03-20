/*
	Practice Problem 1
	
	Question:
	- Get job details for BOTH 'Data Analyst' or 'Business Analyst' positions
		- For 'Data Analyst', I want jobs only > $100k
		- For 'Business Analyst', I only eant jobs > $70k
	- Only include jobs located in EITHER:
		- 'Boston, MA'
		- 'Anywhere' (i.e., Remote jobs)
*/

SELECT *
FROM job_postings_fact
WHERE
	job_title_short = 'Data Analyst' AND
	salary_year_avg > 100000 OR
	job_title_short = 'Business Analyst' AND
	salary_year_avg > 70000 AND
	job_location IN ('Boston, MA', 'Anywhere');

/*
	Problems found:
	- Data doesn't represent what is needed (so much columns displayed)
	- Conditions are a mess (organize with parenthesis)
*/

SELECT
	job_title_short,
	job_location,
	job_via,
	salary_year_avg
FROM
	job_postings_fact
WHERE
	(
		(job_title_short = 'Data Analyst' AND salary_year_avg > 100000) OR
		(job_title_short = 'Business Analyst' AND salary_year_avg > 70000)
	) AND
	job_location IN ('Boston, MA', 'Anywhere');
	
	