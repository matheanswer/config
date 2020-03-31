## SD Card

Flash the raspbian image to the SD Card

To assign the minimum amount of memory to the GPU, disable bluetooth and wifi, replace `/boot/config.txt` with
```
gpu_mem=16
dtoverlay=disable-bt
dtoverlay=disable-wifi
```
Enable SSH with `touch /boot/ssh`

Insert the SD card into the Pi, plug the power and SSH into it with user `pi` and password `raspberry`

## Bridge

Add this to `/etc/network/interfaces` to create a `br0` bridge over the `eth0` interface
```
auto br0
iface br0 inet dhcp
	bridge_ports eth0
	bridge_fd 0
	bridge_maxwait 0
iface eth0 inet manual
```
Then start the bridge wiht `sudo ifup br0`

## Packages
Prevent `apt` from installing recommended and suggested packages by adding the following to `/etc/apt/apt.conf`
```
APT::Install-Recommends "0" ;
APT::Install-Suggests "0" ;
```
Disable useless services with 
