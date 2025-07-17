/*
Project  Fictional Online Retail Company
*/

create database online_retail_db;
use online_retail_db;
-- Create the Customers table

DROP TABLE IF EXISTS Customers;

CREATE TABLE Customers
(
  customerID INT PRIMARY KEY AUTO_INCREMENT,
  First_name VARCHAR(50),
  Last_name VARCHAR(50),
  Email VARCHAR(50),
  Phone_number VARCHAR(20),
  Address VARCHAR(255),
  City VARCHAR(100),
  State VARCHAR(100),
  Zipcode VARCHAR(10),
  Country VARCHAR(100),
  CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);
-- craete categories table
CREATE TABLE Categories (
    Category_ID INT PRIMARY KEY AUTO_INCREMENT,
    Category_name VARCHAR(100) NOT NULL,
    Description VARCHAR(255)
);
-- create product table 
CREATE TABLE Products (
    Product_ID INT PRIMARY KEY AUTO_INCREMENT,
    Product_name VARCHAR(100) NOT NULL,
    Category_ID INT NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    Stock INT NOT NULL,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (Category_ID) REFERENCES Categories(Category_ID)
);
-- create order table 
DROP TABLE IF EXISTS Orders;
CREATE TABLE orders (
order_id INT PRIMARY KEY AUTO_INCREMENT,         -- Unique order identifier
customerID INT NOT NULL,                         -- Refers to a customer ID (foreign key)
order_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,  -- Date and time of the order
total_amount_of_bill DECIMAL(10,2) NOT NULL,   -- Total bill amount with 2 decimal places
 FOREIGN KEY (customerID) REFERENCES Customers(customerID)
);
-- CREATE THE ORDERITEMS TABLE
DROP TABLE IF EXISTS OrderItems;
CREATE TABLE OrderItems (
    OrderItem_ID INT PRIMARY KEY AUTO_INCREMENT,
    Order_ID INT NOT NULL,
    Product_ID INT NOT NULL,
    Quantity INT NOT NULL,
    Unit_Price DECIMAL(10,2) NOT NULL,
    Total_Price DECIMAL(10,2) AS (Quantity * Unit_Price) STORED,
    FOREIGN KEY (Order_ID) REFERENCES orders(order_id),
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID)
);

-- Categories 
INSERT INTO Categories (Category_name, Description) VALUES
('Electronics', 'Devices and gadgets'),
('Clothing', 'Apparel for men and women'),
('Books', 'Printed and digital books'),
('Home & Kitchen', 'Appliances and kitchenware'),
('Sports', 'Sporting goods and equipment'),
('Toys', 'Toys and games for kids'),
('Beauty', 'Cosmetics and skincare'),
('Automotive', 'Car accessories and tools'),
('Garden', 'Gardening tools and plants'),
('Music', 'Musical instruments and gear'),
('Office Supplies', 'Stationery and office equipment'),
('Pet Supplies', 'Products for pets'),
('Health', 'Health and wellness products'),
('Jewelry', 'Rings, necklaces, and accessories'),
('Shoes', 'Footwear for all'),
('Baby', 'Baby care products'),
('Groceries', 'Food and beverages'),
('Tools', 'Hardware tools'),
('Furniture', 'Home and office furniture'),
('Outdoor', 'Outdoor gear and camping'),
('Electronics Accessories', 'Chargers, cables, etc.'),
('Smart Home', 'Home automation devices'),
('Games', 'Video and board games'),
('Photography', 'Cameras and accessories'),
('Fitness', 'Exercise equipment'),
('Travel', 'Luggage and travel accessories'),
('Watches', 'Wrist watches'),
('Crafts', 'Crafting supplies'),
('Software', 'Computer software'),
('Computers', 'Desktops and laptops'),
('Mobile Phones', 'Smartphones and accessories'),
('TV & Video', 'Televisions and devices'),
('Appliances', 'Major home appliances'),
('Lighting', 'Lighting fixtures'),
('Cleaning Supplies', 'Cleaning tools and chemicals'),
('Stationery', 'Paper, pens, and office supplies'),
('Bags', 'Backpacks and purses'),
('Kitchen Tools', 'Utensils and gadgets'),
('Bedding', 'Sheets and blankets'),
('Personal Care', 'Hygiene and grooming'),
('Sunglasses', 'Eyewear'),
('Hobbies', 'Collectibles and hobbies'),
('Food Storage', 'Containers and wraps'),
('Party Supplies', 'Decorations and favors'),
('Seasonal', 'Holiday decorations'),
('Safety', 'Safety equipment'),
('Baby Toys', 'Toys for babies'),
('Kitchen Appliances', 'Small kitchen appliances'),
('Smart Watches', 'Wearable technology'),
('Novelty', 'Unique and fun items'),
('Art Supplies', 'Painting and drawing materials');
select * from Categories ;

