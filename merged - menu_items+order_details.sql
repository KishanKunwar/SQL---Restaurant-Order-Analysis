-- 1. Combine the menu_items and order_details tables into a single table
select * 
from order_details  as od
join menu_items  as mi
on od.item_id = mi.menu_item_id ;


-- 2. What were the least and most ordered items ? what categories were they in ?

select item_name , category, count(order_details_id) as num_purchase
from order_details  as od
join menu_items  as mi
on od.item_id = mi.menu_item_id 
group by item_name , category
order by num_purchase desc
;


-- 3. What were the top 5 orders that spent the most money ?

select order_id, sum(price) as total_price
from order_details  as od
join menu_items  as mi
on od.item_id = mi.menu_item_id
group by order_id
order by total_price desc 
limit 5;

-- 4 View the details of the highest spend order. What Insights can you gather from the 

select category, count(item_id) as num_items 
from order_details  as od
join menu_items  as mi
on od.item_id = mi.menu_item_id 
where order_id = 440
group by category;

-- 5 View the details of the top 5 highest spend orders. What insight can you gather from the

select order_id, category, count(item_id) as num_items 
from order_details  as od
join menu_items  as mi
on od.item_id = mi.menu_item_id 
where order_id in (4, 2075,1957,330,2675)
group by order_id, category;


-- high sepnd was mostly from italaina nad we should kwep this high italina food 
