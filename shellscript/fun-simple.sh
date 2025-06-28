#!/bin/bash

#!/bin/bash

id=$(id -u)

if [ $id -ne 0 ]
then 
   echo "Error: Must be root user to install the packages"
   exit 1 # other than 0 as 0 indicates it is success
fi

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
    echo "install Mysqld"
    dnf install mysql-server -y
    VALIDATE $? Mysql Installation # $? = input1 ,Mysql installation = input2  
else
    echo "Mysql already installed....."
fi

dnf list installed git

if [ $? -ne 0 ]
then
    echo "Install Git"
    dnf install git -y
    VALIDATE $? Git Installation # $? = input1 ,Git installation = input2   
else
    echo "Git already installed....."
fi

