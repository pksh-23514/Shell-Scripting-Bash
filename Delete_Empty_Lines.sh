#!/bin/bash

<<Documentation
Name         : Prabhat Kiran
Date         : 15th June 2022
Description  : Write a script to delete empty lines from a file. If the line is empty with spaces or tabs, you need to delete that line also.
Sample Input : 1) ./delete_empty_lines.sh <file_name>.txt
                  Contents of <file_name>.txt are:
                  How


                  are

                  <Only Tabs and Spaces given>

                  you?
               2) ./delete_empty_lines.sh
Sample Output: 1) Empty lines are deleted
                  How
                  are
                  you?
               2) Error: Please pass the file name through command line.
Documentation

if [ $# -eq 1 ]     #To check whether the user has entered one particular file name for which the empty lines are to be deleted.
then
    sed -i '/^[[:blank:]]*$/d' $1   #To remove all the empty lines (including those which have only tabs or spaces or both) from the '$1' which is the file passed as CLA.
    echo "Empty lines are deleted"
    cat $1      #To print the contents of the updated file in the Terminal window.
else
    echo "Error: Please pass the file name through command line."
fi
