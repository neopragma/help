# Notes about system issues

These are issues I encounter from time to time when configuring systems. Rather than re-Google every time, I've collected some notes here so I can find them quickly when necessary.

## apt-get

#### Problem

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

#### Problem

```shell
dpkg: status database area is locked by another process while trying to install
```

#### Solution

```shell
sudo rm /var/lib/dpkg/lock
sudo dpkg --configure -a
```

## X-windows

#### Problem

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

Now create a mode using the result produced by gtf, add it to the table, and set the screen resolution. Note that VBOX0 is the identifier to use for VirtualBox. The identifier for your configuration may be different.

```shell
xrandr --newmode "1440x900_59.90"  106.29  1440 1520 1672 1904  900 901 904 932  -HSync +Vsync
xrandr --addmode VGA 1440x900_59.90
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

## yum

#### Problem

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

