#!/bin/bash
# Author Vengada Kandasamy - S3727817 - S3727817@student.rmit.edu.au - 22/10/19
# This program is created for education purposes as part of Unix System Administration Assignment 2 for RMIT University
# This menu program will guide the user through the a selection of various scripts that will let them gather extra infomration of the system in a more user friendly manner
question="Select an Option"
mainMenuOptions=(" " "1 - Basic Info" "2 - Basic Info Post Processing" "3 - Custom Find" "4 - Basic Profiler" "q - Quit")
printf '%s\n' "${mainMenuOptions[@]}"
echo "Please enter your numerical choice, or q to quit: "
read mainMenuChoice

#display the main menu and wait for the user to make a choice
#if they dont make the correct choice, the menu will be displayed again
while [[ $mainMenuChoice != "q" ]] ; do
	#do the apropriate code for choice the user has made
	case $mainMenuChoice in
		"1")    #display a menu and allow the user to make a choice on what to do for the Base Info, based on the choice, display the appropriate information
			baseOptions=(" " "1 - Free Memory" "2 - Disk Space" "3 - Connection Info" "4 - System Load" "5 - All Info" "9 - Back")
			printf '%s\n' "${baseOptions[@]}"
			echo $question
			read baseOptionChoice
			while [[ $baseOptionChoice != "9" ]] ; do
				case $baseOptionChoice in
					"1") ./baseinfo -f ;;
					"2") ./baseinfo -d ;;
					"3") ./baseinfo -c ;;
					"4") ./baseinfo -s ;;
					"5") ./baseinfo -l ;;
					"9") echo "Going Back" break ;;
					*) echo "Invalid Choice $REPLY" ;;
				esac
				printf '%s\n' "${baseOptions[@]}"
				echo $question
				read baseOptionChoice
			done ;;
	        "2")
        	    	#display a menu to allow the user to make a choice on what to do with the Basic Information Post Processing
			basicOptions=(" " "1 - CPU Count" "2 - Process Priority" "3 - Number of Process Running" "4 - Number of Open File Descriptors" "5 - Stack Size" "6 - Display All" "9 - Back")
			printf '%s\n' "${basicOptions[@]}"
			echo $question
			read basicOptionChoice
			while [[ $basicOptionChoice != "9" ]] ; do
				case $basicOptionChoice in
					"1") ./basicinfopost.sh -c ;;
					"2") ./basicinfopost.sh -p ;;
					"3") ./basicinfopost.sh -r ;;
					"4") ./basicinfopost.sh -o ;;
					"5") ./basicinfopost.sh -s ;;
					"6") ./basicinfopost.sh -l ;;
					"9") echo "Going Back" break ;;
					*) echo "Invalid Choice $REPLY" ;;
				esac
				printf '%s\n' "${basicOptions[@]}"
				echo $question
				read basicOptionChoice
			done ;;
        	"3")
			echo "Begin Custom Find Script\n"
			./customfind.sh
	            ;;
		"4")
			echo "Begin Profiling Script\n"
			./profiler.sh
		    ;;
        	"q")
		    echo "Quitting Program, See You Later"
        	        break
	            ;;
        	*) echo "invalid option $REPLY"
	   		;;
	esac
	printf '%s\n' "${mainMenuOptions[@]}"
	echo "Please enter your numerical choice, or q to quit: "
	read mainMenuChoice
done