-- Customers
INSERT INTO Customers (First_name, Last_name, Email, Phone_number, Address, City, State, Zipcode, Country) VALUES

('John', 'Doe1', 'john.doe1@example.com', '1234500001', '123 Elm St', 'Mumbai', 'Maharashtra', '400001', 'India'),
('Jane', 'Smith2', 'jane.smith2@example.com', '1234500002', '456 Oak St', 'Delhi', 'Delhi', '110001', 'India'),
('Michael', 'Brown3', 'michael.brown3@example.com', '1234500003', '789 Pine St', 'Bengaluru', 'Karnataka', '560001', 'India'),
('Emily', 'Davis4', 'emily.davis4@example.com', '1234500004', '321 Maple St', 'Chennai', 'Tamil Nadu', '600001', 'India'),
('David', 'Wilson5', 'david.wilson5@example.com', '1234500005', '654 Cedar St', 'Kolkata', 'West Bengal', '700001', 'India'),
('Laura', 'Johnson6', 'laura.johnson6@example.com', '1234500006', '987 Birch St', 'Hyderabad', 'Telangana', '500001', 'India'),
('Chris', 'Lee7', 'chris.lee7@example.com', '1234500007', '135 Spruce St', 'Pune', 'Maharashtra', '411001', 'India'),
('Sarah', 'Kim8', 'sarah.kim8@example.com', '1234500008', '246 Walnut St', 'Ahmedabad', 'Gujarat', '380001', 'India'),
('James', 'Martinez9', 'james.martinez9@example.com', '1234500009', '357 Chestnut St', 'Jaipur', 'Rajasthan', '302001', 'India'),
('Anna', 'Garcia10', 'anna.garcia10@example.com', '1234500010', '468 Fir St', 'Lucknow', 'Uttar Pradesh', '226001', 'India'),
('Brian', 'Harris11', 'brian.harris11@example.com', '1234500011', '579 Elm St', 'Kanpur', 'Uttar Pradesh', '208001', 'India'),
('Megan', 'Clark12', 'megan.clark12@example.com', '1234500012', '680 Oak St', 'Nagpur', 'Maharashtra', '440001', 'India'),
('Kevin', 'Lewis13', 'kevin.lewis13@example.com', '1234500013', '791 Pine St', 'Indore', 'Madhya Pradesh', '452001', 'India'),
('Olivia', 'Robinson14', 'olivia.robinson14@example.com', '1234500014', '802 Maple St', 'Thane', 'Maharashtra', '400601', 'India'),
('Ethan', 'Walker15', 'ethan.walker15@example.com', '1234500015', '913 Cedar St', 'Bhopal', 'Madhya Pradesh', '462001', 'India'),
('Sophia', 'Young16', 'sophia.young16@example.com', '1234500016', '102 Birch St', 'Visakhapatnam', 'Andhra Pradesh', '530001', 'India'),
('Daniel', 'King17', 'daniel.king17@example.com', '1234500017', '213 Spruce St', 'Pimpri-Chinchwad', 'Maharashtra', '411018', 'India'),
('Grace', 'Scott18', 'grace.scott18@example.com', '1234500018', '324 Walnut St', 'Patna', 'Bihar', '800001', 'India'),
('Matthew', 'Green19', 'matthew.green19@example.com', '1234500019', '435 Chestnut St', 'Vadodara', 'Gujarat', '390001', 'India'),
('Ava', 'Adams20', 'ava.adams20@example.com', '1234500020', '546 Fir St', 'Ghaziabad', 'Uttar Pradesh', '201001', 'India'),
('Joshua', 'Baker21', 'joshua.baker21@example.com', '1234500021', '657 Elm St', 'Ludhiana', 'Punjab', '141001', 'India'),
('Isabella', 'Nelson22', 'isabella.nelson22@example.com', '1234500022', '768 Oak St', 'Agra', 'Uttar Pradesh', '282001', 'India'),
('Andrew', 'Hill23', 'andrew.hill23@example.com', '1234500023', '879 Pine St', 'Nashik', 'Maharashtra', '422001', 'India'),
('Mia', 'Ramirez24', 'mia.ramirez24@example.com', '1234500024', '980 Maple St', 'Faridabad', 'Haryana', '121001', 'India'),
('Joseph', 'Campbell25', 'joseph.campbell25@example.com', '1234500025', '109 Cedar St', 'Meerut', 'Uttar Pradesh', '250001', 'India'),
('Charlotte', 'Mitchell26', 'charlotte.mitchell26@example.com', '1234500026', '210 Birch St', 'Rajkot', 'Gujarat', '360001', 'India'),
('Samuel', 'Roberts27', 'samuel.roberts27@example.com', '1234500027', '311 Spruce St', 'Kalyan-Dombivli', 'Maharashtra', '421301', 'India'),
('Amelia', 'Carter28', 'amelia.carter28@example.com', '1234500028', '412 Walnut St', 'Vasai-Virar', 'Maharashtra', '401201', 'India'),
('Benjamin', 'Phillips29', 'benjamin.phillips29@example.com', '1234500029', '513 Chestnut St', 'Varanasi', 'Uttar Pradesh', '221001', 'India'),
('Ella', 'Evans30', 'ella.evans30@example.com', '1234500030', '614 Fir St', 'Srinagar', 'Jammu & Kashmir', '190001', 'India'),
('Logan', 'Turner31', 'logan.turner31@example.com', '1234500031', '715 Elm St', 'Moscow', 'Moscow', '101000', 'Russia'),
('Victoria', 'Torres32', 'victoria.torres32@example.com', '1234500032', '816 Oak St', 'Saint Petersburg', 'Saint Petersburg', '190000', 'Russia'),
('Ryan', 'Parker33', 'ryan.parker33@example.com', '1234500033', '917 Pine St', 'Novosibirsk', 'Novosibirsk Oblast', '630000', 'Russia'),
('Lily', 'Collins34', 'lily.collins34@example.com', '1234500034', '1018 Maple St', 'Yekaterinburg', 'Sverdlovsk Oblast', '620000', 'Russia'),
('Nathan', 'Edwards35', 'nathan.edwards35@example.com', '1234500035', '1119 Cedar St', 'Nizhny Novgorod', 'Nizhny Novgorod Oblast', '603000', 'Russia'),
('Zoe', 'Stewart36', 'zoe.stewart36@example.com', '1234500036', '1220 Birch St', 'Kathmandu', 'Bagmati', '44600', 'Nepal'),
('Christian', 'Morris37', 'christian.morris37@example.com', '1234500037', '1321 Spruce St', 'Pokhara', 'Gandaki', '33700', 'Nepal'),
('Hannah', 'Rogers38', 'hannah.rogers38@example.com', '1234500038', '1422 Walnut St', 'Lalitpur', 'Bagmati', '44700', 'Nepal'),
('Aaron', 'Reed39', 'aaron.reed39@example.com', '1234500039', '1523 Chestnut St', 'Biratnagar', 'Province No. 1', '56600', 'Nepal'),
('Natalie', 'Cook40', 'natalie.cook40@example.com', '1234500040', '1624 Fir St', 'Bharatpur', 'Bagmati', '44200', 'Nepal'),
('Dylan', 'Morgan41', 'dylan.morgan41@example.com', '1234500041', '1725 Elm St', 'Janakpur', 'Province No. 2', '45600', 'Nepal'),
('Samantha', 'Bell42', 'samantha.bell42@example.com', '1234500042', '1826 Oak St', 'Hetauda', 'Bagmati', '44100', 'Nepal'),
('Elijah', 'Murphy43', 'elijah.murphy43@example.com', '1234500043', '1927 Pine St', 'Beijing', 'Beijing', '100000', 'China'),
('Addison', 'Bailey44', 'addison.bailey44@example.com', '1234500044', '2028 Maple St', 'Shanghai', 'Shanghai', '200000', 'China'),
('Gabriel', 'Rivera45', 'gabriel.rivera45@example.com', '1234500045', '2129 Cedar St', 'Guangzhou', 'Guangdong', '510000', 'China'),
('Sofia', 'Cooper46', 'sofia.cooper46@example.com', '1234500046', '2230 Birch St', 'Shenzhen', 'Guangdong', '518000', 'China'),
('Owen', 'Richardson47', 'owen.richardson47@example.com', '1234500047', '2331 Spruce St', 'Chengdu', 'Sichuan', '610000', 'China'),
('Chloe', 'Cox48', 'chloe.cox48@example.com', '1234500048', '2432 Walnut St', 'Wuhan', 'Hubei', '430000', 'China'),
('Jack', 'Howard49', 'jack.howard49@example.com', '1234500049', '2533 Chestnut St', 'Hangzhou', 'Zhejiang', '310000', 'China'),
('Maddison', 'Ward50', 'maddison.ward50@example.com', '1234500050', '2634 Fir St', 'Nanjing', 'Jiangsu', '210000', 'China');

