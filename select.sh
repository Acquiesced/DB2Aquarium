#!/bin/bash

. db2init
db2 connect to db2data

echo "Calling Tables"

db2 "select * from Employee"
db2 "select * from Fish"
db2 "select * from Transactions"
db2 "select * from Tank"
db2 "select * from Inventory"
db2 "select * from Customer";