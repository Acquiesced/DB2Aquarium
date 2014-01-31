#!/bin/bash

#Help text for main Query menu
helpQueriesMain()
{
    echo
    echo "Query Menu Command"
    echo "1)Display Tables"
    echo "2)Selection"
    echo "3)Views"
    echo "4)Between"
    echo "5)Others"
    echo "c)Custom Query"
    echo "h)Help"
    echo "r)Return"
    echo "q)Quit"
}

#Main Query Menu
queriesMain()
{
    helpQueriesMain

    while [ true ]; do
        echo -n ">"
        read line
        if [ $line = 1 ]; then
            displayMenu        #Found in QUERYDISPLAY.SH
            helpQueriesMain
        elif [ $line = 2 ]; then
            selectMenu          #Found in QUERYSELECT.sh
            helpQueriesMain
        elif [ $line = 3 ]; then
            viewMenu            #Found in QUERYVIEW.sh
            helpQueriesMain
        elif [ $line = 4 ]; then
            betweenMenu
            helpQueriesMain
        elif [ $line = 5 ]; then
            otherMenu
            helpQueriesMain
        elif [ $line = "C" ] || [ $line = "c" ]; then
            customQuery
            helpQueriesMain
        elif [ $line = "H" ] || [ $line = "h" ]; then
            helpQueriesMain
        elif [ $line = "R" ] || [ $line = "r" ]; then
            echo "Returning to main menu..."
            break
        elif [ $line = "Q" ] || [ $line = "q" ]; then
            quitProgram
        else
            echo "Command not understood. Please re-enter a command."
            echo "Type H for help"
        fi

    done
}
