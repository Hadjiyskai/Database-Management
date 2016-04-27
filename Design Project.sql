/*DROP TABLE IF EXISTS characters;
DROP TABLE IF EXISTS voiceActors;
DROP TABLE IF EXISTS episodes;
DROP TABLE IF EXISTS animals;
DROP TABLE IF EXISTS owners;
DROP TABLE IF EXISTS occupations;
DROP TABLE IF EXISTS characterEpisode;
DROP TABLE IF EXISTS jobs;
DROP TABLE IF EXISTS animalOwn;
DROP TABLE IF EXISTS voiceCharacter;*/

--Simpsons Database
--Iglika Hadjiyska
--Database Management Spring 2016


CREATE TABLE characters (
	cid integer NOT NULL,
	characterName varchar(100) NOT NULL DEFAULT 'not specified',
	age integer NOT NULL,
	relationshipStatus varchar(100) NOT NULL DEFAULT 'single',
	frequency varchar(100) DEFAULT 'not specified',
	status varchar(100) DEFAULT 'alive',
	strangeFact text DEFAULT 'lives in the Simpsons universe',
	hairColor varchar(100) DEFAULT 'not specified',
	gender varchar(100) DEFAULT 'not specified',
	cType varchar(100) DEFAULT 'not specified',
   primary key (cid)
);



CREATE TABLE voiceActors (
	vid integer NOT NULL,
	actorName varchar(100) NOT NULL DEFAULT 'not specified',
	dob date,
   primary key (vid)
);


CREATE TABLE episodes (
	eid integer NOT NULL,
	episodeName varchar(100) NOT NULL DEFAULT 'not specified',
	airDate date,
	season int,
   primary key (eid)
);


CREATE TABLE occupations (
	oid integer NOT NULL,
	occupyName varchar(100) NOT NULL DEFAULT 'not specified',
   primary key (oid)
);

CREATE TABLE animals (
	aid integer NOT NULL references characters(cid),
	breed varchar(100) DEFAULT 'not specified',
	aniName varchar(100) DEFAuLT 'not specified',
   primary key (aid)
);

CREATE TABLE owners (
	ownid integer NOT NULL references characters(cid),
	ownName varchar(100) DEFAULT 'not specified',
   primary key (ownid)
);

CREATE TABLE animalOwn (
	aid integer NOT NULL references animals(aid),
	ownid integer NOT NULL references owners(ownid),
   primary key(aid, ownid)
);


CREATE TABLE characterEpisode (
	eid integer NOT NULL references episodes(eid),
	cid integer NOT NULL references characters(cid),
   primary key (eid, cid)
);

CREATE TABLE jobs (
	cid integer NOT NULL references characters(cid),
	oid integer NOT NULL references occupations(oid),
   primary key (cid, oid)
);


CREATE TABLE voiceCharacter (
	cid integer NOT NULL references characters(cid),
	vid integer NOT NULL references voiceActors(vid),
   primary key (cid, vid)
);


--characters sample data
INSERT INTO characters (cid, characterName, age, relationshipStatus, frequency, status, strangeFact, hairColor, gender, cType)
	VALUES (001, 'Homer Jay Simpson', 40, 'married', 'main', 'alive', 'owns the Denver Broncos, despite wanting to own the Dallas Cowboys', 'balding', 'male', 'human');

INSERT INTO characters (cid, characterName, age, relationshipStatus, frequency, status, strangeFact, hairColor, gender, cType) 
	VALUES (002, 'Marge Jacqueline Simpson', 34, 'married', 'main', 'alive', 'only ambidextrous character', 'blue', 'female', 'human');

INSERT INTO characters (cid, characterName, age, relationshipStatus, frequency, status, strangeFact, hairColor, gender, cType) 
	VALUES (003, 'Bart JoJo Simpson', 10, 'single', 'main', 'alive', 'once died in a car accident but was told to return to life by Satan', 'blonde', 'male', 'human');

