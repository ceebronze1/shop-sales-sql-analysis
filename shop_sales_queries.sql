/*
Project 1: Shop Sales Analysis
Author: Cindy
Goal: answer business questions with SQL
*/

SELECT COUNT(*) FROM sales;
SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM products;

-- Q1: Show the first 10 sales
-- Uses TOP 10 to limit the output and * to show all columns, which gives a quick preview of the data
SELECT TOP 10 * FROM SALES;

-- Q2: List all products in the Phone category, from most to least expensive
-- Uses WHERE to filter by category and ORDER BY unit_price DESC to sort from the highest price to the lowest
SELECT * FROM products
WHERE category = 'Phone'
ORDER BY unit_price DESC;
-- Finding: There are 5 phones. The iPhone 13 is the most expensive at 7,800 GHS and the Tecno Spark 20 is the cheapest at 1,700 GHS

--QUESTION 3 : SHOW ALL SALES PAID WITH MOBILE MONEY
-- Uses WHERE to filter the sales table by payment_method
SELECT * FROM sales
WHERE payment_method ='Mobile Money';
-- Finding: [the number of rows I got,  "81 of the 150 sales were paid with Mobile Money"]

-- Q4: List the customers in Greater Accra
-- Uses WHERE to filter the customers table by region
SELECT * FROM CUSTOMERS
WHERE region = 'Greater Accra';
-- Finding: [9] customers are in Greater Accra


--level 2

-- Q5: How many sales were there for each payment method?
-- Uses GROUP BY payment_method to make one row per method, and COUNT(*) to count the sales in each
SELECT payment_method, COUNT(*) AS Number_of_sales
FROM sales
GROUP BY payment_method
ORDER BY Number_of_sales DESC;
-- Finding: Mobile Money is the most common payment method (81 of 150 sales), followed by Cash (43), Card (18) and Bank Transfer (8)


-- Q6: What is the total quantity sold per product?
-- Uses SUM(quantity) to add up the units sold, and GROUP BY product_id to make one row per product
-- ORDER BY total_units DESC puts the best-selling product first
SELECT product_id, SUM(quantity) AS total_units
FROM sales
GROUP BY product_id
ORDER BY total_units DESC;
-- Finding: Product ID [9] WHICH IS (earphones) sold the most, with [44] units

-- Q7: Total revenue for each category
-- Joins sales to products to get the unit price, then multiplies quantity by price and sums it for each category

SELECT p.category, SUM(s.quantity * p.unit_price) AS total_revenue
FROM sales s
JOIN products p ON s.product_ID = p.product_ID
GROUP BY P.category
ORDER BY total_revenue DESC;
--FINDING: PHONE CATEGORY EARNED MORE WITH AN AMOUNT OF 178450


-- Q8: Revenue by region
SELECT c.region, SUM(s.quantity * p.unit_price) AS total_revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.region
ORDER BY total_revenue DESC;


-- Q9 Top 5 customers by total spending
SELECT TOP 5   c.customer_name, SUM(s.quantity * p.unit_price) AS total_spending
FROM sales s
JOIN products p ON s.product_id = p.product_id
JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spending DESC;

-- Q11: Which customers bought more than once?
-- Joins sales to customers, then groups the sales by customer and counts how many purchases each one made
-- HAVING COUNT(*) > 1 keeps only the customers who bought two or more times (repeat customers)
-- ORDER BY puts the customer with the most purchases first
SELECT c.customer_name, COUNT(*) AS number_of_purchases
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(*) > 1
ORDER BY number_of_purchases DESC;
-- Finding: [19 repeat ] customers bought more than once, and [31] bought the most, with [write the number] purchases.

-- Q12: Label each sale by size
SELECT s.sale_id,
       s.quantity * p.unit_price AS revenue,
       CASE
           WHEN s.quantity * p.unit_price > 5000 THEN 'Big'
           WHEN s.quantity * p.unit_price >= 1000 THEN 'Medium'
           ELSE 'Small'
       END AS sale_size
FROM sales s
JOIN products p ON s.product_id = p.product_id
ORDER BY revenue DESC;