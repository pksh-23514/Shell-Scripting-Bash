#!/bin/bash

<<Documentation
Name         : Prabhat Kiran
Date         : 18th June 2022
Description  : Write a script to sort the given numbers in ascending or descending order.
Sample Input : 1) ./sorting.sh -a 5 4 6 2 3 8 9 7 1
               2) ./sorting.sh -d 5 4 6 2 3 8 9 7 1
               3) ./sorting.sh 5 4 6 2 3 8 9 7 1
               4) ./sorting.sh
               5) ./sorting.sh -d 5 4 6 2 -3 8 -9 7 1
Sample Output: 1) Ascending order of array is 1 2 3 4 5 6 7 8 9
               2) Descending order of array is 9 8 6 5 4 3 2 1
               3) Error : Please pass the choice.
                  Usage : ./sorting -a/-d 4 23 5 6 3
               4) Error : Please pass the argument through command line.
                  Usage : ./sorting -a/-d 4 23 5 6 3
               5) Descending order of array is 8 7 6 5 4 2 1 -3 -9
Documentation

if [ $# -gt 1 ]     #To check whether user has entered the arguments through command line. There should be minimum 2 inputs in CLA i.e. order and 1 number.
then
    n=$#    #To store the number of CLA in the variable.
    order=${1:1:1}      #To store the order in which the numbers are to be sorted.
    ar=(${@:2:$(($n-1))})       #To store the numbers passed as arguments through CL in the array. This array will not contain only the numbers and not the order of sorting.

    case $order in
        a) for i in `seq 0 $((${n}-2))`     #The loop will run from 0 to '(n-2)' times as the order of sorting has been removed from the CLA.
           do
               for j in `seq 0 $((${n}-${i}-3))`    #The loop will run one time less after each iteration of outer loop as the largest of the lot in the array reaches its correct order position.
                do
                    if [ ${ar[j]} -gt ${ar[j+1]} ]  #The comparision of adjacent elements is done. If the condition is true, swapping takes place.
                    then
                        temp=${ar[j]}
                        ar[j]=${ar[j+1]}
                        ar[j+1]=${temp}
                    fi
                done
            done
            echo "Ascending order of array is ${ar[@]}"
            ;;
        d) for i in `seq 0 $((${n}-2))`     #The loop will run from 0 to '(n-2)' times as the order of sorting has been removed from the CLA.
           do
               for j in `seq 0 $((${n}-${i}-3))`    #The loop will run one time less after each iteration of outer loop as the smallest of the lot in the array reaches its correct order position.
               do
                   if [ ${ar[j]} -lt ${ar[j+1]} ]   #The comparision of adjacent elements is done. If the condition is true, swapping takes place.
                   then
                       temp=${ar[j]}
                       ar[j]=${ar[j+1]}
                       ar[j+1]=${temp}
                   fi
               done
           done
           echo "Descending order of array is ${ar[@]}"
           ;;
        *) echo -e "Error : Please pass the choice.\nUsage : ./sorting -a/-d 4 23 5 6 3"    #If the CLA does not contain the order in which the sorting is to be done, error to be printed.
            ;;
    esac
else
    echo -e "Error : Please pass the argument through command line.\nUsage : ./sorting -a/-d 4 23 5 6 3"    #If the user enters 0 or 1 number of argument, error to be printed.
fi
