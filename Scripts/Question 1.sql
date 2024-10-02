--1.	How many rows are in the data_analyst_jobs table?

SELECT COUNT(*)
FROM data_analyst_jobs

--Answer: 1793






--2.	Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?

SELECT *
FROM data_analyst_jobs
LIMIT 10

--Answer:   ExxonMobil





--3.	How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?

SELECT COUNT(*)
FROM data_analyst_jobs
WHERE data_analyst_jobs.location='TN'

--Answer 3a     21 jobs in TN




--3.	How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?

SELECT COUNT(*)
FROM data_analyst_jobs
WHERE data_analyst_jobs.location IN ('TN','KY')

--Answer 3b		27 jobs total in TN and KY combined





--4.	How many postings in Tennessee have a star rating above 4?

SELECT COUNT(*)
FROM data_analyst_jobs
WHERE star_rating >4

--Answer    416 total posting for TN where star rating is above 4






--5.	How many postings in the dataset have a review count between 500 and 1000?

SELECT COUNT(*)
FROM data_analyst_jobs
WHERE review_count BETWEEN 500  AND 1000

--Answer	total of 151 records where reviews are between 500-10000



--6.	Show the average star rating for companies in each state. The output should show the state as `state` and the average rating for the state as `avg_rating`. Which state shows the highest average rating?

SELECT data_analyst_jobs.location AS state, 
		ROUND(AVG(star_rating),2) AS avg_rating
FROM data_analyst_jobs
WHERE star_rating IS NOT NULL
GROUP BY state
ORDER BY avg_rating DESC

--Answer    NE shows the highest avg rating of 4.20






--7.	Select unique job titles from the data_analyst_jobs table. How many are there?

SELECT COUNT(DISTINCT(title)) AS unique_title
FROM data_analyst_jobs

--Answer    total of 881 Unique title showing





--8.	How many unique job titles are there for California companies?

SELECT COUNT(DISTINCT(title)) AS unique_title
FROM data_analyst_jobs
WHERE data_analyst_jobs.location = 'CA'

--Answer    230 Uniqe title for jobs in CA Location




--9.	Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?

SELECT 








