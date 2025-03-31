 SELECT * from df_orders
 

 -- find 10 highest revenue genrating prducts
 SELECT top 10 product_id,sum(sale_price) as sales
 from df_orders
 group by product_id
 order by sales



 --find top 5 highest selling products in each region 



 SELECT region, 
       product_id, 
       SUM(quantity) AS total_quantity_sold
FROM df_orders
GROUP BY region, product_id
ORDER BY region, total_quantity_sold DESC;

--find month over month growth comparison for 2022 and 2023 sales edg jan 2022 vs jan 2023

SELECT  year (order_date) AS order_year ,month(order_date) as month ,sum(sale_price) as sales  from df_orders

group by year(order_date) , month(order_date)
ORDER BY year(order_date) , month(order_date)

--Find the Most Profitable Regions (Top 5 by Total Profit)
SELECT TOP 5 region, SUM(profit) AS total_profit
FROM df_orders
GROUP BY region
ORDER BY total_profit DESC;

--Find the Best Month for Sales in the Last 2 Years

SELECT TOP 1 YEAR(order_date) AS order_year, 
           MONTH(order_date) AS order_month, 
           SUM(sale_price) AS total_sales
FROM df_orders
WHERE order_date >= DATEADD(YEAR, -2, GETDATE())
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY total_sales DESC;