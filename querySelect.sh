#!/bin/bash

#Help text for Select Menu
helpSelect()
{
    echo
    echo "Select Menu Command"
    echo "1)Select all employees who are managers"
    echo "2)Select all female employees"
    echo "3)Select all male employees"
    echo "4)Select all fish in the Fish table"
    echo "5)Select all inventory of Type: Fish"
    echo "6)Select all Inventory all inventory tuples between \$1 and \$20"
    echo "7)Select all employees that are floor cleaners"
    echo "8)Select all employees that are general workers"
    echo "9)Select all employees that are sales representatives"
    echo "10)Select all employees that are tank cleaners"
    echo "11)Select all employees that are tank inspectors"
    echo "12)Select all employees that are veterinarians"
    echo "13)Select all customer transaction details"
    echo "14)Select all inventory of type gift"
    echo "15)Select all inventory of type ticket"
    echo "c)Custom Query"
    echo "h)Help"
    echo "r)Return"
    echo "q)Quit"
}

#Select Query Menu
selectMenu()
{
    helpSelect

    while [ true ]; do
        echo -n ">"
        read line
        if [ $line = 1 ]; then
            echo "Selecting all managers..."
            initdb2
            db2 "SELECT EmployeeID, Gender, Name, Dob, Shift, Salary from Employee where Position='Manager'";
            helpSelect
        elif [ $line = 2 ]; then
            echo "Selecting all female employees..."
            initdb2
            db2 "SELECT EmployeeID, Name from Employee where Gender='F'";
            helpSelect
        elif [ $line = 3 ]; then
            echo "Selecting all male employees..."
            initdb2
            db2 "SELECT EmployeeID, Name from Employee where Gender='M'"
            helpSelect
        elif [ $line = 4 ]; then
            echo "Selecting all fish in the fish table"
            initdb2
            db2 "SELECT Fish.FishID, Inventory.InventoryName, Fish.InventoryID FROM Fish, Inventory WHERE Inventory.InventoryID = FISH.InventoryID";
            helpSelect
        elif [ $line = 5 ]; then
            echo "Selecting all inventory of type fish..."
            initdb2
            db2 "SELECT InventoryName from Inventory where InventoryType='Fish'";
            helpSelect
        elif [ $line = 6 ]; then
            echo "Selecting all inventory tuples priced between \$1 and \$20"
            initdb2
            db2 "SELECT * from Inventory where price between 1 and 20";
            helpSelect
        elif [ $line = 7 ]; then
            echo "Selecting all employees that are floor cleaners"
            initdb2
            db2 "SELECT EmployeeID, Gender, Name, Dob, Shift, Salary from Employee where Position='Floor Cleaner'";
            helpSelect
        elif [ $line = 8 ]; then
            echo "Selecting all employees that are general workers"
            initdb2
            db2 "SELECT EmployeeID, Gender, Name, Dob, Shift, Salary from Employee where Position='General Worker'";
            helpSelect
        elif [ $line = 9 ]; then
            echo "Selecting all employees that are sales representatives"
            initdb2
            db2 "SELECT EmployeeID, Gender, Name, Dob, Shift, Salary from Employee where Position='Sales Representative'"; 
            helpSelect
        elif [ $line = 10 ]; then
            echo "Selecting all employees that are Tank Cleaners"
            initdb2
            db2 "SELECT EmployeeID, Gender, Name, Dob, Shift, Salary from Employee where Position='Tank Cleaner'";
            helpSelect
        elif [ $line = 11 ]; then
            echo "Selecting all employees that are Tank Inspectors"
            initdb2
            db2 "SELECT EmployeeID, Gender, Name, Dob, Shift, Salary from Employee where Position='Tank Inspection'";
            helpSelect
        elif [ $line = 12 ]; then
            echo "Selecting all employees that are veterinarians"
            initdb2
            db2 "SELECT EmployeeID, Gender, Name, Dob, Shift, Salary from Employee where Position='Veterinarian'";
            helpSelect
        elif [ $line = 13 ]; then
            echo "Selecting all customer transaction details"
            initdb2
            db2 "SELECT Customer.CustomerID, Customer.TransactionID, Transactions.TotalPrice, Transactions.EmployeeID, Quantity, InventoryID, Date FROM Customer, Transactions WHERE Customer.TransactionID = Transactions.TransactionID";
            helpSelect
        elif [ $line = 14 ]; then
            echo "Selecting all inventory of type gift"
            initdb2
            db2 "SELECT InventoryID, InventoryName, Price, QuantityinStock from Inventory where InventoryType='Gift'";
            helpSelect
        elif [ $line = 15 ]; then
            echo "Selecting all inventory of type ticket"
            initdb2
            db2 "SELECT InventoryID, InventoryName, Price, QuantityinStock from Inventory where InventoryType='Ticket'";
            helpSelect
        elif [ $line = "C" ] || [ $line = "c" ]; then
            customQuery
            helpSelect
        elif [ $line = "H" ] || [ $line = "h" ]; then
            helpSelect
        elif [ $line = "R" ] || [ $line = "r" ]; then
            echo "Returning..."
            break
        elif [ $line = "Q" ] || [ $line = "q" ]; then
            quitProgram
        else
            echo "Command not understood. Please re-enter a command."
            echo "Type H for help"
        fi
    done
}
