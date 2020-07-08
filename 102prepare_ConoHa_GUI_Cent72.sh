kill `cat /var/run/yum.pid`
wait 5

systemctl disable packagekit.service
systemctl stop packagekit.service

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
wget -O gtypist-2.9.tar.gz https://github.com/dummyotsuka/101setup/blob/master/gtypist-2.9.tar.gz?raw=true
yumdownloader dvd+rw-tools
#wget -O dvd+rw-tools-7.1-15.el7.x86_64.rpm https://github.com/dummyotsuka/101setup/blob/master/dvd+rw-tools-7.1-15.el7.x86_64.rpm?raw=true
yum -y install zlib-devel
yum -y install ncurses-devel
yum -y install dump
rpm -e dvd+rw-tools
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

yum -y groupinstall "GNOME Desktop"

yum -y install epel-release
yum -y install xrdp
yum -y install tigervnc-server
systemctl enable xrdp
yum -y install ansible

systemctl set-default graphical.target
systemctl disable firewalld

echo "export LANG=ja_JP.UTF-8" >> /etc/bashrc

shutdown -h now


