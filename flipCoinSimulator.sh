#!/bin/bash -x 
read -p "How many times you want to flip the coin: " numberOfCounts 
HEAD=0;
TAIL=0;
HEADHEAD=0;
HEADTAIL=0;
TAILHEAD=0;
TAILTAIL=0;
HEADHEADHEAD=0;
TAILTAILTAIL=0;
HEADTAILTAIL=0;
TAILHEADHEAD=0;
HEADTAILHEAD=0;
TAILHEADTAIL=0;
TAILTAILHEAD=0;
HEADHEADTAIL=0;
declare -A Dictionary
function flipCoinSingle()
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
function flipCoinDoublets()
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
function flipCoinTriplets()
{

for(( count=0; count<$1; count++ ))
do  
  guess=$((RANDOM%2))
  guess1=$((RANDOM%2))
  guess2=$((RANDOM%2))
  if [[ $guess -eq $guess1 ]] && [[ $guess1 -eq $guess2 ]] && [[ $guess -eq $guess2 ]]
  then 
      if [ 1 -eq $guess ]
      then  
          TAILTAILTAIL=$(($TAILTAILTAIL+1))
     	  Dictionary[((TAILTAILTAIL))]=$TAILTAILTAIL
      else
          HEADHEADHEAD=$(($HEADHEADHEAD+1))
          Dictionary[((HEADHEADHEAD))]=$HEADHEADHEAD
      fi
  else
      if [ $guess -eq $guess1 ]
      then 
          if [ 1 -eq $guess ]
          then
              TAILTAILHEAD=$(($TAILTAILHEAD+1))
              Dictionary[((TAILHEAD))]=$TAILTAILHEAD
          else 
              HEADHEADTAIL=$(($HEADHEADTAIL+1))
              Dictionary[((HEADHEADTAIL))]=$HEADHEADTAIL
          fi  
      else
          if [ 1 -eq $guess ]
          then
              if [ $guess1 -eq $guess2 ]
              then 
                  TAILHEADHEAD=$(($TAILTAIL+1))
                  Dictionary[((TAILHEADHEAD))]=$TAILHEADHEAD
              else
                  TAILHEADTAIL=$(($TAILHEADTAIL+1))
                  Dictionary[((TAILHEADTAIL))]=$TAILHEADTAIL
              fi
          else
              if [ $guess1 -eq $guess2 ]
              then 
                  HEADTAILTAIL=$(($HEADTAILTAIL+1))
                  Dictionary[((HEADTAILTAIL))]=$HEADTAILTAIL
              else
                  HEADTAILHEAD=$(($HEADTAILTAIL+1))
                  Dictionary[((HEADTAILHEAD))]=$HEADTAILHEAD 
              fi
         fi  
      fi
  fi 
done
}
function Percentage()
{
temp=$(($HEAD * 100))
HeadPercentage=$(($temp/$1))
temp=$(($TAIL * 100))
TailPercentage=$(($temp/$1))
temp=$(($HEADHEAD * 100))
HEADHEADPercentage=$(($temp/$1))
temp=$(($TAILTAIL * 100))
TAILTAILPercentage=$(($temp/$1))
temp=$(($TAILHEAD * 100))
TAILHEADPercentage=$(($temp/$1))
temp=$(($HEADTAIL * 100))
HEADTAILPercentage=$(($temp/$1))
temp=$(($TAILHEADHEAD * 100))
TAILHEADHEADPercentage=$(($temp/$1))
temp=$(($TAILTAILHEAD * 100))
TAILTAILHEADPercentage=$(($temp/$1))
temp=$(($TAILTAILTAIL * 100))
TAILTAILTAILPercentage=$(($temp/$1))
temp=$(($TAILHEADTAIL * 100))
TAILHEADTAILPercentage=$(($temp/$1))
temp=$(($HEADHEADHEAD * 100))
HEADHEADHEADPercentage=$(($temp/$1))
temp=$(($HEADTAILTAIL * 100))
HEADTAILTAILPercentage=$(($temp/$1))
temp=$(($HEADHEADTAIL * 100))
HEADHEADTAILPercentage=$(($temp/$1))
temp=$(($HEADTAILHEAD * 100))
HEADTAILHEADPercentage=$(($temp/$1))
}

flipCoinSingle $numberOfCounts
flipCoinDoublets $numberOfCounts
flipCoinTriplets $numberOfCounts
Percentage $numberOfCounts
echo $(printf " %s\n " ${Dictionary[@]} | sort -nr | head -1 )

