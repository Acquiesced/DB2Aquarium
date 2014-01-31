#!/bin/bash

#Help text for Between Menu
helpBetween()
{
    echo
    echo "Between Table Menu Commands:"
    echo "1)Weights Between 50 and 150"
    echo "2)Gift Prices Between 4 and 10 Dollars"
    echo "3)Employee Salaries between 50K and 70K"
    echo "4)Employee SINs between 900000000 and 999999999"
    echo "5)Employees with birthdays between 1980 and 1990"
    echo "c)Custom Query"
    echo "h)Help"
    echo "r)Return"
    echo "q)Quit"
}

#Give Between Menu
betweenMenu()
{
    helpBetween

    while [ true ]; do
        echo -n ">"
        read line
        if [ $line = 1 ]; then
            echo "Finding all Inventory Tuples with Weights between 50 and 150 lbs."
            initdb2
            db2 "select * from Fish where Weight between 50 and 150";
            helpBetween
        elif [ $line = 2 ]; then
            echo "Finding all Gift Type Inventory Tuples with Price bewteen 4 and 10 Dollars"
            initdb2
            db2 "select * from Inventory where InventoryType='Gift' AND Price between 4 and 10";
            helpBetween
        elif [ $line = 3 ]; then
            echo "Finding Salaries between 50k and 70k per year"
            initdb2
            db2 "select * from Employee where Salary between 50000 and 70000";
            helpBetween
        elif [ $line = 4 ]; then
            echo "Finding Employee SINs between 900000000 and 999999999"
            initdb2
            db2 "select * from Employee where SIN between 900000000 and 999999999";
            helpBetween
        elif [ $line = 5 ]; then
            echo "Finding Employees born between 1980 and 1990"
            initdb2
            db2 "select * from Employee where Dob between '1979-12-31' and '1990-01-01'";
            helpBetween
        elif [ $line = "C" ] || [ $line = "c" ]; then
            customQuery
            helpBetween
        elif [ $line = "H" ] || [ $line = "h" ]; then
            helpBetween
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
