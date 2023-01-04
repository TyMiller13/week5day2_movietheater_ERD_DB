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


--insert customers to customer table
insert into customer (
	email,
	phone_number,
	loyalty_member 
) values (
	'golda.kozey93@gmail.com',
	555-555-5555,
	true
), (
	'magali93@hotmail.com',
	281-330-8004,
	false
), (
	'river24@gmail.com',
	234-567-8910,
	false	
), (
	'vern69@gmail.com',
	678-999-8212,
	true
);
--insert movies to movie table
insert into movies (
	title,
	description,
	rating,
	genre 
) values (
	'AVATAR: THE WAY OF WATER',
	'Set more than a decade after the events of the first film, “Avatar The Way of Water” begins to tell the story of the Sully family (Jake, Neytiri and their kids), the trouble that follows them, the lengths they go to keep each other safe, the battles they fight to stay alive and the tragedies they endure.',
	'PG-13',
	'Sci-Fi'
), (
	'M3GAN',
	'From the most prolific minds in horror—James Wan, the filmmaker behind the Saw, Insidious and The Conjuring franchises, and Blumhouse, the producer of the Halloween films, The Black Phone and The Invisible Man—comes a fresh new face in terror. M3GAN is a marvel of artificial intelligence, a life-like doll programmed to be a child’s greatest companion and a parent’s greatest ally. Designed by brilliant toy-company roboticist Gemma (Get Out’s Allison Williams), M3GAN can listen and watch and learn as she becomes friend and teacher, playmate and protector, for the child she is bonded to. When Gemma suddenly becomes the caretaker of her orphaned 8-year-old niece, Cady (Violet McGraw, The Haunting of Hill House), Gemma’s unsure and unprepared to be a parent. Under intense pressure at work, Gemma decides to pair her M3GAN prototype with Cady in an attempt to resolve both problems—a decision that will have unimaginable consequences.',
	'PG-13',
	'Horror'
), (
	'BLACK PANTHER: WAKANDA FOREVER',
	'The nation of Wakanda is pitted against intervening world powers as they mourn the loss of their king TChalla.',
	'PG-13',
	'Action'
);

-- add column to movies table
alter table movies 
add column genre VARCHAR(20);
-- add column to ticket table
alter table tickets 
add column quantity INTEGER not null;