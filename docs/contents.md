# Help Contents

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
* [git](#git)
    * [change default branch to main](#change-default-branch-to-main)
    * [hprof file prevents push](#hprof-file-prevents-push)
    * [rename master branch to main](#rename-master-branch-to-main)
    * [stop tracking files](#stop-tracking-files)
* [github](#github)
    * [list your repositories](#list-your-repositories)
    * [personal access token](#personal-access-token)
* [gnome](#gnome)
    * [disable overlay scrollbars](#disable-overlay-scrollbars)
    * [disable screen timeout](#disable-screen-timeout)
    * [gnomekeyring for github](#gnomekeyring-for-github)
* [Gradle](#gradle)
    * [recompile with xlint](#recompile-with-xlint)
    * [update_gradle_from_command_line](#update-gradle-from-command-line)
* [OSX](#osx)
    * [Add divider to Dock](#add-divider-to-dock)
    * [.DS_Store](#ds_store)
        * [Disable writing DS_Store files on network volumes](#disable-writing-ds_store-files-on-network-volumes)
        * [Remove all .DS_Store files system-wide](#remove-all-ds_store-files-system-wide)
        * [Remove .DS_Store files recursively](#remove-ds_store-files-recursively)
    * [File is in use by macos and cannot be opened](#file-is-in-use)
    * [Hidden files](#hidden-files)
    * [HP printer drivers for OSX](#hp-printer-drivers-for-osx)
    * [NTFS filesystem is read-only](#ntfs-filesystem-readonly)
    * [Make an app out of a shell script](#make-an-app-out-of-a-shell-script)
    * [Replace strings in files recursively](#replace-strings-in-files-recursively)
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



## git

### change default branch to main 

```shell
git config --global init.defaultBranch main
```

### hprof file prevents push 

Files named java_pid99999.hprof are due to issues with heap memory being exceeded. If this happens in your project, you won't be able to push to github. Use this command to clean up the local history (substituting the real filename):

```shell 
git filter-branch -f --index-filter 'git rm --cached --ignore-unmatch java_pid26029.hprof' 
``` 

Add this to .gitignore and commit it: 

```shell 
*.hprof 
``` 

### rename master branch to main 

```shell
git branch -m master main
```

### stop tracking files

Symptom: ```git status``` shows files you don't want to track.

Solution: Update ```.gitignore``` with filenames to ignore and then:

```shell
git rm -r --cached .
git add .
git commit -m "Cleaned up cached untracked files"
```

## github

### list your repositories

List the names of your repositories in alphabetical order.

```shell
curl "https://api.github.com/users/$GIT_USER/repos?access_token=$GIT_ACCESS_TOKEN&per_page=1000&type=all" | grep '"name":' | sort
```

### personal access token 

After generating a personal access token on Github, for Ubuntu you must enter this:

```shell
git config --global credential.helper store
```

On the next push, it will prompt for a password. Enter the personal access token instead of your password.

## gnome

### Disable overlay scrollbars

#### Problem

Those pesky overlay scrollbars that are enabled by default in Ubuntu prevent you from grabbing the side of a window to resize it. Seems like you should be able to set this in Settings -> Appearance -> Behavior, but you can't.

#### Solution

```shell
gsettings set org.gnome.desktop.interface ubuntu-overlay-scrollbars false
```

### Disable screen timeout

#### Problem 

Screen times out and locks during presentations, demonstrations, mobbing sessions, etc.

#### Solution 

```shell 
gsettings set org.gnome.desktop.session idle-delay 0
gsettings set org.gnome.desktop.screensaver lock-enabled false
```

### Gnomekeyring for github

#### Problem

How to store the Github Personal Access Token locally on a Linux instance using Gnome Keyring

#### Solution

Install Gnome Keyring dev package

```shell
sudo apt install libgnome-keyring-dev
```

Build credentials helper

```shell
cd /usr/share/doc/git/contrib/credential/gnome-keyring
sudo make
```

Configure local Git to use the credentials helper

```shell
git config --global credential.helper /usr/share/doc/git/contrib/credential/gnome-keyring/git-credential-gnome-keyring
```

On first use, it will prompt for a password for Gnome Keyring. Don't lose track of it!


## Gradle

### Recompile with Xlint 

When working with Java and Gradle, sometimes Gradle issues a warning and suggests recompiling with an -Xlint option, but it does not explain how to do this. You have to add a specification to the build.gradle file as follows.

```shell
tasks.withType(JavaCompile) {
    options.compilerArgs << '-Xlint:unchecked'
    options.deprecation = true
}
```

### Update Gradle from command line 

```shell
./gradlew wrapper --gradle-version 4.10.2
```

## OSX

### Add divider to Dock

```shell
defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'
killall Dock
```

### .DS_Store

#### Disable writing .DS_Store files on network volumes

```shell
defaults write com.apple.desktopservices DSDontWriteNetworkStores true
```

#### Remove all .DS_Store files system-wide

```shell
sudo find / -name ".DS_Store" -depth -exec rm {} \;
```

#### Remove .DS_Store files recursively

```shell
find . -name ‘*.DS_Store’ -type f -delete
```

### File is in use

Creator and type attributes are modified by Finder during a file copy operation. To reset:

```shell
SetFile -c "" -t "" path/to/file
```

If the SetFile command is not installed, do this:

```shell
xcode-select --install
```

### Hidden files

Apple is very serious about keeping hidden files hidden. OSX is far less user-friendly in this regard than any other \*nix system. Do this:

```shell
defaults write -g AppleShowAllFiles -bool true
```

and then re-launch any applications you would like to show hidden files in the Open dialog.

### HP printer drivers for OSX

Go to http://support.hp.com/us-en/drivers

Enter the printer model name/number.

Choose 'Apple OS X' as the operating system and select the version number.

It will take you to a download page. The file you download will be a .zip archive containing an installer.

### NTFS filesystem readonly

OS X mounts external NTFS drive as read-only. 

#### Solution

There is no longer a free workaround for this problem. You have to purchase a commercial product to get read/write support for NTFS. Here are two: 

- Paragon: https://www.paragon-software.com/home/ntfs-mac/ 
- Tuxera: https://www.tuxera.com/products/tuxera-ntfs-for-mac/

### Make an app out of a shell script

1. Write the shell script.
2. In Automator, choose ```run shell script``` and write a one-liner to execute the shell script.
3. Choose ```File``` -> ```Convert to...```, then choose ```Application```.
4. Find a suitable icon and make an ```.icns``` file with it.
5. Right-click on the app file and choose ```Get Info```.
6. Paste the icon over the small icon image located in the upper left-hand corner of the ```Info``` dialog.

### Replace strings in files recursively

```shell
export LC_CTYPE=C
export LANG=C
find . *.html -type f -print0 | xargs -0 sed -i "" 's/Software Craftsperson/Solution Developer/g'
```

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

