--What are total counts based on type?
SELECT type,COUNT(type) AS type_count
FROM netflix_data
GROUP BY type;

-- what are the total counts based on type and country?
SELECT type,COUNT(type) AS type_count,country
FROM netflix_data
GROUP BY type, country
ORDER BY type, type_count DESC;

--Demonstrate the top 5 countries which have filmed movies most.
SELECT type,country,COUNT(type) AS type_count
FROM netflix_data
WHERE type ='Movie'
	AND country IS NOT NULL
	AND country <> ''
GROUP BY type, country
ORDER BY type, type_count DESC
LIMIT 5;

--What are the movies count in the range of 1-90min , 90-120 min, >120min
SELECT
 CASE
 	WHEN duration<=90 THEN '1-90min'
	WHEN duration>90 AND duration <=120 THEN '90-120min'
	ELSE '>120min'
 END AS duration_range,
 COUNT(*) AS movie_count
FROM netflix_data
WHERE type ='Movie'
GROUP BY duration_range
ORDER BY duration_range;


--What are the TV Shows count in the range of 1-5 season, 5-10 season, >10 season
SELECT
	CASE 
		WHEN duration<=5 THEN '1-5 Season'
		WHEN duration>5 AND duration<=10 THEN '5-10 Season'
		ELSE '>10Season'
	END AS duration_range,
	COUNT(*) AS TV_Shows_Count
FROM netflix_data
WHERE type = 'TV Show'
GROUP BY duration_range
ORDER BY duration_range;

--What is the unique genre count?
SELECT COUNT(DISTINCT(listed_in))
FROM netflix_data;

--What is the total movies&tv shows count based on genre?
SELECT listed_in, COUNT(*) AS total_count
FROM netflix_data
GROUP BY listed_in
ORDER BY total_count DESC;

--What are the unique rating types and total movies&tv shows count based on it?
SELECT rating, COUNT(*) AS total_count
FROM netflix_data
WHERE rating <> ''
GROUP BY rating
ORDER BY total_count DESC;

-- Demostrate total movie_count and tv shows based on year on the date_added.
SELECT EXTRACT(YEAR FROM date_added) AS year,
       COUNT(*) AS movie_count
FROM netflix_data
WHERE type = 'Movie'
GROUP BY year
ORDER BY year;

SELECT EXTRACT(YEAR FROM date_added) AS year,
       COUNT(*) AS tv_shows_count
FROM netflix_data
WHERE type = 'TV Show'
GROUP BY year
ORDER BY year;

