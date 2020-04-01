## SD Card

Flash the raspbian image to the SD Card.

Edit `/boot/config.txt` :
```
# Use 64 bits kernel, probably bad for a Pi 3
#arm_64bit=1

# Assign the minimum amount of memory to the GPU
gpu_mem=16

# Disable bluetooth (sudo systemctl disable hciuart)
dtoverlay=disable-bt

# Disable wifi
dtoverlay=disable-wifi
```
Create an empty `ssh` file in the boot folder to enable SSH
```
touch /boot/ssh
```
Insert the SD card into the Pi, plug the power and SSH into it with user `pi` and password `raspberry`

## Locale

Set locales with `sudo dpkg-reconfigure locales`

## Packages
If `disable-bt` was set in config.txt
```
sudo systemctl disable hciuart
```
Update apt
```
sudo apt update
```
Prevent `apt` from installing recommended and suggested packages with
```
apt-config dump | grep -we Recommends -e Suggests | sed s/1/0/ | sudo tee /etc/apt/apt.conf.d/99-no-install-recommends
```
Check the settings with 
```
apt-config dump | grep -we Recommends -e Suggests
```
Upgrade everything
```
sudo apt full-upgrade
```
# Minimal
List of services enabled by default for Raspbian Buster Lite (2020-02-13)
```
apt-daily-upgrade.timer
apt-daily.timer
autovt@.service
avahi-daemon.service
avahi-daemon.socket
bluetooth.service
console-setup.service
cron.service
dbus-fi.w1.wpa_supplicant1.service
dbus-org.bluez.service
dbus-org.freedesktop.Avahi.service
dbus-org.freedesktop.timesync1.service
dhcpcd.service
dhcpcd5.service
dphys-swapfile.service
fake-hwclock.service
getty@.service
hciuart.service
keyboard-setup.service
logrotate.timer
man-db.timer
networking.service
nfs-client.target
raspberrypi-net-mods.service
remote-fs.target
rpi-display-backlight.service
rpi-eeprom-update.service
rsync.service
rsyslog.service
ssh.service
sshd.service
sshswitch.service
syslog.service
systemd-timesyncd.service
triggerhappy.service
triggerhappy.socket
wpa_supplicant.service
```
Useless services you can probably disable `sudo systemctl disable` :
avahi-daemon bluetooth wpa_supplicant

Useless packages you can probably remove `sudo apt purge ` :
avahi-daemon bluez cifs-utils nano ncdu ntfs-3g pi-bluetooth raspi-config rfkill wireless-regdb wireless-tools wpasupplicant

Cleaning their dependancies with `sudo apt --purge autoremove` should get rid of :
alsa-utils bind9-host bluez-firmware fuse geoip-database libasound2 libasound2-data libavahi-common-data libavahi-common3 libavahi-core7 libbind9-161 libdaemon0 libdns1104 libfftw3-single3 libfstrm0 libfuse2 libgeoip1 libisc1100 libisccc161 libisccfg163 libiw30 liblmdb0 liblwres161 libntfs-3g883 libprotobuf-c1 libsamplerate0 libtalloc2 libwbclient0 triggerhappy crda iw libnl-3-200 libnl-genl-3-200 libnl-route-3-200 libpcsclite1


Install packages (this doesn't install the recommended samba-vfs-modules that might be useful for samba with macOS)
```
sudo apt install bridge-utils btrfs-progs git glances lxc neofetch vim zsh
```

## Bridge

Add this to `/etc/network/interfaces` to create a `br0` bridge over the `eth0` interface (requires `bridge-utils`)
```
auto br0
iface br0 inet dhcp
	bridge_ports eth0
	bridge_fd 0
	bridge_maxwait 0
iface eth0 inet manual
```
Then start the bridge wiht `sudo ifup br0`
