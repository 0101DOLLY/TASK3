# 1.Create a database name task_c?
create database task_c;

# how to use the database?
use task_c;

#show all columns from supplement_sales?
select * from supplement_sales;



# show product name,category, units sold whose units sold is greater than 150?
SELECT `Product Name`, `Category`
FROM supplement_sales
WHERE `Units Sold` >150;

#Total revenue by category, for sales above $5000, ordered descending
SELECT Category, SUM(Revenue) AS Total_Revenue
FROM supplement_sales
WHERE Revenue > 5000
GROUP BY Category
ORDER BY Total_Revenue DESC;

#Total and average revenue by platform
SELECT Platform, SUM(Revenue) AS Total_Revenue, AVG(Revenue) AS Avg_Revenue
FROM supplement_sales
GROUP BY Platform;

# Create a view to show best-performing products (revenue > 6000)
CREATE VIEW best_Performance_Products AS
SELECT `Product Name`, `Category`, `Revenue`
FROM supplement_sales
WHERE `Revenue` > 5000;

select* from best_Performance_Products;

# Top 5 Bestselling Products by Units Sold?
SELECT "Product Name", SUM("Units Sold") AS Total_Units_Sold
FROM supplement_sales
GROUP BY "Product Name"
ORDER BY Total_Units_Sold 
LIMIT 5;

#Average Discount by Category?
SELECT `Category`, AVG(`Discount`) AS `Avg_Discount`
FROM supplement_sales
GROUP BY Category;

#inner join
SELECT 
    s.`Product Name`, 
    s.Category AS Sales_Category, 
    ss.Category AS Superstore_Category, 
    s.Revenue, 
    ss.Sales
FROM supplement_sales
INNER JOIN superstore ss
ON s.Category = ss.Category;

# LEFT JOIN on Location = State
SELECT 
    s.`Product Name`, 
    s.Location AS Country, 
    ss.State, 
    ss.Sales AS Store_Sales
FROM supplement_sales
LEFT JOIN superstore ss
ON s.Location = ss.State;



















