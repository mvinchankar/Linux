#!/bin/bash -x 
read -p "How many times you want to flip the coin: " numberOfCounts 
HEADHEAD=0;
TAILTAIL=0;
HEADTAIL=0;
TAILHEAD=0;
declare -A Dictionary
function flipCoin()
{

for(( count=0; count<$1; count++ ))
do  
  guess=$((RANDOM%2))
  guess1=$((RANDOM%2))
  if [ $guess -eq $guess1 ]
  then 
      if [ 1 -eq $guess ]
      then  
          TAILTAIL=$(($TAILTAIL+1))
     	  Dictionary[((TAILTAIL))]=$TAILTAIL
      else
          HEADHEAD=$(($HEADHEAD+1))
          Dictionary[((HEADHEAD))]=$HEADHEAD
      fi
  else
      if [ 1 -eq $guess ]
      then 
          TAILHEAD=$(($TAILHEAD+1))
          Dictionary[((TAILHEAD))]=$TAILHEAD
      else
          HEADTAIL=$(($HEADTAIL+1))
          Dictionary[((HEADTAIL))]=$HEADTAIL  
      fi  
      
  fi
done
}
function Percentage()
{
temp=$(($HEADHEAD * 100))
HEADHEADPercentage=$(($temp/$1))
temp=$(($TAILTAIL * 100))
TAILTAILPercentage=$(($temp/$1))
temp=$(($TAILHEAD * 100))
TAILHEADPercentage=$(($temp/$1))
temp=$(($HEADTAIL * 100))
HEADTAILPercentage=$(($temp/$1))
echo TAILTAILPercentage:$TAILTAILPercentage HEADHEADPercentage:$HEADHEADPercentage HEADTAILPercentage:$HEADTAILPercentage TAILHEADPercentage:$TAILHEADPercentage 
}

flipCoin $numberOfCounts
Percentage $numberOfCounts
