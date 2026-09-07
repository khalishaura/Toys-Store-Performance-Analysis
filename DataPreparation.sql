-- Tabel Stores
CREATE TABLE toys.stores (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100),
    store_city VARCHAR(100),
    store_location VARCHAR(100),
    store_open_date DATE
);

-- Tabel Products
CREATE TABLE toys.products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(150),
    product_category VARCHAR(100),
    product_cost TEXT,
    product_price TEXT
);

-- Tabel Sales 
CREATE TABLE toys.sales (
    sale_id INT PRIMARY KEY,
    sale_date DATE,
    store_id INT,
    product_id INT,
    units INT,
    FOREIGN KEY (store_id) REFERENCES toys.stores(store_id),
    FOREIGN KEY (product_id) REFERENCES toys.products(product_id)
);

-- Tabel Inventory 
CREATE TABLE toys.inventory (
    store_id INT,
    product_id INT,
    stock_on_hand INT,
	PRIMARY KEY (store_id, product_id),
    FOREIGN KEY (store_id) REFERENCES toys.stores(store_id),
    FOREIGN KEY (product_id) REFERENCES toys.products(product_id)
);

-- Konversi tipe data kolom product cost dan price di tabel product
ALTER TABLE toys.products 
    ALTER COLUMN product_cost TYPE NUMERIC(10,2) 
        USING REPLACE(product_cost, '$', '')::NUMERIC(10,2),
    ALTER COLUMN product_price TYPE NUMERIC(10,2) 
        USING REPLACE(product_price, '$', '')::NUMERIC(10,2);