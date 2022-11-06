#!/bin/bash

<<Documentation
Name         : Prabhat Kiran
Date         : 17th June 2022
Description  : Write a script to rename a file/directory replaced by lower/upper case letters.
Sample Input : NIL
Sample Output: Before running the script:
               File.txt MyScript.SH MyFile007.txt dir/ Assign1/ newfolder/
               Files are rename in lowercase and directories are renamed in uppercase:
               file.txt myfile007.txt myscript.sh DIR/ ASSIGN1/ NEWFOLDER/
Documentation

echo "Before running the script:"
ls      #To print the contents of the current working directory before renaming.

for i in *      #To store all the files and directories name in the variable 'i' one by one for renaming.
do
    if [ -d ${i} ]      #To check if the name in 'i' is a directory.
    then
        mv ${i} `echo ${i} | tr "a-z" "A-Z"`    #For directory, the renaming will be from lowercase to uppercase.
    else
        if [ "`echo ${i}`" != "File_Upper_Lower.sh" ]   #To prevent the renaming of the file which contains the program code.
        then
            mv ${i} `echo ${i} | tr "A-Z" "a-z"`    #For file, the renaming will be from uppercase to lowercase.
        fi
    fi
done

echo "Files are renamed in lowercase and Directories are renamed in uppercase:"
ls      #To print the contents of the current working directory after renaming.
