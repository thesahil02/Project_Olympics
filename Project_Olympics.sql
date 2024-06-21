create database Project1;
use Project1;
SHOW VARIABLES LIKE "secure_file_priv";
create table olympics
(ID int,
Name varchar(300),
Sex char(10),
Age int,
Height int,
Weight int,
Team varchar(200),
NOC varchar(200),
Games varchar(200),
Year int,
Season varchar(100),
City varchar(100),
Sport varchar(200),
Event varchar(250),
Medal varchar(50)
);

show tables;
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.4/Uploads/Athletes_Cleaned.csv'
into table olympics
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows;

select * from olympics;

-- 1. Show how many medal counts present for entire data

select Medal, count(*) as total_medals from olympics
group by Medal;


-- 2. Show count of unique sports present in Olympics

select count(distinct(Sport)) as Unique_Sports from olympics;



-- 3. Show how many different medals won by team India

select Team, Medal, Count(Medal) as count_medal from olympics
where Team = 'India' and medal <> 'NoMedal'
group by Medal;


-- 4. Show event wise medals won by India show from highest to lowest medals won in order

select Event, Medal, count(Medal) as MedalWomBy_India from olympics
where Team = 'India' and Medal <> 'noMedal'
group by Event, Medal
order by MedalWomBy_India desc;


-- 5. Show event wise medals won by India in order of year

select event, team,medal, year as Order_year from Olympics
where team = 'India' and medal <> 'NoMedal'
group by event, year, medal
order by Order_year;


-- 6. show country who won maximum medals.

select team as country, max(medal) as Max_Medal, count(medal) as Medal_Count from Olympics
where medal <> 'NoMedal'
group by country
order by Medal_Count desc
limit 1;


-- 7.show top 10 countries who won gold 

select team as Country, medal, count(medal) as medalcount from Olympics
where medal = 'Gold'
group by team
order by medalcount desc
limit 10;


--  8. show in which year did United states won most gold medal 

select Team, year, max(medal) as maxmedal, count(Medal) as gold_medals from olympics
where medal = 'gold' and Team = 'United States'
group by Team, year
order by maxmedal desc
limit 1;


--  9. In which sports United States has most medals. 

select Team, Sport, max(medal) as maxMedal, count(Medal) as medalcount from olympics
where Team = 'United States'
group by Sport, Team
order by medalcount desc
limit 1;


-- 10. Find top three players who won most medals along with their sports and country 

select name, sport, Team as country, count(Medal) as most_medal from olympics
where Medal <> 'NoMedal'
group by name, sport, country
order by most_medal desc
limit 3;


-- 11. Find player with most gold medals in cycling along with his country.

select name, max(medal) as medal, count(Medal) AS gold_medals, Sport, Team as country from olympics
where Sport = 'Cycling' and Medal = 'gold'
group by name, country
order by gold_medals desc
limit 1;

-- 12.Find player with most medals (Gold+Silver+Bronze) in Basketball also show his country.
 
select name, Team as Country,max(medal) as medal, count(Medal) as most_Medal from olympics
where Sport = 'Basketball' and  medal <> 'NoMedal'
group by name, Country
order by most_Medal desc
limit 1;


-- 13. Find out the count of different medals of the top basketball player Teresa Edwards  

select Medal, count(Medal) as Count_Medals,name, Sport From olympics
where name ='Teresa Edwards' and Sport = 'Basketball' and Medal <> 'NoMedal'
group by Name, Sport, Medal
order by Medal desc;


-- 14. Find out medals won by male,female each year , Export this data and plot graph in excel

select year,sex, count(Medal) as count_medal from olympics
where Medal <> 'NoMedal'
group by year, sex
order by year;







