/* Iglika Hadjiyska
Database Management
Labouseur
Lab 5 Joins
February 22, 2016 */

-- cities of agents booking an order for a customer whose id is 'coo2'
SELECT city
FROM agents
INNER JOIN orders
ON agents.aid = orders.aid
WHERE cid = 'c002';

-- ids of products ordered through any agent who takes at least one order from a customers in Dallas, sorted by pid from highest to lowest
SELECT DISTINCT pid
FROM orders
INNER JOIN customers
ON orders.cid = customers.cid
WHERE customers.city = 'Dallas'
ORDER BY pid DESC;

-- names of customers who never placed an order. Use a subquery
SELECT name
FROM customers
WHERE customers.cid NOT IN (SELECT cid
							FROM orders);

-- names of customers who never placed an order. Use an outer join
SELECT name
FROM customers
FULL OUTER JOIN orders
ON customers.cid = orders.cid
WHERE orders.ordnum is NULL;

-- names of customers who placed at least one order through an agent in their own city, along with the agent names
SELECT DISTINCT customers.name, agents.name
FROM customers
	INNER JOIN orders ON customers.cid = orders.cid
	INNER JOIN agents ON orders.aid = agents.aid
WHERE customers.city = agents.city;

--names of customers and agents living in the same city, along with the name of shared city, regardless of whether or not the customer has placed an order with that agent
SELECT customers.name, agents.name, customers.city
FROM customers 
	INNER JOIN agents
ON customers.city = agents.city
WHERE customers.city = agents.city;

-- name and city of customers who live in the city that makes the fewest different kinds of products
SELECT customers.name, products.city
FROM customers
INNER JOIN products
ON customers.city = products.city
GROUP BY products.city, customers.name
ORDER BY count(products.city);
