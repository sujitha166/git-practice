#!/bin/bash

USERID=$( id -u)

#echo "user id is:$USERID"

if( $USERID is -ne 0 )
then
echo "run the script with root privilages"

fi

dnf install mysql -y