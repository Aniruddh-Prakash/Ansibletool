#!/bin/bash

target="None"
my_head()
{
echo -e "-------------------------------------------------------------"
    echo -e "Automation tool to automate daily Linux tasks \c"
    echo -e "\t Target Server : $target"
    echo -e "----------------------------------------------------------------------"
}
while true
do
my_head
    echo -e "Please enter one of the choices from the below menu \n"
    echo -e "1. Pre-Validation \n"
    echo -e "2. User Administration \n"
    echo -e "3. Run AD Hoc Commands \n"
    echo -e  "4. Health statistics"
    echo -e "22. Options \n"
    echo -e "0. Exit \n"
    read choice
    case $choice in

    0)
    break
    ;;
    1)
    if [ $target = "None" ]; then
        echo -e "Please select a target from option 22 \n"
        read dummy
        else
        echo "Welcome to Pre-validation"
        sleep 4
    fi
    ;;
    2) 
    if [ $target = "None" ]; then
        echo -e "Please select a target from option 22 \n"
        read dummy
        else
        while true
        do  
            clear
            echo -e " 1. User Creation \n"
            echo -e " 2. User Deletion \n"
            echo -e " 3. Reset User Password \n"
            echo -e " 4. Create a new group \n"
            echo -e " 0. Exit \n"
            read choice
            case $choice in

            0)
            break
            ;;
            1)
            cd usercreation
            cat usercreation.yml | sed "s/xyz/$target/g" > targetadded.yml
            ./replaceuser.sh
            sleep 6
            ;;
            2)
            cd userdeletion
            cat userdel.yml | sed "s/xyz/$target/g" > targetadded.yml
            ./userdelrep.sh
            sleep 6
            ;;
            3)
            cd passwordchange
            cat passchange.yml | sed "s/xyz/$target/g" > targetadded.yml
            ./passch.sh
            sleep 6
            ;;
            4)
            cd groupaddition
            cat groupadd.yml | sed "s/xyz/$target/g" > targetadded.yml
            ./groupadd.sh
            sleep 6
            ;;
            *)
            echo -e "Invalid Choice !!! \n"
            read dummy
            continue
            ;;
            esac
        done
    fi
    ;;
    3)
    if [ $target = "None" ]; then
        echo -e "Please select a target from option 22 \n"
        read dummy
        else
        echo "Welcome to AD Hoc commands"
        sleep 4
    fi
    ;;
    4) 
    if [ $target = "None" ]; then
        echo -e "Please select a target from option 22 \n"
        read dummy
        else
        while true
        do  
            clear
            echo -e " 1. Memory Utilization \n"
            echo -e " 2. CPU Utilization \n"
            echo -e " 0. Exit \n"
            read choice
            case $choice in

            0)
            break
            ;;
            1)
            echo -e "######################################################"
            echo -e "Memory Utilization Statistics SAR"
            echo -e "######################################################"
            echo -e " "
            ansible $target -m shell -a "sar -r 1 3"
            echo -e " "
            echo -e "kbmemfree: is the amount of free memory"
            echo -e "kbmemused: is the amount of  memory used"
            echo -e "%memused: percentage of memory used"
            echo -e "kbbuffers: amount of buffer memory used by the kernel"
            echo -e "kbcached: is the amount of cached memory used by the kernel"
            echo -e "kbmemfree and mem used are pretty helpful"
            sleep 6
            ;;
            2)
            echo -e "######################################################"
            echo -e "CPU Utilization Statistics SAR"
            echo -e "######################################################"
            echo -e " "
            ansible $target -m shell -a "sar -u 1 3"
            echo -e "%user   :This shows the total time that the processor is spending on different process"
            echo -e "%sys    :This shows the percentage of time spend by the processor for operating system tasks"
            echo -e "%iowait :The name iowait itself suggests that its the time spend by processor waiting for devices(input and output)"
            echo -e "%steal  :This column shows the amount to time spend by a CPU (which is virtualized), for resources from the physical CPU"
            echo -e "%idle   :This suggests the idle time spend by the processor \n"
            sleep 5
            clear
            ;;
            
            *)
            echo -e "Invalid Choice !!! \n"
            read dummy
            continue
            ;;
            esac
        done
    fi
    ;;
    22)
        while true
        do
        clear
        my_head
        echo -e "1. Target Server \n"
        echo -e "0. Exit \n"
        echo -e "Please enter your choice: \c"
        read choice
        case $choice in

        0)
        clear
        break
        ;;
        1)
        echo -e "-----------------------------------------------"
        echo -e "List of available environments \n"
        cat /etc/ansible/hosts | grep "\[" | grep -v "^#" | sed "s/\[/ /g" | sed "s/\]/ /g"
        echo -e "------------------------------------------------"
        echo -e " enter your choice: \c"
        read target
        ;;
        esac
        done
    ;;
    *)
    echo -e  "Wrong choice \n"
    read new
    continue
    ;;
    esac
done