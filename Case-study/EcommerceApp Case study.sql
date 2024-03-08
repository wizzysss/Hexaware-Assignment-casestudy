



CREATE DATABASE  EcommerceApp

USE EcommerceApp

-- Create customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY IDENTITY(1,1),
    Cust_name VARCHAR(25),
    email VARCHAR(50),
    password VARCHAR(25)
);


-- Create products table
CREATE TABLE products (
    product_id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(25),
    price INT,
    [description] TEXT,
    stockQuantity INT
);

-- Create cart table
CREATE TABLE cart (
    cart_id INT PRIMARY KEY IDENTITY(1,1),
    customer_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Create orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY IDENTITY(1,1),
    customer_id INT,
    order_date DATE,
    total_price DECIMAL(10, 2),
    shipping_address TEXT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Create order_items table
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY IDENTITY(1,1),
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


INSERT INTO customers (name, email, password) VALUES
('Aravindh', 'aravindh@gmail.com', 'password1'),
('Dhanush', 'dhanush@gmail.com', 'password2'),
('Gayathri', 'gayathri@gmail.com', 'password3'),
('mani ', 'mani@gmail.com', 'password4');

INSERT INTO products (name, price, description, stockQuantity) VALUES
('iphone 14', 65000, 'It is phone from brand Apple with IOS OS', 10),
('ipad', 40000, 'It is a tab from Apple brand with IOS ', 15),
('samsung s24', 80000, 'Samsung 24 is new release of samsung flagship', 10),
('sony TV', 140000, 'OLED TV with dolby vision and dolby audio', 20);

INSERT INTO cart (customer_id, product_id, quantity) VALUES
(1, 1, 2), 
(2, 2, 1), 
(3, 3, 3), 
(4, 4, 2);


INSERT INTO orders (customer_id, order_date, total_price, shipping_address) VALUES
(1, '2024-03-06', 130000, '123 Main St, chennai, India'), 
(2, '2024-03-06', 40000, '456 Ranjinikanth St, ooty, india'), 
(3, '2024-03-06', 240000, '101 thapathy street, madurai, india'), 
(4, '2024-03-06', 280000, '004 Shankarar street, kanjipuram, india'); 

INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 2), 
(2, 2, 1),
(3, 3, 3),
(4, 4, 2); 

