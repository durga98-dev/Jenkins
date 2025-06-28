#!/bin/bash

echo "Please enter the day:"

read DAY

inday=${DAY,,}

if [ "$inday" == "sunday" ]
then
    echo "Today is holiday"
else
    echo "Today is not holiday, go to school"
fi




