# dockerAndPostgresql

This is a database named Umuzi, containing different tables recording data from when an order is placed to when it is delivered. 

You may need to have ```docker-compose``` to run this database and use details inside the 
```docker-compose.yml``` to log on Adminer.

The ```postgresCommands.sql``` shows all commands used to build this database.

------------------------------------------------------------------------------------------

The database contains the following tables:
🔹Customers
    🔸The first table, ```Customers``` contains data of customers who placed orders.
    
🔹Employees
    🔸The ```Employees``` table records all details of employees which this order passes through before it's delivered.
    
🔹Payments
    🔸```Payments``` records the checkout date and amount associated with customers respectfully.
    🔸 ```CustomerID``` references the ```Customers``` table.
🔹Products
    🔸```Products``` contains products ordered.
🔹Orders
    🔸The ```Orders``` table stores the order data recorded on ```Customers, Employees, Payments and Products.``` for a specific customer. 
    🔸```ProductID``` references the ```ProductID``` in the ```Products``` table.
    🔸```PaymentID``` references the ```PaymentsID``` in the ```Payments``` table.
    🔸```FulfilledByEmployeeID``` references the ```EmployeeID``` in the ```Employees``` table.

------------------------------------------------------------------------------------------
