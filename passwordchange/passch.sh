#!/bin/bash

echo -e "Please enter the username to change the password for:"
read username
echo -e " Please enter the new password:"
read thepass
cat targetadded.yml | sed "s/pwd/$thepass/g" | sed "s/usrname/$username/g" > userchanged.yml
ansible-playbook userchanged.yml
sleep 45