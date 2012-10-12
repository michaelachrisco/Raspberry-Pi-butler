#If the curent time is between 6am and 10pm, do the operation. You can also set up a cron job if needed
if [ "`date "+%H" | awk '{print $1}'`" -le "21" -a  "`date "+%H" | awk '{print $1}'`" -ge "6" ] ; then sh butler.sh; fi;
exit 0;
