#!/bin/bash
echo -e "Enter a group name: "
read grpname
echo -e " Enter a groupid: "
read groupid

cat targetadded.yml | sed "s/gname/$grpname/g" | sed "s/grid/$groupid/g" > groupadded.yml
ansible-playbook groupadded.yml
sleep 45