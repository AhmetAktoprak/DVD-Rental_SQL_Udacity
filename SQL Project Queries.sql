	Workspace + Question Set #1

Query 1 - used for Question Set #1 Question 1



SELECT DISTINCT (film_title), category_name,
	COUNT(rental_count) OVER (PARTITION BY film_title ) AS rental_count  
FROM 
   (SELECT f.title film_title, c.name category_name, r.rental_id rental_count  
    FROM film f
    JOIN film_category fc
    ON f.film_id = fc.film_id
    JOIN category c
    ON fc.category_id = c.category_id
    JOIN inventory i
    ON f.film_id = i.film_id
    JOIN rental r
    ON i.inventory_id = r.inventory_id) AS film_title
WHERE category_name IN ('Animation' , 'Comedy' , 'Classics' , 'Children' ,'Family' , 'Music')
GROUP BY film_title, rental_count, category_name
ORDER BY 2,1,3 DESC;


    
----------------------------------------------------------------------------
Query 2 - used for Question Set #1 Question 2


SELECT f.title title, c.name AS name, f.rental_duration rental_duration,
NTILE(4) OVER (ORDER BY rental_duration) AS standard_quartile
    FROM film f
    JOIN film_category fc
    ON f.film_id = fc.film_id
    JOIN category c
    ON fc.category_id = c.category_id
  WHERE c.name IN ('Animation' , 'Comedy' , 'Classics' , 'Children' ,'Family' , 'Music')
GROUP BY 1,2,3;
    
--------------------------------------------------------------------------------
Query 3 - used for Question Set #1 Question 3

SELECT name, standard_quartile, 
COUNT (rental_duration) AS count
FROM
  (SELECT f.title title, c.name AS name, f.rental_duration,
  NTILE(4) OVER (ORDER BY rental_duration) AS standard_quartile
      FROM film f
      JOIN film_category fc
      ON f.film_id = fc.film_id
      JOIN category c
      ON fc.category_id = c.category_id
    WHERE c.name='Animation' OR c.name='Children' OR c.name='Classics' OR c.name='Comedy' OR c.name='Family' OR c.name='Music') t1
GROUP BY 1,2
ORDER BY 1,2,3;

======================================================================
	
	Workspace + Question Set #2

Query 1 - used for Question Set #2 Question 1


 SELECT DATE_PART('month', r.rental_date ) AS rental_month,
         DATE_PART('year', r.rental_date ) AS rental_year,
         str.store_id,
         COUNT(*) as count_rentals
    FROM rental r
    JOIN staff s
    ON r.staff_id = s.staff_id
    JOIN store str
    ON s.store_id = str.store_id
    GROUP BY 1,2,3
    ORDER BY 4 DESC;
    



