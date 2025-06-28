#!/bin/bash

id=$(id -u)

if [ $id -eq 0 ]
then
    echo "install Mysqld"
    dnf install mysql-server -y
else
    echo "Error:: Must be root user to install mysql"
    exit 1 # other than 0 as 0 indicates it is success
fi

#check if installation is success or not

if [ $? -eq 0 ]
then
    echo "Mysql Installation.... is success"
else
    echo "Mysql Installation.... is Failed"
fi

if [ $id -eq 0 ]
then
    echo "install Git"
    dnf install git -y
else
    echo "Error:: Must be root user to install mysql"
    exit 1 # other than 0 as 0 indicates it is success
fi

if [ $? -eq 0 ]
then
    echo "Git Installation.... is success"
else
    echo "Git Installation.... is Failed"

