TotalMemory=`free -m|head -2|tail -1|awk '{print $2}'`
UsedMemory=`free -m|head -2|tail -1|awk '{print $3}'`

Used_Precent=`expr $UsedMemory \* 100 / $TotalMemory`

echo "`date +"%D %r"`  $Used_Precent"  >> used_precent.tsv
