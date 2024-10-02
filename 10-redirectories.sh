#!/bin/bash

Logs_Folder="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMO=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $Logs_Folder

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[33m"


CHECK ROOT(){
if [ $USERID -ne 0 ]
then
   echo -e "$R please run this script with root privilages $N" $>>$LOG_FILE
   exit 1
fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
     ech0 -e "$2 is...$R FAILED $N" &>>$LOG_FILE
     exit 1
     else 
     echo -e "$2 is... $G SUCCESS $N" &>>$LOG_FILE


}
CHECK_ROOT

for package in $@
do
  dnf list installed $package &>>$LOG_FILE
  if [ $? -ne 0 ]
  then 
    echo "$package is not installed, going to install it.." &>>$LOG_FILE
    dnf install $package -y &>>$LOG_FILE
    VALIDATE $? " Installing  $package"
    else
       echo "$package is already installed..nothing to do" &>>$LOG_FILE
    fi
    done   