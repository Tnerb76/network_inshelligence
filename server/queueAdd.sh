#! /bin/bash

head -1 /var/www/html/masterQueue.txt > /var/www/html/work/queue.txt
tail -n +2 /var/www/html/masterQueue.txt > /var/www/html/tmp.txt
cp -n /var/www/html/tmp.txt /var/www/html/masterQueue.txt
rm -f /var/www/html/tmp.txt
echo "Queue reset"

