#!/bin/bash

echo ("please enter the number: ")
read NUM

if [ $NUM <= 100 ]
then
    echo "$NUM is less than or equal to 100"
else    
    echo "Given number is greater than 100"
fi
