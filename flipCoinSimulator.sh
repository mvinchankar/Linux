#!/bin/bash -x 
read -p "How many times you want to flip the coin: " numberOfCounts 
HEADHEADHEAD=0;
TAILTAILTAIL=0;
HEADTAILTAIL=0;
TAILHEADHEAD=0;
HEADTAILHEAD=0;
TAILHEADTAIL=0;
TAILTAILHEAD=0;
HEADHEADTAIL=0;
declare -A Dictionary
function flipCoin()
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
echo TAILTAILTAILPercentage:$TAILTAILTAILPercentage HEADHEADHEADPercentage:$HEADHEADHEADPercentage 
echo HEADTAILTAILPercentage:$HEADTAILTAILPercentage TAILHEADHEADPercentage:$TAILHEADHEADPercentage
echo TAILTAILHEADPercentage:$TAILTAILHEADPercentage HEADHEADTAILPercentage:$HEADHEADTAILPercentage
echo TAILHEADTAILPercentage:$TAILHEADTAILPercentage HEADTAILHEADPerentage:$HEADTAILHEADPercentage 
}

flipCoin $numberOfCounts
Percentage $numberOfCounts
