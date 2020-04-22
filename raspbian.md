## SD Card

Flash the raspbian image to the SD Card.

Edit `/boot/config.txt` :
```
# Use 64 bits kernel, probably bad for a Pi 3
#arm_64bit=1

# Assign the minimum amount of memory to the GPU
gpu_mem=16

# Disable overscan
disable_overscan=1

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
apt-config dump | grep -we Recommends -e Suggests | sed s/1/0/ | sudo tee /etc/apt/apt.conf.d/99recommends
```
Check the settings with 
```
apt-config dump | grep -we Recommends -e Suggests
```
Upgrade everything
```
sudo apt full-upgrade
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

## Oh My Zsh
```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## grml zsh
```
wget -O .zshrc https://git.grml.org/f/grml-etc-core/etc/zsh/zshrc
```

## Pi-hole
Install
```
curl -sSL https://install.pi-hole.net | bash
```
Blocklists
```
https://raw.githubusercontent.com/deathbybandaid/piholeparser/master/Subscribable-Lists/ParsedBlacklists/uBlockFiltersPlus.txt
https://raw.githubusercontent.com/deathbybandaid/piholeparser/master/Subscribable-Lists/ParsedBlacklists/EasyList.txt
https://raw.githubusercontent.com/deathbybandaid/piholeparser/master/Subscribable-Lists/ParsedBlacklists/EasyList-Liste-FR.txt
https://raw.githubusercontent.com/deathbybandaid/piholeparser/master/Subscribable-Lists/ParsedBlacklists/PeterLowes.txt
```

## Resizing the root partition
As final adjustments, it's a good idea to resize the ext4 root partition so we don't run out of disk space. This is usually done automatically by raspbian but for the sake of simplicity I've excluded the script from my build.

With fdisk:
Delete the root partiton.
Recreate the root partition while preserving the ext4 signature.
Afterwards, the system should be rebooted and the root partition be resized using resize2fs.
```
sudo reboot
sudo resize2fs /dev/mmcblk0p2
```
