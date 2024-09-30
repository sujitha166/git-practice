#!/bin/bash/

Number=$1

if [ $Number -gt 20 ] #gt, lt, eq, -ne, -ge, -le
then
  echo "Given Number: $Number is greater than 20"
else
   echo "Given Number: $Number is less than 20"
fi