INSERT INTO characters (cid, characterName, age, relationshipStatus, frequency, status, strangeFact, hairColor, gender, cType) 
	VALUES (004, 'Lisa Marie Simpson', 8, 'single', 'main', 'alive', 'her character turned vegetarian upon request of Sir Paul McCartney', 'blonde', 'female', 'human');

INSERT INTO characters (cid, characterName, age, relationshipStatus, frequency, status, strangeFact, hairColor, gender, cType) 
	VALUES (005, 'Maggie Evelyn Simpson', 1, 'single', 'main', 'alive', 'Elizabeth Taylor provided the voice for her first word', 'blonde', 'female', 'human');

INSERT INTO characters (cid, characterName, age, relationshipStatus, frequency, status, strangeFact, hairColor, gender, cType) 
	VALUES (006, 'Abe Jebediah Simpson II', 83, 'single', 'supporting', 'alive', 'was part of the WWII troops The Flying Hellfish', 'blonde', 'male', 'human');

INSERT INTO characters (cid, characterName, age, relationshipStatus, frequency, status, strangeFact, hairColor, gender, cType) 
	VALUES (007, 'Ned Flanders', 60, 'married', 'supporting', 'alive', 'does not believe in insurance and considers it gambling', 'brown', 'male', 'human');

INSERT INTO characters (cid, characterName, age, relationshipStatus, frequency, status, strangeFact, hairColor, gender, cType) 
	VALUES (008, 'Patty Bouvier', 41, 'single', 'supporting', 'alive', 'her hair is originally red', 'grey', 'female', 'human');

INSERT INTO characters (cid, characterName, age, relationshipStatus, frequency, status, strangeFact, hairColor, gender, cType) 
	VALUES (009, 'Selma Bouvier', 41, 'single', 'supporting', 'alive' ,'has six ex-husbands', 'grey', 'female', 'human');

INSERT INTO characters (cid, characterName, age, frequency, status, strangeFact, hairColor, gender, cType) 
	VALUES (010, 'Santa''s Little Helper', 2, 'supporting', 'alive', 'can change a baby''s diaper', 'brown', 'male', 'canine');

INSERT INTO characters (cid, characterName, age, frequency, status, strangeFact, hairColor, gender, cType) 
	VALUES (011, 'Snowball II', 2, 'supporting', 'deceased', 'has been replaced at least four times, all with the same name', 'black', 'female', 'feline');

INSERT INTO characters (cid, characterName, age, relationshipStatus, frequency, status, strangeFact, hairColor, gender, cType) 
	VALUES (012, 'Krusty the Clown', 52, 'single', 'supporting', 'alive', 'weighs 200 pounds roughly, including 30 pounds of makeup', 'green', 'male', 'human');

INSERT INTO characters (cid, characterName, age, relationshipStatus, frequency, status, strangeFact, hairColor, gender, cType) 
	VALUES (013, 'Sideshow Bob', 41, 'married', 'supporting', 'alive', 'became the mayor of an Italian village due to his large feet', 'red', 'male', 'human');	

INSERT INTO characters (cid, characterName, age, relationshipStatus, frequency, status, strangeFact, hairColor, gender, cType) 
	VALUES (014, 'Sideshow Mel', 45, 'married', 'supporting', 'alive', 'can feel meteorological conditions because of the bone in his hair', 'green', 'male', 'human');

INSERT INTO characters (cid, characterName, age, relationshipStatus, frequency, status, strangeFact, hairColor, gender, cType) 
	VALUES (015, 'Charles Montgomery Burns', 100, 'single', 'supporting', 'alive', 'owns the suit Charlie Chaplin was buried in', 'balding', 'male', 'human');

INSERT INTO characters (cid, characterName, age, relationshipStatus, frequency, status, strangeFact, hairColor, gender, cType) 
	VALUES (016, 'Waylon Smithers', 40, 'single', 'supporting', 'alive', 'has the largest collection of Malibu Stacy dolls', 'grey', 'male', 'human');

