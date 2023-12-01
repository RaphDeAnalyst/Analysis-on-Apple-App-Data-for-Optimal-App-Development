USE apple_store;

SELECT * FROM store;

-- Getting the total number of apps in the store
SELECT COUNT(*) AS TotalApps FROM store;

-- Number of apps by genre
SELECT prime_genre, COUNT(*) AS TotalApps
FROM store
GROUP BY prime_genre
ORDER BY TotalApps DESC;

-- Top ten genre by average user rating 
SELECT prime_genre, ROUND(AVG(user_rating), 2) AS AvgRating
FROM store
GROUP BY prime_genre
ORDER BY AvgRating DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;

-- Bottom ten genre by average user rating 
SELECT prime_genre, ROUND(AVG(user_rating), 2) AS AvgRating
FROM store
GROUP BY prime_genre
ORDER BY AvgRating ASC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;

-- Average User rating by app size
SELECT size_group, ROUND(AVG(user_rating), 2) AS AvgRating
FROM store
GROUP BY size_group
ORDER BY AvgRating DESC;

-- Number of app by free or paid status
SELECT DISTINCT free_paid, COUNT(*) as TotalApp
FROM store
GROUP BY free_paid;

-- Average rating by free or paid status
SELECT DISTINCT free_paid,ROUND(AVG(user_rating), 2) AS AvgRating
FROM store
GROUP BY free_paid;

SELECT * FROM store

-- Average user rating by number of supported languages
SELECT DISTINCT lang_num_group, ROUND(AVG(user_rating), 2) AS AvgRating
FROM store
WHERE lang_num_group IS NOT NULL
GROUP BY lang_num_group
ORDER BY AvgRating DESC;

-- Average user rating by number of screenshots posted

SELECT DISTINCT ipadSc_urls_num, ROUND(AVG(user_rating), 2) AS AvgRating
FROM store
GROUP BY ipadSc_urls_num
ORDER BY AvgRating DESC;

-- Average user rating by price group
/* 50 to 100 dollars is a reasonable price to set for paid apps,
as it had the highest average rating*/
SELECT DISTINCT price_group, ROUND(AVG(user_rating), 2) AS AvgRating
FROM store
WHERE price_group <> 'free'
GROUP BY price_group
ORDER BY AvgRating DESC;

SELECT * FROM store
WHERE lang_num_group = '60+'

-- Average user rating by content rating
SELECT DISTINCT cont_rating, ROUND(AVG(user_rating), 2) AS AvgRating
FROM store
GROUP BY cont_rating
ORDER BY AvgRating DESC;

SELECT track_name, user_rating, rating_count_tot, prime_genre, ipadSc_urls_num, free_paid, price_group
FROM store
WHERE price_group <> '0.1-50 dollars' AND price_group <> 'free'
ORDER BY user_rating ASC;

SELECT DISTINCT price_group, COUNT(*)
from store
GROUP BY price_group;

SELECT track_name, user_rating
FROM store

SELECT 
    CASE 
        WHEN DATALENGTH(app_desc) <500 THEN 'short'
        WHEN DATALENGTH(app_desc) BETWEEN 500 AND 1000 THEN 'medium'
        ELSE 'long'
    END AS desc_range,
    ROUND(AVG(user_rating), 2) AS AVGRating
FROM 
    store
WHERE 
    price > 0
GROUP BY 
 CASE 
        WHEN DATALENGTH(app_desc) <500 THEN 'short'
        WHEN DATALENGTH(app_desc) BETWEEN 500 AND 1000 THEN 'medium'
        ELSE 'long'
    END
ORDER BY 
    AVGRating DESC;
