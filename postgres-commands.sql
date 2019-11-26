--Creating database
CREATE DATABASE Umuzi;
--creating Customers table
CREATE TABLE Customers(
   CustomerID     INTEGER SERIAL PRIMARY KEY,
   FirstName      VARCHAR (50),
   LastName       VARCHAR (50),
   Gender         VARCHAR,
   Address        VARCHAR (200),
   Phone          BIGINT,
   Email          VARCHAR (100),
   City           VARCHAR (20),
   Country        VARCHAR (50)
);

--inserting data into Customers table
INSERT INTO Customers(CustomerID, FirstName, LastName, Gender, Address, Phone, Email, City, Country)
VALUES(1, 'John', 'Hilbert', 'Male', '284 chaucer st', 084789657, 'john@gmail.com', 'Johannesburg', 'South Africa');

INSERT INTO customers(FirstName, LastName, Gender, Address, Phone, Email, City, Country)
VALUES('Thando', 'Sithole', 'Female', '240 Sect 1', 0794445584, 'thando@gmail.com', 'Cape Town', 'South Africa');
   
INSERT INTO customers(FirstName, LastName, Gender, Address, Phone, Email, City, Country)
VALUES('Leon', 'Glen', 'Male', '281 Everton Rd, Gillits', 0820832830, 'Leon@gmail.com', 'Durban', 'South Africa');
   
INSERT INTO customers(FirstName, LastName, Gender, Address, Phone, Email, City, Country)
VALUES('Charl', 'Muller', 'Male', '290A DOrset Ecke', ++44856872553, 'Charl.muller@gmail.com', 'Berlin', 'Germany');

INSERT INTO customers(FirstName, LastName, Gender, Address, Phone, Email, City, Country)
VALUES('Julia', 'Stein', 'Female', '2 Wernerring', ++448672445058, 'Js234@yahoo.com', 'Frankfurt', 'Germany');

--Creating table Employees
CREATE TABLE Employees (
   EmployeeID   SERIAL    PRIMARY KEY,
   FirstName    VARCHAR(50)   NOT NULL,
   LasttName    VARCHAR(50)   NOT NULL,
   Email        VARCHAR(100)  NOT NULL,
   JobTitle     VARCHAR(20)   NOT NULL
);

--Inserting data into Employees table
INSERT INTO Employees(EmployeeID, FirstName, LasttName, Email, JobTitle)
VALUES(1, 'Kani', 'Matthew', 'mat@gmail.com', 'Manager');

INSERT INTO Employees(FirstName, LasttName, Email, JobTitle)
VALUES('Lesly', 'Cronje', 'LesC@gmail.com', 'Clerk');

INSERT INTO Employees(FirstName, LasttName, Email, JobTitle)
VALUES('Gideon', 'Maduku', 'm@gmail.com', 'Accountant');

-- Because Orders table has foreign keys of products table and payments table
-- I have created the payments and Products table before Orders.
-- The Orders table references an existing tables.

--Creating Payments table
CREATE TABLE Payments(
   CustomerID     int references Customers(CustomerID),
   PaymentID      SERIAL     PRIMARY KEY,
   PaymentDate    int        NOT NULL,
   Amount         NUMERIC    NOT NULL
);

--Inserting data into Payments table
INSERT INTO Payments(CustomerID, PaymentID, PaymentDate, Amount)
VALUES (1, 2018-09-01, 150.75);

INSERT INTO Payments(CustomerID, PaymentDate, Amount)
VALUES (5, 2018-09-02, 150.75);

INSERT INTO Payments(CustomerID, PaymentDate, Amount)
VALUES (4, 2018-09-03, 700.60);

--Creating Products table
CREATE TABLE Products(
   ProductID    SERIAL        PRIMARY KEY,
   ProductName  varchar(100)  NOT NULL,
   Description  varchar(100)  NOT NULL,
   BuyPrice     NUMERIC       NOT NULL
);

--Inserting data into Products
INSERT INTO Products(ProductID, ProductName, Description, BuyPrice)
VALUES (1, 'Harley Davidson Chopper', 'This replica features working kickstand, front suspension, gear-shift lever', 150.75);

