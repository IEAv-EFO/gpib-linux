# gpib-linux

Necessary drivers and instructions to use GPIB to USB converters in Linux OS.


# Instructions

Driver downloaded from [link](https://sourceforge.net/projects/linux-gpib/files/linux-gpib%20for%203.x.x%20and%202.6.x%20kernels/).

Run the script [install_gpib.sh](install_gpib.sh) to install drivers and if your system update to a new kernel run [install_gpib_after_udpate.sh](install_gpib_after_update.sh) for the driver to work again.

# How to use

After the driver installation is completed, one can communicate with the instruments from the linux terminal by using `ibtest` or any visa communication library such as `pyvisa`.

# Potential problems at the time of installation
## gpib.conf not find libgpib.so.0"
the solution it is create a symbolic link whith:
```
sudo ln -s /usr/local/lib/libgpib.so.0 /lib/libgpib.so.0"
sudo gpib_config
```


# References
 [driver download link:](https://linux-gpib.sourceforge.io/)

This scripts are base on tutorial of [tomverbeure](https://github.com/tomverbeure) on [webpage](https://tomverbeure.github.io/2023/01/29/Installing-Linux-GPIB-Drivers-for-the-Agilent-82357B.html)

