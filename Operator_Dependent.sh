#!/bin/bash

<<Documentation
Name         : Prabhat Kiran
Date         : 14th June 2022
Description  : Write a script to perform arithmetic operation on digits of given number.
Sample Input : 1) ./operator_dependent.sh 1234+
    	       2) ./operator_dependent.sh 5487
	           3) ./operator_dependent.sh
Sample Output: 1) Sum of digits = 10
	           2) Error: Operator missing or invalid operator, please pass operator as last digit (+,-,x,/)
	           3) Error : Please pass the arguments through CL.
		          Usage : ./operator_dependent.sh 2345+
Documentation

if [ $# -gt 0 ]     #To check whether user has entered the arguments through command-line.
then
    str=$1      #To store the entered argument in a variable for further use in the program.
    len=$((${#str}-1))  #To calculate the length of the entered input and subtract it from 1 to use in indexing.
    opt=${str:$len:1}   #To extract the operator from the entered input.
    num=${str:0:$len}   #To extract the number from the entered input.
    case $opt in
        +) sum=0
           while [ $num -gt 0 ]     #The loop is used for extracting each digit from the number and performing addition.
           do
               rem=$((${num}%10))   #The digit is extracted using the remainder concept.
               sum=$((${sum}+${rem}))   #The sum of the digits is performed.
               num=$((${num}/10))   #The extracted digit is removed from the number by division.
           done
           echo "Sum of digits = ${sum}"
           ;;
       -) sub=${str:0:1}    #The first digit is stored as all the other digits will be subtracted from it using the loop.
           while [ $num -gt 10 ]     #The loop is to extract each digit from 2nd position to last and subtract it from the first digit.
           do
               rem=$((${num}%10))
               sub=$((${sub}-rem))  #The digits starting from 2nd position to last position are subtracted from the first.
               num=$((${num}/10))
           done
           echo "Subtraction of digits = ${sub}"
           ;;
       x) prod=1
           while [ $num -gt 0 ]		#The loop is used for extracting each digit from the number and performing multiplication.
           do
               rem=$((${num}%10))
               prod=$((${prod}*${rem}))     #The product of the digits is performed.
               num=$((${num}/10))
           done
           echo "Multiplication of digits = ${prod}"
           ;;
       /) div=${str:0:1}    #The first digit is stored as all the other digits will be divide it using the loop.
           while [ $num -gt 10 ]     #The loop is to extract each digit and divide the first digit with it.
           do
               rem=$((${num}%10))
               div=`echo "scale=2; ${div}/${rem}" | bc`     #To set a particular scale (here 2), bc command is used. The digits from 2nd to last position divide the first digit.
               num=$((${num}/10))
           done
           echo "Division of digits = ${div}"
           ;;
       *) echo "Error: Operator missing or invalid operator, please pass operator as last digit (+,-,x,/)"      #If the operator is missing or invalid form of input is given
           ;;
   esac
else
    echo -e "Error : Please pass the arguments through CL.\nUsage : ./operator_dependent.sh 2345+"      #If the user does not pass any argument using the command-line.
fi
