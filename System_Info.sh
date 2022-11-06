#!/bin/bash

<<Documentation
Name         : Prabhat Kiran
Date         : 17th June 2022
Description  : Write a script to print system information using commands.
Sample Input : ./system_info.sh
                1. Currently logged users.
                2. Your shell directory.
                3. Home directory.
                4. OS name & version.
                5. Current working directory.
                6. Number of users logged in.
                7. Show all available shells in your system.
                8. Hard disk information.
                9. CPU information.
                10. Memory Informations.
                11. File system information.
                12. Currently running process.
               1) Enter the choice : 2
               2) Enter the choice : 14
Sample Output: 1) Your shell directory is /bin/bash
                  Do you want to continue (y/n) ?
               2) Error : Invalid option, please enter valid option.
Documentation

res="y"     #To make the loop run for at least one time without the user input.

while [ "${res}" = "y" -o "${res}" = "Y" ]      #The user can enter "y" or "Y" and the loop must execute. Anything else entered by user shall terminate the loop.
do
    echo -e "1. Currently logged users.\n2. Your shell directory.\n3. Home directory.\n4. OS name & version.\n5. Current working directory.\n6. Number of users logged in.\n7. Show all available shells in your system.\n8. Hard disk information.\n9. CPU information.\n10. Memory Informations.\n11. File system information.\n12. Currently running process."
    
    read -p "Enter the choice : " ch        #To read the choice of system information that needs to be printed from the user.
    
    case $ch in
        1) echo -n "Currently logged user is "
            whoami
            ;;
        2) echo "Your shell directory is $SHELL"
            ;;
        3) echo "Home directory is $HOME"
            ;;
        4) echo "OS name & version is"
            uname -sv
            ;;
        5) echo -n "Current working directory is "
            pwd
            ;;
        6) echo "Number of users logged in is/are"
            w
            ;;
        7) echo "All available shells in your system are"
            cat /etc/shells
            ;;
        8) echo "Hard disk information is"
            df -h
            ;;
        9) echo "CPU Information is"
            cat /proc/cpuinfo
            ;;
        10) echo "Memory Information is"
            grep MemTotal /proc/meminfo
            ;;
        11) echo "File system information is "
            df
            ;;
        12) echo "Currently running process is "
            ps
            ;;
        *) echo "Error : Invalid option, please enter valid option"     #To display the error message if the user entered any number other than 0-12 as displayed earlier.
            ;;
    esac
    read -p "Do you want to continue (y/Y/n/N)? " res       #To ask the user if he requires any other system information to be printed. Else the loop will be terminated.
done
