#!/bin/sh

echo "画面番号は$gamenです"

rm -rf OK_cmd.log
rm -rf NG_cmd.log


exec 1>> OK_cmd.log
exec 2>> NG_cmd.log


echo  LAB0_test_start >> $gamen
echo  LAB0_test__start
echo  LAB0_test__start 1>&2

echo `cat /etc/redhat-release` 1>&2

#このようにコマンドを記載する

ls
pwd
date

#正常処理はOK_cmd.log　へ出力
#エラー処理はNG_cmd.log へ出力


#一般ユーザでのコマンド実行はsuで切り替えるのではなくsu -l -cを使う
#su  -  lpic
su -l lpic -c "pwd"

#下のLABX_startの3行をコピーして、その下にテスト対象のコマンドを並べていく

echo  LAB1_start >> $gamen
echo  LAB1_start
echo  LAB1_start 1>&2

#Windowsからリモートデスクトップ接続を実施するラボとする
service xrdp start
chkconfig xrdp on


echo  LAB2_start >> $gamen
echo  LAB2_start
echo  LAB2_start 1>&2

touch script1.sh
echo '#!/bin/sh' >> script1.sh
echo '' >> script1.sh
echo 'tmpdir="/tmp"' >> script1.sh
echo 'cmdpath="/bin"' >> script1.sh
echo 'if  test  $#  -eq  1' >> script1.sh
echo 'then' >> script1.sh
echo 'echo  "実行前の/tmpの確認 ：" ; ls  $tmpdir  |  grep  $1' >> script1.sh
echo '$cmdpath/mkdir  $tmpdir/$1' >> script1.sh
echo 'echo  "実行後の/tmpの中身 ："; ls  -ld  $tmpdir/$1' >> script1.sh
echo 'else' >> script1.sh
echo 'echo  "作成したいディレクトリ名を1つ指定してください"' >> script1.sh
echo 'fi' >> script1.sh
chmod  +x  script1.sh
./script1.sh  testdir

touch script2.sh
echo '#!/bin/sh' >> script2.sh
echo '' >> script2.sh
echo 'echo  \"Hello!\"' >> script2.sh
chmod  +x  script2.sh
./script2.sh

touch script3.sh
echo '#!/bin/sh' >> script3.sh
echo '' >> script3.sh
echo 'echo  "引数の文字列は $1 です。"' >> script3.sh
chmod  +x  script3.sh
./script3.sh  test

touch script4.sh
echo '#!/bin/sh' >> script4.sh
echo '' >> script4.sh
echo 'if  test  -f  /tmp/hit.txt' >> script4.sh
echo 'then' >> script4.sh
echo 'echo  "Hit!"' >> script4.sh
echo 'else' >> script4.sh
echo 'echo  "ファイルがありませんでした。"' >> script4.sh
echo 'fi' >> script4.sh
chmod  +x  script4.sh
touch  /tmp/hit.txt
./script4.sh
rm -f /tmp/hit.txt 
./script4.sh

touch script5.sh
echo '#!/bin/sh' >> script5.sh
echo '' >> script5.sh
echo 'for  i  in  `seq  1  5`' >> script5.sh
echo 'do' >> script5.sh
echo 'touch  $1$i' >> script5.sh
echo 'echo  "$1$i 作成しました"' >> script5.sh
echo 'done' >> script5.sh
echo 'ls  -l  $1*' >> script5.sh
chmod  +x  script5.sh
./script5.sh  test


echo  LAB3_start >> $gamen
echo  LAB3_start
echo  LAB3_start 1>&2

ifconfig
ping  -c 2 8.8.8.8
ping  -c 2 172.16.123.123
route

echo  LAB4_start >> $gamen
echo  LAB4_start
echo  LAB4_start 1>&2


#ssh 192.168.122.73
sshpass -p ngn-sf1234GO ssh -oStrictHostKeyChecking=no 127.0.0.1
whoami
exit

#ssh  192.168.122.73 -l user1
sshpass -p ngn-sf ssh  -oStrictHostKeyChecking=no 127.0.0.1 -l user1
whoami
exit

#PermitRootLogin noはチェックツールが止まるのでツールでの実施なし(ときどき手動で確認すること)
#PasswordAuthentication  noはチェックツールが止まるのでツールでの実施なし(ときどき手動で確認すること)
#SSH port forwardingはGUIないのでツールでの実施なし(ときどき手動で確認すること)

echo  LAB5_start >> $gamen
echo  LAB5_start
echo  LAB5_start 1>&2

touch  /var/log/lab5_log
echo 'local5.=error                                                 /var/log/lab5_log' >>   /etc/rsyslog.conf
service  rsyslog  restart
#tail  -f  /var/log/lab5_log
logger  -p  local5.error  "This is error log"
logger  -p  local5.info  "This is info log"
logger  -p  local5.warning  "This is warning log"
logger  -p  local5.crit  "This is critical log"
#tail  -f  /var/log/lab5_log 
cat /var/log/lab5_log

echo  LAB6_start >> $gamen
echo  LAB6_start
echo  LAB6_start 1>&2

echo  "This is hardlink test."  >  link.txt
cat  link.txt
ln  link.txt  link1.txt
ls  -il  link*
cat  link1.txt
rm  link.txt
cat  link1.txt
rm  link1.txt
echo  "This is symboliclink.test."  >  slink.txt
cat  slink.txt
ln  -s  slink.txt  slink1.txt
ls  -il  slink*
cat  slink1.txt
rm  slink.txt
ls  -il  slink*
cat slink1.txt
rm  slink1.txt


#間違って下の行を消さないように！(標準出力の初期化)

exec 1>> $gamen
exec 2>> $gamen


