#!/bin/bash
echo -e "Enter the username \n"
read usname 
echo -e " Enter the userid \n "
read usid 
echo -e " Enter comments for the user \n"
read cmt 
echo -e "Enter te primary groups \n"
read prigrp
echo -e "Enter te supplementary group \n"
read secgrp
echo -e " What should be the home directory for the user? \n"
read usrhome
cat targetadded.yml | sed "s/usname/$usname/g" | sed "s/usid/$usid/g" | sed "s/cmt/$cmt/g" | sed "s/prigrp/$prigrp/g" | sed "s/secgrp/$secgrp/g" | sed "s/usrhome/$usrhome/g" > userreplaced.yml
ansible-playbook userreplaced.yml
sleep 20