## SD Card

Flash the raspbian image to the SD Card.

Edit `/boot/config.txt` :
```
# Use 64 bits kernel
#arm_64bit=1

# Assign the minimum amount of memory to the GPU
gpu_mem=16

# Disable bluetooth (sudo systemctl disable hciuart)
dtoverlay=disable-bt

# Disable wifi
dtoverlay=disable-wifi
```
Enable SSH
```
touch /boot/ssh
```
Insert the SD card into the Pi, plug the power and SSH into it with user `pi` and password `raspberry`

## Locale

Set locales with `sudo dpkg-reconfigure locales`

## Packages
Update apt
```
sudo apt update
```
Prevent `apt` from installing recommended and suggested packages with
```
apt-config dump | grep -we Recommends -e Suggests | sed s/1/0/ | sudo tee /etc/apt/apt.conf.d/99norecommends
```
Check the settings with 
```
apt-config dump | grep -we Recommends -e Suggests
```
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

Disable useless services with
```
sudo systemctl disable avahi-daemon bluetooth hciuart wpa_supplicant
```
Useless packages to remove 
```
sudo apt purge avahi-daemon bluez cifs-utils nano ncdu ntfs-3g pi-bluetooth raspi-config rfkill wireless-regdb wireless-tools wpasupplicant
```
Clean dependancies
```
sudo apt --purge autoremove
```
Upgrade everything
```
sudo apt full-upgrade
```
Install packages (this doesn't install the recommended samba-vfs-modules that might be useful for samba with macOS)
```
sudo apt install bridge-utils btrfs-progs git glances lxc neofetch samba vim zsh
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
