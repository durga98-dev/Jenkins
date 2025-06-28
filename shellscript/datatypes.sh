#!/bin/bash

# shell scrip is smart enough to recognize the data types

num1=$1
num2=$2 # even if we pass string, shell is smart enough & will consider as zero

Timestamp=$(date)
sum=$(($num1+$num2))

echo "script executed at: $Timestamp"

echo "sum of $num1 and $num2 is: $sum"