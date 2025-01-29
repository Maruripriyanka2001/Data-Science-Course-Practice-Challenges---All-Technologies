USE sakila;

   -- TASK 1 : Extracting the data of customers who are in active
select * from customer
where active=0;
-- INTERPRETATION:Extracted the data of customers who are in inactive using where condition.
 
 -- TASK 2: Extracting the firstname and lastname and email who are in active
select first_name,last_name,email from customer
where active=0;
-- INTERPRETATION: Extracted the firstname and lastname and email who are in active using where clause

    -- TASK 3: Identifying the highest store_id of customer who are inactive.
select first_name,store_id from customer
where active=0
order by store_id desc
limit 1;
-- INTERPRETATION: Identified the highest store_id of customer who are inactive. Using order by.

    -- TASK 4 : Identified the title that are realted to pg-13
select title,rating from film
where rating = 'PG-13';
-- INTERPRETATION: Identified the movies that are related to pg-13 rating.

   -- TASK 5: Identified the title that aree related to pg-13 and limit is 3
select title,rating from film
where rating = 'PG-13'
order by rating desc
limit 3;
 -- INTERPRETATION: Identified the title that are related to pg-13 and limit is 3
   
   -- TASK 6:Identified the highet rental duration for the pg-13 movies.
select title,rental_duration from film
where rating = 'PG-13'
order by rental_duration desc;
-- INTERPRETATION: Identified the highest rental duration for the pg-13 movies using where clause and order by.

   -- TASK 7:Identified the average rental cost of the movie
select title,avg(rental_rate) from film
group by title;
-- INTERPRETATION: Identified the average rental cost of the movie from film using avg function
 
  -- TASK 8:Identified the total replacement cost for the each movie title.
Select title,sum(replacement_cost) as total_replacement_cost from film
group by title;
-- INTERPRETATION: Identified the total replacement cost for the each movie title using group by.


--  TASK9
SELECT 'Animation' AS category ,COUNT(*) AS number_of_films
FROM film_category
WHERE category_id = (SELECT category_id FROM category WHERE name = 'Animation')
union all
SELECT 'Children' as category,COUNT(*) AS number_of_films
FROM film_category
WHERE category_id = (SELECT category_id FROM category WHERE name = 'Children');
-- INTERPRETATION: Identified the total no of films related the category of animations and children



