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

if [ $? == 0 ]
then
    echo "Installation is sucess"
else
    echo "Installation is Failed"