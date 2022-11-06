#!/bin/bash

<<Documentation
Name         : Prabhat Kiran
Date         : 10th June 2022
Description  : Read 'n' and generate a pattern given below. 
Sample Input : 3
Sample Output: 1
               2 3
               4 5 6
Documentation

read -p "Enter the number of Lines the Pattern needs to be printed: " n     #To prompt the user to input the number of lines the pattern needs to be printed.

k=1     #The controlling variable for printing the pattern.
for i in `seq ${n}`     #To run the loop for Row. The number of times the loop runs is as per the User Input.
do
    for j in `seq ${i}`     #To run the loop for Column. The number of times the loop runs is limited to the value of 'i'.
    do
        echo -n "${k} "     #To print the pattern.
        k=$((${k} + 1))     #To increase the pattern controlling variable.
    done
    echo        #To print the next set of output in the next line.
done
echo $i
echo $j
echo $k
