/*
	Practice Problem 8

	Find job postings from the first quarter that have a salary greater than $70k
		- Combine job postings tables from the first quarter of 2023 (Jan-Mar)
		- Gets job postings with an average yearly salary > $70,000	
*/

WITH first_quarter_job_postings AS (
	SELECT *
	FROM jan_jobs

	UNION ALL

	SELECT *
	FROM feb_jobs

	UNION ALL

	SELECT *
	FROM mar_jobs
)
SELECT
	job_title,
	job_location,
	job_via,
	job_posted_date,
	salary_year_avg
FROM first_quarter_job_postings
WHERE
	salary_year_avg > 70000 AND
	job_title_short = 'Data Analyst'
ORDER BY
	salary_year_avg DESC;

/*
	Problems found:
	- The query is simple so It would be better to use a subquery instead a CTE
	- job_posted_date would be casted to just the date (it's no useful the time at this case)
*/

SELECT
	job_title,
	job_location,
	job_via,
	job_posted_date,
	salary_year_avg
FROM (
	SELECT *
	FROM jan_jobs

	UNION ALL

	SELECT *
	FROM feb_jobs

	UNION ALL

	SELECT *
	FROM mar_jobs
) AS first_quarter_job_postings
WHERE
	salary_year_avg > 70000 AND
	job_title_short = 'Data Analyst'
ORDER BY
	salary_year_avg DESC;


