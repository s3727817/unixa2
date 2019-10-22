#!/bin/bash
# Author Vengada Kandasamy - S3727817 - S3727817@student.rmit.edu.au - 22/10/19
# This program is created for education purposes as part of Unix System Administration Assignment 2 for RMIT Universitye
# This menu program will guide the user through the a selection of various scripts that will let them gather extra infomration of the system in a more user friendly manner

read choice='Please enter your numerical choice: or q to quit '
options=("1 - Basic Info" "2 - Req 2" "3 - Req 3" "4 - Req 4 " "q - Quit")
select opt in "${options[@]}"

do
    case $REPLY in
        "1")
            echo "you chose choice $opt - Not Yet Implemented"
		break

            ;;
        "2")
            echo "you chose $opt - Not Yet Implemented"
		break;
            ;;
        "3")
            echo "you chose $opt - Not Yet Implemented"
		break
            ;;
	"4")
	    echo "you chose $opt - Not Yet Implemented"
		 break
	    ;;
        "q")
	    echo "Quitting Program, See You Later"
                break
            ;;
        *) echo "invalid option $REPLY"
	   	;;
    esac
done
