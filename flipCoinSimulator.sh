#!/bin/bash -x 
read -p "How many times you want to flip the coin: " a
for(( count=0; count<$a; count++ ))
do  
  guess=$((RANDOM%2))
  if [ 1 -eq $guess ]
  then 
      echo TAIL
  else
      echo HEAD
  fi
done
