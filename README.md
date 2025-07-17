Fictional-Online-Retail-Company
1. Project Description
This project simulates a database system for a fictional online retail company. It involves designing and implementing a relational database to manage customers, products, orders, and categories. The project demonstrates creating tables, inserting sample data, and executing complex queries for business reporting and data analysis.

3. Database Schema Overview

 The database consists of the following core tables with relationships:

- Customers: Stores customer details (ID, name, contact, address, etc.).
- Categories: Stores product categories with descriptions.
- Products: Stores product information linked to categories.
- Orders: Stores customer orders with timestamps and total amounts.
- OrderItems: Stores each product item within an order, linking orders to products.

3. Relationships:

- Each product belongs to one category (Products.Category_ID → Categories.Category_ID).
- Each order belongs to one customer (Orders.customerID → Customers.customerID).
- Each order can have multiple order items (OrderItems.Order_ID → Orders.order_id).
- Each order item corresponds to one product (OrderItems.Product_ID → Products.Product_ID).


4 . Triggers & Stored Procedures 

- Triggers:

  Automatically decrease product stock after an order item is inserted.
  Prevent insertion of order items if there is insufficient stock, enforcing data integrity.

- Stored Procedure:

  A procedure to add new customers easily via a parameterized call.

6. Technologies Used

- MySQL: For database design, queries, triggers, and stored procedure.
- SQL: Standard SQL for table creation, data manipulation, and complex query writing.



