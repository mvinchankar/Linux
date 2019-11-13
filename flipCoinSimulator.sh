
#!/bin/bash -x

echo "welcome"
read -p "how much time you flip coin " number
read -p "how many coins " coin

declare -A result

headCount=0
tailCount=0
function coin() {
  for (( i=1; i<=$number; i++ ))
  do
    s=""
    for(( j=0; j<$coin; j++ ))
    do
      resultk=$(( RANDOM % 2 ))
      if [ $resultk == 1 ]
      then
          s=$s"H"
          headCount=$(( $headCount + 1 ))
      else
          s=$s"T"
          ((tailCount++))
      fi  

    done
    echo final key : $s
    result["$s"]=$(( ${result["$s"]} ))   

  done

}
coin 
echo $(printf "%s\n" ${result[@]} ${!result[@]} | sort -nr )
echo $(printf "%s\n" ${result[@]} ${!result[@]} | sort -nr | head -1 )
echo $(printf " %s " ${result[@]} ${!result[@]} | sort -nr | awk '{print $14}')
