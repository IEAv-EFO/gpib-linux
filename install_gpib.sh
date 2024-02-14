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

# echo "download linux-gpib"
# wget https://sourceforge.net/projects/linux-gpib/files/linux-gpib%20for%203.x.x%20and%202.6.x%20kernels/4.3.6/linux-gpib-4.3.6.tar.gz
echo "unpack"

tar -xvf linux-gpib-4.3.6.tar.gz
cd linux-gpib-4.3.6
tar -xvf linux-gpib-user-4.3.6.tar.gz
tar -xvf linux-gpib-kernel-4.3.6.tar.gz

cd linux-gpib-kernel-4.3.6
make 
sudo make install
kernel=$(uname -r)

cd ../..

cd "linux-gpib-4.3.6/linux-gpib-user-4.3.6/"
./bootstrap
./configure --sysconfdir=/etc
sudo make install

cd ../../

ls -a /etc/udev/rules.d
echo "edit the /etc/udev/rules.d/98-gpib-generic.rules file. Put the correct user on GROUP"
sudo gedit /etc/udev/rules.d/98-gpib-generic.rules


echo "Install the Agilent 82357B firmware in the right location"
# wget --content-disposition --no-check-certificate http://linux-gpib.sourceforge.net/firmware/gpib_firmware-2008-08-10.tar.gz
# tar -xvf gpib_firmware-2008-08-10.tar.gz

cd gpib_firmware-2008-08-10
sudo cp -r * /usr/local/share/usb




tar xvfz fxload-2008_10_13.tar.gz
cd fxload-2008_10_13
make
sudo make install
cd ..


echo "modify board type on /etc/gpib.config file to 
    interface {
  minor = 0   /* board index, minor = 0 uses /dev/gpib0, minor = 1 uses /dev/gpib1, etc. */
  board_type = "agilent_82357a"   /* type of interface board being used */
  ..." 
sudo gedit /etc/gpib.conf


cd ../..
sudo modprobe gpib_common
sudo modprobe agilent_82357a

echo "Installing the dong. Note, gpib_config dont find libgpib.so.0 file you can run: sudo ln -s /usr/local/lib/libgpib.so.0 /lib/libgpib.so.0"
sudo gpib_config