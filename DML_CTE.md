**1. Написать запрос суммы очков с группировкой и сортировкой по годам**

select s.year_game, sum(s.points)  
from statistic s  
group by s.year_game  
order by s.year_game DESC; 

**2. Написать cte показывающее тоже самое**

with points_sum as (  
    >select s.year_game, sum(s.points) as sum from statistic s group by s.year_game  
)  
select points_sum.year_game, points_sum.sum from points_sum order by points_sum.year_game DESC;

**3. Используя функцию LAG вывести кол-во очков по всем игрокам за текущий код и за предыдущий.**

WITH points_sum AS (
	select year_game, sum(points) as sum from statistic s group by year_game order by year_game DESC
) 
select year_game, sum, lag(sum, 1) over (order by year_game) as previous_year_points from points_sum;
