#!/bin/bash

<<Documentation
Name         : Prabhat Kiran
Date         : 16th June 2022
Description  : Display the longest and shortest user-names on the system.
Sample Input : NIL
Sample Output: The Longest Name is: speech-dispatcher
               The Shortest Name is: lp
Documentation

name=(`cat /etc/passwd | cut -d ":" -f 1`)  #To store the usernames of all the users by cutting the username field (i.e. first field) from the output of '/etc/passwd' in array.
min=${name[0]}
max=${name[0]}

for i in ${name[@]}     #To run the loop for finding the maximum and minimum length of usernames on the system.
do
    if [ ${#i} -gt ${#max} ]    #To check if the current word length is greater than the length of word stored in 'max' and update it in 'max'.
    then
        max=${i}
    fi
    if [ ${#i} -lt ${#min} ]    #To check if the current word length is lesser than the length of word stored in 'min' and update it in 'min.
    then
        min=${i}
    fi
done
echo "The Longest name is: ${max}"
echo "The Shortest name is: ${min}"
