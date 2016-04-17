#! /bin/bash

echo "" > /var/www/html/work/item.txt
echo "" > /var/www/html/masterQueue.txt
echo "" > /var/www/html/work/queue.txt
echo "server start()"
while [ 1 ]
do
if [ -s /var/www/html/work/item.txt ] ; then
	head -1 /var/www/html/masterQueue.txt  > /var/www/html/work/queue.txt
        tail -n +2 /var/www/html/masterQueue.txt > /var/www/html/tmp.txt
        rm -f /var/www/html/work/item.txt
	rm -f /var/www/html/masterQueue.txt
	cp /var/www/html/tmp.txt /var/www/html/masterQueue.txt
	rm -f /var/www/html/tmp.txt
else
	sleep 1
fi
done
