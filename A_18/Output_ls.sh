#!/bin/bash

<<Documentation
Name         : Prabhat Kiran
Date         : 17th June 2022
Description  : Write a script to print contents of a directory without 'ls' command.
Sample Input : 1) ./output_ls.sh
               2) ./ouput_ls.sh ~ ~/ECEP
               3) ./ouput_ls.sh Test
Sample Output: 1) Assignments Classwork
               2) /home/user:
                  Downloads Documents Desktop Music Pictures Public Videos ECEP
                  /home/user/ECEP:
                  Linux_Systems Advnc_C Linux_Internals Data_Structures MC
               3) output_ls.sh: Cannot access ‘Test’ : No such a file or directory.
Documentation

if [ $# -eq 0 ]     #To check if the CLA is empty. If empty, print the contents of the current directory.
then
    pwd
    echo *      #To print all the contents of the directory (similar to the ls command).
else
    for i in $@     #To store all the directory paths input as CLA in the variable 'i' one by one for printing their contents.
    do
        if [ -d $i ]    #To check if the directory is valid or not.
        then
            cd ${i}     #To go to the directory path stored in 'i'.
            pwd
            if [ "$(echo *)" = "*" ]    #If the directory is empty, the output of 'echo *' will be '*'. Then, print that the directory is empty.
            then
                echo "The directory ${i} is empty."
            else        #Print the contents of the directory.
                echo *
            fi
        else        #If the directory does not exists, print an error message.
            echo "Cannot access ${i} : No such a file or directory."
        fi
    done
fi
