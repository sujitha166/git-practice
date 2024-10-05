#!/bin/bash

USERID=$(id -u)

#echo "user id is:$USERID"

if [ $USERID -ne 0 ] #$USERID is -ne 0 
then
   echo "run the script with root privelages"
   exit 1

fi

dnf install mysql -y