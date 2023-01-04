create table customer(
	customer_id serial primary key,
	email VARCHAR(50),
	phone_number INTEGER,
	loyalty_member BOOLEAN default false
);

select *
from customer c 



create table movies(
	movie_id serial primary key,
	title VARCHAR(50),
	description TEXT,
	rating VARCHAR(6)
);

select *
from movies;



create table tickets(
	ticket_id serial primary key,
	price numeric(5,2) not null,
	date_of_purchase TIMESTAMP default CURRENT_TIMESTAMP,
	customer_id integer not null,
	foreign key(customer_id) references customer(customer_id),
	movie_id integer not null,
	foreign key(movie_id) references movies(movie_id)
);

select *
from tickets t;


create table payments(
	payment_id serial primary key,
	amount numeric(5,2) not null,
	payment_date TIMESTAMP default CURRENT_TIMESTAMP,
	customer_id INTEGER,
	foreign key(customer_id) references customer(customer_id),
	ticket_id INTEGER,
	foreign key(ticket_id) references tickets(ticket_id)
);

select * 
from payments p;