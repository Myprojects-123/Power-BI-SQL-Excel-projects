-- QUERY 1: SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales_excel_file;

-- QUERY 2: SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM pizza_sales

-- QUERY 3: SELECT SUM(QUANTITY) AS TOTAL_PIZZA_SOLD FROM pizza_sales_excel_file;

-- QUERY 4: SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales_excel_file;


-- QUERY 5:SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza_sales_excel_file;

-- QUERY 6:SELECT
    DAYNAME(STR_TO_DATE(order_date, '%d-%m-%Y')) AS order_day,
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales_excel_file
GROUP BY
    DAYOFWEEK(STR_TO_DATE(order_date, '%d-%m-%Y')),
    DAYNAME(STR_TO_DATE(order_date, '%d-%m-%Y'))
ORDER BY
    DAYOFWEEK(STR_TO_DATE(order_date, '%d-%m-%Y'));
    
    -- QUERY 7: SELECT
    MONTHNAME(STR_TO_DATE(order_date, '%d-%m-%Y')) AS Month_Name,
    COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales_excel_file
GROUP BY
    MONTH(STR_TO_DATE(order_date, '%d-%m-%Y')),
    MONTHNAME(STR_TO_DATE(order_date, '%d-%m-%Y'))
ORDER BY
    MONTH(STR_TO_DATE(order_date, '%d-%m-%Y'));
    
    -- QUERY 8:SELECT pizza_category,
    ROUND(SUM(total_price), 2) AS TOTAL_SALES,
    ROUND(
        (SUM(total_price) * 100) / 
        (SELECT SUM(total_price) FROM pizza_sales_excel_file),
        2
    ) AS PCT
FROM pizza_sales_excel_file
GROUP BY pizza_category;

-- query 9:SELECT PIZZA_SIZE,
    ROUND(SUM(total_price), 2) AS TOTAL_SALES,
    ROUND(
     (SUM(total_price) * 100) / 
        (SELECT SUM(total_price) FROM pizza_sales_excel_file),
        2
    ) AS PCT
FROM pizza_sales_excel_file
GROUP BY PIZZA_SIZE 
ORDER BY PCT DESC;


-- QUERY: SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales_excel_file
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;


-- QUERY 10: SELECT pizza_name, SUM(total_price) AS Total_Revenue FROM pizza_sales_excel_file
GROUP BY pizza_name
ORDER BY Total_Revenue DESC LIMIT 5 ;

-- QUERY 11: SELECT pizza_name, SUM(total_price) AS Total_Revenue FROM pizza_sales_excel_file GROUP BY pizza_name
             ORDER BY Total_Revenue ASC LIMIT 5 ;
             
 -- QUERY 12:   SELECT pizza_name, SUM(QUANTITY) AS Total_QUANTITY
FROM pizza_sales_excel_file
GROUP BY pizza_name
ORDER BY Total_QUANTITY DESC LIMIT 5 ;    

-- QUERY 13:  SELECT pizza_name, SUM(QUANTITY) AS Total_QUANTITY
FROM pizza_sales_excel_file
GROUP BY pizza_name
ORDER BY Total_QUANTITY ASC LIMIT 5 ; 

-- QUERY 14: 
SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales_excel_file
GROUP BY pizza_name
ORDER BY Total_Orders DESC LIMIT 5;

-- QUERY 15: SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales_excel_file
GROUP BY pizza_name
ORDER BY Total_Orders ASC LIMIT 5;