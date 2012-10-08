if [ "`date "+%H" | awk '{print $1}'`" -le "21" -a  "`date "+%H" | awk '{print $1}'`" -ge "6" ] ; then sh butler.sh; fi;
exit 0;
