#!/bin/bash -x
x=$((RANDOM%2))
if [ $x -eq 0 ]
then
	echo "head wins"
else
	echo "tail wins"
fi

#!/bin/bash 
header=0;
tailer=0;
a=0;
b=0;
counter=0
trolly=0

declare -A e
for (( i=1; i<10; i++ ))
do
	x=$((RANDOM%2))
	if [ $x -eq 0 ]
	then
		echo "head wins"
		let "header++"
		declare -A d

		d[$counter]="head"
		((counter++))

	else


		echo "tail wins"
		let "tailer++"
		e[$trolly]="tail"
		((trolly++))
	fi
done
echo  "header: $header"
echo  "tailer: $tailer"
echo "${d[@]}"
echo "${e[@]}"

total=$(( $header + $tailer ))
echo "(($header / $total))"
echo "tailor wins percentage : (($tailer / $total))"


#!/bin/bash -x
echo "welcome to flip combination problem"
declare -A coin
read -p "how many times you want to flip the coin" times
echo the single coin toss

for((count=0;count<$times;count++))
do
flip=$((RANDOM%2))
if [[ $flip -eq 1 ]]
then
    if [[ ${coin["H"]} -eq null ]]
     then
       coin["H"]=1
      else
        coin["H"]=$((${coin["H"]}+1))
       fi
else
 

    if [[ ${coin["T"]} -eq null ]]
     then
       coin["T"]=1
      else
        coin["T"]=$((${coin["T"]}+1))
       fi
fi
done
	echo the win percentage of each combination of singlet coin toss :
for i in "${!coin[@]}"
do
	percentwin=$( echo ${coin[$i]} $times | awk '{print $1/$2 * 100}' )
	echo "$i => $percentwin %"
done
 
max1="H"
  for i in ${!coin[@]}
do
if [[ ${coin[$i]} -gt ${coin[$max]} ]]
then
	max=$i
fi
done
echo the winner of singlet coin toss is $max1


#!/bin/bash
declare -A coin 
echo "the double coin toss"
read -p "how many times you want to iterate" iteration
for ((count=0;count<$iteration;count++))
do
flip1=$((RANDOM%2))
flip2=$((RANDOM%2))

if [[ $flip1 -eq 1 ]]
then
   if [[ $flip2 -eq 1 ]]
     then
      if [[ ${coin["HH"]} -eq  null ]]
       then
        coin["HH"]=1
      else
       coin["HH"]=$((${coin["HH"]}+1))
       fi
      else
       if [[ ${coin["HT"]} -eq null ]]
then
coin["HT"]=1
else
  coin["HT"]=$((${coin["HT"]}+1))
fi
fi
else
       if [[ $flip2 -eq 1 ]]
      then
       if [[ ${coin["TH"]} -eq  null ]]
       then
        coin["TH"]=1
      else
       coin["TH"]=$((${coin["TH"]}+1))
       fi
else
 if [[ ${coin["TT"]} -eq  null ]]
       then
        coin["TT"]=1
      else
       coin["TT"]=$((${coin["TT"]}+1))
       fi
fi
fi 
done

	echo the win percentage of each combination of singlet coin toss :
for i in "${!coin[@]}"
do
	percentwin=$( echo ${coin[$i]} $iteration | awk '{print $1/$2 * 100}' )
	echo "$i => $percentwin %"
done
 
max1="HH"
  for i in ${!coin[@]}
do
if [[ ${coin[$i]} -gt ${coin[$max1]} ]]
then
	max1=$i
fi
done
echo the winner of singlet coin toss is $max1
