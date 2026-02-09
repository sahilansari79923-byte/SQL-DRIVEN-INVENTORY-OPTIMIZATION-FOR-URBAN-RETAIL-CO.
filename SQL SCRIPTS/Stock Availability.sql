-- STOCK AVAILABILITY
-- Stock availability is calculated by selecting the most recent inventory snapshot for each product,rather than summing historical inventory records)
select i.Product_ID,i.inventory_level,latest.latest_date from inventory i join(
select Product_ID,
max(date) as latest_date
from inventory 
group by Product_ID)  latest
 
on i.Product_ID = latest.Product_ID  
AND i.date =latest.latest_date;