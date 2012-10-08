#bash script for butler program. 
#This script is the main brains of the whole operation.
osascript -e 'set volume output volume 100'

say "Hello. The time is currently" 
say `date "+%l %M"`
echo `ssh pi@192.168.1.64 weather fat` |  awk '{print $1, $2, $3, $4". " $21, $22, "fahrenheit.", $26, $27, $28".", $29, $36, "Miles per hour.", $40, $41, $42, $43, $44, $45, $46}' |say
echo `ssh pi@192.168.1.64 weather -f fat |grep FRESNO| awk {'print "Forcast for today. High of ", $2 ". Low of "$3"." '}` | say 
gigs=`ssh  -t pi@192.168.1.64 /home/pi/bytes.bash | awk {'print $3'}`
say "We have currently used $gigs Gigabytes this month."
say "Internet percentage: $((${gigs}*100/250)) %"

say "The agenda for today and tomorrow: " `ssh pi@192.168.1.64 sh agenda.sh`

