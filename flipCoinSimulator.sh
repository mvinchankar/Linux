#!/bin/bash -x 
read -p "How many times you want to flip the coin: " numberOfCounts
for(( count=0; count<$numberOfCounts; count++ ))
do  
  guess=$((RANDOM%2))
  if [ 1 -eq $guess ]
  then 
      TAIL=$(($TAIL+1))
  else
      HEAD=$(($HEAD+1))
  fi
done
declare -A Dictionary
Dictionary[((TAIL))]=$TAIL
Dictionary[((HEAD))]=$HEAD
echo ${Dictionary[@]}
temp=$(($HEAD * 100))
HeadPercentage=$(($temp/$numberOfCounts))
temp=$(($TAIL * 100))
TailPercentage=$(($temp/$numberOfCounts))
echo TailPercentage:$TailPercentage HeadPercentage:$HeadPercentage 
