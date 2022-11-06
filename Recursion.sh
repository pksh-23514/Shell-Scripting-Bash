#!/bin/bash

<<Documentation
Name         : Prabhat Kiran
Date         : 14th June 2022
Description  : Use a recursive function to print each argument passed to the function.
Sample Input : ./recursion.sh How are you? I am fine
Sample Output: How
               are
               you?
               I
               am
               fine
Documentation

print ()    #The function to Print the text.
{
    arr=($@)    #To store the complete input passed as arguments in the function call in an array form.
    echo $1     #To print the first word from the input passed as arguments in the function call.
    arr=(${arr[@]:1})   #To remove the printed word (i.e. first word) from the input. 'arr' will be updated to have all the words starting from the second position.
    
    if [ $# -gt 1 ]     #To check if the word count in input is non-zero. '$#' will return the word count in the input passed as arguments in the function call and not the updated 'arr'.
    then
        print ${arr[@]}     #If there are words left to be printed, then the function 'print' is called again with the updated array passed as arguments.
    else
        return    #If all the words are printed, the function can be exited.
    fi
}

if [ $# -gt 0 ]     #To check whether the user has entered the arguments through command-line.
then
    print $@    #The function 'print' is called with the command-line arguments being passed as function arguments.
else
    echo "Error : Pass the arguments through command line."
fi
