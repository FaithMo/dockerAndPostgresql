CREATE DATABASE Umuzi;
CREATE TABLE Customers(
   CustomerID     serial PRIMARY KEY,
   FirstName      VARCHAR (50),
   LastName       VARCHAR (50),
   Gender         VARCHAR,
   Address        VARCHAR (200),
   Phone          BIGINT,
   Email          VARCHAR (100),
   City           VARCHAR (20),
   Country        VARCHAR (50)
);

INSERT INTO Customers(CustomerID, FirstName, LastName, Gender, Address, Phone, Email, City, Country)
VALUES(1, 'John', 'Hilbert', 'Male', '284 chaucer st', 084789657, 'john@gmail.com', 'Johannesburg', 'South Africa');

INSERT INTO customers(CustomerID, FirstName, LastName, Gender, Address, Phone, Email, City, Country)
VALUES(2, 'Thando', 'Sithole', 'Female', '240 Sect 1', 0794445584, 'thando@gmail.com', 'Cape Town', 'South Africa');
   
INSERT INTO customers(CustomerID, FirstName, LastName, Gender, Address, Phone, Email, City, Country)
VALUES(3, 'Leon', 'Glen', 'Male', '281 Everton Rd, Gillits', 0820832830, 'Leon@gmail.com', 'Durban', 'South Africa');
   
INSERT INTO customers(CustomerID, FirstName, LastName, Gender, Address, Phone, Email, City, Country)
VALUES(4, 'Charl', 'Muller', 'Male', '290A DOrset Ecke', ++44856872553, 'Charl.muller@gmail.com', 'Berlin', 'Germany');

INSERT INTO customers(CustomerID, FirstName, LastName, Gender, Address, Phone, Email, City, Country)
VALUES(5, 'Julia', 'Stein', 'Female', '2 Wernerring', ++448672445058, 'Js234@yahoo.com', 'Frankfurt', 'Germany');

CREATE TABLE Employees (
   EmployeeID   SERIAL        PRIMARY KEY,
   FirstName    varchar(50)   NOT NULL,
   LasttName    varchar(50)   NOT NULL,
   Email        varchar(100)  NOT NULL,
   JobTitle     varchar(20)   NOT NULL
);

INSERT INTO Employees(EmployeeID, FirstName, LasttName, Email, JobTitle)
VALUES(1, 'Kani', 'Matthew', 'mat@gmail.com', 'Manager');

INSERT INTO Employees(EmployeeID, FirstName, LasttName, Email, JobTitle)
VALUES(2, 'Lesly', 'Cronje', 'LesC@gmail.com', 'Clerk');

INSERT INTO Employees(EmployeeID, FirstName, LasttName, Email, JobTitle)
VALUES(3, 'Gideon', 'Maduku', 'm@gmail.com', 'Accountant');

CREATE TABLE Payments(
   CustomerID     int references Customers(CustomerID),
   PaymentID      SERIAL     PRIMARY KEY,
   PaymentDate    int        NOT NULL,
   Amount         NUMERIC    NOT NULL
);

INSERT INTO Payments(CustomerID, PaymentID, PaymentDate, Amount)
VALUES (1, 1, 2018-09-01, 150.75);

INSERT INTO Payments(CustomerID, PaymentID, PaymentDate, Amount)
VALUES (5, 2, 2018-09-02, 150.75);

INSERT INTO Payments(CustomerID, PaymentID, PaymentDate, Amount)
VALUES (4, 3, 2018-09-03, 700.60);

CREATE TABLE Orders(
   OrdersID                SERIAL        PRIMARY KEY,
   ProductID               int,
   PaymentID               int          references Payments(PaymentID),
   FulfilledByEmployeeID   int,
   DateRequired            DATE,
   DateShipped             DATE,
   Status                  varchar(20)
);

INSERT INTO Orders(OrdersID, ProductID, PaymentID, FulfilledByEmployeeID,DateRequired, DateShipped, Status)
VALUES (1, 1, 1, 2, '05-09-2018', null, 'Not shipped');

INSERT INTO Orders(OrdersID, ProductID, PaymentID, FulfilledByEmployeeID,DateRequired, DateShipped, Status)
VALUES (2, 1, 2, 2, '2018-09-04', '2018-09-03', 'Shipped');

INSERT INTO Orders(OrdersID, ProductID, PaymentID, FulfilledByEmployeeID,DateRequired, DateShipped, Status)
VALUES (3, 3, 3, 3, '2018-09-06', null, 'Not shipped');

CREATE TABLE Products(
   ProductID    SERIAL        PRIMARY KEY,
   ProductName  varchar(100)  NOT NULL,
   Description  varchar(100)  NOT NULL,
   BuyPrice     NUMERIC       NOT NULL
);

INSERT INTO Products(ProductID, ProductName, Description, BuyPrice)
VALUES (1, 'Harley Davidson Chopper', 'This replica features working kickstand, front suspension, gear-shift lever', 150.75);

INSERT INTO Products(ProductID, ProductName, Description, BuyPrice)
VALUES (2, 'Classic Car', 'Turnable front wheels, steering function', 550.75);

INSERT INTO Products(ProductID, ProductName, Description, BuyPrice)
VALUES (3, 'Sports Car', 'Turnable front wheels, steering function', 700.60);

SELECT * FROM Customers;

SELECT DISTINCT FirstName, LastName, Gender, Address, Phone, Email FROM Customers;

SELECT
  FirstName,
  LastName
FROM Customers 
WHERE CustomerID = 1;

UPDATE Customers
SET FirstName = 'Lebitso',
    LastName = 'Mabitso'
WHERE
   CustomerID = 1;

DELETE FROM Customers
WHERE CustomerID = 2;

SELECT COUNT(DISTINCT Status) 
FROM Orders;

SELECT MAX(Amount)
FROM Payments;

SELECT * FROM Customers
ORDER BY Country;

SELECT * FROM Products
WHERE BuyPrice BETWEEN 100 AND 600;

SELECT * FROM Customers
WHERE Country = 'Germany' AND City = 'Berlin';

SELECT * FROM Customers
WHERE City = 'Cape Town' OR City = 'Durban';

SELECT * FROM Products
WHERE BuyPrice > 500;

SELECT SUM (Amount)
FROM Payments;

SELECT COUNT(DISTINCT Status) 
FROM Orders
WHERE Status = 'Shipped';

SELECT AVG(BuyPrice) AS AveragePriceRands FROM Products;
SELECT AVG(BuyPrice/12) AS AveragePriceDollars FROM Products;

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

SELECT * FROM Products
WHERE Description = 'Turnable front wheels, steering function';
