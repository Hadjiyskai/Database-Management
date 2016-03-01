/* Iglika Hadjiyska
Database Management
Labouseur
February 29, 2015
Lab 6 Painful Queries */

-- Display	the	name	and	city	of	customers	who	live	in	any	city	that	makes	the	most different	kinds	of	products.	(There	are	two	cities	that	make	the	most	different products.	Return	the	name	and	city	of	customers	from	either	one	of	those.)	

SELECT customers.name, customers.city
FROM customers
WHERE city IN (SELECT city
			   FROM products
			   GROUP BY products.city
			   ORDER BY count(*) DESC
			   limit 1);
			   
-- Display	the	names	of	products	whose	priceUSD	is	strictly	above	the	average	priceUSD, in	reverse-alphabetical	order
SELECT products.name
FROM products
WHERE priceUSD > (SELECT AVG(priceUSD)
				  FROM products)
ORDER BY name DESC;

-- Display	the	customer	name,	pid	ordered,	and	the	total	for	all	orders,	sorted	by	total from	high	to	low
SELECT customers.name, orders.pid, orders.totalUSD
FROM customers
INNER JOIN orders
ON customers.cid = orders.cid
ORDER BY totalUSD DESC;

-- Display	all	customer	names	(in	alphabetical	order)	and	their	total	ordered,	and	nothing	more.	Use	coalesce	to	avoid	showing	NULL
select customers.name, coalesce(totalUSD, 0) as totalUSD
from customers
FULL OUTER JOIN orders
ON customers.cid = orders.cid;

select customers.name, coalesce(sum(orders.totalUSD), 0) as "TotalOrdered"
from customers
left outer join orders
on customers.cid = orders.cid
group by customers.name;

-- Display	the	names	of	all	customers	who	bought	products	from	agents	based	in	Tokyo along	with	the	names	of	the	products	they	ordered,	and	the	names	of	the	agents	who	sold	it	to	them
select customers.name, products.name, agents.name
from orders inner join customers on orders.cid = customers.cid
	    inner join products on orders.pid = products.pid
	    inner join agents on orders.aid = agents.aid
where agents.city = 'Tokyo';

-- Write	a	query	to	check	the	accuracy	of	the	dollars	column	in	the	Orders	table.	This means	calculating	Orders.totalUSD	from	data	in	other	tables	and	comparing	those values	to	the	values	in	Orders.totalUSD.	Display	all	rows	in	Orders	where Orders.totalUSD	is	incorrect,	if	any
select orders.totalUSD, (orders.qty * products.priceUSD) * (1- (customers.discount/100)) as "Recalculated TotalUSD"
from orders inner join products on orders.pid = products.pid
	        inner join customers on orders.cid = customers.cid
where orders.totalUSD != ((orders.qty * products.priceUSD) * (1- (customers.discount/100)));

-- What’s	the	difference	between	a	LEFT	OUTER	JOIN	and	a	RIGHT	OUTER	JOIN?	Give example	queries	in	SQL	to	demonstrate.	(Feel	free	to	use	the	CAP2	database	to	make your	points	here.)
/* An outer join basically is used to show all values within two or more tables that are being joined. This is different fro the inner join, which only returns matching values between the two tables. Left and right outer joins only differ based on which table is being referenced first. A left outer join will reference the first table (table 1) while a right outer join will reference the second table (table 2).

Example of a left outer join:
SELECT orders.aid, agents.name
FROM orders
LEFT OUTER JOIN agents
ON orders.aid = agents.aid;

Example of a right outer join:
SELECT orders.cid, customers.city
FROM orders
RIGHT OUTER JOIN customers
ON customers.cid = orders.cid;

*/ 