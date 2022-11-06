#!/bin/bash

<<Documentation
Name         : Prabhat Kiran
Date         : 14th June 2022
Description  : Write a script for arithmetic calculator using command line arguments.
Sample Input : 1) ./arithmatic_calc.sh 25 + 41
		       2) ./arithmatic_calc.sh
	           3) ./arithmatic_calc.sh 3.4
Sample Output: 1) 25 + 41 = 66
               2) Error : Please pass the arguments through command line.
                  Usage:./arithmatic_calc.sh 2.3 + 6.7
               3) Error:Please pass 3 arguments.
                  Usage:./arithmatic_calc.sh 2.3 + 6.7
Documentation

if [ $# -eq 3 ]     #To check whether the user has entered 3 inputs in the command-line.
then
    ans=0
    case $2 in      #To check and match the operator entered by user.
    +) ans=`echo "$1+$3" | bc`      #Addition of the 2 numbers
        echo "$1 $2 $3 = ${ans}"
        ;;
    -) ans=`echo "$1-$3" | bc`      #Subtraction of the 2 numbers.
        echo "$1 $2 $3 = ${ans}"
        ;;
    x) ans=`echo "$1*$3" | bc`      #Multiplication of the 2 numbers.
        echo "$1 $2 $3 = ${ans}"
        ;;
    /) ans=`echo "scale=2; $1/$3" | bc`     #Division of the 2 numbers.
        echo "$1 $2 $3 = ${ans}"
        ;;
    *) echo -e "Error:Please pass 3 arguments.\nUsage:./arithmatic_calc.sh 2.3 + 6.7"   #If the user has entered 3 arguments incorrectly.
        ;;
    esac
elif [ $# -lt 3 -a $# -ne 0 -o $# -gt 3 ]       #If the user has entered less than or more than 3 arguments.
    then
        echo -e "Error:Please pass 3 arguments.\nUsage:./arithmatic_calc.sh 2.3 + 6.7"
else
    echo -e "Error : Please pass the arguments through command line.\nUsage:./arithmatic_calc.sh 2.3 + 6.7"     #If the user has not entered any arguments in the command-line.
fi
