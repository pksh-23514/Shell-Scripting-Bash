#!/bin/bash

<<Documentation
Name         : Prabhat Kiran
Date         : 16th June 2022
Description  : Write a script to print contents of file from given line number to next given number of lines.
Sample Input : Assume, Contents of myfile.txt is
               line number 1
               line number 2
               line number 3
               line number 4
               1) ./print_lines.sh 2 3 myfile.txt
               2) ./print_lines.sh myfile.txt
               3) ./print_lines.sh 5 10 myfile.txt
Sample Output: 1) line number 2
                  line number 3
                  line number 4
               2) Error: arguments missing!
                  Usage: ./file_filter.sh start_line upto_line filename
                  For eg. ./file_filter.sh 5 5 <file>
               3) Error: data.txt is having only 10 lines. file should have atleast 14 lines
Documentation

if [ $# -eq 3 ]     #To check whether the user has entered the arguments through command-line.
then
    lines=`cat $3 | wc -l`  #To count the total number of lines in the input file.
    count=$(($1+$2-1))      #To calculate the number of lines to be extracted from the top of the file.
    if [ ${count} -gt ${lines} ]    #If the lines to be printed exceed the bottom line of the file, an error should be printed.
    then
        echo "Error: data.txt is having only ${lines} lines. file should have atleast ${count} lines"
    else
        cat $3 | head -${count} | tail -$2      #To print the lines from a specified number of line to next given number of lines.
    fi
else
    echo -e "Error: arguments missing!\nUsage: ./file_filter.sh start_line upto_line filename\nFor eg. ./file_filter.sh 5 5 <file>"
fi
