#!/bin/bash

id=$(id -u)

VALIDATE(){
    if [ $1 -eq 0 ]
        then
            echo "$2.... is success"
        else
            echo "$2.... is Failed"
    fi
}

dnf list installed mysql

if [ $? -ne 0 ]
then
    if [ $id -eq 0 ]
    then
        echo "install Mysqld"
        dnf install mysql-server -y
        VALIDATE $? Mysql Installation # $? = input1 ,Mysql installation = input2
    else
        echo "Error:: Must be root user to install mysql"
        exit 1 # other than 0 as 0 indicates it is success
    fi
else
    echo "Mysql already installed....."
fi

dnf list installed git

if [ $? -ne 0 ]
then
    if [ $id -eq 0 ]
    then
        echo "Install Git"
        dnf install git -y
        VALIDATE $? Git Installation # $? = input1 ,Git installation = input2
    else
        echo "Error:: Must be root user to install Git"
        exit 1 # other than 0 as 0 indicates it is success
    fi
else
    echo "Git already installed....."
fi

