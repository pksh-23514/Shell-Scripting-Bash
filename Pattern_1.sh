#!/bin/bash

<<Documentation
Name         : Prabhat Kiran
Date         : 10th June 2022
Description  : Read 'n' and generate a pattern given below.
Sample Input : 3
Sample Output: 1
               1 2
               1 2 3
Documentation

read -p "Enter the number of Lines the Pattern needs to be printed: " n     #To prompt the User to input the number of lines the pattern needs to be printed.

for i in `seq ${n}`     #To run the loop for Row. The number of times the loop runs is as per User Input.
do
    for j in `seq ${i}`     #To run the loop for Column. The number of times the loop runs is limited to the value of 'i'.
    do
        echo -n "${j} "     #To print the number pattern.
    done
    echo    #To print the next set of output in the next line.
done
