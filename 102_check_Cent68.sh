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

cat  /etc/passwd  |  grep  ^root  |  tee  kekka.txt
cat  kekka.txt

touch test1.txt
echo "ngn" >> test1.txt
echo "ngnsf" >> test1.txt
echo "ngnss" >> test1.txt
echo "ngnfs" >> test1.txt
echo "nginx" >> test1.txt

touch test2.txt
echo "com" >> test2.txt
echo "acom" >> test2.txt
echo "compass" >> test2.txt
echo "coom" >> test2.txt
echo "cooom" >> test2.txt
echo "caaam" >> test2.txt

grep ^n.[sn]$ test1.txt
grep ^n.[sn] test1.txt
grep ^n..[^f]s$ test1.txt

grep ^c...m$  test2.txt
grep ^co*m$  test2.txt
grep ^c[^o]*m$  test2.txt
grep ^c.m  test2.txt
grep c.m  test2.txt


echo  LAB4_start >> $gamen
echo  LAB4_start
echo  LAB4_start 1>&2

ls  -l  /etc
touch  /tmp/access.txt
ls  -l  /tmp/access.txt
echo  "I am root"  >  /tmp/access.txt
cat  /tmp/access.txt
#su  -  user1
su -l user1 -c 'echo  "I am user1"  >>  /tmp/access.txt'
su -l user1 -c 'cat  /tmp/access.txt'
chmod  o+w  /tmp/access.txt
ls  -l  /tmp/access.txt
su -l user1 -c 'echo  "I am user1"  >>  /tmp/access.txt'
chown  user1:linux  /tmp/access.txt
ls  -l  /tmp/access.txt

useradd  george
passwd  george --stdin << E
ngn-sf
ngn-sf
E
useradd henry
passwd  henry --stdin << E
ngn-sf
ngn-sf
E
useradd alan
passwd  alan --stdin << E
ngn-sf
ngn-sf
E
useradd frank
passwd  frank --stdin << E
ngn-sf
ngn-sf
E


touch  /tmp/shared-file
ls  -l  /tmp/shared-file
touch  /tmp/ngn-file
ls  -l  /tmp/ngn-file
groupadd  holdings
usermod  -G  holdings  george
usermod  -G  holdings  frank
usermod  -G  holdings  alan
tail  -1  /etc/group
groupadd  ngn
usermod  -G  ngn,holdings frank
usermod  -G  ngn  henry
tail  -2  /etc/group
chgrp  holdings  /tmp/shared-file
chmod  g+rw  /tmp/shared-file
ls  -l  /tmp/shared-file
su -l alan -c 'echo  "I am alan"  >>  /tmp/shared-file'
su -l alan -c 'cat  /tmp/shared-file'
su -l henry -c 'echo  "I am henry"  >>  /tmp/shared-file'
su -l henry -c 'cat  /tmp/shared-file'
chgrp  ngn  /tmp/ngn-file
chmod  g+rw  /tmp/ngn-file
chmod  o-r  /tmp/ngn-file
ls  -l  /tmp/ngn-file
su -l henry -c 'echo  "I am henry"  >>  /tmp/ngn-file'
su -l henry -c 'cat  /tmp/ngn-file'
su -l alan -c 'echo  "I am alan"  >>  /tmp/ngn-file'
su -l alan -c 'cat  /tmp/ngn-file'


echo  LAB5_start >> $gamen
echo  LAB5_start
echo  LAB5_start 1>&2

#/dev/vda3は300KBしか確保できなかった。
#セットアップで作成した/tmp/dev/sda6などを追加ディスクとみなす

mke2fs  /dev/vda3
mkdir  /linux-filesys1
ls  -l  /linux-filesys1
mount  /dev/vda3  /linux-filesys1/
mount
echo  “filesystem test”  >>  /linux-filesys1/testfile.txt
cat  /linux-filesys1/testfile.txt
echo "/dev/vda3  /linux-filesys1 ext2 defaults 0 0" >> /etc/fstab
umount  /linux-filesys1
tune2fs  -j  /dev/vda3
mount  /dev/vda3  /linux-filesys1
mount
mkfs.ext4 /tmp/dev/sda7 << E
y
E
mkdir  /linux-filesys2
ls  -l  /linux-filesys2
mount  -o loop /tmp/dev/sda7  /linux-filesys2
echo "/tmp/dev/sda7  /linux-filesys2 ext4 defaults 0 0" >> /etc/fstab
echo  “filesystem test”  >>  /linux-filesys2/testfile.txt


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