INSERT INTO characters (cid, characterName, age, frequency, status, strangeFact, hairColor, cType) 
	VALUES (017, 'Mr. Teeny', 2, 'supporting', 'alive', 'like James Bond, Mr. Teeny is an alias for many of Krusty''s monkeys', 'brown', 'monkey');

INSERT INTO characters (cid, characterName, age, frequency, status, hairColor, gender, cType) 
	VALUES (018, 'Jub-Jub', 100, 'supporting', 'alive', 'green', 'male', 'reptile');

INSERT INTO characters (cid, characterName, age, frequency, status, strangeFact, hairColor, gender, cType) 
	VALUES (019, 'Stampy', 0, 'supporting', 'alive', 'his safe word is ''magumbo''', 'grey', 'male', 'elephant');

--voiceActors sample data
INSERT INTO voiceActors(vid, actorName, dob)
	VALUES (101, 'Dan Castellaneta', '10/29/1957');

INSERT INTO voiceActors(vid, actorName, dob)
	VALUES (102, 'Julie Kavner', '09/07/1950');

INSERT INTO voiceActors(vid, actorName, dob)
	VALUES (103, 'Nancy Cartwright', '10/25/1957');

INSERT INTO voiceActors(vid, actorName, dob)
	VALUES (104, 'Yeardley Smith', '07/3/1964');

INSERT INTO voiceActors(vid, actorName, dob)
	VALUES (105, 'Kelsey Grammer', '2/21/1955');

INSERT INTO voiceActors(vid, actorName, dob)
	VALUES (106, 'Harry Shearer', '12/23/1943');

INSERT INTO voiceActors(vid, actorName, dob)
	VALUES (107, 'Frank Welker', '03/12/1946');

--occupation sample data
INSERT INTO occupations(oid, occupyName)
	VALUES (201, 'Nuclear Factory Plant worker');

INSERT INTO occupations(oid, occupyName)
	VALUES(202, 'housewife');

INSERT INTO occupations(oid, occupyName)
	VALUES(203, 'student');

INSERT INTO occupations(oid, occupyName)
	VALUES(204, 'DMV worker');

INSERT INTO occupations(oid, occupyName)
	VALUES(205, 'clown/TV entertainer');

INSERT INTO occupations(oid, occupyName)
	VALUES(206, 'house pet');

INSERT INTO occupations(oid, occupyName)
	VALUES(207, 'owner of the Leftorium');

INSERT INTO occupations(oid, occupyName)
	VALUES(208, 'pharmecutical representative');

INSERT INTO occupations(oid, occupyName)
	VALUES(209, 'astronaut');

INSERT INTO occupations(oid, occupyName)
	VALUES(210, 'talent agent');

INSERT INTO occupations(oid, occupyName)
	VALUES(211, 'musician');

INSERT INTO occupations(oid, occupyName)
	VALUES(212, 'car designer');

INSERT INTO occupations(oid, occupyName)
	VALUES(213, 'real estate agent');

INSERT INTO occupations(oid, occupyName)
	VALUES(214, 'model');

INSERT INTO occupations(oid, occupyName)
	VALUES(215, 'actor');

INSERT INTO occupations(oid, occupyName)
	VALUES(216, 'Nuclear Factory Plant owner');

INSERT INTO occupations(oid, occupyName)
	VALUES(217, 'assistant');

INSERT INTO occupations(oid, occupyName)
	VALUES(218, 'racing dog');

INSERT INTO occupations(oid, occupyName)
	VALUES(219, 'performer');

INSERT INTO occupations(oid, occupyName)
	VALUES(220, 'veteran');

INSERT INTO occupations(oid, occupyName)
	VALUES(221, 'toddler');

INSERT INTO occupations(oid, occupyName)
	VALUES(222, 'murderer');

--animals sample data
INSERT INTO animals(aid, breed, aniName)
	VALUES(010, 'greyhound', 'Santa''s Little Helper');

INSERT INTO animals(aid, aniName)
	VALUES(011, 'Snowball II');

