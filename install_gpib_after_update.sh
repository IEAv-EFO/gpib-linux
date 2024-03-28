#!/bin/sh
# Steps to make gpib work in linux os.

## gpib-usb driver

# driver download link:
# https://linux-gpib.sourceforge.io/

# References :
# https://tomverbeure.github.io/2023/01/29/Installing-Linux-GPIB-Drivers-for-the-Agilent-82357B.html



# cd linux-gpib-4.3.5/linux-gpib-kernel-4.3.5

echo "remove ond compiled files"

sudo rm linux-gpib-4.3.6 -R

echo "unpack"

tar -xvf linux-gpib-4.3.6.tar.gz
cd linux-gpib-4.3.6
#tar -xvf linux-gpib-user-4.3.6.tar.gz
tar -xvf linux-gpib-kernel-4.3.6.tar.gz

cd linux-gpib-kernel-4.3.6
make 
sudo make install
kernel=$(uname -r)

cd ../..

# cd "linux-gpib-4.3.6/linux-gpib-user-4.3.6/"
# ./bootstrap
# ./configure --sysconfdir=/etc
# sudo make install

# cd ../../



# sudo modprobe agilent_82375a
# sudo modprobe agilent_82350b

