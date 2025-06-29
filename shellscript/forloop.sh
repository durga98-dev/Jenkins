#!/bin/bash

# for i in {1..5}
# do
#     echo $i
# done

R="\e[31m"
G="\e[32m"
Y="\e[33m"

LOG_FOLDER=$("mkdir -p /var/log/scrip-logs")
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
            echo -e "$2.... is $G SUCCESS $N"
        else
            echo -e "$2.... is $R FAILED $N"
    fi
}

for package in $@
do
    dnf list installed $package &>>LOG_FILE_NAME
    if [ $? -ne 0 ]
    then
        dnf install $package -y
        VALIDATE $? "Installing $package"
    else
        echo "$package $Y already installed....$N"
    fi
done