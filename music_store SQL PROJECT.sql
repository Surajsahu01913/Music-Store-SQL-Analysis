CREATE DATABASE Music_store
USE Music_store
 SELECT * FROM [dbo].[album]
 SELECT * FROM [dbo].[artist]
 SELECT * FROM [dbo].[customer]
 SELECT * FROM [dbo].[employee]
 SELECT * FROM [dbo].[genre]
 SELECT * FROM [dbo].[invoice]
 SELECT * FROM [dbo].[media_type]
 SELECT * FROM [dbo].[playlist]
 SELECT * FROM [dbo].[playlist_track]
 SELECT * FROM [dbo].[track]
 SELECT * FROM [dbo].[invoice_line]
 SELECT * FROM [dbo].[album2]

 ---1. Who is the senior most employee based on job title?
     WITH senior AS (
           SELECT (first_name + ' ' + last_name)  AS Name,title,DENSE_RANK ()OVER (ORDER BY DATEDIFF(YEAR,hire_date,GETDATE())) AS Total_Servis
		   FROM employee )
		   SELECT  Name,title
		   FROM senior
		   WHERE Total_Servis ='1'
---2. Which countries have the most Invoices?
      SELECT  TOP 1 
	  billing_country,COUNT (invoice_id) AS Total_invoice
	  FROM invoice
	  GROUP BY billing_country
	  ORDER BY COUNT (invoice_id) DESC
---3. What are top 3 values of total invoice?
               SELECT TOP 3  *
			   FROM invoice
			   ORDER BY total DESC

---4. Which city has the best customers?
--We would like to throw a promotional Music Festival in the city we made the most money.
--Write a query that returns one city that has the highest sum of invoice totals.
--Return both the city name & sum of all invoice totals
                   SELECT  TOP 1 
				    billing_city,SUM(total) Total_Sales
				   FROM invoice
				   GROUP BY billing_city
				   ORDER BY SUM(total) DESC

---5. Who is the best customer? 
--The customer who has spent the most money will be declared the best customer.
--Write a query that returns the person who has spent the most money
                SELECT  TOP 1 
				(C.first_name +' '+C.last_name)  AS Name,
				C.customer_id,SUM(total) AS Total_spent
				FROM invoice AS I
				   JOIN customer AS C
				   ON I.customer_id = C.customer_id
				GROUP BY C.customer_id ,(C.first_name +' '+C.last_name) 
				ORDER BY SUM(total) DESC

----------------------Question Set 2 – Moderate------------------------------------------------------------
	---1. Write query to return the email, first name, last name, & Genre of all Rock Music listeners.
	----Return your list ordered alphabetically by email starting with A			         
						  
						  SELECT  DISTINCT(C.first_name+' '+C.last_name) AS Name,
						  C.email,G.name
						  FROM  customer AS C
						     JOIN invoice AS I 
							 ON C.customer_id = I.customer_id
							  JOIN invoice_line AS II
							   ON I.invoice_id = II.invoice_id
							   JOIN track AS T
							   ON II.track_id = T.track_id
							   JOIN genre AS G
							   ON T.genre_id = G.genre_id
							   WHERE G.name='ROCK'
							   ORDER BY  C.email ASC
---2. Let's invite the artists who have written the most rock music in our dataset.
--Write a query that returns the Artist name and total track count of the top 10 rock bands
                       SELECT  TOP 10
					   AR.name,AR.artist_id,
					   COUNT(AR.artist_id ) AS TotaL_song
					   FROM track AS T
					   JOIN album AS A ON A.album_id =T.album_id
					   JOIN artist AS AR ON AR.artist_id = A.artist_id
					   JOIN genre AS G ON G.genre_id = T.genre_id
					   WHERE G.name = 'ROCK'
					   GROUP BY AR.name,AR.artist_id
					   ORDER BY COUNT(AR.artist_id )  DESC
-----3. Return all the track names that have a song length longer than the average song length. 
--Return the Name and Milliseconds for each track.
---Order by the song length with the longest songs listed first
                  SELECT  name,milliseconds
				  FROM track
				  WHERE milliseconds > (SELECT AVG(milliseconds)  FROM track)
             ORDER BY milliseconds DESC

----Question Set 3 – Advance
--1. Find how much amount spent by each customer on artists? 
--Write a query to return customer name, artist name and total spent
                 SELECT  (C.first_name+' '+C.last_name) AS customer_name,
				  (AR.name) AS Artist_name,
				 SUM(IL.unit_price*IL.quantity) AS TOTAL_Sales
				 FROM customer AS C
				 JOIN invoice AS I ON I.customer_id = C.customer_id
				 JOIN invoice_line AS IL ON IL.invoice_id =I.invoice_id
				 JOIN track AS T ON T.track_id = IL.track_id
				 JOIN album AS A ON A.album_id= T.album_id
				 JOIN artist AS AR ON AR.artist_id = A.artist_id
				GROUP BY AR.name,(C.first_name+' '+C.last_name)
				 ORDER BY SUM(IL.unit_price*IL.quantity) DESC
---2. We want to find out the most popular music Genre for each country.
---We determine the most popular genre as the genre with the highest amount of purchases.
---Write a query that returns each country along with the top Genre.
---For countries where the maximum number of purchases is shared return all Genres
            SELECT country,popular_music_Genre,
			MAX(Total_purchases) AS maximum_number_of_purchases
			FROM (SELECT   C.country,(G.name) AS popular_music_Genre,
				    COUNT(IL.quantity) AS Total_purchases,
					DENSE_RANK () OVER (PARTITION BY C.country ORDER BY  COUNT(IL.quantity) DESC) AS popular_music
					 FROM  customer AS C 
					  JOIN invoice AS I ON I.customer_id = C.customer_id
					  JOIN invoice_line AS IL ON IL.invoice_id= I.invoice_id
					  JOIN track AS T ON T.track_id = IL.track_id
					  JOIN genre AS G ON G.genre_id =T.genre_id
					  GROUP BY  G.name,C.country) AS most_popular_genre
					   WHERE popular_music ='1'
					   GROUP BY country,popular_music_Genre
----3. Write a query that determines the customer that has spent the most on music for each country.
---Write a query that returns the country along with the top customer and how much they spent. 
----For countries where the top amount spent is shared, provide all customers who spent this amount					  
           WITH   each_country  AS 
		                    (SELECT C.country,
						   (C.first_name+' '+C.last_name) AS customer_Name,
						   ROUND(SUM(I.total),2) AS Total_Spent,
						   DENSE_RANK () OVER(PARTITION  BY C.country ORDER BY  ROUND(SUM(I.total),2) DESC)AS Top_customer
					       FROM invoice AS I
						   JOIN customer AS C  ON C.customer_id = I.customer_id
						   GROUP BY C.country,(C.first_name+' '+C.last_name))
              SELECT country,customer_Name,Total_Spent
			       FROM each_country
				   WHERE Top_customer ='1'
				   ORDER BY Total_Spent DESC

