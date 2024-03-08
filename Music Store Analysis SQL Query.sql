-- 							Question set 1: Easy questions

-- select * from album

-- Q1: Who is the senior most employee based on job title?
--solution
select * from employee
order by levels desc
limit 1

-- Q2: Which countries have the most Invoices?
--solution
select count(*) as c, billing_country from invoice
group by billing_country
order by c desc

-- Q3: What are top 3 values of total invoice?
--solution
select invoice_id, total from invoice
order by total desc
limit 3

/* Q4: Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. 
Write a query that returns one city that has the highest sum of invoice totals.
Return both the city name & sum of all invoice totals */
--solution
select billing_city, sum(total) as invoice_total from invoice
group by billing_city
order by invoice_total desc
limit 1

/* Q5: Who is the best customer? The customer who has spent the most money will be declared the best customer. 
Write a query that returns the person who has spent the most money.*/
--solution
select customer.customer_id, customer.first_name, customer.last_name, sum(invoice.total) as cust_total from customer
join invoice on customer.customer_id = invoice.customer_id
group by customer.customer_id
order by cust_total desc
limit 1


/* Q6: Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
Return your list ordered alphabetically by email starting with A. */
--solution
select distinct first_name, last_name, email, genre.name as genre_name from customer
join invoice on invoice.customer_id = customer.customer_id
join invoice_line on invoice_line.invoice_id = invoice.invoice_id
join track on track.track_id = invoice_line.track_id
join genre on genre.genre_id = track.genre_id
where genre.name like 'Rock'
order by email


/* Q7: Let's invite the artists who have written the most rock music in our dataset. 
Write a query that returns the Artist name and total track count of the top 10 rock bands. */
--solution
select artist.artist_id, artist.name, count(artist.artist_id) as number_of_songs
from track
join album on album.album_id = track.album_id
join artist on artist.artist_id = album.artist_id
join genre on genre.genre_id = track.genre_id
where genre.name like 'Rock'
group by artist.artist_id
order by number_of_songs desc
limit 10;


/* Q8: Return all the track names that have a song length longer than the average song length. 
Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first. */
--solution
select name, milliseconds from track
where milliseconds > (select avg(milliseconds) as avg_song_length from track)
order by milliseconds desc;









