#!/bin/bash
# Author Vengada Kandasamy - S3727817 - S3727817@student.rmit.edu.au
# This script will allow the user to read some basic information about their device, such information includes
# Number of CPU Cores on the system, Current Process's Priority, Processess running count, Open File Descriptors owned by the current user and the maximum system stack size

# Using the following parameters the user will see specific information for that parameter
# -c will display the number of cpu cores on the system
# -p will display the process' priority
# -r will display the number of processess running under the current user
# -o will display the open file descriptors to regular files owned by the current user
# -s will display the maximum system stack size
# -l will display all the above information

#detect parameters
while getopts "cprosl" flag ; do
	case $flag in
		"c") 	#count the amount of times "processor" turns up in /proc/cpuinfo with grep
			echo "CPU Count: $(grep -c processor /proc/cpuinfo)" ;;
	 	"p")    echo "Current Process' Priorit is"
			echo "$(ps -o pri -o ni -o cmd)" ;;
		"r") 	#count amount of lines from ps for this user
			echo "Process' Currently Running for $USER is $(ps -u $USER | wc -l)" ;;
		"o") 	#count amount of lines from lsof $USER
			echo "Current Open File Descriptors for $USER is $(lsof -u $USER | wc -l)" ;;
		"s") 	#display the max stack size
			echo "Stack Size is: $(ulimit -s) kb" ;;
		"l") 	./basicinfopost.sh -c -p -r -o -s ;;
		*) echo invalid choice #REPLY
	esac
done
