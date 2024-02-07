-- Practical Exercise with solutions
-- Create an SQL query that shows the Second highest value from the cost product column
SELECT MAX(cost_of_product) AS 2nd_highest_value
FROM data_of_orders
WHERE NOT cost_of_product =(SELECT MAX(cost_of_product) FROM data_of_orders);

-- Create an SQL query that shows the top 3 education degree of customers by total number of orders
SELECT data_of_customers.education, COUNT(data_of_orders.order_id) AS number_of_orders
FROM data_of_orders INNER JOIN data_of_customers ON data_of_orders.customer_id = data_of_customers.customer_id
GROUP BY education
ORDER BY number_of_orders DESC
LIMIT 3 ;

-- Create an SQL query that shows number of orders in table where rows are states and columns are years of orders
SELECT state,
COUNT(CASE WHEN year_of_order = 2013 THEN 1 ELSE NULL END) as "2013",
COUNT(CASE WHEN year_of_order = 2014 THEN 1 ELSE NULL END) as "2014",
COUNT(CASE WHEN year_of_order = 2015 THEN 1 ELSE NULL END) as "2015",
COUNT(CASE WHEN year_of_order = 2016 THEN 1 ELSE NULL END) as "2016"
FROM data_of_orders
GROUP BY state ;

-- Create an SQL query that shows how many customers ordered more than 1 time
SELECT COUNT(*)
FROM (SELECT customer_id,COUNT(*) AS orders_per_customer FROM data_of_orders GROUP BY customer_id 
HAVING COUNT(*)>1) AS list_of_orders_per_customer;
