
with cte as(
select customer_id,year(order_date) as order_date,sum(price) as price
from orders
group by customer_id,year(order_date)
)

select  distinct c1.customer_id
from cte c1
left join cte c2 on c1.customer_id=c2.customer_id and c1.order_date+1=c2.order_date and c1.price<c2.price
group by c1.customer_id
having count(*)-count(c2.customer_id)=1