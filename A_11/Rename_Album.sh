#!/bin/bash

<<Documentation
Name         : Prabhat Kiran
Date         : 17th June 2022
Description  : Given album name and corresponding directory, this script renames the jpg files with new name passed through command line.
Sample Input : Before executing the script
               DSN001.jpg DSN002.jpg DSN003.jpg DSN004.jpg DSN005.jpg
               1) ./rename_album.sh day_out
               2) ./rename_album.sh
Sample Output: 1) All .jpg files in current directory is renamed as
                  day_out001.jpg day_out002.jpg day_out003.jpg day_out005.jpg day_out004.jpg
               2) Error : Please pass the prefix name through command line.
Documentation

if [ $# -eq 1 ]     #To check whether the user has entered the arguments through command-line.
then
    echo "Before executing the script"
    ls *.jpg      #To print all the .jpg file names of the current directory before renaming is done.

    for i in *.jpg      #To store all the file names with extension .jpg in the variable 'i' one by one for renaming process.
    do
        alpha=`echo ${i} | tr -d [:digit:] | cut -d "." -f 1`   #To store the prefix of the file name without the digits and .jpg extension.
        if [ "${1}" != "${alpha}" ]     #To check if the prefix name in 'alpha' is different from what is entered by the user. If they are same, no renaming is done and a warning is displayed.
        then
            digit=`echo ${i} | tr -dc [:digit:]`    #To store only the digits part of the prefix in the file name.
            mv ${i} $1$digit.jpg    #To rename the file with the user entered prefix name along with the digits extracted and .jpg extension.
        else
            echo "Warning : The name passed in CLA is same as the prefix name of the existing file."
        fi
    done
    echo "All .jpg files in current directory is renamed as"
    ls *.jpg       #To print all the .jpg file names of the current directory after renaming.
else
    echo "Error : Please pass the prefix name through command line."
fi
