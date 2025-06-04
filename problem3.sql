
with cte as(
select *, row_number()over()as row_num
from Point2D)

select round(min(sqrt(pow((c.x-p.x),2)+pow((c.y-p.y),2))),2) as shortest
from cte c
inner join cte p
on c.row_num<p.row_num;

