# Toy Store Sales Performance

# Project Overview 
This project analyzes sales performance for a toy retail business using PostgreSQL for data analysis and preparation, followed by Power BI for interactive dashboard visualization. The objective is to transform raw transactional data into actionable business insights by evaluating revenue, profitability, product performance, store performance, and sales trends over time.

# Data Source 
The raw dataset is sourced from the Maven Analytics Data Playground (Maven Toys Dataset).  

# Data Preparation 
The database is designed using four relational tables connected through Primary Keys (PK) and Foreign Keys (FK) to support sales performance analysis.

<p align="center">
  <img src="erd-schema.png" alt="Toy Store Database ERD" width="700">
</p>

### Table Overview

| Table | Primary Key | Description |
|-------|-------------|-------------|
| `products` | `product_id` | Stores product information, including category, cost, and selling price. |
| `stores` | `store_id` | Stores information about each store, including city and location type. |
| `sales` | `sale_id` | Records individual sales transactions and links products with stores. |
| `inventory` | (`store_id`, `product_id`) | Stores the stock quantity of each product in every store. |

### Entity Relationships

- **`products` → `sales` (1:N):** One product can appear in multiple sales transactions.
- **`stores` → `sales` (1:N):** One store can have multiple sales transactions.
- **`stores` → `inventory` (1:N):** One store can have inventory records for multiple products.
- **`products` → `inventory` (1:N):** One product can have inventory records across multiple stores.

## Analysis Process

The analysis was conducted using several approaches.

### 1. Overall Performance Analysis
Calculated key performance indicators (KPIs), including:
- Total Revenue
- Total Profit
- Profit Margin
- Total Units Sold
- Total Transactions

### 2. Store Location Analysis
Grouped the data by store location to compare revenue, profit, total units sold, and profit margin. 

### 3. Product Analysis
Analyzed product performance by category and product name to compare revenue, profit, total units sold, and profit margin. 
The analysis focused on:
- **Product Category:** Identifying the best-performing product categories.
- **Product Name:** Identifying individual products that contributed the most to sales.

### 4. Monthly Trend Analysis
Calculated monthly revenue and analyzed revenue growth compared with the previous month.
# 
