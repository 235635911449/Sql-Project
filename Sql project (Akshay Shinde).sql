-- sql project

use sample;
select * from athlete;

-- Q1. Show how many medal counts present for entire data.

select count(Medal)
from athlete;

-- Q2. Show count of unique Sports are present in olympics.

select count(distinct sport)
from athlete;

-- Q3. Show how many different medals won by Team India in data.

select team,count(medal)
from athlete
where team ='india';


-- Q4. Show event wise medals won by india show from highest to lowest medals won in order.

select Team,Event,Medal
from athlete
where Team='india'
order by 
		case
             when Medal='Gold' then 1
             when Medal='Silver' then 2
             when medal='Bronze' then 3
             else 4
        end;     
     

-- Q5. Show event and yearwise medals won by india in order of year.

select Team,Event,Year,Medal
from athlete
having Team = 'india' and Medal!='NoMedal'
order by Year;


-- Q6. Show the country with maximum medals won gold, silver, bronze
    
select max(team),medal
from athlete
group by medal;


-- Q7. Show the top 10 countries with respect to gold medals.

select Team,max(medal)
from athlete
where medal='Gold'
group by team,medal
order by count(Medal)
limit 10;


-- Q8. Show in which year did United States won most medals


select team,year,count(medal)
from athlete
where team = 'United States'
group by year,team,medal
order by count(medal) desc
limit 1;

-- Q9. In which sports United States has most medals.

select team,sport,count(medal)
from athlete
where team = 'united states'
group by team,sport ,medal 
order by count(medal) desc
limit 1 ;


-- Q10. Find top 3 players who have won most medals along with their sports and country.

select  name,team,sport,count(medal)
from athlete
group by name,team,sport,medal
order by count(medal) desc
limit  3 ;

-- Q11. Find player with most gold medals in cycling along with his country.

select Name,team,sport,medal
from athlete
where medal='gold' and sport='cycling'
group by name ,team ,sport,medal
order by medal asc;


-- Q12. Find player with most medals (Gold + Silver + Bronze) in Basketball also show his country.


select name,team,sport,count(medal)
from athlete
where medal='gold' or medal='silver' or medal='bronze' and sport = 'basketball'
group by name,team,sport,medal
order by count(medal) desc
limit 10 ;


-- Q13. Find out the count of different medals of the top basketball player.


select name,team,sport,count(medal)
from athlete
where medal='gold' or medal='silver' or medal='bronze' and sport = 'basketball'
group by name,team,sport,medal
order by count(medal) desc
limit 5 ;


-- Q14. Find out medals won by male, female each year . Export this data and plot graph in excel.


SELECT YEAR,
    SUM(CASE WHEN sex = 'M' THEN 1 ELSE 0 END) AS male_medals,
    SUM(CASE WHEN sex = 'F' THEN 1 ELSE 0 END) AS female_medals
FROM athlete
GROUP BY year
ORDER BY year;