select* from Customers;
-- Products 
INSERT INTO Products (Product_name, Category_ID, Price, Stock) VALUES
('Smartphone', 1, 66399.17, 150),
('Men\'s Leather Jacket', 2, 20749.17, 80),                
('Bestselling Novel', 3, 1241.17, 200),                   
('Air Fryer', 4, 7436.85, 100),
('Tennis Racket', 5, 9959.17, 0),                         
('Anti-Aging Serum', 7, 3735.00, 90),                    
('Car Phone Mount', 8, 1659.17, 110),                      
('Garden Hose', 9, 3318.50, 70),                          
('Acoustic Guitar', 10, 24899.17, 40),                     
('Ballpoint Pens Pack', 11, 496.17, 300),                  
('Dog Chew Toy', 12, 788.50, 150),                       
('Vitamin C Supplements', 13, 1908.17, 100),              
('Gold Hoop Earrings', 14, 14879.17, 50),                
('Running Shoes', 15, 7469.17, 120),                     
('Baby Stroller', 16, 14939.17, 30),                       
('Organic Olive Oil', 17, 1120.50, 200),                   
('Cordless Drill', 18, 9089.17, 60),                     
('Office Desk Chair', 19, 12449.17, 40),                  
('Camping Tent', 20, 16599.17, 25),                      
('USB-C Charger Cable', 21, 1327.17, 180),                 
('Smart Thermostat', 22, 10789.17, 40),                
('Chess Set', 23, 2489.17, 75),                            
('Digital Camera', 24, 33189.17, 30),                      
('Yoga Mat', 25, 2157.17, 100),                            
('Travel Backpack', 26, 8319.17, 50),                    
('Analog Wrist Watch', 27, 20749.17, 70),                 
('Knitting Yarn Set', 28, 2277.50, 90),                 
('Antivirus Software License', 29, 6639.17, 500),          
('Gaming Laptop', 30, 115617.00, 20),                      
('Wireless Earbuds', 31, 12449.17, 150),                   
('4K LED TV', 32, 74667.00, 35),                         
('Refrigerator', 33, 53949.17, 25),                        
('LED Desk Lamp', 34, 4979.17, 70),                        
('Multi-Surface Cleaner', 35, 744.17, 200),               
('Premium Notebook', 36, 1241.17, 300),                    
('Leather Backpack', 37, 14997.00, 60),                    
('Chef\'s Knife', 38, 7423.50, 80),                        
('Egyptian Cotton Sheets', 39, 11579.17, 40),             
('Electric Razor', 40, 7433.85, 70),                      
('Polarized Sunglasses', 41, 9919.17, 100),               
('Model Train Set', 42, 6234.17, 50),                     
('Food Storage Containers', 43, 2329.17, 150);             

