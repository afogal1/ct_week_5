-- Customer table
CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	birthday DATE,
	ticket_id INTEGER NOT NULL,
	FOREIGN KEY(ticket_id) REFERENCES ticket(ticket_id)
);
	
-- Ticket table
CREATE TABLE ticket(
	ticket_id SERIAL PRIMARY KEY,
 	movie_time DATE,
	movie_id INTEGER NOT NULL,
	FOREIGN KEY(movie_id) REFERENCES movie(movie_id)	
);
	
-- Concession table
CREATE TABLE concession(
	concession_id SERIAL PRIMARY KEY,
	concession_name VARCHAR(30),
	customer_id INTEGER NOT NULL,
	FOREIGN KEY ("customer_id") REFERENCES customer(customer_id)
);

-- Movie table 
CREATE TABLE movie(
	movie_id SERIAL PRIMARY KEY,
	movie_title VARCHAR(30)
);

SELECT *
FROM concession;