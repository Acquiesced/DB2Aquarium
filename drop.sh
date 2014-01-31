#!/bin/bash

. db2init
db2 connect to db2data

echo "Dropping Table"

db2 DROP TABLE Employee
db2 DROP TABLE Fish
db2 DROP TABLE Transactions
db2 DROP TABLE Tank
db2 DROP TABLE Inventory
db2 DROP TABLE Customer;
db2 DROP TRIGGER remove_fish;
