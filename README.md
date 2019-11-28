# dockerAndPostgresql

This is a database named Umuzi, containing different tables recording data from when an order is placed to when it is delivered. 

You may need to have ```docker-compose``` to run this database and use details inside the 
```docker-compose.yml``` to log on Adminer.

The ```postgresCommands.sql``` shows all commands used to build this database.

------------------------------------------------------------------------------------------

The database contains the following tables:

🔹Customers

    🔸The first table, Customers contains data of customers who placed orders.
    
    
🔹Employees

    🔸The Employees table records all details of employees which orders pass
    
    through before they are delivered.
    
    
🔹Payments

    🔸Payments records the checkout date and amount associated with customers respectfully.
    
    🔸 CustomerID references the CustomerID from the Customers table.
🔹Products

    🔸Products contains products ordered.
    
🔹Orders

    🔸The Orders table is the final table storing all data recorded on Customers, Employees, 
    
    Payments and Products. for a specific customer. It links all tables for a particular order.
    
    🔸ProductID references the ProductID from the Products table.
    
    🔸PaymentID references the PaymentsID from the Payments table.
    
    🔸FulfilledByEmployeeID references the EmployeeID from the Employees table.

