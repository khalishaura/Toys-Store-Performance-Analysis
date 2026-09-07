/* Total tranksaksi, total unit terjual (sold), total revenue, 
total profit, dan rata - rata margin keuntungan secara keseluruhan */
SELECT 
    COUNT(DISTINCT s.sale_id) AS total_transactions,
    SUM(s.units) AS total_units_sold,
    SUM(s.units * p.product_price) AS total_revenue,
    SUM(s.units * (p.product_price - p.product_cost)) AS total_profit,
    ROUND((SUM(s.units * (p.product_price - p.product_cost)) / NULLIF(SUM(s.units * p.product_price), 0)) * 100, 2) 
		AS overall_profit_margin_percentage
FROM toys.sales s
JOIN toys.products p ON s.product_id = p.product_id;

-- Analisis Berdasarkan Lokasi Store 
SELECT 
	st.store_location, 
	COUNT(DISTINCT st.store_id) AS total_store,
	SUM(s.units * p.product_price) AS total_revenue,
	SUM(s.units * (p.product_price - p.product_cost)) AS total_profit, 
	SUM(s.units) AS total_units_sold, 
	ROUND((SUM(s.units * (p.product_price - p.product_cost)) / NULLIF(SUM(s.units * p.product_price), 0)) * 100, 2) 
		AS overall_profit_margin_percentage,
	ROUND(SUM(s.units*p.product_price)/COUNT(DISTINCT st.store_id), 2) 
		AS avg_revenue_per_store
FROM toys.sales s 
JOIN toys.stores st ON s.store_id = st.store_id 
JOIN toys.products p ON s.product_id = p.product_id
GROUP BY st.store_location
ORDER BY total_revenue DESC; 	

-- Analisis Berdasarkan Kategori Produk 
SELECT 
	p.product_category, 
	SUM(s.units * p.product_price) AS total_revenue,
	SUM(s.units * (p.product_price - p.product_cost)) AS total_profit, 
	SUM(s.units) AS total_units_sold, 
	ROUND((SUM(s.units * (p.product_price - p.product_cost)) / NULLIF(SUM(s.units * p.product_price), 0)) * 100, 2) 
		AS overall_profit_margin_percentage
FROM toys.sales s
JOIN toys.products p ON s.product_id = p.product_id
GROUP BY product_category
ORDER BY total_revenue DESC; 

-- Analisis Berdasarkan Nama Produk 
SELECT 
	p.product_name, 
	p.product_category, 
	SUM(s.units * p.product_price) AS total_revenue,
	SUM(s.units * (p.product_price - p.product_cost)) AS total_profit, 
	SUM(s.units) AS total_units_sold, 
	ROUND((SUM(s.units * (p.product_price - p.product_cost)) / NULLIF(SUM(s.units * p.product_price), 0)) * 100, 2) 
		AS overall_profit_margin_percentage
FROM toys.sales s
JOIN toys.products p ON s.product_id = p.product_id
GROUP BY product_name, product_category
ORDER BY total_revenue DESC; 

-- Tabel Untuk Power BI 
CREATE VIEW toys.vw_sales_master AS
SELECT 
    s.sale_id,
    s.sale_date,
    s.store_id,
    st.store_name,
    st.store_city,
    st.store_location,
    s.product_id,
    p.product_name,
    p.product_category,
    p.product_cost,
    p.product_price,
    s.units
FROM toys.sales s
JOIN toys.products p ON s.product_id = p.product_id
JOIN toys.stores st ON s.store_id = st.store_id;