kill `cat /var/run/yum.pid`
wait 5

useradd lpic
passwd lpic --stdin << E
ngn-sf
ngn-sf
E

useradd user1
passwd user1 --stdin << E
ngn-sf
ngn-sf
E

yum -y install xclock
yum -y install git
yum -y install gcc
yum -y install zlib-devel
yum -y install ncurses-devel
yum -y install dump
rm -f /etc/systemd/system/default.target
ln -s /usr/lib/systemd/system/graphical.target /etc/systemd/system/default.target
yum -y install gdisk
yum -y install mkisofs

mkdir /tmp/dev/
dd if=/dev/zero of=/tmp/dev/sda1 bs=1M count=10
dd if=/dev/zero of=/tmp/dev/sda2 bs=1M count=10
dd if=/dev/zero of=/tmp/dev/sda3 bs=1M count=10
dd if=/dev/zero of=/tmp/dev/sda4 bs=1M count=10
dd if=/dev/zero of=/tmp/dev/sda5 bs=1M count=10
dd if=/dev/zero of=/tmp/dev/sda6 bs=1M count=10
dd if=/dev/zero of=/tmp/dev/sda7 bs=1M count=10
dd if=/dev/zero of=/tmp/dev/sda8 bs=1M count=10
dd if=/dev/zero of=/tmp/dev/sdb1 bs=1M count=10
dd if=/dev/zero of=/tmp/dev/sdb2 bs=1M count=10
dd if=/dev/zero of=/tmp/dev/sdb3 bs=1M count=10
dd if=/dev/zero of=/tmp/dev/sdb4 bs=1M count=10
dd if=/dev/zero of=/tmp/dev/sdb5 bs=1M count=10
dd if=/dev/zero of=/tmp/dev/sdc1 bs=1M count=10
dd if=/dev/zero of=/tmp/dev/sdc2 bs=1M count=10
dd if=/dev/zero of=/tmp/dev/sdc3 bs=1M count=10
dd if=/dev/zero of=/tmp/dev/sdc4 bs=1M count=10
dd if=/dev/zero of=/tmp/dev/sdc5 bs=1M count=10
dd if=/dev/zero of=/tmp/dev/sdd1 bs=1M count=10
dd if=/dev/zero of=/tmp/dev/sdd2 bs=1M count=10
dd if=/dev/zero of=/tmp/dev/sdd3 bs=1M count=10
dd if=/dev/zero of=/tmp/dev/sdd4 bs=1M count=10
dd if=/dev/zero of=/tmp/dev/sdd5 bs=1M count=10

yum -y groupinstall "Desktop"
yum -y groupinstall "X Window System"
yum -y groupinstall "General Purpose Desktop"
yum -y groupinstall "Japanese Support"
yum -y install epel-release
yum -y install xrdp
yum -y install tigervnc*
#102ではxrdpはLAB1で有効にする
#chkconfig xrdp on

wget http://www.mail-archive.com/xrdp-devel@lists.sourceforge.net/msg00263/km-e0010411.ini
cp km-e0010411.ini /etc/xrdp/km-0411.ini
cp km-e0010411.ini /etc/xrdp/km-e0010411.ini
cp km-e0010411.ini /etc/xrdp/km-e0200411.ini
cp km-e0010411.ini /etc/xrdp/km-e0210411.ini

sed -i -e s/id:3:initdefault:/id:5:initdefault:/ /etc/inittab

rm -f /etc/udev/rules.d/70-persistent-net.rules

yum -y install sshpass

#起動前にOSイメージを取ること(上記MACアドレスファイルの都合)
shutdown -h now