INSERT INTO animals(aid, breed, aniName)
	VALUES(017, 'ape', 'Mr. Teeny');

INSERT INTO animals(aid, breed, aniName)
	VALUES(018, 'iguana', 'Jub-Jub');

INSERT INTO animals(aid, breed, aniName)
	VALUES(019, 'African elephant', 'Stampy');


--owners sample data
INSERT INTO owners(ownid, ownName)
	VALUES(003, 'Bart JoJo Simpson');

INSERT INTO owners(ownid, ownName)
	VALUES(001, 'Homer Jay Simpson');

INSERT INTO owners(ownid, ownName)
	VALUES(004, 'Lisa Marie Simpson');

INSERT INTO owners(ownid, ownName)
	VALUES(009, 'Selma Bouvier');

INSERT INTO owners(ownid, ownName)
	VALUES(012, 'Krusty the Clown');

--episodes sample data
INSERT INTO episodes(eid, episodeName, airDate, season)
	VALUES(301, 'Good Night', '4/19/1987', 1);

INSERT INTO episodes(eid, episodeName, airDate, season)
	VALUES(302, 'Grandpa and the Kids', '1/10/1988', 2);

INSERT INTO episodes(eid, episodeName, airDate, season)
	VALUES(303, 'Simpsons Roasting on an Open Fire', '12/17/1989', 1);

INSERT INTO episodes(eid, episodeName, airDate, season)
	VALUES(304, 'The Krusty the Clown Show', '1/15/1989', 3);

INSERT INTO episodes(eid, episodeName, airDate, season)
	VALUES(305, 'The Telltale Head', '2/25/1990', 1);

INSERT INTO episodes(eid, episodeName, airDate, season)
	VALUES(306, 'Itchy & Scratchy & Marge', '12/20/1990', 2);

INSERT INTO episodes(eid, episodeName, airDate, season)
	VALUES(307, 'Homer''s Odyssey', '1/21/1990', 1);

INSERT INTO episodes(eid, episodeName, airDate, season)
	VALUES(308, 'Selma''s Choice', '1/21/1993', 4);

INSERT INTO episodes(eid, episodeName, airDate, season)
	VALUES(309, 'Bart Gets an Elephant', '3/31/1994', 5);

--animalOwn sample data
INSERT INTO animalOwn(aid, ownid)
	VALUES(010, 001);

INSERT INTO animalOwn(aid, ownid)
	VALUES(011, 004);

INSERT INTO animalOwn(aid, ownid)
	VALUES(017, 012);

INSERT INTO animalOwn(aid, ownid)
	VALUES(018, 009);

INSERT INTO animalOwn(aid, ownid)
	VALUES(019, 004);

--characterEpisode sample data
INSERT INTO characterEpisode(eid, cid)
	VALUES(301, 001);

INSERT INTO characterEpisode(eid, cid)
	VALUES(301, 002);

INSERT INTO characterEpisode(eid, cid)
	VALUES(301, 003);

INSERT INTO characterEpisode(eid, cid)
	VALUES(301, 004);

INSERT INTO characterEpisode(eid, cid)
	VALUES(301, 005);

INSERT INTO characterEpisode(eid, cid)
	VALUES(302, 006);

INSERT INTO characterEpisode(eid, cid)
	VALUES(303, 007);

INSERT INTO characterEpisode(eid, cid)
	VALUES(303, 008);

INSERT INTO characterEpisode(eid, cid)
	VALUES(303, 009);

INSERT INTO characterEpisode(eid, cid)
	VALUES(303, 010);

INSERT INTO characterEpisode(eid, cid)
	VALUES(303, 011);

INSERT INTO characterEpisode(eid, cid)
	VALUES(304, 012);

INSERT INTO characterEpisode(eid, cid)
	VALUES(305, 013);

INSERT INTO characterEpisode(eid, cid)
	VALUES(306, 014);

INSERT INTO characterEpisode(eid, cid)
	VALUES(303, 015);