INSERT INTO Orders (customerID, order_date, total_amount_of_bill) VALUES
(20, '2025-06-12 19:00:00', 33217.51),
(23, '2025-07-03 01:00:00', 12449.17),
(38, '2025-07-01 11:00:00', 6987.51),
(3,  '2025-06-16 18:00:00', 6987.51),
(33, '2025-06-26 11:00:00', 21867.51),
(12, '2025-06-28 09:30:00', 19874.00),
(15, '2025-07-04 21:45:00', 27500.00),
(8,  '2025-06-20 10:15:00', 8800.75),
(29, '2025-06-30 14:00:00', 10500.00),
(5,  '2025-06-22 16:00:00', 14750.25),
(19, '2025-06-25 08:00:00', 4200.00),
(7,  '2025-07-05 12:00:00', 7900.00),
(14, '2025-06-21 19:15:00', 15300.00),
(22, '2025-07-02 15:30:00', 6700.00),
(11, '2025-06-18 13:45:00', 5400.00),
(26, '2025-06-29 17:30:00', 18200.00),
(1,  '2025-06-23 20:00:00', 33000.00),
(10, '2025-07-01 09:45:00', 12350.00),
(17, '2025-06-24 11:00:00', 7100.00),
(4,  '2025-06-27 18:30:00', 13400.00),
(13, '2025-07-03 07:00:00', 8000.00),
(9,  '2025-06-19 14:30:00', 2700.00),
(18, '2025-06-25 16:15:00', 9700.00),
(21, '2025-07-04 20:45:00', 11200.00),
(27, '2025-06-28 10:00:00', 8700.00),
(30, '2025-06-30 13:00:00', 9200.00),
(31, '2025-07-02 11:15:00', 4400.00),
(28, '2025-06-26 08:45:00', 15600.00),
(25, '2025-06-29 19:30:00', 13800.00),
(24, '2025-07-05 09:00:00', 5400.00),
(32, '2025-07-01 10:30:00', 7300.00),
(34, '2025-06-27 14:15:00', 8200.00),
(35, '2025-06-23 12:00:00', 9100.00),
(36, '2025-06-24 16:45:00', 4700.00),
(37, '2025-06-20 18:00:00', 13400.00),
(39, '2025-06-22 15:00:00', 11100.00),
(40, '2025-06-28 09:45:00', 3000.00),
(41, '2025-06-29 20:30:00', 16500.00),
(42, '2025-07-03 17:00:00', 5200.00),
(43, '2025-06-25 13:00:00', 6100.00),
(44, '2025-06-26 15:30:00', 8500.00),
(45, '2025-07-04 11:15:00', 10900.00),
(46, '2025-07-01 08:00:00', 4700.00),
(47, '2025-06-19 14:00:00', 7600.00),
(48, '2025-06-21 19:30:00', 13400.00),
(49, '2025-06-22 20:45:00', 10800.00),
(50, '2025-06-23 10:30:00', 21000.00),
(16, '2025-07-02 09:00:00', 14000.00),
(6,  '2025-06-20 13:00:00', 9800.00),
(2,  '2025-06-18 11:15:00', 12300.00);

