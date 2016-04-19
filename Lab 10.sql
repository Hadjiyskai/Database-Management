--Iglika Hadjiyska
--Database Management
--Alan Labouseur
--Lab 10: Stored Procedures

--Displays the first prerequisite for the given course number
CREATE FUNCTION preReqsFor(int, REFCURSOR)
RETURNS refcursor as $$
DECLARE
	courseNumInput int := $1;
	resultset REFCURSOR := $2;
BEGIN
   open resultset for
	SELECT preReqNum
	FROM Prerequisites
	WHERE courseNum = courseNumInput;
   return resultset;
end;
$$
language plpgsql;

SELECT preReqsFor(499, 'results');
FETCH ALL FROM results;

--Displays the course number that the given prerequistite is for
CREATE FUNCTION isPreReqFor(int, REFCURSOR)
RETURNS refcursor as $$
DECLARE
	preReqNumInput int := $1;
	resultset REFCURSOR := $2;
BEGIN
   open resultset for
	SELECT courseNum
	FROM Prerequisites
	WHERE preReqNum = preReqNumInput;
   return resultset;
end;
$$
language plpgsql;
SELECT isPreReqFor(308, 'results');
FETCH ALL FROM results;