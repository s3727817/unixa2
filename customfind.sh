#!/bin/bash
# Author Vengada Kandasamy - S3727817 - S3727817@student.rmit.edu.au
# This script will run a find query based on user input, the user will be able to navigate through some
# choices to aid them in their query

# set default values for some variables
testing="true"
depth="0"

#get the starting point
echo "please enter the starting point location"
read startingPoint

#this next section we will cycle through choices for type, and ask for apropriate value to go with it

#the list of options for them to choose from
searchMenuOptions=(" " "1 - path" "2 - type" "3 - group" "4 - fstype" "Hit Enter To Leave Blank")
printf '%s\n' "${searchMenuOptions[@]}"
echo "What Type are you searching for? 1, 2, 3, 4"
read searchingFor
searchingType="false"
#get the value for their choice
while [[ $searchingType == "false" ]] ; do
	if [[ $searchingFor == "1" ]] ; then
		echo "Please Enter the pattern for -path"
		read pattern
		searchingType="-path ${pattern}"
	elif [[ $searchingFor == "2" ]] ; then
		echo "Please enter the type you are after"
		read type
		searchingType="-type ${type}"
	elif [[ $searchingFor == "3" ]] ; then
		echo "please enter the gname"
		read gname
		searchingType="-group ${gname}"
	elif [[ $searchingFor == "4" ]] ; then
		echo "Please enter the fstype"
		read fstype
		searchingType="-fstype ${fstype}"
	else
		printf '%s\n' "${searchMenuOptions[@]}"
		read searchingFor
	fi
done

#get the depth, if any
echo "please enter the max Depth, i.e. 0, 1, 2, 3...99"
read depth

#do they want to follow symbollic links? lets find out
echo "Follow Symbollic Links? y/n"
read follow

#what action are they taking? lets find out
echo "please enter the action to be take, i.e. delete, print, print0 or enter a custom one"
read action

#testing output
#echo "Starting Point $startingPoint"
#echo "Searching Type $searchingType"
#echo "Depth $depth"
#echo "Follow $follow"
#echo "Action $action"

#if the depth is not 0, they they must have entered some kind of value, so set that to the depth
#also check they didnt just hit enter and leave an empty string
if [[ "$depth" != "0" ]] ; then
	if [[ $depth" != "" ]] then
		oldDepth="${depth}"
		depth="-depth ${oldDepth}"
	fi
fi

#alter follow based on the choice to follow symbolic links or not
if [[ "$follow" == "y" ]] || [[ "$follow" == "Y" ]] || [[ "$follow" == "yes" ]] || [[ "$follow" == "YES" ]] ; then
	follow="-L" #enable following of symbollic links
else
	follow="" #set to empty, default wont follow symbollic links
fi

resultingCommand="find ${startingPoint} ${searchingType} ${depth} ${follow} ${action}"

#inform the user of the complete command so they can see if its to their liking
echo "Your command is"
echo "${resultingCommand}"
echo "Do you want to run it? y/n"
read finalise

#run the command if they want to
if [[ "$finalise" == "y" ]] || [[ "$finalise" == "Y" ]] || [[ "$finalise" == "yes" ]] || [[ "$finalise" == "YES" ]] ; then
	eval $resultingCommand
fi
