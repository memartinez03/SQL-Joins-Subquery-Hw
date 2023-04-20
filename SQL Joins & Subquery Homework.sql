--Q1: Jennifer Davis, Kim Cruz, Richard Mccrary, Bryan Hardison, Ian Still
select first_name,last_name
from customer 
inner join address
on address.address_id = customer.address_id and address.district = 'Texas';

--Q2: Douglas Graf, Mary Smith, Alfredo Mcadams, Peter Menard, Alvin Deloach
select first_name, last_name,payment.payment_id, payment.amount
from customer 
inner join payment
on payment.customer_id = customer.customer_id and payment.amount > 6.99;

--Q3: Mary Smith, Douglas Graf
select first_name, last_name
from customer 
where customer_id in (
	select customer_id 
	from payment
	group by customer_id 
	having max(amount) > 175
);

--Q4: Kevin Schuler
--finding nepal id (66)
select country_id
from country 
where country = 'Nepal';
--Finding customers that live in nepal
select first_name, last_name
from customer 
where address_id in (
	select address_id
	from address 
	where city_id in (
		select city_id
		from address 
		where city_id in (
			select city_id 
			from city 
			where country_id = 66
	)
));

--Q5: Jon Stephens
--find staff_id of biggest seller (2)
select staff_id, count(payment_id)
from payment
group by staff_id 
order by count(payment_id) desc;
--find name of best seller
select first_name, last_name, staff_id
from staff
where staff_id = 2;



--Q6: PG-13: 223, NC-17: 209, R: 196, PG: 194, G: 178
select rating, count(film_id) from film
group by rating order by count(film_id) desc;

--Q7: Douglas Graf, Alvin Deloach, Alfredo Mcadams
select customer_id, first_name, last_name
from customer 
where customer_id in (
	select customer_id
	from payment 
	where amount > 6.99
	group by customer_id 
	having count(payment_id) = 1
);

--Q8: 1452 rentals
select count(rental_id)
from rental
where rental_id in(
select rental.rental_id
from rental 
left join payment 
on payment.rental_id = rental.rental_id 
where payment.rental_id is null);