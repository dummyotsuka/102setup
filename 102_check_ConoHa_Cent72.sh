#!/bin/sh

echo "画面番号は$gamenです"


rm -rf OK_cmd.log
rm -rf NG_cmd.log


exec 1>> OK_cmd.log
exec 2>> NG_cmd.log


echo  LAB0_test_start >> $gamen
echo  LAB0_test__start
echo  LAB0_test__start 1>&2


echo  LAB5_syslog_start >> $gamen
echo  LAB5_syslog_start
echo  LAB5_syslog_start 1>&2

sed -i -e s/#$ModLoad imudp/$ModLoad imudp/ /etc/rsyslog.conf
sed -i -e s/#$UDPServerRun 514/$UDPServerRun 514/ /etc/rsyslog.conf
touch  /var/log/test.log
echo "user.*                                                  /var/log/test.log" >> /etc/rsyslog.conf
systemctl restart rsyslog
#tail  -f  /var/log/test.log
cat /var/log/test.log


exec 1>> $gamen
exec 2>> $gamen