INSERT INTO OrderItems (OrderItem_ID, Order_ID, Product_ID, Quantity, Unit_Price) VALUES
(1, 1, 26, 1, 20749.17),
(2, 1, 41, 2, 6234.17),
(3, 2, 18, 1, 12449.17),
(4, 3, 43, 3, 2329.17),
(5, 4, 43, 3, 2329.17),
(6, 5, 10, 1, 24899.17),
(7, 6, 15, 2, 7469.17),
(8, 7, 1, 1, 66399.17),
(9, 8, 12, 4, 788.50),
(10, 9, 33, 1, 53949.17),
(11, 10, 14, 1, 14879.17),
(12, 11, 38, 2, 7423.50),
(13, 12, 23, 1, 2489.17),
(14, 13, 17, 1, 9089.17),
(15, 14, 21, 1, 1327.17),
(16, 15, 31, 1, 12449.17),
(17, 16, 4, 1, 7436.85),
(18, 17, 29, 1, 6639.17),
(19, 18, 9, 1, 3318.50),
(20, 19, 25, 1, 2157.17),
(21, 20, 20, 1, 16599.17),
(22, 21, 7, 1, 3735.00),
(23, 22, 5, 1, 9959.17),
(24, 23, 16, 3, 1120.50),
(25, 24, 3, 1, 1241.17),
(26, 25, 11, 2, 496.17),
(27, 26, 30, 1, 115617.00),
(28, 27, 28, 1, 2277.50),
(29, 28, 34, 1, 4979.17),
(30, 29, 19, 1, 12449.17),
(31, 30, 2, 1, 20749.17),
(32, 31, 6, 2, 1659.17),
(33, 32, 22, 1, 10789.17),
(34, 33, 35, 1, 744.17),
(35, 34, 27, 1, 20749.17),
(36, 35, 24, 1, 33189.17),
(37, 36, 8, 1, 3318.50),
(38, 37, 13, 1, 1908.17),
(39, 38, 32, 1, 74667.00),
(40, 39, 36, 1, 1241.17),
(41, 40, 37, 1, 14997.00),
(42, 41, 39, 1, 11579.17),
(43, 42, 40, 1, 7433.85),
(44, 43, 42, 1, 6234.17),
(45, 44, 44, 1, 6639.17),
(46, 45, 45, 1, 115617.00),
(47, 46, 46, 1, 12449.17),
(48, 47, 47, 1, 74667.00),
(49, 48, 48, 1, 53949.17),
(50, 49, 49, 1, 4979.17);

 -- Query 1: Retrieve all orders for a specific customer
 SELECT o.*, c.First_name, c.Last_name
