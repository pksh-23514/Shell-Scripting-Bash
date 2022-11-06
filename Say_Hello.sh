#!/bin/bash

<<Documentation
Name         : Prabhat Kiran
Date         : 14th June 2022
Description  : Write a script say_hello,which will print greetings based on the Time as follows:
               "Good morning" (5 AM - 12 PM)
               "Good noon" (12 PM - 2 PM)
               "Good afternoon" (2 PM - 5 PM)
               "Good evening" (5 PM - 9 PM)
               "Good night" (9 PM - 5 AM)
               You can do in either 12-hr format or 24-hr format.
Sample Input : NIL
Sample Output: Good Morning <User_Name>, Have nice day!
               This is Thursday 08 in June of 2017 (10:44:10 AM)
Documentation

#To display the output as soon as you run the shell, in the last line of .bashrc, write: bash ~/ECEP/LS/Assignments/say_hello.sh

hr=`date +%H`   #To extract the hour in 24-hr format and check which greeting is to be printed based on the conditions below.
if [ ${hr} -ge 5 -a ${hr} -lt 12 ]
then
    echo -n "Good morning "
elif [ ${hr} -ge 12 -a ${hr} -lt 14 ]
then
    echo -n "Good noon "
elif [ ${hr} -ge 14 -a ${hr} -lt 17 ]
then
    echo -n "Good afternoon "
elif [ ${hr} -ge 17 -a ${hr} -lt 21 ]
then
    echo -n "Good evening "
else
    echo -n "Good night "
fi

echo "$USER, Have a nice day!"  #'$USER' is an environment variable to print the current Username.

day=`date +%A`                      #To extract today's day in full.
date=`date | cut -d " " -f 3`       #To cut the date part from the output of 'date' command.
month=`date +%B`                    #To extract current month in full.
year=`date | cut -d " " -f 6`       #To cut the year part from the output of 'date' command.
clock=`date +%r | cut -d " " -f 1`  #To cut the time (in 12-hr format) from the output of 'date +%r' command.
zone=`date +%r | cut -d " " -f 2`   #To cut the AM/PM part from the output of 'date +%r' command.
echo "This is ${day} ${date} in ${month} of ${year} (${clock} ${zone})"
