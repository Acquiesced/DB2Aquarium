#!/bin/bash

#Help text for Other Menu
helpOther()
{
    echo
    echo "Other Table Menu Commands:"
    echo "1)Display total price of Inventory"
    echo "2)Select all employees with last name \"Jung\""
    echo "3)Find average of all Inventory prices"
    echo "4)Total Count of Fish"
    echo "5)Union of Fish and Tickets"
    echo "6)Largest Fish Weight"
    echo "7)Update prices"
    echo "8)Select Transactions after 09/25/2012"
    echo "9)Update Employee Salary"
    echo "10)Order Inventory by price*1.13"
    echo "11)Clean Tank 2"
    echo "12)Remove fish 1 from fish list"
    echo "c)Custom Query"
    echo "h)Help"
    echo "r)Return"
    echo "q)Quit"
}

#Give Other Menu
otherMenu()
{
    helpOther

    while [ true ]; do
        echo -n ">"
        read line
        if [ $line = 1 ]; then
            echo "Displaying the total price of all inventory items (stock * price)"
            initdb2
            db2 "select inventoryname, inventorytype, price, quantityinstock, price*quantityinstock AS Total_Price from Inventory"; 
            helpOther
        elif [ $line = 2 ]; then
            echo "Selecting all employees with the Last name \"Jung\""
            initdb2
            db2 "select * FROM Employee WHERE (name LIKE '%Jung')";
            helpOther
        elif [ $line = 3 ]; then
            echo "Finding the average of all Inventory prices"
            db2 "select AVG(Price) AS AvgInvPrice FROM inventory ";
            helpOther
        elif [ $line = 4 ]; then
            echo "Finding the Total Count of Fish." 
            initdb2
            db2 "select COUNT(FishID) AS TotalFish FROM Fish";
            helpOther
        elif [ $line = 5 ]; then
            echo "Selecting union of Fish and Tickets"
            initdb2
            db2 "select * from Inventory where InventoryType='Fish' union select * from inventory where inventorytype='Ticket'";
            helpOther
        elif [ $line = 6 ]; then
            echo "Finding the largest fish weight." 
            initdb2
            db2 "select Max(Weight) AS HeaviestFish FROM Fish";
            helpOther
        elif [ $line = 7 ]; then
            echo "Updating Inventory Prices"
            initdb2
            db2 "select Price from Inventory"
            db2 "UPDATE Inventory set Price = Price * 0.97"
            db2 "select Price from Inventory";
            helpOther
        elif [ $line = 8 ]; then
            echo "Finding Transactions that Occured on or after 09/25/2012." 
            initdb2
            db2 "SELECT * FROM Transactions where (Date>= '2012-09-25')";
            helpOther
        elif [ $line = 9 ]; then
            echo "Update Employee Salary"
            initdb2
            db2 "select Name, Salary from Employee"
            db2 "UPDATE Employee set Salary = Salary + 500"
            db2 "select Name, Salary from Employee";
            helpOther
        elif [ $line = 10 ]; then
            echo "Find total price plus tax on Inventory Prices, and order by Price." 
            initdb2
            db2 "SELECT InventoryID, InventoryName, Price * 1.13 AS PriceWithTax FROM Inventory ORDER BY 3, InventoryID";
            helpOther
        elif [ $line = 11 ]; then
            echo "Cleaning Tank 2" 
            initdb2
            echo "Before:"
            db2 "SELECT * from Tank";
            db2 "UPDATE Tank set Clean = 'Y'";
            echo "After:"
            db2 "SELECT * from Tank";
            helpOther
        elif [ $line = 12 ]; then
            echo "Removing Fish 1 from fish table." 
            initdb2
            echo "Before:"
            db2 "SELECT * from Fish";
            db2 "SELECT * from Tank";
            db2 "DELETE from Fish where fishid = 1"
            echo "After:"
            db2 "SELECT * from Fish";
            db2 "SELECT * from Tank";
            helpOther
        elif [ $line = "C" ] || [ $line = "c" ]; then
            customQuery
            helpOther
        elif [ $line = "H" ] || [ $line = "h" ]; then
            helpOther
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
