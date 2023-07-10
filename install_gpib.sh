# Steps to make gpib work in linux os.

## gpib-usb driver

# driver download link:
# https://linux-gpib.sourceforge.io/

# References :
# https://tomverbeure.github.io/2023/01/29/Installing-Linux-GPIB-Drivers-for-the-Agilent-82357B.html

echo "install dependenceis..."
sudo apt-get install linux-headers-$(uname -r)
sudo apt-get install automake fxload libtool m4 python3 autoconf autogen -y
pip install gpib-ctypes -U
pip install pyusb -U
pip install pyserial -U
pip install pyvisa -U
pip install pyvisa-py -U

echo "download linux-gpib"
# wget https://sourceforge.net/projects/linux-gpib/files/linux-gpib%20for%203.x.x%20and%202.6.x%20kernels/4.3.5/linux-gpib-4.3.5.tar.gz
echo "unpack"

tar -xvf *.tar.gz
cd linux-gpib-4.3.5
tar -xvf linux-gpib-user-4.3.5.tar.gz
tar -xvf linux-gpib-kernel-4.3.5.tar.gz

cd linux-gpib-kernel-4.3.5
make
sudo make install
kernel=$(uname -r)

cd ../..

cd "linux-gpib-4.3.5/linux-gpib-user-4.3.5/"
./bootstrap
./configure --sysconfdir=/etc
sudo make install

ls -a /etc/udev/rules.d
echo "edit the /etc/udev/rules.d/98-gpib-generic.rules file. Put the correct user on GROUP"
sudo gedit /etc/udev/rules.d/98-gpib-generic.rules


echo "Install the Agilent 82357B firmware in the right location"
# wget --content-disposition --no-check-certificate http://linux-gpib.sourceforge.net/firmware/gpib_firmware-2008-08-10.tar.gz
tar xvfz gpib_firmware-2008-08-10.tar.gz
cd ../../
cd gpib_firmware-2008-08-10
sudo cp -r * /usr/local/share/usb
