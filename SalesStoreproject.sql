--change sales and profits decimal points
select 
order_id, 
order_priority, 
order_quantity, 
round(sales,2) as Sales, 
ship_mode,  
round(profit,2) as Profit, 
customer_name, 
region, 
customer_segment, 
product_category, 
Product_sub_category 
from salesstore

--orders based on the customer_region
select count(region) as region_count, region from Salesstore
group by region
order by 1

--most purchased product subcategory in each region
select count(product_sub_category) as Product_Sub_Category_count, Product_Sub_Category, region from salesstore
group by Product_Sub_Category, region
--order by Product_Sub_Category_count desc, 

--count of products based on order_prority
select count(*) as order_pririty_count, Order_Priority from Salesstore 
group by Order_Priority
order by 1

--ordercount based on prodcut category
select count(*) as product_category_count, Product_Category, product_sub_category from Salesstore 
group by product_category, product_sub_category
order by 2, 3

--order_quanity by product_category
select sum(order_quantity) as order_quanity_by_product, product_category, Product_Sub_Category from salesstore
group by Product_Category, Product_Sub_Category
order by Product_Category


--looking in to net profit and total sales 
select round(sum(profit),2) as net_profit, round(sum(sales),2) as Total_sales from salesstore

--product category That Give Most Loss To This Store ?
  


--category that gives highest profit
select  top 1 product_category, round(profit,2) as highest_profit from salesstore 
order by profit desc 


--order_priority vs ship mode
select count(order_priority) as order_priority_count, order_priority, ship_mode from salesstore
group by order_priority, ship_mode

--how are customer segments distributed in each region
select count(customer_segment) as total_customer_segmemt, region, customer_segment
from salesstore
group by customer_segment, region
order by region

--Which Region Has The Most Order Quantity ?
select top 1 sum(Order_Quantity) as total_orders_by_region,  region from salesstore 
group by region 
order by sum(Order_Quantity) desc 

--How Order Priority Distributed In Each Region ?
select count(Order_Priority) as order_priority_count, region, Order_Priority
from salesstore
group by Order_Priority, region
order by region

--customer that gave the highest profit
select top 1 customer_name, sum(profit) as profit_by_customer from Salesstore 
group by customer_name
order by profit_by_customer desc

--customer who bought the highest order quantity
select customer_name, sum(Order_Quantity) as order_quantity_by_customer from Salesstore 
group by customer_name
order by order_quantity_by_customer desc