INSERT INTO characterEpisode(eid, cid)
	VALUES(307, 016);

INSERT INTO characterEpisode(eid, cid)
	VALUES(306, 017);

INSERT INTO characterEpisode(eid, cid)
	VALUES(308, 018);

INSERT INTO characterEpisode(eid, cid)
	VALUES(309, 019);

--Jobs sample data
INSERT INTO jobs(cid, oid)
	VALUES(001, 201);

INSERT INTO jobs(cid, oid)
	VALUES(001, 209);

INSERT INTO jobs(cid, oid)
	VALUES(001, 210);
	
INSERT INTO jobs(cid, oid)
	VALUES(001, 211);

INSERT INTO jobs(cid, oid)
	VALUES(001, 212);

INSERT INTO jobs(cid, oid)
	VALUES(002, 202);

INSERT INTO jobs(cid, oid)
	VALUES(002, 213);

INSERT INTO jobs(cid, oid)
	VALUES(002, 214);

INSERT INTO jobs(cid, oid)
	VALUES(003, 203);

INSERT INTO jobs(cid, oid)
	VALUES(004, 203);

INSERT INTO jobs(cid, oid)
	VALUES(005, 221);

INSERT INTO jobs(cid, oid)
	VALUES(006, 220);

INSERT INTO jobs(cid, oid)
	VALUES(007, 207);

INSERT INTO jobs(cid, oid)
	VALUES(007, 208);

INSERT INTO jobs(cid, oid)
	VALUES(008, 204);

INSERT INTO jobs(cid, oid)
	VALUES(009, 204);

INSERT INTO jobs(cid, oid)
	VALUES(010, 206);

INSERT INTO jobs(cid, oid)
	VALUES(011, 206);

INSERT INTO jobs(cid, oid)
	VALUES(012, 205);

INSERT INTO jobs(cid, oid)
	VALUES(012, 219);

INSERT INTO jobs(cid, oid)
	VALUES(012, 215);

INSERT INTO jobs(cid, oid)
	VALUES(013, 222);

INSERT INTO jobs(cid, oid)
	VALUES(013, 219);

INSERT INTO jobs(cid, oid)
	VALUES(013, 205);

INSERT INTO jobs(cid, oid)
	VALUES(014, 205);

INSERT INTO jobs(cid, oid)
	VALUES(014, 219);

INSERT INTO jobs(cid, oid)
	VALUES(014, 215);

INSERT INTO jobs(cid, oid)
	VALUES(015, 216);

INSERT INTO jobs(cid, oid)
	VALUES(016, 217);

INSERT INTO jobs(cid, oid)
	VALUES(017, 219);

INSERT INTO jobs(cid, oid)
	VALUES(017, 205);

INSERT INTO jobs(cid, oid)
	VALUES(018, 206);

INSERT INTO jobs(cid, oid)
	VALUES(019, 219);

--voiceCharacter sample data
INSERT INTO voiceCharacter(cid, vid)
	VALUES(001, 101);

INSERT INTO voiceCharacter(cid, vid)
	VALUES(006, 101);

INSERT INTO voiceCharacter(cid, vid)
	VALUES(012, 101);

INSERT INTO voiceCharacter(cid, vid)
	VALUES(014, 101);

INSERT INTO voiceCharacter(cid, vid)
	VALUES(002, 102);

INSERT INTO voiceCharacter(cid, vid)
	VALUES(008, 102);

INSERT INTO voiceCharacter(cid, vid)
	VALUES(009, 102);

INSERT INTO voiceCharacter(cid, vid)
	VALUES(003, 103);

INSERT INTO voiceCharacter(cid, vid)
	VALUES(005, 103);

INSERT INTO voiceCharacter(cid, vid)
	VALUES(004, 104);

INSERT INTO voiceCharacter(cid, vid)
	VALUES(015, 106);

INSERT INTO voiceCharacter(cid, vid)
	VALUES(016, 106);

