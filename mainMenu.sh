#!/bin/bash

#Help text for main menu
helpMain()
{
    echo 
    echo "Main Menu Commands:"
    echo "1)Create Tables"
    echo "2)Populate Tables"
    echo "3)Drop Tables"
    echo "4)List Tables"
    echo "5)Queries"
    echo "6)Initialize(Create & Populate Tables)"
    echo "7)Denitialize(Drop Tables & Quit)"
    echo "h)Help"
    echo "q)Quit"
}

#Routine for creating tables
create()
{
    ./create.sh
}

#Routine for populating tables
populate()
{
#    ./VALUES.sh
    initdb2

    while read line; do 
            #echo $line # or whaterver you want to do with the $line variable
            db2 INSERT INTO Employee VALUES "$line"
    done < tableEmployee.txt

    while read line; do 
            #echo $line # or whaterver you want to do with the $line variable
            db2 INSERT INTO Inventory VALUES "$line"
    done < tableInventory.txt
    
    while read line; do 
            #echo $line # or whaterver you want to do with the $line variable
            db2 INSERT INTO Tank VALUES "$line"
    done < tableTank.txt
    
    while read line; do 
            #echo $line # or whaterver you want to do with the $line variable
            db2 INSERT INTO Fish VALUES "$line"
    done < tableFish.txt
    
    while read line; do 
            #echo $line # or whaterver you want to do with the $line variable
            db2 INSERT INTO Transactions VALUES "$line"
    done < tableTransactions.txt
    
    while read line; do 
            #echo $line # or whaterver you want to do with the $line variable
            db2 INSERT INTO Customer VALUES "$line"
    done < tableCustomer.txt
}

#Routine for dropping tables
drop()
{
    ./drop.sh
}

#Routine for populating tables
list()
{
    ./list.sh
}

main()
{
    #Main section
    helpMain

    while [ true ]; do
        echo -n ">"
        read line
        #Create Tables
        if [ $line = 1 ]; then
            create
            helpMain
            #Populate
        elif [ $line = 2 ]; then
            populate
            helpMain
            #Drop
        elif [ $line = 3 ]; then
            drop
            helpMain
            #List
        elif [ $line = 4 ]; then
            list
            helpMain
            #Query Menu
        elif [ $line = 5 ]; then
            queriesMain     #Found in QUERIES.sh    
            helpMain
            #Initialize
        elif [ $line = 6 ]; then
            create
            populate
            helpMain
            #Denitialize
        elif [ $line = 7 ]; then
            drop
            quitProgram
        elif [ $line = "H" ] || [ $line = "h" ]; then
            helpMain
        elif [ $line = "Q" ] || [ $line = "q" ]; then
            quitProgram
        else
            echo "Command not understood. Please re-enter a command."
            echo "Type H for help"
        fi
    done
}
