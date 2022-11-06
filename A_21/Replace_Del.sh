#!/bin/bash

<<Documentation
Name         : Prabhat Kiran
Date         : 21st June 2022
Description  : Write a script to replace 20% lines in a C file randomly and replace it with the pattern "".
Sample Input : 1) ./replace_DEL.sh main.c
               2) ./replace_DEL.sh main1.c
               3) ./replace_DEL.sh main2.c
               4) ./replace_DEL.sh
Sample Output: 1) Before replacing
                  #incude <stdio.h>
                  int main()
                  {
                      printf(“Hello world\n”);
                  }
                  After replacing
                  #incude <stdio.h>
                  int main()
                  {
                      <-----------Deleted------------>
                  }
               2) Error : No such a file.
               3) Error : main2.c is empty file. So can’t replace the string.
               4) Error : Please pass the file name through command line.
Documentation

echo "Before replacing"
cat $1

if [ $# -eq 1 ]     #To check whether the user has entered the arguments through command-line.
then
    if [ -f $1 ]    #To check if the CLA passed is a file or not.
    then
        if [ -s $1 ]    #To check if the file has some contents or not.
        then
            lines=`cat $1 | wc -l`      #To store the number of lines of content present in the file.
            if [ ${lines} -ge 5 ]       #The minimum number of lines in the file should be 5. If the number of lines are less than 5, 20% of the lines will come less than one which is invalid.
            then
                num=$((${lines}/5))     #To calculate the number of lines to be deleted from the file.
                for i in `seq ${num}`   #The loop is used to randomly delete 'num' number of lines from the file.
                do
                    random=`shuf -i 1-${lines} -n1`     #The randomly generated line number in the range of 1 to 'lines' is stored in the variable 'random'.
                    sed -i "${random}s/.*/<----Deleted---->/" $1    #'sed' command is used to replace the contents of the selected random line.
                done
                echo "After replacing"
                cat $1
            else    #The error to be printed if the lines in the file is less than 5.
                echo "The file $1 doesn't have sufficient number of lines. It should have a minimum of 5 lines of content!"
            fi
        else        #The error to be printed if the file is empty.
            echo "Error : $1 is an empty file. So can't replace the string."
        fi
    else            #The error to be printed if the passed CLA is not a file.
        echo "Error : No such a file."
    fi
else                #The error to be printed if there is no CLA passed.
    echo "Error : Please pass the file name through command line."
fi
