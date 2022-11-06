#!/bin/bash

<<Documentation
Name         : Prabhat Kiran
Date         : 10th June 2022
Description  : Write a script to print the Chess Board.
Sample Input : NIL
Sample Output: 8X8 Chess Board
Documentation

for i in `seq 8`    #To run the loop for Row. The loop will run for 8 times as the chess board dimension is 8x8.
do
    for j in `seq 8`    #To run the loop for Column. The loop will run for 8 times as the chess board dimension is 8x8.
    do
        if [ $(((${i}+${j})%2)) -eq 1 ]     #The condition to alternately print black and white squares.
        then
            echo -e -n "\e[40m" " "     #To print black color square.
        else
            echo -e -n "\e[47m" " "     #To print white color square.
        fi
    done
    echo -e -n "\e[0m" " "      #To change the color to normal.
    echo    #To print the next set of output in the next line.
done
