#!/bin/bash

. db2init
db2 connect to db2data

echo "Calling Table Methods"

db2 LIST TABLES;