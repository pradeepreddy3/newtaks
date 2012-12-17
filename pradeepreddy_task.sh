#!/bin/bash
LOG_FILE="pradeep_reddy_task.log"

while [ 1 ]
do
        echo "1. Change Password \n "
        echo "2. Disk Pace \n"
        echo "3. Login \n"
        echo "4. Service Running \n"
        echo "5. Ports Open \n"
        echo "6. Java Appas \n"
        echo "7. Kill app \n"
        echo "8. to exit\n"
        echo -e "Enter Option [ 1 - 8 ]:"
        read Choice
        case $Choice in
                1)
                        echo "Enter Username to change"
                        read Username
                        if [ "$Username" ]; then
                                echo "Enter New Password "
                                read New_Password
                                if [ "$New_Password" ]; then
                                        `pwd`/change_password.sh "$Username" "$New_Password" >>$LOG_FILE 2>&1
                                else
                                        echo "Invalid Password"
                                fi

                        else
                                echo "Invalid Username"
                        fi;;
                2)
                        echo "Disk Space Utilization"
                        df -h;; # command to show dish usage
                3)
                        echo "Login to another box"
                        echo "Enter IP address of box to login in"
                        read IP
                        if [ "$IP" ]; then
                                echo "Enter Username to be login in "
                                read Username
                                if [ "Username" ]; then
                                        echo "Enter Password "
                                        read Password
                                        if [ "$Password" ];
                                        then
                                                `pwd`/login_ssh.sh $Username $IP $Password
                                        else
                                                echo "Invalid Password"
                                        fi
                                else
                                        echo "Invalid Username"
                                fi
                        else
                                echo "Invalid IP"
                        fi;;
                4)
                        echo "Service running are "
                        ps -aux ;;
                5)
                        echo "Ports Open are "
                        ss -l;; ## command to list all open ports
                6)
                        echo "JAVA Apps running are "
                        ps -aux | grep java;;
                7)
                        echo "Enter app to be killed"
                        read app_to_kill
                        if [ "$app_to_kill" ]; then
                                killall $app_to_kill
                        else
                                echo "Invalid entry"
                        fi;;
                8)
                        exit ;;
        esac
done
