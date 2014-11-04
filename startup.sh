#!/bin/bash

mkdir /var/run/sshd

# create an ubuntu user
#PASS=`pwgen -c -n -1 10`
#PASS=ubuntu
#echo "User: ubuntu Pass: $PASS"
#useradd --create-home --shell /bin/bash --user-group --groups adm,sudo ubuntu
#echo "ubuntu:$PASS" | chpasswd
#cp -r /openbox-config/.config ~ubuntu/

/usr/bin/supervisord -c /etc/supervisor/supervisord.conf

for f in /etc/startup.aux/*.sh
do
    . $f
done

#while [ 1 ]; do
/bin/bash
#done
