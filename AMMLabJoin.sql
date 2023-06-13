
use sakila;

-- 1. List the number of films per category.
select  category_id, count(*) as film_count
from film_category
group by category_id;


select c.category_id, c.name, count(f.film_id) as film_count
from category c
join film_category fc ON c.category_id = fc.category_id
join film f ON fc.film_id = f.film_id
group by c.category_id, c.name;


-- 2. Display the first and the last names, as well as the address, of each staff member.

select s.first_name, s.last_name, a.address
from staff s
join address a on s.address_id = a.address_id
join city c on a.city_id = c.city_id;


-- 3.Display the total amount rung up by each staff member in August 2005.
select s.staff_id, concat(s.first_name, ' ', s.last_name) AS staff_name, sum(p.amount) as total_amount
from staff s
join payment p on s.staff_id = p.staff_id
join rental r on p.rental_id = r.rental_id
where date_format(p.payment_date, '%Y-%m') = '2005-08'
group by s.staff_id, staff_name;



-- 4. List all films and the number of actors who are listed for each film.

select f.film_id, f.title, count(*) as actor_count
from film f
join film_actor fa on f.film_id = fa.film_id
group by f.film_id, f.title;

-- 5. Using the payment and the customer tables as well as the JOIN command,
-- list the total amount paid by each customer. List the customers alphabetically by their last names.

select c.customer_id, c.last_name, c.first_name, sum(p.amount) as total_amount_paid
from customer c
join payment p on c.customer_id = p.customer_id
group by c.customer_id, c.last_name, c.first_name
order by c.last_name asc;