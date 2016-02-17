/* Iglika Hadjiyska
Labouseur
February 15, 2016
Lab 4 subqueries sequel */

-- Get the cities of agents booking an order for a customer who cid is 'c002'
SELECT city
FROM agents
WHERE aid IN (SELECT aid 
			  FROM orders
			  WHERE cid= 'c002');

-- Get the ids of products ordered through any agent who takes at least one order from a customer in Dallas, sorted	by pid from highest	to lowest
SELECT DISTINCT pid
FROM orders
WHERE aid IN (SELECT DISTINCT aid
			  FROM orders
	          WHERE cid IN (SELECT cid
							FROM customers
							WHERE city = 'Dallas'))
ORDER BY pid DESC;

-- Get the ids and names of customers who did not place an order through agent a01
SELECT cid, name
FROM customers 
WHERE cid IN (SELECT DISTINCT cid
			  FROM orders
              WHERE aid NOT IN ('a01'));

-- Get the ids of customers who ordered both product p01 and p07
SELECT cid
FROM customers
WHERE cid IN (SELECT cid
			  FROM orders 
			  WHERE pid IN ('p01') AND cid IN (SELECT cid
											   FROM orders
											   WHERE pid = 'p07'));

-- Get the ids of products not ordered by any customers who placed any order through agent a07 in pid order from highest to lowest
SELECT pid
FROM orders
WHERE cid NOT IN (SELECT cid
			      FROM orders
			      WHERE aid IN ('a07'))
ORDER BY pid DESC;

-- Get the name, discounts and city for al customers who placed an order through agents in London or New York
SELECT name, discount, city 
FROM customers
WHERE cid IN (SELECT cid
			  FROM orders
	          WHERE aid IN (SELECT aid
							FROM agents
							WHERE city IN ('London', 'New York')));

-- Get all customers who have the same discount as that of any customers in Dallas and London	
London
SELECT cid
FROM customers
WHERE discount IN (SELECT discount
		           FROM customers
		           WHERE city IN ('Dallas', 'London'));

