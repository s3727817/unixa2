#!/bin/bash
# Author Vengada Kandasamy - S3727817 - S3727817@student.rmit.edu.au - 22/10/19
# This program is created for education purposes as part of Unix System Administration Assignment 2 for RMIT Universitye
# This menu program will guide the user through the a selection of various scripts that will let them gather extra infomration of the system in a more user friendly manner


mainMenuOptions=("1 - Basic Info" "2 - Req 2" "3 - Req 3" "4 - Req 4 " "q - Quit")
printf '%s\n' "${mainMenuOptions[@]}"
echo "Please enter your numerical choice, or q to quit: "
read mainMenuChoice
while [ $mainMenuChoice != "q" ]
do
	case $mainMenuChoice in
        	"1")
	            echo "you chose choice $opt - Work In Progress"
			baseOptions=("1 - Free Memory" "2 - Disk Space" "3 - Connection Info" "4 - System Load" "9 - Back")
			printf '%s\n' "${baseOptions[@]}"
			echo "Select an Option"
			read baseOptionChoice
			while [ $baseOptionChoice != "9" ]
			do
				case $baseOptionChoice in
					"1") basinfo.sh -freemem ;;
					"2") baseinfo.sh -diskspace ;;
					"3") baseinfo.sh -conninfo ;;
					"4") baseinfo.sh -sysload ;;
					"9") echo "Going Back" break ;;
					*) echo "Invalid Choice $REPLY" ;;
				esac
				printf '%s\n' "${baseOptions[@]}"
				echo "Select an Option"
				read baseOptionChoice
			done ;;
	        "2")
        	    echo "you chose $opt - Not Yet Implemented"
	            ;;
        	"3")
	            echo "you chose $opt - Not Yet Implemented"
	            ;;
		"4")
		    echo "you chose $opt - Not Yet Implemented"
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
