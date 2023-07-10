# gpib-linux

Steps to make gpib work in linux os.


## gpib-usb driver 

Driver downloaded from [link](https://sourceforge.net/projects/linux-gpib/files/linux-gpib%20for%203.x.x%20and%202.6.x%20kernels/):

Run the script [install_gpib.sh](install_gpib.sh) to install and, if your system update to a new kernel run [install_gpib_after_udpate.sh](install_gpib_after_update.sh) for the driver to work again.

<!-- ## using pyvisa

- install pyvisa: `python -m pip install pyvisa`
- install pyserial: `python -m pip install pyserial`
- install pyusb:`python -m pip install pyusb`
- install linux-gpib or gpib-ctypes `python -m pip install gpib-ctypes` -->
