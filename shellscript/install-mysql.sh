#!/bin/bash

id=$(id -u)

if [ $id -eq 0 ]
then
    echo "install Mysqld"
    dnf install mysql-server -y
else
    echo "Error:: Must be root user to install mysql"
    exit1
fi

#check if installation is success or not

if [ $? == 0 ]
then
    echo "Installation is sucess"
else
    echo "Installation is Failed"