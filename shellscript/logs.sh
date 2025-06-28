#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"

LOG_FOLDER="/var/log/scrip-logs"
LOG_FILE=$(echo $0|cut -d "." -f1 )
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOG_FOLDER/$LOG_FILE-$TIMESTAMP.log"

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

dnf list installed mysql &>>$LOG_FILE_NAME

if [ $? -ne 0 ]
then
    echo "Install Mysqld"
    dnf install mysql-server -y &>>$LOG_FILE_NAME
    VALIDATE $? Mysql Installation # $? = input1 ,Mysql installation = input2  
else
    echo -e "$Y Mysql already installed....."
fi

dnf list installed git &>>$LOG_FILE_NAME

if [ $? -ne 0 ]
then
    echo "Install Git"
    dnf install git -y &>>$LOG_FILE_NAME
    VALIDATE $? Git Installation # $? = input1 ,Git installation = input2   
else
    echo -e "$Y Git already installed....."
fi

