#!/bin/bash

#Source all menu functions
. mainMenu.sh
. queryMenu.sh
. queryDisplay.sh
. querySelect.sh
. queryView.sh
. queryBetween.sh
. queryOther.sh

#Global functions
quitProgram()
{
    echo "Exiting DB2 system. Have a good day."
    exit 0
}

initdb2()
{
    . db2init
    db2 connect to db2data
}

customQuery()
{
    echo "Enter a Custom Query"
    echo -n ">"
    read line
    initdb2
    db2 "$line";
}

#Welcome message
echo "Welcome to the DB2 system. Please enter a command"

#Call Main function
main
