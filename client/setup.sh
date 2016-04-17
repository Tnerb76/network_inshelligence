#! /bin/bash

rm -f -R /opt/fun
cd /opt
mkdir fun
cd fun
wget --no-parent http://10.63.2.179/work/beacon.sh
wget --no-parent http://10.63.2.179/work/node.sh
chmod +x ./beacon.sh
chmod +x ./node.sh
./node.sh
