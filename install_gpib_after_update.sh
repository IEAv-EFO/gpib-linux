#!/bin/sh
# Steps to make gpib work in linux os.

## gpib-usb driver

# driver download link:
# https://linux-gpib.sourceforge.io/

# References :
# https://tomverbeure.github.io/2023/01/29/Installing-Linux-GPIB-Drivers-for-the-Agilent-82357B.html



# cd linux-gpib-4.3.5/linux-gpib-kernel-4.3.5
cd linux-gpib-4.3.6/linux-gpib-kernel-4.3.6
make
sudo make install
kernel=$(uname -r)

sudo modprobe agilent_82375a
sudo modprobe agilent_82350b
