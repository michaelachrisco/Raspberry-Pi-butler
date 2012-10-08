curl -silent http://192.168.1.254/xslt?PAGE=C_1_0 > snapshot.html

line_number=`more snapshot.html| grep '<td class="indent">Receive</td>' -n | awk '{ print $1 }'| sed "s/:$//"`
#echo $line_number

line_number=$((line_number+1))

#echo $line_number

#Now we know the line number so forget being precise for later updates. Ill change it when the time comes.
specific_line_in_text_file=`sed -n 168p snapshot.html` 

echo $specific_line_in_text_file > snapshot_today.txt

#Getting the number from snapshot_today
numbers=`cat snapshot_today.txt` 

transmit_in_bytes=`cat snapshot_today.txt | sed 's/<[./]*t[rd]>/\n/g' | awk 'NF'`
#Done with getting snapshot of transmit but now need the recieving end. 

#new
specific_line_in_text_file=`sed -n 169p snapshot.html`


echo $specific_line_in_text_file > snapshot_today.txt

# Got both numbers in text file, now need to extract them and add them together. 

sent_in_bytes=`cat snapshot_today.txt | sed 's/<[./]*t[rd]>/\n/g' | awk 'NF'`

#echo $((($transmit_in_bytes+$sent_in_bytes)))

total_bytes=$((($transmit_in_bytes+$sent_in_bytes)))

#Formatting of output

#one line
echo $total_bytes" bytes "$((total_bytes/1073741824))" GB "$((total_bytes/1048576))" MB "`date`
 
#multiple lines
#echo $total_bytes$" bytes"
#echo $((total_bytes/1048576))$" MB"
#echo $((total_bytes/1073741824))$" GB "
#date | awk '{ print $2" "$3" "$6}'
exit 0
