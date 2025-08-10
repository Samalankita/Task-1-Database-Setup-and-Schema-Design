CREATE DATABASE IF NOT EXISTS ecommerce_db;

USE ecommerce_db;

CREATE TABLE Customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15)
);

INSERT INTO Customer (name, email, phone) VALUES
('Ankita Samal', 'ankita@example.com', '9876543210'),
('Rahul Mehta', 'rahul@example.com', '9123456780'),
('Sneha Roy', 'sneha@example.com', '9988776655');

CREATE TABLE Category (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) NOT NULL
);
INSERT INTO Category (category_name) VALUES
('Electronics'),
('Clothing'),
('Books');

CREATE TABLE Product (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);
INSERT INTO Product (name, price, category_id) VALUES
('Smartphone', 699.99, 1),
('Laptop', 1199.49, 1),
('T-shirt', 19.99, 2),
('Novel - Fiction', 12.50, 3);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE NOT NULL,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);
INSERT INTO Orders (order_date, customer_id) VALUES
('2025-08-01', 1),
('2025-08-02', 2),
('2025-08-03', 1);

CREATE TABLE OrderItem (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price_each DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

INSERT INTO OrderItem (order_id, product_id, quantity, price_each) VALUES
(1, 1, 1, 699.99),  
(1, 3, 2, 19.99),   
(2, 2, 1, 1199.49), 
(3, 4, 3, 12.50);   

select * from customer;

select * from  Category ;

select * from  Product ;

select * from  OrderItem;

show databases;
show tables;
