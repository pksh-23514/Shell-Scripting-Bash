#!/bin/bash

<<Documentation
Name         : Prabhat Kiran
Date         : 16th June 2022
Description  : Count the number of users with user IDs between given range.
Sample Input : 1) /user_ids.sh
               2) ./user_ids.sh 0 100
               3) ./user_ids.sh 100
               4) ./user_ids.sh 200 100
Sample Output: 1) Total count of user ID between 500 to 10000 is: 2
               2) Total count of user ID between 0 to 100 is : 3
               3) Error : Please pass 2 arguments through CL.
                  Usage : ./user_ids.sh 100 200
               4) Error : Invalid range. Please enter the valid range through CL.
Documentation

if [ $# -eq 2 ]     #To check whether user has entered the arguments through command-line.
then
    if [ $1 -lt $2 ]    #To check whether the user has entered a valid range.
    then
        id=(`cat /etc/passwd | cut -d ":" -f 3`)    #To store all the User-IDs by cutting the User-ID field (i.e. third field) from the output of the '/etc/passwd command' in array.
        count=0
        for i in ${id[@]}   #To run the loop for finding the User-IDs in the given range.
        do
            if [ $1 -le $i -a $i -le $2 ]   #To check if the user-ID stored in 'i' lies in the specified range.
            then
                count=$((${count}+1))
            fi
        done
        echo "Total count of user ID between $1 to $2 is : ${count}"
    else                                                                        #If the range is invalid, print an error message.
        echo "Error : Invalid range. Please enter the valid range through CL."
    fi
elif [ $# -ne 2 -a $# -ne 0 ]   #If user has entered less than or more than 2 arguments but has not left the Command-line arguments as blank, print an error message.
then
    echo -e "Error : Please pass 2 arguments through CL.\nUsage : ./user_ids.sh 100 200"
else                                                   #If the user has left the Command-line arguments as blank, the default range of 500-10000 to be taken.
    id=(`cat /etc/passwd | cut -d ":" -f 3`)
    count=0
    for i in ${id[@]}
    do
        if [ 500 -le $i -a $i -le 10000 ]
        then
            count=$((${count}+1))
        fi
    done
    echo "Total count of user ID between 500 to 10000 is : ${count}"
fi
