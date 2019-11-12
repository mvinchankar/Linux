#!/bin/bash -x 
read -p "How many times you want to flip the coin: " numberOfCounts 
HEAD=0;
TAIL=0;
declare -A Dictionary
function flipCoin()
{

for(( count=0; count<$1; count++ ))
do  
  guess=$((RANDOM%2))
  if [ 1 -eq $guess ]
  then 
      TAIL=$(($TAIL+1))
      Dictionary[((TAIL))]=$TAIL
  else
      HEAD=$(($HEAD+1))
      Dictionary[((HEAD))]=$HEAD
  fi
done
}
function Percentage()
{
temp=$(($HEAD * 100))
HeadPercentage=$(($temp/$1))
temp=$(($TAIL * 100))
TailPercentage=$(($temp/$1))
echo TailPercentage:$TailPercentage HeadPercentage:$HeadPercentage 
}

flipCoin $numberOfCounts
Percentage $numberOfCounts
