-- STOCK AVAILABILITY
select i.Product_ID,i.inventory_level,latest.latest_date from inventory i join(
select Product_ID,
max(date) as latest_date
from inventory 
group by Product_ID)  latest
 
on i.Product_ID = latest.Product_ID  
AND i.date =latest.latest_date;
