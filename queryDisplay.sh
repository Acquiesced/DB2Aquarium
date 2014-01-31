#!/bin/bash

#Help text for Display Menu
helpDisplay()
{
    echo
    echo "Display Table Menu Commands:"
    echo "1)Display Employee Table"
    echo "2)Display Inventory Table"
    echo "3)Display Tank Table"
    echo "4)Display Fish Table"
    echo "5)Display Transactions Table"
    echo "6)Display Customer Table"
    echo "7)Display ALL tables"
    echo "c)Custom Query"
    echo "h)Help"
    echo "r)Return"
    echo "q)Quit"
}

#Display Query Menu
displayMenu()
{
    helpDisplay

    while [ true ]; do
        echo -n ">"
        read line
        if [ $line = 1 ]; then
            echo "Displaying Employee table..."
            initdb2
            db2 "SELECT * from Employee";
            helpDisplay
        elif [ $line = 2 ]; then
            echo "Displaying Inventory table..."
            initdb2
            db2 "SELECT * from Inventory";
            helpDisplay
        elif [ $line = 3 ]; then
            echo "Displaying Tank table..."
            initdb2
            db2 "SELECT * from Tank";
            helpDisplay
        elif [ $line = 4 ]; then
            echo "Displaying Fish table..."
            initdb2
            db2 "SELECT * from Fish";
            helpDisplay
        elif [ $line = 5 ]; then
            echo "Displaying Tansactions table..."
            initdb2
            db2 "SELECT * from Transactions";
            helpDisplay
        elif [ $line = 6 ]; then
            echo "Displaying Customer table..."
            initdb2
            db2 "SELECT * from Customer";
            helpDisplay
        elif [ $line = 7 ]; then
            echo "Displaying ALL tables..."
            initdb2
            db2 "SELECT * from Employee";
            db2 "SELECT * from Inventory";
            db2 "SELECT * from Tank";
            db2 "SELECT * from Fish";
            db2 "SELECT * from Transactions";
            db2 "SELECT * from Customer";
            helpDisplay
        elif [ $line = "C" ] || [ $line = "c" ]; then
            customQuery
            helpDisplay
        elif [ $line = "H" ] || [ $line = "h" ]; then
            helpDisplay
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
