# Notes about system issues

These are issues I encounter from time to time when configuring systems. Rather than re-Google every time, I've collected some notes here so I can find them quickly when necessary.

* [apport](#apport)
    * [Disable bogus crash reports](#apport-disable)
* [apt-get](#apt-get)
    * [Problem with MergeList...](#package-list-corrupted)
* [dpkg](#dpkg)
    * [Status database area locked...](#status-database-area-locked)
* [OSX](#osx)
    * [NTFS filesystem is read-only](#ntfs-filesystem-readonly)
    * [Make an app out of a shell script](#make-an-app-out-of-a-shell-script)
* [Ubuntu](#ubuntu)
    * [Determine the Ubuntu version](#determine-the-ubuntu-version)
    * [Determine the types of filesystems](#determine-the-types-of-filesystems)
    * [NTFS filesystem is read-only Ubuntu](#ntfs-filesystem-is-read-only-ubuntu)
* [Windows](#windows)
    * [Equivalent of touch command](#equivalent-of-touch-command)
* [X-windows](#x-windows)
    * [Wrong screen resolution](#wrong-screen-resolution)
* [yum](#yum)
    * [Yum lock is held by another process](#yum-lock-is-held)

## apport

### apport-disable

Edit /etc/default/apport

Change enabled=1 to enabled=0

## apt-get

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

## dpkg

#### Status database area locked

```shell
dpkg: status database area is locked by another process while trying to install
```

#### Solution

```shell
sudo rm /var/lib/dpkg/lock
sudo dpkg --configure -a
```

## OSX

#### NTFS filesystem readonly

OS X mounts external NTFS drive as read-only. 

#### Solution

Connect the NTFS drive to the Mac. Open Terminal and find the UUID of the drive:

```shell
diskutil info /Volumes/DRIVENAME | grep UUID
```

Add a line to ```/etc/fstab``` to define the drive as read-write:

```shell
sudo echo "UUID=ENTER_UUID_HERE none ntfs rw,auto,nobrowse" >> /etc/fstab
```

An icon for the drive will not appear on the Desktop automatically. You can open a Finder window like this:

```shell
open /Volumes
```

You can define a symlink for a Desktop icon like this:

```Shell
sudo ln -s /Volumes/DRIVENAME ~/Desktop/DRIVENAME
```

#### Make an app out of a shell script

1. Write the shell script.
2. In Automator, choose ```run shell script``` and write a one-liner to execute the shell script.
3. Choose ```File``` -> ```Convert to...```, then choose ```Application```.
4. Find a suitable icon and make an ```.icns``` file with it.
5. Right-click on the app file and choose ```Get Info```.
6. Paste the icon over the small icon image located in the upper left-hand corner of the ```Info``` dialog.

## Windows

#### Equivalent of touch command

```shell
type nul > filename & copy filename +,,
```

## X-windows

#### Wrong screen resolution

When running as a guest OS in a virtual machine (VM), the OS does not recognize the screen resolutions available on the actual hardware. The xorg video driver normally discovers the optimal screen resolution and sets it automatically, but this does not always happen when you set up a guest OS in a VM. The cause may be related to hardware, the host OS or video drivers, the guest OS, the VM's video driver, or a configuration error that you cannot find. 

#### Solution

Find out the maximum framebuffer size supported on the host system (not the VM):

```shell
xrandr | grep maximum
```

On the guest OS (running in the VM), create a mode for the resolution and refresh rate you want. I typically make this a little smaller than the resolution I'm using on the host OS, so it will fit within the VM window with no scrolling necessary. This command will generate a mode line:

```shell
gtf 1440 900 59.9
```

Now create a mode using the result produced by gtf, add it to the table, and set the screen resolution. 

- The identifier for VirtualBox is VBOX0
- The identifier for VMware is Virtual1

```shell
xrandr --newmode "1440x900_59.90"  106.29  1440 1520 1672 1904  900 901 904 932  -HSync +Vsync
xrandr --addmode VBOX0 1440x900_59.90
xrandr --output VBOX0 --mode 1440x900_59.90
```

To make the setting persistent, create the file ```/etc/X11/xorg.conf``` and edit it to correspond with the desired video settings:

```shell
sudo Xorg -configure :1
sudo cp /root/xorg.conf.new /etc/X11/xorg.conf
```

Edit ```/etc/X11/xorg.conf``` with root privileges.

Restart Xorg service. Procedure differs by OS and distro; see references or Google it.

#### References

* Debian/Ubuntu: http://ubuntuforums.org/showthread.php?t=1112186
* Debian/Ubuntu: http://askubuntu.com/questions/1220/how-can-i-restart-x-server-from-the-command-line
* Fedora/RedHat: http://forums.fedoraforum.org/showpost.php?p=1120206&postcount=2
* Fedora/RedHat: http://fedoraproject.org/wiki/SysVinit_to_Systemd_Cheatsheet
* FreeBSD: http://lists.freebsd.org/pipermail/freebsd-questions/2012-October/245323.html
* Solaris: http://www.unix.com/solaris/180317-starting-x-solaris-11-a.html
* Solaris: http://docs.oracle.com/cd/E23823_01/html/816-5166/svcadm-1m.html

## Ubuntu

#### Determine the Ubuntu version

```shell
lsb_release -a
```

#### Determine the types of filesystems

```shell
df -T
```

#### NTFS filesystem is read-only Ubuntu

```
sudo apt-get install ntfs-3g
```

## yum

#### Yum lock is held

```shell
Another app is currently holding the yum lock; waiting for it to exit...
The other application is: yum
```

This means an instance of yum is hanging around in the background. You can't do anything with it.

#### Solution

```shell
sudo killall yum
sudo rm /var/run/yum.pid
```

