--  Low stock alerts

select maxdate.latestdate,i.product_id,i.inventory_level,invo.threshold  from inventory i 
join(
select product_id, avg(inventory_level) as threshold
from inventory
group by product_id
order by product_id
) invo
on  i.product_id = invo.product_id
join(
select product_id, max(date) as latestdate
from inventory
group by product_id

)maxdate
on i.product_id = maxdate.product_id
WHERE i.inventory_level < 0.75*invo.threshold
-- comparing inventory_level with 75 percent of threshold
AND i.date = maxdate.latestdate






