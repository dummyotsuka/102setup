#!/bin/sh

echo $gamen


rm -rf OK_cmd.log
rm -rf NG_cmd.log


exec 1>> OK_cmd.log
exec 2>> NG_cmd.log


echo  LAB0_test_start >> $gamen
echo  LAB0_test__start
echo  LAB0_test__start 1>&2


#このようにコマンドを記載する

ls
pwd
date

#正常処理はOK_cmd.log　へ出力
#エラー処理はNG_cmd.log へ出力

#GUI ha check shitemasen

#一般ユーザでのコマンド実行はsuで切り替えるのではなくsu -l -cを使う
#su  -  lpic
su -l lpic -c "pwd"

#下のLABX_startの3行をコピーして、その下にテスト対象のコマンドを並べていく

echo  LAB1_start >> $gamen
echo  LAB1_start
echo  LAB1_start 1>&2

#GUI ha check shitemasen
#runlevel
#sed -i -e s/id:5:initdefault:/id:3:initdefault:/ /etc/inittab
runlevel
#init 5
#sed -i -e s/id:3:initdefault:/id:5:initdefault:/ /etc/inittab
rm -f /etc/systemd/system/default.target
ln -s /usr/lib/systemd/system/multi-user.target /etc/systemd/system/default.target
#shutdown -r now
rm -f /etc/systemd/system/default.target
ln -s /usr/lib/systemd/system/graphical.target /etc/systemd/system/default.target

dmesg  |  grep  error


echo  LAB2_start >> $gamen
echo  LAB2_start
echo  LAB2_start 1>&2

#GUI no kawaridesu
useradd user1
passwd user1 --stdin << E
ngn-sf
ngn-sf
E

#GUI no kawaridesu
groupadd linux
usermod -G linux user1

useradd  user2
passwd  --stdin user2 << E
ngn-sf
ngn-sf
E

groupadd  lpic
usermod  -G  lpic  user2
cat  /etc/group  |  grep  lpic
cat  /etc/passwd  |  grep  ^root  |  tee  kekka.txt



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

fdisk /dev/sda << E
n


+100M
n


+100M
w
E
partprobe

mke2fs  /dev/sda6
mkdir  /linux-filesys1
ls  -l  /linux-filesys1
mount  /dev/sda6  /linux-filesys1/
mount
echo  “filesystem test”  >>  /linux-filesys1/testfile.txt
cat  /linux-filesys1/testfile.txt
echo "/dev/sda6  /linux-filesys1 ext2 defaults 0 0" >> /etc/fstab
umount  /linux-filesys1
tune2fs  -j  /dev/sda6
mount  /dev/sda6  /linux-filesys1
mount
mkfs.ext4 /dev/sda7
mkdir  /linux-filesys2
ls  -l  /linux-filesys2
mount  /dev/sda7  /linux-filesys2
echo "/dev/sda7  /linux-filesys2 ext4 defaults 0 0" >> /etc/fstab
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


echo  LAB7_start >> $gamen
echo  LAB7_start
echo  LAB7_start 1>&2

useradd  lpic
passwd  --stdin lpic << E
ngn-sf
ngn-sf
E
#sed -i -e "s/home                   ext4    defaults/home                   ext4    defaults,usrquota/" /etc/fstab
sed -i -e "s/ext2 defaults/ext2 defaults,usrquota/" /etc/fstab
mount  -o  remount  /linux-filesys1
quotacheck  -cm  /linux-filesys1
quotaon  /linux-filesys1
setquota -u lpic 0 0 30 30 -a
chmod 777 /linux-filesys1
su -l lpic -c "touch /linux-filesys1/file{01..35}"

echo  LAB8_start >> $gamen
echo  LAB8_start
echo  LAB8_start 1>&2

dd  if=/dev/zero  of=file1  bs=1024  count=1000
dd  if=/dev/zero  of=file2  bs=1024  count=1000
dd  if=/dev/zero  of=file3  bs=1024  count=1000
dd  if=/dev/zero  of=file4  bs=1024  count=1000
dd  if=/dev/zero  of=file5  bs=1024  count=1000
dd  if=/dev/zero  of=file6  bs=1024  count=1000
tar  cvf  fileA.tar  file1  file2  file3
tar  cvf  fileB.tar  file4  file5  file6
ls  -l  file*.tar
rm  -f  file?
gzip  fileA.tar
ls  -l  fileA.tar.gz
bzip2  fileB.tar
ls  -l  fileB.tar.bz2
gunzip  fileA.tar.gz
ls  -l  fileA.tar*
bzip2  -d  fileB.tar.bz2
ls  -l  fileB.tar*
tar  tvf  fileA.tar
tar  xvf  fileA.tar
tar  xvf  fileB.tar
ls  file*
ls  -l  file*
ls  file1  file2  file3  |  cpio  -oa  >  fileA.cpio
ls  -l  fileA.cpio
cpio  -it  <  fileA.cpio
rm -f { file1 , file2 , file3 }
ls  -l  file*
cpio  -idm  <  fileA.cpio
ls  -l  file*
mount  |  grep  /linux-filesys1
ls  /linux-filesys1
dump  -0uf  /tmp/linux-filesys1.dump  /linux-filesys1
ls  -l  /tmp/linux-filesys1.dump
rm  -rf  /linux-filesys1/*
ls  /linux-filesys1
cd  /linux-filesys1
restore  -rf  /tmp/linux-filesys1.dump
ls

echo  LAB9_start >> $gamen
echo  LAB9_start
echo  LAB9_start 1>&2

cd ~
tar xzvf gtypist-2.9.tar.gz
cd  ./gtypist-2.9/
./configure
ls  -l  Makefile
make
make  install
gtypist -v
cd ~
rpm  -ihv  dvd+rw-tools-7.1-15.el7.x86_64.rpm
dvd+rw-mediainfo /dev/cdrom
yum -y install dstat
dstat -h

echo  LAB10_start >> $gamen
echo  LAB10_start
echo  LAB10_start 1>&2

xclock
ps  ax  |  grep  xclock
ps  ax  |  grep  xclock
#kill  -9  10301
pkill xclock
#xclock  &
jobs
#fg  1
#bg  1
top -v
touch  a.txt
nice  -n  -20  vi  a.txt &
ps  -el  |  grep  vi
ps  ax  |  grep  vi
#renice  19  10490
ps  -el  |  grep  vi


echo  LAB11_start >> $gamen
echo  LAB11_start
echo  LAB11_start 1>&2

#Lab11 check shitemasen
#非常時のログイン方法
#⇒webサーバの構築
ip addr show
yum -y install httpd
touch /var/www/html/index.html
#vim /var/www/html/index.html
echo "<html><body>好きな文字</body></html>" >> /var/www/html/index.html
systemctl start httpd
systemctl status httpd
firefox http://127.0.0.1

#間違って下の行を消さないように！(標準出力の初期化)

exec 1>> $gamen
exec 2>> $gamen
