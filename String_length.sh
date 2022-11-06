#!/bin/bash

<<Documentation
Name         : Prabhat Kiran
Date         : 13th June 2022
Description  : Write a script to print the length of each and every string using arrays.
Sample Input : 1) ./string_length.sh hello
               2) ./string_length.sh
Sample Output: 1) Length of string (hello) - 5
               2) Error : Please pass the arguments through command-line.
Documentation

if [ $# -gt 0 ]     #To check whether the user has entered the arguments through command-line.
then
    arr=($@)    #To store all the command-line arguments in the array.
    for i in "${arr[@]}"   #To traverse the strings one by one stored in the array.
    do
        echo "Length of string (${i}) - ${#i}"
    done
else
    echo "Error : Please pass the arguments through command-line."
fi
