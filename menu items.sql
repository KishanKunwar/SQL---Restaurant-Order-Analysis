use restaurant_db;
-- 1. View the menu_item table
select * from menu_items;

-- 2. Find the no of items on the menu
select count(*) from menu_items;


-- 3. What are the least and most expensive items on the menu
select item_name, price from menu_items
where price = (select max(price) from menu_items);

select item_name, price from menu_items
where price = (select min(price) from menu_items);

-- 4. How many Italian dishes are on the menu

select count(*) from menu_items 
where category = 'Italian';

-- 5. What are the least and most expensive italian dishes on the menu
select item_name, price from menu_items
where category = 'Italian' 
and 
 price = (select max(price) from menu_items where category = 'Italian')
;

select item_name, price
from menu_items
where category = 'Italian'
and 
price = (select min(price) from menu_items where category = 'Italian' )
  ;

-- or you can used below to get rank

select item_name, price, rank() over(partition by category order by price desc) as italian_rank
from menu_items
where category = 'Italian'
order by price desc;

-- 6. How many dishes are in each category 

select category, count(*) as no_of_dishes from menu_items
group by category
order by no_of_dishes desc ;


-- 7 What is the average dish price within each category 

select category, avg(price) from  menu_items
group by category;




