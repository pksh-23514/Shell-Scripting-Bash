#!/bin/bash

<<Documentation
Name         : Prabhat Kiran
Date         : 20th June 2022
Description  : For each directory in the $PATH, display the number of executable files in that directory.
Sample Input : NIL
Sample Output: Current dir: /usr/local/sbin
               current count: 0
               Current dir: /usr/local/bin
               current count: 0
               Current dir: /usr/sbin
               current count: 205
               Current dir: /usr/bin
               current count: 1889
               Current dir: /sbin
               current count: 187
               Current dir: /bin
               current count: 159
               Current dir: /usr/games
               current count: 5
               Current dir: /usr/local/games
               current count: 0
               Total – 2445
Documentation

total=0     #To store the total count of all executable files stored in all the directories in $PATH.
arr=(`echo $PATH | tr ":" " "`)     #To replace the ':' with space to store them in form of an array. All the paths in $PATH is separated by ':'.

for i in ${arr[@]}      #To store all the paths in the variable 'i' one by one for counting the number of executable files stored in each directory.
do
    count=0     #To store the count of executable files in each directory.
    echo "Current dir: ${i}"
    cd ${i}
    for j in $(ls)      #To store all the files in the directory in the variable 'j' one by one for checking how many files are of executable type.
    do
        if [ -x ${j} ]  #To check if the file is of executable type or not.
        then
            count=$((${count}+1))
        fi
    done
    echo "Current count: ${count}"
    total=$((${total}+${count}))
done
echo "Total - ${total}"
