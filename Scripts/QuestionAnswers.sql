SELECT * FROM data_analyst_jobs;





-- 1.	How many rows are in the data_analyst_jobs table?

SELECT COUNT(*)
FROM data_analyst_jobs;

-- Answer: 1793






-- 2.	Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?

SELECT *
FROM data_analyst_jobs
LIMIT 10;

-- Answer:   ExxonMobil





-- 3.	How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?

SELECT COUNT(*)
FROM data_analyst_jobs
WHERE location='TN';

-- Answer 3a     21 jobs in TN




-- 3.	How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?

SELECT COUNT(*)
FROM data_analyst_jobs
WHERE location IN ('TN','KY');

-- Answer 3b		27 jobs total in TN and KY combined





-- 4.	How many postings in Tennessee have a star rating above 4?

SELECT *
FROM data_analyst_jobs
WHERE star_rating >4
	AND location = 'TN';

-- Answer    3 total posting for TN where star rating is above 4






-- 5.	How many postings in the dataset have a review count between 500 and 1000?

SELECT COUNT(*)
FROM data_analyst_jobs
WHERE review_count 
	BETWEEN 500  AND 1000;

-- Answer	total of 151 records where reviews are between 500-10000



-- 6.	Show the average star rating for companies in each state. The output should show the state as `state` and the average rating for the state as `avg_rating`. Which state shows the highest average rating?

SELECT data_analyst_jobs.location AS state, 
		ROUND(AVG(star_rating),2) AS avg_rating
FROM data_analyst_jobs
WHERE star_rating IS NOT NULL
GROUP BY state
ORDER BY avg_rating DESC;

-- Answer    NE shows the highest avg rating of 4.20





-- 7.	Select unique job titles from the data_analyst_jobs table. How many are there?

SELECT DISTINCT(title)
FROM data_analyst_jobs; 

--Answer    total of 881 Unique titles showing





--8.	How many unique job titles are there for California companies?

SELECT COUNT(DISTINCT(title)) AS unique_title
FROM data_analyst_jobs
WHERE data_analyst_jobs.location = 'CA';

--Answer    230 Uniqe title for jobs in CA Location






--9.	Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?

SELECT company
	,	ROUND(AVG(star_rating), 2) AS avg_star_rating
FROM data_analyst_jobs
WHERE review_count>5000
	AND company IS NOT NULL
GROUP BY company;


---Answer     40 companies have more than 5000 reviews across all locations





--10.	Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?

SELECT company, star_rating,
		AVG(star_rating) AS avg_star_rating
FROM data_analyst_jobs
WHERE review_count>5000
GROUP BY company, star_rating
ORDER BY avg_star_rating DESC;

--Answer    there are 6 companies with same avg_star_rating. General Motors shows up at top with 4.1999998090000000





--11.	Find all the job titles that contain the word ‘Analyst’. How many different job titles are there? 

SELECT COUNT(DISTINCT(title)) AS title_count
FROM data_analyst_jobs
WHERE title ILIKE '%Analyst%';

--Answer	774 is the title_count where title contains 'Analyst'





--12.	How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?

SELECT title
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analyst%'
	AND title NOT ILIKE '%Analytics%';

---Answer    There are total of 4 job titles that do not contain either the word 'Analyst' or the word 'Analytics'. They all have the word "Tableau" (part of Data Visualization) common in them.





-- **BONUS:**
-- You want to understand which jobs requiring SQL are hard to fill. Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks. 
--  - Disregard any postings where the domain is NULL. 
--  - Order your results so that the domain with the greatest number of `hard to fill` jobs is at the top. 
--   - Which three industries are in the top 3 on this list? How many jobs have been listed for more than 3 weeks for each of the top 3?

SELECT domain AS industry
	, COUNT(title) AS job_count	
FROM data_analyst_jobs
WHERE domain IS NOT NULL
	AND days_since_posting > 21
	AND skill ILIKE '%SQL%'
GROUP BY  industry		
ORDER BY job_count DESC;


-- Answer	1st	"Internet and Software"					62
-- 			2nd	"Banks and Financial Services"			61
-- 			3rd	"Consulting and Business Services"		57	





