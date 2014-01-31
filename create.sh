#!/bin/bash

. db2init
db2 connect to db2data

echo "Creating Tables"

db2 CREATE TABLE Employee"(EmployeeID INTEGER NOT NULL, Name VARCHAR(30), Gender CHAR(1), SIN INTEGER NOT NULL, DOB DATE, Position VARCHAR(30), Shift VARCHAR(20), Salary DECIMAL(9,2) NOT NULL, PRIMARY KEY (EmployeeID), UNIQUE(SIN))"
db2 CREATE TABLE Inventory"(InventoryID INTEGER NOT NULL, InventoryName VARCHAR(40), InventoryType VARCHAR(20), Price DECIMAL(9,2), QuantityinStock INTEGER, PRIMARY KEY(InventoryID))"
db2 CREATE TABLE Tank"(TankID INTEGER NOT NULL, WaterType VARCHAR(20), WaterTemp DECIMAL(9,2), TankSize INTEGER, TankCapacity INTEGER, FishinTank INTEGER, Clean VARCHAR(1), PRIMARY KEY(TankID))"
db2 CREATE TABLE Fish"(FishID INTEGER NOT NULL, TankID INTEGER, Weight DECIMAL(9,2), InventoryID INTEGER NOT NULL, Healthy VARCHAR(1), PRIMARY KEY (FishID),FOREIGN KEY IFK(InventoryID) REFERENCES Inventory, FOREIGN KEY TFK(TankID) REFERENCES Tank)"
db2 CREATE TABLE Transactions"(TransactionID INTEGER NOT NULL, TotalPrice DECIMAL(9,2) NOT NULL, EmployeeID INTEGER NOT NULL, Quantity INTEGER, InventoryID INTEGER NOT NULL, Date DATE, PRIMARY KEY (TransactionID), FOREIGN KEY EFK (EmployeeID) REFERENCES Employee, FOREIGN KEY IFK(InventoryID) REFERENCES Inventory)"
db2 CREATE TABLE Customer"(CustomerID INTEGER NOT NULL, TransactionID INTEGER NOT NULL, PRIMARY KEY(CustomerID), FOREIGN KEY TRFK (TransactionID) REFERENCES Transactions)";
db2 "Create trigger remove_fish after update on fish for each row delete from Fish where Healthy = 'N'";
