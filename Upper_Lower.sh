#!/bin/bash

<<Documentation
Name         : Prabhat Kiran
Date         : 16th June 2022
Description  : Write a script to convert string lower to upper and upper to lower.
Sample Input : 1) ./upper_lower.sh <file_name>.txt
                  1 - Lower to Upper
                  2 - Upper to Lower
                  Please select option : 1
               2) ./upper_lower.sh file.txt
                  1 – Lower to Upper
                  2 – Upper to Lower
                  Please select option : 2
               3) ./upper_lower.sh file1.txt
               4) ./upper_lower.sh
Sample Output: 1) WHAT IS OS?
                  WHAT ARE THE DIFFERENT OS?
               2) what is os?
                  what are the different os?
               3) Error: No contents inside the file.
               4) Error : Please pass the file name through command line.
Documentation

if [ $# -eq 1 ]     #To check whether the user has entered the arguments through command-line.
then
    if [ -f $1 ]    #To check if the file name entered is valid or not.
    then
        if [ -s $1 ]    #To check if the file name entered has some contents inside it or not.
        then
            echo -e "1 - Lower to upper\n2 - Upper to lower"    #Display the choices available to the user.
            read -p "Please select option: " ch         #To ask the user for the choice.

            case $ch in
                1) cat $1 | tr "a-z" "A-Z"      #To translate the characters from lowercase to uppercase through piping. 'Using redirection: cat $1 | tr "a-z" "A-Z" >/>> $1'
                    ;;
                2) cat $1 | tr "A-Z" "a-z"      #To translate the characters from uppercase to lowercase through piping.
                    ;;
                *) echo "Option entered by user is incorrect. Please enter option as 1 or 2."   #If the user enters a choice other than 1/2, print an error message.
                    ;;
            esac
        else            #If the file is empty, print an error message.
            echo "Error: No contents inside the file."
        fi
    else        #If the argument passed through CL is not a file, print an error message.
        echo "Error: The CLA passed is not a file name. Please provide a file name as input in CLA."
    fi
else        #If there are no arguments entered through the CL, print an error message.
    echo "Error : Please pass the file name through command line."
fi