FROM Orders o
JOIN Customers c ON o.customerID = c.customerID
WHERE o.customerID = 1;

-- Query 2: Find the total sales for each product
Select p.Product_ID, p.product_name, sum(oi.Quantity*p.price)
 AS Total_Sales FROM OrderItems oi
Join Products p on oi.product_Id = p. product_ID
GROUP BY p.product_ID, p.product_name;
desc OrderItems;
desc products;

-- Query 3: Calculate the average order value
SELECT AVG(total_amount_of_bill) AS AverageOrderValue
FROM Orders;


-- Query 4: List the top 5 customers by total spending
select customerID from  Customers limit 5;
SELECT 
  c.CustomerID,
  c.First_name,
  c.Last_name,
  SUM(o.total_amount_of_bill) AS TotalSpending
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerID, c.First_name, c.Last_name
ORDER BY TotalSpending DESC
LIMIT 5;

-- Query 5: Retrieve the most popular product category
SELECT 
  c.Category_ID,
  c.Category_name,
  SUM(oi.Quantity * p.Price) AS Total_Sales_Amount
FROM OrderItems oi
JOIN Products p ON oi.Product_ID = p.Product_ID
JOIN Categories c ON p.Category_ID = c.Category_ID
GROUP BY c.Category_ID, c.Category_name
ORDER BY Total_Sales_Amount DESC
LIMIT 1;
desc products;
desc Categories;