INSERT INTO Products(ProductName, Description, BuyPrice)
VALUES ('Classic Car', 'Turnable front wheels, steering function', 550.75);

INSERT INTO Products(ProductName, Description, BuyPrice)
VALUES ('Sports Car', 'Turnable front wheels, steering function', 700.60);
--Creating table Orders.
CREATE TABLE Orders(
   OrdersID                SERIAL       PRIMARY KEY,
   ProductID               int,         references Payments(ProductID),
   PaymentID               int          references Payments(PaymentID),
   FulfilledByEmployeeID   int,
   DateRequired            DATE,
   DateShipped             DATE,
   Status                  varchar(20)
);

--Inserting data into Orders
INSERT INTO Orders(OrdersID, ProductID, PaymentID, FulfilledByEmployeeID,DateRequired, DateShipped, Status)
VALUES (1, 1, 1, 2, '05-09-2018', null, 'Not shipped');

INSERT INTO Orders(ProductID, PaymentID, FulfilledByEmployeeID,DateRequired, DateShipped, Status)
VALUES (1, 2, 2, '2018-09-04', '2018-09-03', 'Shipped');

INSERT INTO Orders(ProductID, PaymentID, FulfilledByEmployeeID,DateRequired, DateShipped, Status)
VALUES (3, 3, 3, '2018-09-06', null, 'Not shipped');


--SELECT ALL records from table Customers
SELECT * FROM Customers;
--SELECT records only from the name column in the Customers table.
SELECT DISTINCT FirstName, LastName, Gender, Address, Phone, Email FROM Customers;
--Show the name of the Customer whose CustomerID is 1.
SELECT
  FirstName,
  LastName
FROM Customers 
WHERE CustomerID = 1;
--UPDATE the record for CustomerID = 1 on the Customer table so that the name is “Lerato Mabitso”.
UPDATE Customers
SET FirstName = 'Lebitso',
    LastName = 'Mabitso'
WHERE
   CustomerID = 1;
--DELETE the record from the Customers table for customer 2 (CustomerID = 2)
DELETE FROM Customers
WHERE CustomerID = 2;
---Select all unique statuses from the Orders table 
--and get a count of the number of orders for each unique status.
SELECT COUNT(DISTINCT Status) 
FROM Orders;
--Return the MAXIMUM payment made on the PAYMENTS table.
SELECT MAX(Amount)
FROM Payments;
--Select all customers from the “Customers” table, sorted by the “Country” column.
SELECT * FROM Customers
ORDER BY Country;
--Select all products with a price BETWEEN R100 and R600.
SELECT * FROM Products
WHERE BuyPrice BETWEEN 100 AND 600;
--Select all fields from “Customers” where country is “Germany” AND city is “Berlin”.
SELECT * FROM Customers
WHERE Country = 'Germany' AND City = 'Berlin';
--Select all fields from “Customers” where city is “Cape Town” OR “Durban”.
SELECT * FROM Customers
WHERE City = 'Cape Town' OR City = 'Durban';
--Select all records from Products where the Price is GREATER than R500.
SELECT * FROM Products
WHERE BuyPrice > 500;
--Return the sum of the Amounts on the Payments table.
SELECT SUM (Amount)
FROM Payments;
--Count the number of shipped orders in the Orders table
SELECT COUNT(DISTINCT Status) 
FROM Orders
WHERE Status = 'Shipped';
--Return the average price of all Products, in Rands and in Dollars 
--(assume the exchange rate is R12 to the Dollar)
SELECT AVG(BuyPrice) AS AveragePriceRands FROM Products;
SELECT AVG(BuyPrice/12) AS AveragePriceDollars FROM Products;
--Using INNER JOIN create a query that selects all Payments with Customer information.
SELECT
   Customers.CustomerID,
   FirstName,
   LastName,
   Gender,
   Address,
   Phone,
   Email,
   Country,
   City
FROM Customers
INNER JOIN Payments ON Payments.CustomerID = Customers.CustomerID;
--Select all products that have turnable front wheels.
SELECT * FROM Products
WHERE Description = 'Turnable front wheels, steering function';
