/*joins: select all the computers from the products table:
 using the products table and the categories table, return the product name and the category name*/
 SELECT * FROM products as p
 INNER JOIN categories AS c ON c.categoryid = p.categoryid
 WHERE c.categoryid = 1;
 
-- joins: find all product names, product prices, and products ratings that have a rating of 5
 SELECT p.name, p.price, r.rating FROM products AS p
 INNER JOIN reviews AS r ON r.productid = p.productid
 WHERE r.rating = 5;
 
-- joins: find the employee with the most total quantity sold.  use the sum() function and group by
SELECT e.firstname, e.lastname, SUM(s.quantity) FROM sales AS s
INNER JOIN employees AS e ON e.employeeid = s.employeeid
GROUP BY e.employeeid;
-- -----------------------------------------------------------------
-- joins: find the name of the department, and the name of the category for Appliances and Games
SELECT d.name, c.name FROM departments AS d
INNER JOIN categories AS c ON c.DepartmentID = d.DepartmentID
WHERE c.name = 'Appliances' OR c.name = 'Games';

/*joins: find the product name, total # sold, and total price sold,
for Eagles: Hotel California --You may need to use SUM()*/
SELECT p.name, SUM(s.quantity), SUM(s.quantity * s.priceperunit) FROM products AS p
INNER JOIN sales AS s ON s.ProductID = p.ProductID
WHERE p.name = 'Eagles: Hotel California';

/*joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!)*/
SELECT p.name, r.Reviewer, r.Rating, r.Comment FROM products AS p
INNER JOIN reviews AS r ON r.ProductID = p.ProductID
WHERE p.name = 'Visio TV' AND r.rating = 1;





-------------------------------------------- Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
SELECT e.employeeID, e.firstname, e.lastname, p.name , s.Quantity FROM sales AS s
INNER JOIN employees AS E ON e.EmployeeID = s.EmployeeID
INNER JOIN products AS p ON p.ProductID = s.ProductID
ORDER BY s.Quantity desc;

-- What is the total revenue from on sale products sold? 
SELECT p.ProductID, p.name, p.price, p.onsale, SUM(s.PricePerUnit) AS Revenue FROM products AS p
INNER JOIN sales AS s ON s.ProductID = p.ProductID;

-- What is the total revenue from games?
SELECT c.name, sum(s.PricePerUnit) AS Revenue from categories AS c
INNER JOIN products AS p ON p.CategoryID = c.CategoryID
INNER JOIN sales AS s ON s.ProductID = p.ProductID
WHERE c.name = 'Games';


-- What is the total quantity of games sold? *
SELECT c.name, sum(s.Quantity) AS TotalQuantity from categories AS c
INNER JOIN products AS p ON p.CategoryID = c.CategoryID
INNER JOIN sales AS s ON s.ProductID = p.ProductID
WHERE c.name = 'Games';

-- How many products have no sales? *
SELECT p.productid, p.name, p.price, s.Quantity AS AmountSold FROM products AS p
INNER JOIN sales AS s ON s.ProductID = p.ProductID
WHERE Quantity = 0;

-- What is the average rating for game reviews? 
SELECT c.name, AVG(r.Rating) AS AVGRating FROM categories AS c
INNER JOIN products AS p ON p.CategoryID = c.CategoryID
INNER JOIN reviews AS r ON r.ProductID = p.ProductID
WHERE c.name = 'Games';

-- Which category has the 2nd most sales (by quantity)? 
SELECT c.CategoryID, c.name, SUM(s.Quantity) AS TotalSales FROM categories AS c 
INNER JOIN products AS p ON p.CategoryID = c.CategoryID
INNER JOIN sales AS s ON s.ProductID = p.ProductID
GROUP BY c.name
ORDER BY TotalSales DESC LIMIT 2;

-- How many unique products were sold during 2015 with a price greater than 50? *
SELECT DISTINCT count(p.name), s.date FROM products AS p
INNER JOIN sales AS s ON s.ProductID = p.ProductID
WHERE s.date LIKE '2015%' AND p.Price > 50;

-- Which department has the lowest revenue? *
SELECT d.name, SUM(s.PricePerUnit) AS Revenue FROM departments AS d
INNER JOIN categories AS c ON c.DepartmentID = d.DepartmentID
INNER JOIN products AS P ON p.CategoryID = c.CategoryID
INNER JOIN sales AS s ON s.ProductID = p.ProductID
GROUP BY d.name
ORDER BY Revenue ASC LIMIT 1;

-- What is the first name of the employee with the most sales of small electronics (by revenue)?
SELECT d.name, e.FirstName, SUM(s.PricePerUnit) AS Revenue FROM departments AS d
INNER JOIN categories AS c ON c.DepartmentID = d.DepartmentID
INNER JOIN products AS p ON p.CategoryID = c.CategoryID
INNER JOIN sales AS s ON s.ProductID = p.ProductID
INNER JOIN employees AS e ON e.EmployeeID = s.EmployeeID
WHERE d.name = 'Small Electronics'
GROUP BY e.FirstName
ORDER BY Revenue DESC LIMIT 1;
