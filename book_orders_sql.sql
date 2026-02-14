-- Create Database
CREATE DATABASE OnlineBookstore;

-- Switch to the database
use onlinebookstore;

-- Create Tables
DROP TABLE IF EXISTS Books;
CREATE TABLE IF NOT EXISTS Books (
    Book_ID SERIAL PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_Year INT,
    Price NUMERIC(10 , 2 ),
    Stock INT
);
DROP TABLE IF EXISTS customers;
CREATE TABLE Customers (
    Customer_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(150)
);
DROP TABLE IF EXISTS orders;
CREATE TABLE Orders (
    Order_ID SERIAL PRIMARY KEY,
    Customer_ID INT REFERENCES Customers (Customer_ID),
    Book_ID INT REFERENCES Books (Book_ID),
    Order_Date DATE,
    Quantity INT,
    Total_Amount NUMERIC(10 , 2 )
);

SELECT 
    *
FROM
    Books;
SELECT 
    *
FROM
    Customers;
SELECT 
    *
FROM
    Orders;

-- 1) Retrieve all books in the "Fiction" genre:

SELECT 
    *
FROM
    books
WHERE
    genre IN ('Fiction');

-- 2) Find books published after the year 1950:
SELECT 
    *
FROM
    books
WHERE
    published_year > '1950';

-- 3) List all customers from the Canada:
SELECT 
    *
FROM
    customers
WHERE
    country IN ('Canada');

-- 4) Show orders placed in November 2023:
SELECT 
    *
FROM
    orders
WHERE
    Order_Date BETWEEN '2023-09-01' AND '2023-10-01';

-- 5) Retrieve the total stock of books available:
SELECT 
    SUM(stock)
FROM
    books;

-- 6) Find the details of the most expensive book:
SELECT 
    *
FROM
    books
ORDER BY price DESC
LIMIT 1;

-- 7) Show all customers who ordered more than 1 quantity of a book:
SELECT 
    *
FROM
    orders
WHERE
    quantity > 1;

-- 8) Retrieve all orders where the total amount exceeds $20:
SELECT 
    *
FROM
    orders
WHERE
    Total_Amount > 20;

-- 9) List all genres available in the Books table:
SELECT DISTINCT
    genre
FROM
    books
ORDER BY genre;

-- 10) Find the book with the lowest stock:
SELECT 
    *
FROM
    books
ORDER BY Stock
LIMIT 5;

-- 11) Calculate the total revenue generated from all orders:
SELECT 
    SUM(total_amount) AS total_revenue
FROM
    orders;
-- Advance Questions : 

SELECT 
    b.genre, SUM(o.quantity) AS sold_books
FROM
    books b
        JOIN
    orders o ON b.Book_ID = o.Book_ID
GROUP BY genre;


-- 2) Find the average price of books in the "Fantasy" genre:
SELECT 
    genre, ROUND(AVG(price), 2)
FROM
    books
WHERE
    genre IN ('Fantasy');


-- 3) List customers who have placed at least 2 orders:
SELECT 
    customer_id, name, COUNT(order_id)
FROM
    (SELECT 
        c.name, o.*
    FROM
        customers c
    JOIN orders o ON c.Customer_ID = o.Customer_ID) a
GROUP BY Customer_ID , name
HAVING COUNT(Quantity) >= 2;



-- 4) Find the most frequently ordered book:
SELECT 
    b.title, b.author, SUM(o.quantity) qty
FROM
    orders o
        JOIN
    books b ON o.Book_ID = b.Book_ID
GROUP BY b.title , b.author
ORDER BY qty DESC
LIMIT 1;


-- 5) Show the top 3 most expensive books of 'Fantasy' Genre :
SELECT 
    *
FROM
    books
WHERE
    genre IN ('Fantasy')
ORDER BY price DESC
LIMIT 3;

-- 6) Retrieve the total quantity of books sold by each author:
SELECT 
    b.author, b.title, SUM(o.Quantity) AS sold_books
FROM
    orders o
        JOIN
    books b ON o.Book_ID = b.Book_ID
GROUP BY b.author , b.Title;

-- 7) List the cities where customers who spent over $30 are located:
SELECT 
   c.city, o.total_amount AS spent_amount
FROM
    customers c
        NATURAL JOIN
    orders o
WHERE
    o.total_amount > 30
    order by c.city;

-- 8) Find the customer who spent the most on orders:
SELECT 
    c.customer_id, c.name, SUM(o.total_amount) sp_amount
FROM
    customers c
        JOIN
    orders o ON c.Customer_ID = o.Customer_ID
GROUP BY c.Customer_ID , c.name
ORDER BY sp_amount DESC;
-- 9) Calculate the stock remaining after fulfilling all orders:
SELECT 
    b.book_id, b.title,ifnull((b.stock - sum(o.quantity)),b.stock) AS remaining_stk
FROM
    orders o
       right JOIN
    books b ON o.Book_ID = b.Book_ID
    group by b.book_id,b.title;
    
