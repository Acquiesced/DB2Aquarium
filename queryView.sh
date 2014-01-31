#!/bin/bash

#Help text for View Menu
helpView()
{
    echo
    echo "View Table Menu Commands:"
    echo "1)Manager's View"
    echo "2)General Employee's View"
    echo "3)Sales Representative View"
    echo "4)Tank Maitennance View"
    echo "5)Price View"
    echo "d)Drop ALL views"
    echo "c)Custom Query"
    echo "h)Help"
    echo "r)Return"
    echo "q)Quit"
}

#Give View Menu
viewMenu()
{
    helpView

    while [ true ]; do
        echo -n ">"
        read line
        if [ $line = 1 ]; then
            echo "Creating View for managers"
            initdb2
            db2 Create View manager_view AS "(SELECT EmployeeID, Gender, Dob, Position, Shift FROM Employee where Position<>'Manager')"
            db2 "SELECT * from manager_view";
            helpView
        elif [ $line = 2 ]; then
            echo "Creating General View for employees"
            db2 Create View general_employee AS "(SELECT employeeid, name, gender, position FROM Employee)"
            db2 "Select * from general_employee";
            helpView
        elif [ $line = 3 ]; then
            echo "Creating Sales Representative View"
            initdb2
            db2 Create View sales_rep_view AS "(SELECT InventoryID, InventoryName, Price, QuantityinStock from Inventory where InventoryType='Ticket')"
            db2 "SELECT * from sales_rep_view";
            helpView
        elif [ $line = 4 ]; then
            echo "Creating Matiennance View"
            initdb2
            db2 Create View maitennance_view AS "(SELECT Inventory.InventoryID, Inventory.InventoryName, Fish.Weight, Tank.TankID, Tank.WaterType, Tank.WaterTemp from Fish, Inventory, Tank where Inventory.InventoryType = 'Fish' AND Tank.TankID = Fish.TankID)"
            db2 "SELECT * from maitennance_view";
            helpView
        elif [ $line = 5 ]; then
            echo "Creating Price View"
            initdb2
            db2 Create View price_view AS "(SELECT InventoryName, Price from Inventory where InventoryType = 'Ticket')"
            db2 "SELECT * from price_view";
            helpView
        elif [ $line = "C" ] || [ $line = "c" ]; then
            customQuery
            helpView
        elif [ $line = "D" ] || [ $line = "d" ]; then
            echo "Dropping ALL views"
            initdb2
            db2 DROP View manager_view;
            db2 DROP View general_employee;
            db2 DROP View sales_rep_view;
            db2 DROP View maitennance_view;
            db2 DROP View price_view;
            helpView
        elif [ $line = "H" ] || [ $line = "h" ]; then
            helpView
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
