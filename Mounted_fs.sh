#!/bin/bash

<<Documentation
Name         : Prabhat Kiran
Date         : 23rd June 2022
Description  : Write a script to determine whether a given file system or mount point is mounted.
Sample Input : 1) ./mounted_fs.sh /dev/sda2
               2) ./mounted_fs.sh /dev
               3) ./mounted_fs.sh
Sample Output: 1) File-system /dev/sda2 is mounted on / and it is having 98% used space with 3298220 KB free.
               2) /dev is not mounted.
               3) Error : Please pass the name of the file-system through command line.
Documentation

flag=0      #To store the status whether the search of CLA in the File System information is successful or not.

if [ $# -eq 1 ]     #To check whether the user has entered arguments through command-line.
then
    fs=(`df -h | tr -s " " | cut -d " " -f 1 | sed '1d'`)       #To store the file system names in the array for the search purpose.
    len=$((${#fs[@]}-1))
    for i in `seq 0 ${len}`     #The loop will check if the file system name passed as CLA is present in the File System name information stored in the array 'fs'.
    do
        if [ "$1" = "${fs[i]}" ]
        then
            avail=`df -h | tr -s " " | cut -d " " -f 4 | head -n $((${i}+2)) | tail -n 1`   #To store the space available.
            mount=`df -h | tr -s " " | cut -d " " -f 6 | head -n $((${i}+2)) | tail -n 1`   #To store the directory where this file system is mounted on.
            dused=`df -h | tr -s " " | cut -d " " -f 5 | head -n $((${i}+2)) | tail -n 1`   #To store the disk space % used.
            echo "File-system $1 is mounted on ${mount} and it is having ${dused} used space with ${avail} free."
            flag=1      #If the search is successful, change the flag to '1'.
        fi
    done
else        #If there is no argument passed through the command-line, the error message is to be printed.
    echo "Error : Please pass the name of the file-system through command line."
fi
if [ ${flag} -eq 0 -a $# -ne 0 ]        #If the search is unsuccessful for the file system name passed as CLA, the search unsuccessful message should be printed.
    then
        echo "$1 is not mounted."
fi
