adminNumber="+91/////////"
while :
do
	
	TotalMemory=free -m|head -2|tail -1|awk '{print $2}'
	UsedMemory=free -m|head -2|tail -1|awk '{print $3}'

	UsedPercent=expr $UsedMemory \* 100 / $TotalMemory


	if [[ $UsedPercent -gt 80 ]];
	then 
		if mudslide send $adminNumber "Hey RAM is used above 80 percent" >> /dev/null;
		then
			echo "Alert message send to admin succesfully " | espeak-ng
		else 
			echo "Got some error to send whatsapp message" | espeak-ng
		fi

	fi
done
