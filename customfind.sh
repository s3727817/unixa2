#!/bin/bash
# Author Vengada Kandasamy - S3727817 - S3727817@student.rmit.edu.au
# This script will run a find query based on user input, the user will be able to navigate through some
# choices to aid them in their query

# get the starting point
testing="true"
echo "please enter the starting point location"
read startingPoint



searchMenuOptions=(" " "1 - path" "2 - type" "3 - group" "4 - fstype")
printf '%s\n' "${searchMenuOptions[@]}"
echo "What Type are you searching for? 1, 2, 3, 4"
read searchingFor
searchingType="false"
while [[ searchingType == "false" ]] ; do
	if [[ searchingFor == "1" ]] ; then
		echo "Please Enter the pattern for -path"
		read pattern
		searchingType="-path ${pattern}"
	else if [[ searchingFor == "2" ]] ; then
		echo "Please enter the type you are after"
		read type
		searchingType="-type ${type}"
	else if [[ searchingFor == "3" ]] ; then
		echo "please enter the gname"
		read gname
		searchingType="-group ${gname}"
	else if [[ searchingFor == "4" ]] ; then
		echo "Please enter the fstype"
		read fstype
		searchingType="-fstype ${fstype}"
	fi
done

echo "please enter the max Depth, i.e. 0, 1, 2, 3...99"
read depth
echo "Follow Symbollic Links? y/n"
read follow
echo "please enter the action to be take, i.e. delete, print, print0 or enter a custom one"
read action

echo "Starting Point $startingPoint"
echo "Searching Type $searchingType"
echo "Depth $depth"
echo "Follow $follow"
echo "Action $action"

if [[ "$follow" == "y" ]] || [[ "$follow" == "Y" ]] || [[ "$follow" == "yes" ]] || [[ "$follow" == "YES" ]] ; then
	follow="-L" #enable following of symbollic links
else
	follow="" #set to empty, default wont follow symbollic links
fi

#if follow =y or Y then add the -L parameter to find

resultingCommand="find ${startingPoint} ${searchingType} ${depth} ${follow} ${action}"

if [[ testing == "true" ]] ; then
	echo ""
	echo "Testing is enabled, the command is below \n"
	echo "${resultingCOmmand}"
	echo "To disable this you will need to edit the script and turn testing to false or not true"
else
	eval resultingCommand #needs to be tested
fi

