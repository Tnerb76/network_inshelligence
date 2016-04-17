#! /bin/bash

cd /opt/fun
wget --no-parent http://10.63.2.179/work/nodes.txt
ifconfig | grep Bcast | awk '{ print substr($2,6),substr($4,6) }' | tr '\n' '    '  >> nodes.txt 
date +"%m%d%y %H:%M:%S $HOSTNAME" >> nodes.txt
scp ./nodes.txt root@10.63.2.179:/var/www/html/work/nodes.txt
rm -f nodes.txt
echo "Beak"

