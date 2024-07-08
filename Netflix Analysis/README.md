

# E-Commerce Data Analysis w/SQL

## Table of Contents
- Problem Statement
- Data Source
- Tools
- Data Analyzing

### Problem Statement

Netflix is one of the most popular media and video streaming platforms. They have over 8000 movies or tv shows available on their platform, as of mid-2021, they have over 200M Subscribers globally. This tabular dataset consists of listings of all the movies and tv shows available on Netflix, along with details such as - cast, directors, ratings, release year, duration, etc. I will demonstrate following criterias.

    1. What are total counts based on type?
    2. What are the total counts based on type and country?
    3. Demonstrate the top 5 countries which have filmed movies most.
    4. What are the TV Shows count in the range of 1-5 season, 5-10 season, >10 season
    5. What is the unique genre count?
    6. What is the total movies&tv shows count based on genre?
    7. What are the unique rating types and total movies&tv shows count based on it?
    8. Demonstrate total movie_count and tv shows based on year on the date_added.

### Data Source
The datasets used for this analysis are the "netflix_data.csv" file.

#### Explanation of the data table?
- show_id = Unique Id for every Movie & TV Shows
- type = Identifier ( Movie or TV Show)
- title = Title of the Movie/TV Shows
- director = Director of the Movie/TV Shows
- cast = Casts of the Movie/TV Shows
- country = Country where the movie was produced
- date_added = Date it was added on Netflix
- release_year = Actual release year of the Movie/TV Shows
- rating = TV rating of the Movie/TV Shows
- duration = total duration
- listed_in = Genre
- description = The summary description of the Movie/TV Shows


### Tools
 PostgreSQL

 #### Functions Used

    - Create Table
    - Select, Count, Where
    - Group By, Order By, Limit
    - Extract, Year
    - Case


### Data Analyzing 
- Step 1: I created a database and tables in the pgAdmin to import CSV files.
- Step 2: I wrote proper queries to answer the questions. You can reach all queries within the repo.
     
    - Query 1: What are total counts based on type?

            SELECT type,COUNT(type) AS type_count
            FROM netflix_data
            GROUP BY type;

    - Query 2: What are the total counts based on type and country?
        
            SELECT type,COUNT(type) AS type_count,country
            FROM netflix_data
            GROUP BY type, country
            ORDER BY type, type_count DESC;. 

    - Query 3: Demonstrate the top 5 countries which have filmed movies most.
    
            SELECT type,country,COUNT(type) AS type_count
            FROM netflix_data
            WHERE type ='Movie'
                AND country IS NOT NULL
                AND country <> ''
            GROUP BY type, country
            ORDER BY type, type_count DESC
            LIMIT 5;

    - Query 4: What are the movies count in the range of 1-90min , 90-120 min, >120min
    
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

    - Query 5: What are the TV Shows count in the range of 1-5 season, 5-10 season, >10 season

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

    - Query 6: What is the unique genre count?

            SELECT COUNT(DISTINCT(listed_in))
            FROM netflix_data;  

    - Query 7: What is the total movies&tv shows count based on genre?
    
            SELECT listed_in, COUNT(*) AS total_count
            FROM netflix_data
            GROUP BY listed_in
            ORDER BY total_count DESC;

    - Query 8: What are the unique rating types and total movies&tv shows count based on it?

            SELECT rating, COUNT(*) AS total_count
            FROM netflix_data
            WHERE rating <> ''
            GROUP BY rating
            ORDER BY total_count DESC;

    - Query 9: Demonstrate total movie_count and tv shows based on year on the date_added.

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