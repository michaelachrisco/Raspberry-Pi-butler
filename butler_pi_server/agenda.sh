#!/bin/bash

current_date=`date | awk {'print $2"/"$3"/"$6'}`
tomorrow_date=`date --date='2 days' | awk {'print $2"/"$3"/"$6'}`
echo `gcalcli --user usernamegoogle --pw 'userpasswordgoogle' agenda $current_date $tomorrow_date`  | sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g"

exit 0;
