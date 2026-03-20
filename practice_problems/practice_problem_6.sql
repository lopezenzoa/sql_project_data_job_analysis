/*
	Practice Problem 6
	
	Question:
	- Create three tables:
		- Jan 2023 jobs
		- Feb 2023 jobs
		- Mar 2023 jobs
	- Foreshadowing: This will be used in another practice problem below
*/

CREATE TABLE IF NOT EXISTS jan_jobs AS (
	SELECT *
	FROM
		job_postings_fact
	WHERE
		EXTRACT(MONTH FROM job_posted_date) = 1
);

SELECT *
FROM jan_jobs;

CREATE TABLE IF NOT EXISTS feb_jobs AS (
	SELECT *
	FROM
		job_postings_fact
	WHERE
		EXTRACT(MONTH FROM job_posted_date) = 2
);

SELECT *
FROM feb_jobs;

CREATE TABLE IF NOT EXISTS mar_jobs AS (
	SELECT *
	FROM
		job_postings_fact
	WHERE
		EXTRACT(MONTH FROM job_posted_date) = 3
);

SELECT *
FROM mar_jobs;

