# Shop Sales SQL Analysis

A SQL project that analyzes sales for a phone and accessories shop in Ghana. I wrote 12 queries in SQL Server to answer business questions about products, customers, regions, and payment methods.

## Dataset
The data is a **sample dataset** I created for practice. It is not real business data. Amounts are in Ghana cedis (GHS), and the sales run from January to June 2026.

| Table | Rows | What it holds |
|---|---|---|
| `sales` | 150 | Each sale: date, customer, product, quantity, payment method, discount |
| `customers` | 30 | Customer name, region, type (individual or business), signup date |
| `products` | 12 | Product name, category (Phone or Accessory), unit price |

The tables are linked by `customer_id` and `product_id`.

## Skills used
`SELECT` · `WHERE` · `ORDER BY` · `TOP` · `COUNT` · `SUM` · `GROUP BY` · `HAVING` · `JOIN` (multiple tables) · `CASE WHEN`

## Business questions
1. Preview the first 10 sales
2. List phones from most to least expensive
3. Show sales paid with Mobile Money
4. List customers in Greater Accra
5. Count sales per payment method
6. Total quantity sold per product
7. Total revenue per category
8. Revenue by region
9. Top 5 customers by spending
10. Revenue per product for each month
11. Customers who bought more than once
12. Label each sale as Big, Medium or Small

## Key findings
- **Phones drive the business.** They earned about 178,450 GHS of the 202,965 GHS total revenue (roughly 88%), and accessories earned about 24,515 GHS.
- **Ashanti is the top region** with about 93,160 GHS, more than double Greater Accra (about 36,090 GHS), even though Greater Accra has the most customers.
- **A few customers matter a lot.** The top customer, Emmanuel Baidoo, spent about 47,625 GHS, and the top 2 customers together account for over 40% of revenue.
- **Mobile Money is the most common payment method**, used in 81 of 150 sales (54%), followed by Cash (43), Card (18) and Bank Transfer (8).
- **Earphones sold the most units** (44), and 19 of the customers bought more than once.

Revenue is calculated as `quantity * unit_price` and does not include discounts.

## Files
- `shop_sales_queries.sql`: all 12 queries with explanations
- `data/`: the three CSV files

## How to run it
1. Create a database in SQL Server (for example `ShopDB`).
2. Import the three CSV files from `data/` as tables named `sales`, `customers` and `products`.
3. Open `shop_sales_queries.sql` and run the queries.

## Author
Cindy Afia Frimpong
