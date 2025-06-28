#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"

id=$(id -u)

if [ $id -ne 0 ]
then 
   echo -e "$R Error: Must be root user to install the packages"
   exit 1 # other than 0 as 0 indicates it is success
fi

VALIDATE(){
    if [ $1 -eq 0 ]
        then
            echo -e "$2.... is $G SUCCESS"
        else
            echo -e "$2.... is $R FAILED"
    fi
}

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "Install Mysqld"
    dnf install mysql-server -y
    VALIDATE $? Mysql Installation # $? = input1 ,Mysql installation = input2  
else
    echo -e "$Y Mysql already installed....."
fi

dnf list installed git

if [ $? -ne 0 ]
then
    echo "Install Git"
    dnf install git -y
    VALIDATE $? Git Installation # $? = input1 ,Git installation = input2   
else
    echo -e "$Y Git already installed....."
fi

