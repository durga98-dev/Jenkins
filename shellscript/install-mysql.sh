#!/bin/bash

id=$(id -u)

dnf list installed mysql

if [ $? -ne 0 ]
then
    if [ $id -eq 0 ]
    then
        echo "install Mysqld"
        dnf install mysql-server -y
        if [ $? -eq 0 ]
        then
            echo "Mysql Installation.... is success"
        else
            echo "Mysql Installation.... is Failed"
        fi
    else
        echo "Error:: Must be root user to install mysql"
        exit 1 # other than 0 as 0 indicates it is success
    fi
else
    echo "Mysql already installed....."
fi

#check if installation is success or not

# if [ $? -eq 0 ]
# then
#     echo "Mysql Installation.... is success"
# else
#     echo "Mysql Installation.... is Failed"
# fi

if [ $id -eq 0 ]
then
    echo "install Git"
    dnf install git -y
else
    echo "Error:: Must be root user to install git"
    exit 1 # other than 0 as 0 indicates it is success
fi

if [ $? -eq 0 ]
then
    echo "Git Installation.... is success"
else
    echo "Git Installation.... is Failed"
fi