INSERT INTO voiceCharacter(cid, vid)
	VALUES(017, 107);

INSERT INTO voiceCharacter(cid, vid)
	VALUES(018, 107);

INSERT INTO voiceCharacter(cid, vid)
	VALUES(019, 107);

INSERT INTO voiceCharacter(cid, vid)
	VALUES(010, 107);

INSERT INTO voiceCharacter(cid, vid)
	VALUES(011, 107);

INSERT INTO voiceCharacter(cid, vid)
	VALUES(013, 105);


/*ELECT * FROM characters;
SELECT * FROM voiceActors;
SELECT * FROM episodes;
SELECT * FROM animals;
SELECT * FROM owners;
SELECT * FROM occupations;
SELECT * FROM jobs;
SELECT * FROM voiceCharacter;
SELECT * FROM characterEpisode;
SELECT * FROM animalOwn;*/

--views
CREATE OR REPLACE VIEW whichVoice AS
SELECT c.characterName, va.actorName 
FROM characters c
INNER JOIN voiceCharacter vc 
ON vc.cid=c.cid
INNER JOIN voiceActors va
ON vc.vid = va.vid;


CREATE OR REPLACE VIEW whichEpisode AS
SELECT e.episodeName, e.airDate, c.characterName
FROM episodes e
INNER JOIN characterEpisode ce
ON e.eid = ce.eid
INNER JOIN characters c
ON ce.cid = c.cid;


--reports
SELECT o.occupyName, c.characterName
FROM occupations o
INNER JOIN jobs j
ON o.oid = j.oid
INNER JOIN characters c
ON j.cid = c.cid;

SELECT o.ownName, a.aniName
FROM owners o
INNER JOIN animalOwn ao
ON o.ownid = ao.ownid
INNER JOIN animals a
ON ao.aid = a.aid;

--stored procedures
CREATE OR REPLACE FUNCTION frequencyVoice(varchar(100), REFCURSOR)
RETURNS refcursor as $$
DECLARE
	actorNameInput varchar(100) := $1;
	resultset REFCURSOR := $2;
BEGIN
   open resultset for
	SELECT count(actorNameInput) 
	FROM whichVoice
	WHERE actorNameInput = actorName;
   return resultset;
end;
$$
language plpgsql;

SELECT frequentVoice('Dan Castellaneta', 'results');
FETCH ALL FROM results;

CREATE OR REPLACE FUNCTION jobschar(varchar(100), REFCURSOR)
RETURNS refcursor as $$
DECLARE 
	characterInput varchar(100) := $1;
	resultset REFCURSOR := $2;
BEGIN
  open resultset for
	SELECT o.occupyName, c.characterName
	FROM occupations o
	INNER JOIN jobs j
	ON o.oid = j.oid
	INNER JOIN characters c
	ON j.cid = c.cid
		where characterInput = c.characterName;
  return resultset;
end;
$$
language plpgsql;

SELECT jobschar('Homer Jay Simpson', 'results');
FETCH ALL FROM results;

--jobs trigger: updates jobs linking table if new cid and oid is added
CREATE OR REPLACE FUNCTION addjobs()
RETURNS TRIGGER AS $body$
BEGIN
	INSERT INTO jobs (cid, oid)
		values(new.cid, new.oid);
END
$body$
language plpgsql;

CREATE TRIGGER addOccupation
AFTER INSERT ON occupations
EXECUTE PROCEDURE addjobs();

CREATE TRIGGER addCharacter
AFTER INSERT ON characters
EXECUTE PROCEDURE addjobs();

INSERT INTO characters (cid, age)
	VALUES(098, 25);

INSERT INTO occupations (oid)
	VALUES(231);

select * from characters;
select * from occupations;

--security
CREATE ROLE admin;
GRANT ALL ON ALL TABLES
IN SCHEMA PUBLIC
TO admin;

CREATE ROLE user
GRANT SELECT
ON ALL TABLES IN SCHEMA PUBLIC
TO user;


