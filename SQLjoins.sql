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
