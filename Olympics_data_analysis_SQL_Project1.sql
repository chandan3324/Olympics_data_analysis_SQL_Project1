create database games;

use games;

create table olympics(
ID int,
Name varchar(500),
Sex varchar(10),
Age int,
Height int,
Weight int,
Team varchar(350),
NOC varchar(100),
Games varchar(500),
Year int,
Season varchar(400),
City varchar(300),
Sport varchar(500),
Event varchar(400),
Medal varchar(200));

select * from olympics;

show variables like "secure_file_priv";

load data infile "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Athletes_Transformed.csv"
into table olympics
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows;

select * from olympics;

-- SQL PROJECT

-- 1. Show how many medal counts present for entire data
SELECT medal,count(Medal) as Medalcounts FROM olympics
WHERE medal != 'Nomedal'
GROUP BY medal;

-- 2. Show count of unique sports present in Olympics
SELECT COUNT(DISTINCT(SPORT)) AS UniqueSport 
FROM olympics;

-- 3. Show how many different medals won by team India
SELECT TEAM,MEDAL, COUNT(MEDAL) AS Medalcnt 
FROM olympics
WHERE team = 'India' and medal != 'Nomedal'
GROUP BY TEAM,MEDAL;


-- 4. Show event wise medals won by India show from highest to lowest medals won in order
SELECT EVENT,COUNT(*) AS Eventcnt FROM olympics
WHERE team = 'India' and medal != 'Nomedal'
GROUP BY EVENT
ORDER BY Eventcnt DESC;


-- 5. Show event wise medals won by India in order of year
SELECT YEAR,EVENT,COUNT(MEDAL) AS medalcnt FROM olympics
WHERE team = 'India' and medal != 'Nomedal'
GROUP BY YEAR,EVENT
ORDER BY YEAR;


-- 6. show country who won maximum medals.
SELECT TEAM,COUNT(MEDAL) AS medalcnt FROM olympics
GROUP BY TEAM
ORDER BY medalcnt DESC
LIMIT 1;

-- 7.show top 10 countries whowon gold
SELECT TEAM,COUNT(MEDAL) AS medalcnt FROM olympics
WHERE medal = 'gold'
GROUP BY TEAM 
ORDER BY medalcnt DESC
LIMIT 10;



--  8. show in which year did United states won most gold medal
SELECT TEAM,YEAR,COUNT(MEDAL) AS Goldmedals FROM olympics
WHERE team = 'United States' and medal = 'Gold'
GROUP BY TEAM,YEAR
ORDER BY Goldmedals DESC
LIMIT 1; 


-- 9. In which sports United States has most medals.
SELECT TEAM,SPORT,COUNT(MEDAL) AS Medalcnt FROM olympics
WHERE team = 'United States'
GROUP BY TEAM, SPORT
ORDER BY Medalcnt DESC
LIMIT 1;


-- 10. Find top three players who won most medals along with their sports and country
SELECT NAME, COUNT(MEDAL) AS MostMedals, SPORT, TEAM FROM olympics
GROUP BY NAME,SPORT,TEAM
ORDER BY MostMedals DESC
LIMIT 3;


-- 11. Find player with most gold medals in cycling along with his country.
SELECT NAME, COUNT(MEDAL) AS medalcnt, SPORT, TEAM FROM olympics
WHERE sport = 'cycling'
GROUP BY NAME,SPORT,TEAM
ORDER BY medalcnt DESC
LIMIT 1;


-- 12.Find player with most medals (Gold+Silver+Bronze) in Basketball also show his country.
SELECT NAME, COUNT(MEDAL) AS medalcnt, SPORT, TEAM FROM olympics
WHERE sport = 'Basketball'
GROUP BY NAME, SPORT, TEAM
ORDER BY medalcnt DESC
LIMIT 1;


-- 13. Find out the count of different medals of the top basketball player Teresa Edwards
SELECT MEDAL, COUNT(MEDAL) AS medalcount FROM olympics
WHERE NAME = 'Teresa Edwards' and sport = 'Basketball'
GROUP BY MEDAL;


-- 14. Find out medals won by male,female each year , Export this data and plot graph in excel
SELECT SEX, YEAR, COUNT(MEDAL) AS MedalCounts FROM olympics
GROUP BY SEX,YEAR
ORDER BY YEAR ASC, SEX ASC;