-- Query 6: List all products that are out of stock
SELECT Product_ID, Product_name, Stock
FROM Products
WHERE Stock = 0;

-- Query 7: Find customers who placed orders in the last 30 days
SELECT DISTINCT c.customerID, c.First_name, c.Last_name
FROM Customers c
JOIN Orders o ON c.customerID = o.customerID
WHERE o.order_date >= CURDATE() - INTERVAL 30 DAY;

-- Query 8: Calculate the total number of orders placed each month
SELECT 
  YEAR(order_date) AS Year,
  MONTH(order_date) AS Month,
  COUNT(order_id) AS TotalOrders
FROM Orders
GROUP BY Year, Month
ORDER BY Year, Month;

-- Query 9: Retrieve the details of the most recent order
SELECT o.*, c.First_name, c.Last_name
FROM Orders o
JOIN Customers c ON o.customerID = c.customerID
ORDER BY o.order_date DESC
LIMIT 1;

-- Query 10: Find the average price of products in each category
SELECT c.Category_ID, c.Category_name, AVG(p.Price) AS AveragePrice
FROM Products p
JOIN Categories c ON p.Category_ID = c.Category_ID
GROUP BY c.Category_ID, c.Category_name;
-- Query 11: List customers who have never placed an order
select * from Customers c LEFT JOIN Orders o ON c.customerID = o.customerID
WHERE o.order_id IS NULL;
-- Query 12: Retrieve the total quantity sold for each product
SELECT p.Product_ID, p.Product_name, SUM(oi.Quantity) AS TotalQuantitySold
FROM OrderItems oi
JOIN Products p ON oi.Product_ID = p.Product_ID
GROUP BY p.Product_ID, p.Product_name;


-- Query 13: Calculate the total revenue generated from each category
SELECT c.Category_ID, c.Category_name, SUM(oi.Quantity * oi.Unit_Price) AS TotalRevenue
FROM OrderItems oi
JOIN Products p ON oi.Product_ID = p.Product_ID
JOIN Categories c ON p.Category_ID = c.Category_ID
GROUP BY c.Category_ID, c.Category_name;

-- Query 14: Find the highest-priced product in each category
SELECT c.Category_ID, c.Category_name, p.Product_ID, p.Product_name, p.Price
FROM Products p
JOIN Categories c ON p.Category_ID = c.Category_ID
WHERE (c.Category_ID, p.Price) IN (
    SELECT Category_ID, MAX(Price)
    FROM Products
    GROUP BY Category_ID
)
ORDER BY c.Category_ID;


-- Query 15: Retrieve orders with a total amount greater than a specific value (e.g., $500)
SELECT o.order_id, o.customerID, o.order_date, o.total_amount_of_bill
FROM Orders o
WHERE o.total_amount_of_bill > 500;

-- Query 16: List products along with the number of orders they appear in
SELECT p.Product_ID, p.Product_name, COUNT(DISTINCT oi.Order_ID) AS NumberOfOrders
FROM OrderItems oi
JOIN Products p ON oi.Product_ID = p.Product_ID
GROUP BY p.Product_ID, p.Product_name;

-- Query 17: Find the top 3 most frequently ordered products
SELECT p.Product_ID, p.Product_name, SUM(oi.Quantity) AS TotalQuantityOrdered
FROM OrderItems oi
JOIN Products p ON oi.Product_ID = p.Product_ID
GROUP BY p.Product_ID, p.Product_name
ORDER BY TotalQuantityOrdered DESC
LIMIT 3;

