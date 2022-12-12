# Help Contents

* [Git and related tools and services](git.md)
    * [git](git.md#git)
        * [change default branch to main](git.md#change-default-branch-to-main)
        * [hprof file prevents push](git.md#hprof-file-prevents-push)
        * [rename master branch to main](git.md#rename-master-branch-to-main)
        * [stop tracking files](git.md#stop-tracking-files)
    * [github](git.md#github)
        * [list your repositories](git.md#list-your-repositories)
        * [personal access token](git.md#personal-access-token)
* [Gnome desktop](gnome.md)
    * [disable overlay scrollbars](gnome.md#disable-overlay-scrollbars)
    * [disable screen timeout](gnome.md#disable-screen-timeout)
    * [gnomekeyring for github](gnome.md#gnomekeyring-for-github)
* [Gradle](gradle.md)
    * [recompile with xlint](gradle.md#recompile-with-xlint)
    * [update_gradle_from_command_line](gradle.md#update-gradle-from-command-line)
* [Linux and Unix: General](linux-unix.md)
    * [diff](linux-unix.md#diff)
        * [diff zipped files](linux-unix.md#diff-zipped-files)
    * [Replace string recursively ignore hidden files](linux-unix.md#replace-string-recursively-ignore-hidden-files)

* [Linux: Debian and derivatives](linux-debian.md)
    * [apport](linux-debian.md#apport)
        * [Disable bogus crash reports](linux-debian.md#apport-disable)
    * [Application menu display problem](linux-debian.md#application-menu-display-problem)
    * [apt](linux-debian.md#apt)
        * [Encountered a section with no package header](linux-debian.md#encountered-a-section-with-no-package-header)
        * [Problem with MergeList...](linux-debian.md#package-list-corrupted)
    * [Boot to command line](linux-debian.md#boot-to-command-line)
    * [Deactivate suspend, hibernate, and hybrid-suspend](linux-debian.md#deactivate-suspend)
    * [Determine the Ubuntu version](linux-debian.md#determine-the-ubuntu-version)
    * [Determine the types of filesystems](linux-debian.md#determine-the-types-of-filesystems)
    * [dpkg](linux-debian.md#dpkg)
        * [Status database area locked...](linux-debian.md#status-database-area-locked)
    * [Enable ssh connection as root](linux-debian.md#enable-ssh-connection-as-root)
    * [HP printer drivers](linux-debian.md#hp-printer-drivers)
    * [Format USB stick NTFS for Ubuntu](linux-debian.md#format-usb-stick-ntfs-for-ubuntu)
    * [NTFS filesystem is read-only Ubuntu](linux-debian.md#ntfs-filesystem-is-read-only-ubuntu)
    * [PostgreSQL install on Ubuntu](linux-debian.md#postgresql-install-on-ubuntu)
    * [ULauncher install on Ubuntu](linux-debian.md#ulauncher-install-on-ubuntu)
    * [Wired networking disabled on boot](linux-debian.md#wired-networking-disabled-on-boot)
* [OSX](osx.md)
    * [Add divider to Dock](osx.md#add-divider-to-dock)
    * [.DS_Store](osx.md#ds_store)
        * [Disable writing DS_Store files on network volumes](osx.md#disable-writing-ds_store-files-on-network-volumes)
        * [Remove all .DS_Store files system-wide](osx.md#remove-all-ds_store-files-system-wide)
        * [Remove .DS_Store files recursively](osx.md#remove-ds_store-files-recursively)
    * [File is in use by macos and cannot be opened](osx.md#file-is-in-use)
    * [Hidden files](osx.md#hidden-files)
    * [HP printer drivers for OSX](osx.md#hp-printer-drivers-for-osx)
    * [NTFS filesystem is read-only](osx.md#ntfs-filesystem-readonly)
    * [Make an app out of a shell script](osx.md#make-an-app-out-of-a-shell-script)
    * [Replace strings in files recursively](osx.md#replace-strings-in-files-recursively)
* [rvm](#rvm)
    * [rvm install gets permission denied errors](#rvm-install-gets-permission-denied-errors)
* [VisualStudio](#visualstudio)
    * [Nuget executable not found](#nuget-executable-not-found)
    * [NUnit tests not discovered](#nunit-tests-not-discovered)
* [VMWare Fusion](#vmware-fusion)
    * [Fusion 10 does not start correctly on OSX 10.12](#fusion-10-does-not-start-correctly-on-osx-1012)
* [Windows](#windows)
    * [Equivalent of kill command](#equivalent-of-kill-command)
    * [Equivalent of touch command](#equivalent-of-touch-command)
    * [HP printer drivers for Windows](#hp-printer-drivers-for-windows)
    * [Open command line elevated](#command-line-elevated)
* [Windows Subsystem for Linux](#windows-subsystem-for-linux)
    * [Access Windows files from Linux](#access-windows-files-from-linux)
    * [Access Linux files from Windows](#access-linux-files-from-windows)
* [Wordpress](#wordpress)
    * [Delete all unapproved comments](#delete-all-unapproved-comments)
* [X-windows](#x-windows)
    * [Wrong screen resolution](#wrong-screen-resolution)
* [yum](#yum)
    * [Yum lock is held by another process](#yum-lock-is-held)


## rvm

### rvm install gets permission denied errors

This happens on Ubuntu using apt. Usually logging out and back in again clears it up.

If that doesn't work, run ```sudo apt update``` and look for any errors (even if unrelated to rvm). Remove any offending entries from ```/etc/apt/sources.list``` and files under ```/etc/apt/sources.list.d```.


## VisualStudio

### Nuget executable not found

VisualStudio can't find a nuget.exe when it tries to build a project.

Solution: Download a nuget.exe from https://dist.nuget.org/index.html

### NUnit tests not discovered

When you run tests, it says there are no NUnit tests to run.

Solution: 
* In VisualStudio, go to Tools => Extensions and Updates
* Search for "nunit"
* Look for the NUnit 3 Test Adapter and install it


## VMWare Fusion

### Fusion 10 does not start correctly on OSX 10.12

VMWare Fusion 10 starts in a corrupted state when opened via clicking its icon. Workaround is to start it from a command line:

```
/Applications/VMware\ Fusion.app/Contents/MacOS/VMware\ Fusion
```


## Windows

### Equivalent of kill command

Find out what command options are available:

```shell
taskkill /?
```

Kill a process by name:

```shell
taskkill /im myprocess.exe /f
```

Kill a process by PID:

```shell
taskkill /pid 1234 /f
```

### Equivalent of touch command

```shell
type nul > filename & copy filename +,,
```

### HP printer drivers for Windows

Go to http://support.hp.com/us-en/drivers

Enter the printer model name/number.

Choose 'Microsoft Windows' as the operating system and select the version number.

It will take you to a download page. The file you download will be an .exe you can run to install the driver.

### Command line elevated

Open a standard command-line window

Enter

```shell
powershell
```

At the PS prompt, enter

```shell
Start-Process cmd -Verb RunAs
```

A second command-line window opens running with Administrator privileges.

## Windows Subsystem for Linux 

### Access Windows Files from Linux

Your Windows C: drive is located at /mnt/c.

### Access Linux Files from Windows

In Windows, enter \\wsl$ in the address bar of Windows Explorer. It will show a list of installed Linux instances. You can navigate through them using Explorer.

On a WSL command line, enter "explorer.exe ." to open Windows Explorer in the current directory.

## Wordpress

### Delete all unapproved comments

1. Go to phpmyadmin in your control panel (based on your hosting plan)

2. Click your Word Press database link

3. Click on the comments table (You can click browse to view all the approved and unapproved comments)

4. Click the mySQL tab. This will open up a query box. Delete the default query and type in:

DELETE FROM wp_comments WHERE comment_approved = 0

5. Click go, this will delete all the unapproved comments

## X-windows

### Wrong screen resolution

When running as a guest OS in a virtual machine (VM), the OS does not recognize the screen resolutions available on the actual hardware. The xorg video driver normally discovers the optimal screen resolution and sets it automatically, but this does not always happen when you set up a guest OS in a VM. The cause may be related to hardware, the host OS or video drivers, the guest OS, the VM's video driver, or a configuration error that you cannot find. 

### Solution

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

### References

* Debian/Ubuntu: http://ubuntuforums.org/showthread.php?t=1112186
* Debian/Ubuntu: http://askubuntu.com/questions/1220/how-can-i-restart-x-server-from-the-command-line
* Fedora/RedHat: http://forums.fedoraforum.org/showpost.php?p=1120206&postcount=2
* Fedora/RedHat: http://fedoraproject.org/wiki/SysVinit_to_Systemd_Cheatsheet
* FreeBSD: http://lists.freebsd.org/pipermail/freebsd-questions/2012-October/245323.html
* Solaris: http://www.unix.com/solaris/180317-starting-x-solaris-11-a.html
* Solaris: http://docs.oracle.com/cd/E23823_01/html/816-5166/svcadm-1m.html

## yum

### Yum lock is held

```shell
Another app is currently holding the yum lock; waiting for it to exit...
The other application is: yum
```

This means an instance of yum is hanging around in the background. You can't do anything with it.

### Solution

```shell
sudo killall yum
sudo rm /var/run/yum.pid
```

