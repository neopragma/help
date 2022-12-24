# Notes for Debian Linux and derivatives 

[Contents](contents.md) | [KWIC Index](kwic-index.md)

* [apport](#apport)
    * [Disable bogus crash reports](#apport-disable)
* [Application menu display problem](#application-menu-display-problem)
* [apt](#apt)
    * [Encountered a section with no package header](#encountered-a-section-with-no-package-header)
    * [Problem with MergeList...](#package-list-corrupted)
* [Boot to command line](#boot-to-command-line)
* [Deactivate suspend, hibernate, and hybrid-suspend](#deactivate-suspend)
* [Determine the Ubuntu version](#determine-the-ubuntu-version)
* [Determine the types of filesystems](#determine-the-types-of-filesystems)
* [dpkg](#dpkg)
    * [Status database area locked...](#status-database-area-locked)
* [Enable ssh connection as root](#enable-ssh-connection-as-root)
* [Format USB stick NTFS for Ubuntu](#format-usb-stick-ntfs-for-ubuntu)
* [HP printer drivers](#hp-printer-drivers)
* [NTFS filesystem is read-only Ubuntu](#ntfs-filesystem-is-read-only-ubuntu)
* [PostgreSQL install on Ubuntu](#postgresql-install-on-ubuntu)
* [Printer definition will not go away](linux-debian.md#printer-definition-will-not-go-away)
* [rvm](#rvm)
    * [rvm install gets permission denied errors](#rvm-install-gets-permission-denied-errors)
* [ULauncher install on Ubuntu](#ulauncher-install-on-ubuntu)
* [Wired networking disabled on boot](#wired-networking-disabled-on-boot)

### apport

#### apport-disable

Edit /etc/default/apport

Change enabled=1 to enabled=0

### apt

#### Encountered a section with no package header

```shell
sudo rm /var/lib/apt/lists/* -vf
sudo apt update
```

#### Package list corrupted

```shell
E: Problem with MergeList /var/lib/apt/lists/[foo]
E: The package lists or status file could not be parsed or opened.
```

This means the local package list has been corrupted.

#### Solution

```shell
sudo rm /var/lib/apt/lists/* -vf
sudo apt-get update
```

#### Alternate solution

```shell
sudo mv /var/lib/apt/lists /var/lib/apt/lists-old
sudo mkdir -p /var/lib/apt/lists/partial
sudo apt-get update
```

#### Alternate solution

```shell
sudo apt-get clean
sudo apt-get update
```

#### References

* http://askubuntu.com/questions/30072/how-do-i-fix-a-problem-with-mergelist-or-status-file-could-not-be-parsed-err

### dpkg

#### Status database area locked

```shell
dpkg: status database area is locked by another process while trying to install
```

#### Solution

```shell
sudo rm /var/lib/dpkg/lock
sudo dpkg --configure -a
```



### Application menu display problem

For some applications, menus don't show up on Ubuntu (I think 13.04 onward) and the application window appears to be shoved up into the top of the screen. To fix this, set environment variable ```UBUNTU_MENUPROXY``` to 0 or to nothing. You can do it on the command line or in a ```.desktop``` file.

```shell
UBUNTU_MENUPROXY=0 appname
```

### Boot to command line

Set up Ubuntu 15.x and later to boot to a command line by default, edit ```/etc/default/grub```

comment the line
```shell
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
```

Add lines:

```shell 
GRUB_CMDLINE_LINUX="text"
GRUB_CMDLINE_LINUX_DEFAULT="text"
```

Save the file and run the following commands:

```shell
sudo update-grub
sudo systemctl enable multi-user.target --force
sudo systemctl set-default multi-user.target
sudo reboot
```

When you want the graphical interface:

```shell
sudo service lightdm start
```

It will default to the screen resolution you last saved. To see what display resolutions are available on the connected display device:

```shell
xrandr
```

To set the display resolution appropriately for the connected display device:

```shell
xrandr --output `xrandr | grep " connected"|cut -f1 -d" "` --mode 1920x1080
```

### Deactivate suspend 

"Turn off" suspend, hibernate, and hybrid suspend in Linux.

```shell
sudo systemctl mask \
    sleep.target \
    suspend.target \
    hibernate.target \
    hybrid-sleep.target

sudo systemctl restart systemd-logind.service
```

Check status: 

```shell 
systemctl status sleep.target suspend.target hibernate.target hybrid-sleep.target
```    

Reactive these features: 

```shell 
sudo systemctl unmask sleep.target suspend.target hibernate.target hybrid-sleep.target
```

What does this actually do? 

The mask command does this: 

```shell 
Created symlink /etc/systemd/system/sleep.target → /dev/null.
Created symlink /etc/systemd/system/suspend.target → /dev/null.
Created symlink /etc/systemd/system/hibernate.target → /dev/null.
Created symlink /etc/systemd/system/hybrid-sleep.target → /dev/null.
```

The unmask command does this: 

```shell 
Removed /etc/systemd/system/sleep.target.
Removed /etc/systemd/system/suspend.target.
Removed /etc/systemd/system/hibernate.target.
Removed /etc/systemd/system/hybrid-sleep.target.
```


### Determine the Ubuntu version

```shell
lsb_release -a
```

### Determine the types of filesystems

```shell
df -T
```

### Enable ssh connection as root

Edit /etc/ssh/sshd_config:

```shell
PermitRootLogin yes
```

Restart sshd

```shell
/etc/init.d/ssh restart
```

Set root password if there isn't one

```shell
sudo passwd root
```

### Format USB stick NTFS for Ubuntu

Insert the USB stick. If it's a new one that's preformatted FAT32, Ubuntu will add it to the device list but not mount it.

Run ```dmesg``` or ```df -h``` and find the device name. It will be something like ```sdb1```.

Now run

```shell
sudo mkfs.ntfs /dev/sdb1
```

Now the USB stick will be accessible with ```ntfs-3g```.

### HP printer drivers

Find out what version of HPLIP is installed:

```shell
dpkg -l hplip
```

Install HPLIP

```shell
sudo apt-get install hplip
```

### NTFS filesystem is read-only Ubuntu

```
sudo apt-get install ntfs-3g
```

### PostgreSQL install on Ubuntu

The basic installation instructions here are useful: https://www.howtoforge.com/tutorial/ubuntu-postgresql-installation/

Then do this:

```shell
sudo cp /etc/postgresql/*/main/postgresql.conf ./postgresql.conf.orig
sudo cp /etc/postgresql/*/main/pg_hba.conf ./pg_hba.conf.orig
sudo cp ./pg_hba.conf /etc/postgresql/*/main
sudo sed -i "/#listen_addresses/c\listen_addresses = \'*\'" /etc/postgresql/*/main/postgresql.conf
```

### Printer definition will not go away 

Edit file /etc/cups/cups-browsed.conf and change the entry for BrowseRemoteProtocols to 'none', e.g.

```shell
BroseRemoteProtocols none
``` 

Save the file and restart the cups service:

```shell
service cups restart
```

### rvm

#### rvm install gets permission denied errors

This happens on Ubuntu using apt. Usually logging out and back in again clears it up.

If that doesn't work, run ```sudo apt update``` and look for any errors (even if unrelated to rvm). Remove any offending entries from ```/etc/apt/sources.list``` and files under ```/etc/apt/sources.list.d```.

### ULauncher install on Ubuntu 

```shell 
sudo add-apt-repository ppa:agornostal/ulauncher 
sudo apt install ulauncher 
```

### Wired networking disabled on boot 

Starting with Ubuntu 20.04, I noticed wired networking was off after startup. This may be the default for some versions of Ubuntu. If you want wired networking on by default on boot, edit file ```/etc/NetworkManager/NetworkManager.conf``` with sudo. Change the line ```managed=false``` to ```managed=true```. Then you can restart or run the following command: 

```shell 
sudo service network-manager restart 
``` 