-- Query 18: Calculate the total number of customers from each country
SELECT Country, COUNT(customerID) AS TotalCustomers
FROM Customers
GROUP BY Country;

-- Query 19: Retrieve the list of customers along with their total spending
SELECT c.customerID, c.First_name, c.Last_name, 
       IFNULL(SUM(o.total_amount_of_bill), 0) AS TotalSpending
FROM Customers c
LEFT JOIN Orders o ON c.customerID = o.customerID
GROUP BY c.customerID, c.First_name, c.Last_name
ORDER BY TotalSpending DESC;

-- Query 20: list orders with more than a specified number of items(e.g., 5 items)
SELECT o.order_id, o.customerID, o.order_date, COUNT(oi.OrderItem_ID) AS NumberOfItems
FROM Orders o
JOIN OrderItems oi ON o.order_id = oi.Order_ID
GROUP BY o.order_id, o.customerID, o.order_date
HAVING NumberOfItems > 5;


-- query 21 :  Count of orders placed by each customer
SELECT customerID, COUNT(order_id) AS order_count FROM orders GROUP BY customerID;

-- query 22: Maximum, minimum and average price of products in each category
SELECT Category_ID, 
       MAX(Price) AS max_price,
       MIN(Price) AS min_price,
       AVG(Price) AS avg_price
FROM Products
GROUP BY Category_ID;
-- TRIGGERS 
-- A. Trigger to decrease product stock when an order item is inserted
DELIMITER //
CREATE TRIGGER after_orderitem_insert
AFTER INSERT ON OrderItems
FOR EACH ROW
BEGIN
    UPDATE Products
    SET Stock = Stock - NEW.Quantity
    WHERE Product_ID = NEW.Product_ID;
END; //
DELIMITER ;
--  Check the product stock before inserting into OrderItems
SELECT Product_ID, Product_name, Stock
FROM Products
WHERE Product_ID = 1;
-- Insert a new order item (this will fire the trigger):
INSERT INTO OrderItems (Order_ID, Product_ID, Quantity, Unit_Price)
VALUES (1, 1, 2, 66399.17); -- Assume Product_ID = 1 and Quantity = 2
-- Now re-check the product stock after the trigger runs
SELECT Product_ID, Product_name, Stock
FROM Products
WHERE Product_ID = 1;

-- B. Trigger to prevent stock from going negative-- Block Insert If Not Enough Stock



DROP TRIGGER IF EXISTS before_orderitem_insert;
DROP TRIGGER IF EXISTS after_orderitem_insert;


DELIMITER //

CREATE TRIGGER before_orderitem_insert
BEFORE INSERT ON OrderItems
FOR EACH ROW
BEGIN
    DECLARE current_stock INT;
    SELECT Stock INTO current_stock FROM Products WHERE Product_ID = NEW.Product_ID;
    IF current_stock < NEW.Quantity THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insufficient stock for product';
    END IF;
END;
//

DELIMITER ;
SHOW TRIGGERS LIKE 'OrderItems';
INSERT INTO OrderItems (Order_ID, Product_ID, Quantity, Unit_Price)
VALUES (1, 5, 1000, 9959.17);



-- 1. Procedure to add a new customer
DELIMITER //
CREATE PROCEDURE AddCustomer (
    IN p_First_name VARCHAR(50),
    IN p_Last_name VARCHAR(50),
    IN p_Email VARCHAR(50)
)
BEGIN
    INSERT INTO Customers (First_name, Last_name, Email) VALUES (p_First_name, p_Last_name, p_Email);
END; //
DELIMITER ;
CALL AddCustomer('Nisha', 'Jayakumar', 'nisha@example.com');
select Email  from Customers where First_name = 'nisha';













 




