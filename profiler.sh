#!/bin/bash
# Author Vengada Kandasamy - S3727817 - S3727817@student.rmit.edu.au
# This program will ask the user to enter the name of a program that they would like to monitor either the memory
# or the cpu utilization of that process. once they have decided what they want monitored the pi will then begin
# to flicker the RED LED on the device in proportion to the utilization of the process

foundprog="false"

echo "what program would you like to profile?"
read prgname


top -n 1 -b | awk -v var='$prgname' '/var*/ {print "PID " $1"\t\tUser " $2"\tCPU   " $9"\tMEM  " $10"\t\tCMD " $12}'
