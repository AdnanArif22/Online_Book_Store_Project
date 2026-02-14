**📚 Online Book Store – MySQL Database Project**

A complete MySQL database project that simulates an Online Book Store system. This project includes database schema creation, sample datasets, and SQL queries to manage books, customers, and orders.

**📌 Project Overview**

The Online Book Store Project is designed to demonstrate database design and SQL query implementation using MySQL. It provides a structured way to store and manage bookstore data including books, customers, and their orders.

This project is useful for:

Learning MySQL database design

Practicing SQL queries

Understanding relationships between tables

Academic database projects and assignments

**🗂️ Project Structure**

Online_Book_Store_Project/
│
├── book_orders_sql.sql                  # SQL script to create database and tables

├── Books.csv                            # Sample books data

├── Customers.csv                        # Sample customers data

├── Orders.csv                            # Sample orders data

├── Online_Bookstore_SQL_Project.pdf     # Project documentation

├── SQL-Project_Question_file.pdf         # SQL questions and requirements

└── README.md                              # Project description

**🧱 Database Schema**

The project includes the following main tables:

1. Books

Stores information about books available in the store.

_Attributes:_

* Book_ID (Primary Key)

* Title

* Author

* Genre

* Price

* Stock

2. Customers

Stores customer information.

_Attributes:_

* Customer_ID (Primary Key)

* Name

* Email

* Phone

* City

* Country

3. Orders

Stores order details made by customers.

_Attributes:_

* Order_ID (Primary Key)

* Customer_ID (Foreign Key)

* Book_ID (Foreign Key)

* Quantity

* Order_Date

**⚙️ Features**

Database creation using SQL

Table creation with Primary and Foreign Keys

Data insertion using CSV files

**SQL queries for:**

Retrieving book information

Customer management

Order tracking

Data analysis

**🚀 How to Run the Project**
Step 1: Install MySQL

Download and install MySQL from:
https://dev.mysql.com/downloads/

Step 2: Open MySQL Workbench or Command Line
Step 3: Run the SQL Script
SOURCE book_orders_sql.sql;


OR copy and paste the SQL file content into MySQL Workbench and execute.

Step 4: Import CSV Data (Optional)

**📊 Example Queries**
-- View all books
SELECT * FROM Books;

-- View all customers
SELECT * FROM Customers;

-- View all orders
SELECT * FROM Orders;

-- Find orders with customer details
SELECT c.Name, b.Title, o.Quantity
FROM Orders o
JOIN Customers c ON o.Customer_ID = c.Customer_ID
JOIN Books b ON o.Book_ID = b.Book_ID;

**🎯 Learning Objectives**

This project helps you understand:

Relational database design

SQL table creation

Primary and Foreign Keys

Data insertion

Joins and queries

Database normalization basics

**🛠️ Technologies Used**

* MySQL

* SQL

* CSV (Dataset)

* MySQL Workbench

**📄 Documentation**

Detailed explanation is available in:

Online_Bookstore_SQL_Project.pdf

SQL-Project_Question_file.pdf

**👨‍💻 Author**

Muhammad Adnan Arif

GitHub:
https://github.com/AdnanArif22

**📜 License**

This project is for educational purposes.
