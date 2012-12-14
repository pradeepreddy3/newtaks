#!/bin/bash
LOG_FILE="pradeep_reddy_task.log"

case $1 in
        --change_password )
                echo change password
                if [ "$#" -eq 3 ] # condition to check if number of parameters passed is 3.
                then
                        `pwd`/change_password.sh "$2" "$3" >>$LOG_FILE 2>&1
                else
                        echo "Enter Username and Password" >>$LOG_FILE
                fi;;
        --disk_space )
                echo disk space
                df -h;; # command to show dish usage
        --login )
                echo Loging to another box
                if [ "$#" -eq 4 ]; then
                        `pwd`/login_ssh.sh $2 $3 $4
                else
                        echo "Enter corrent values " >>$LOG_FILE
                fi;;
        --service_running )
                ps -aux ;;
        --ports_open )
                echo Ports which are open are
                ss -l;; ## command to list all open ports
        --java_apps )
                echo "Java appas"
                ps -aux | grep java;;
        --kill_app )
                echo "kill app"
                killall $2
                ;;
        * )
                echo "Usage pradeepreddy_task.sh --[change_password/disk_space/login/ports_open/java_apps/kill_app]"  ;;
esac
