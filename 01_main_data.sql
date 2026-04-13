-- Database Creation
Create Database IF NOT exists practice;

-- List of Database 
show databases;

-- Database Selection
use practice;

-- Table 01 Creation
CREATE TABLE IF NOT EXISTS customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(30),
    last_nme VARCHAR(40),
    email VARCHAR(100),
    join_date DATE
);

-- Column Renaming
ALTER TABLE customers
RENAME column last_nme to last_name;

-- Column Adding
ALTER TABLE customers
add column age int after last_name,
add column phone_num int after email;

-- Table Description
describe practice.customers;

-- Data Insert
 INSERT INTO practice.customers (customer_id, first_name, last_name, age, email, phone_num, join_date)
VALUES 
(1, 'Alice', 'Johnson', 28, 'alice.j@email.com', '5550101', '2023-01-15'),
(2, 'Bob', 'Smith', 34, 'bob.smith@email.com', '5550102', '2023-02-20'),
(3, 'Charlie', 'Davis', 22, 'charlie.d@email.com', '5550103', '2023-03-05'),
(4, 'Diana', 'Prince', 31, 'diana.p@email.com', '5550104', '2023-03-12'),
(5, 'Evan', 'Wright', 45, 'evan.w@email.com', '5550105', '2023-04-01'),
(6, 'Fiona', 'Miller', 28, 'fiona.m@email.com', '5550106', '2023-05-22'),
(7, 'George', 'Smith', 52, 'george.s@email.com', '5550107', '2023-06-10'),
(8, 'Hannah', 'Abbott', 19, 'hannah.a@email.com', '5550108', '2023-07-04'),
(9, 'Ian', 'Malcolm', 40, 'chaos.theory@email.com', '5550109', '2023-08-15'),
(10, 'Jenna', 'Lee', 26, 'jenna.l@email.com', '5550110', '2023-09-30');

-- Table View
SELECT 
    *
FROM
    practice.customers;


-- Table 02 Creation 

CREATE TABLE IF NOT EXISTS categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50) NOT NULL
);

-- Table Description
DESCRIBE categories;

-- Data Input into Table 02
INSERT INTO categories (category_name)
VALUES 
('Electronics'), ('Fitness'), ('Home Decor'), ('Books'), ('Cloting' );
 
-- Data Alteration or Update
UPDATE practice.categories 
SET category_name = 'Clothing'
WHERE category_id = '5';
 

-- Table View
select * from practice.categories;




-- Table 03 Creation
CREATE TABLE IF NOT EXISTS products (
	product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR (50) NOT NULL,
    price DECIMAL (10,2),
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- Table Description
DESCRIBE products;

-- Data Input into Table 03

INSERT INTO products (product_name, price, category_id) 
VALUES
('Wireless Mouse', 25.50, 1),
('Yoga Mat', 40.00, 2),
('Desk Lamp', 15.99, 3),
('SQL Guidebook', 29.95, 4),
('Cotton T-Shirt', 12.00, 5),
('Noise Cancelling Headphones', 199.00, 1),
('Dumbbell Set', 85.00, 2);

-- Table View
SELECT * FROM practice.products;


-- Table 04 Creation

CREATE TABLE IF NOT EXISTS orders (
	order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL (10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

DESCRIBE orders;

-- Data insert into Table 04

INSERT INTO orders (customer_id, order_date, total_amount)
VALUES 
(1, '2023-10-01', 25.50),
(2, '2023-10-02', 125.00),
(1, '2023-10-05', 15.99),
(3, '2023-10-10', 29.95),
(5, '2023-10-12', 199.00);

-- Table View
SELECT * FROM practice.orders;


-- Table 05 Creation
CREATE TABLE IF NOT EXISTS order_items (
	item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
	FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Table Description
DESCRIBE order_items;

-- Data insert into Table 05
INSERT INTO order_items (order_id, product_id, quantity)
VALUES
(1, 1, 1),
(2, 2, 1), 
(2, 3, 2), 
(3, 3, 1), 
(4, 4, 1),
(5, 6, 1);

-- Table View

SELECT * FROM practice.order_items;




