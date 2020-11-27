#!/bin/bash
echo -e "Enter the username to be removed \n"
read thename
cat targetadded.yml | sed "s/thename/$thename/g" > /home/ansib/tool/userdeletion/deluser.yml
ansible-playbook deluser.yml
sleep 30