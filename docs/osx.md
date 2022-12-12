[Contents](contents.md) | [KWIC Index](kwic-index.md)

# Notes on Apple OS X 

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

## Add divider to Dock

```shell
defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'
killall Dock
```

## .DS_Store

### Disable writing .DS_Store files on network volumes

```shell
defaults write com.apple.desktopservices DSDontWriteNetworkStores true
```

### Remove all .DS_Store files system-wide

```shell
sudo find / -name ".DS_Store" -depth -exec rm {} \;
```

### Remove .DS_Store files recursively

```shell
find . -name ‘*.DS_Store’ -type f -delete
```

## File is in use

Creator and type attributes are modified by Finder during a file copy operation. To reset:

```shell
SetFile -c "" -t "" path/to/file
```

If the SetFile command is not installed, do this:

```shell
xcode-select --install
```

## Hidden files

Apple is very serious about keeping hidden files hidden. OSX is far less user-friendly in this regard than any other \*nix system. Do this:

```shell
defaults write -g AppleShowAllFiles -bool true
```

and then re-launch any applications you would like to show hidden files in the Open dialog.

## HP printer drivers for OSX

Go to http://support.hp.com/us-en/drivers

Enter the printer model name/number.

Choose 'Apple OS X' as the operating system and select the version number.

It will take you to a download page. The file you download will be a .zip archive containing an installer.

## NTFS filesystem readonly

OS X mounts external NTFS drive as read-only. 

### Solution

There is no longer a free workaround for this problem. You have to purchase a commercial product to get read/write support for NTFS. Here are two: 

- Paragon: https://www.paragon-software.com/home/ntfs-mac/ 
- Tuxera: https://www.tuxera.com/products/tuxera-ntfs-for-mac/

## Make an app out of a shell script

1. Write the shell script.
2. In Automator, choose ```run shell script``` and write a one-liner to execute the shell script.
3. Choose ```File``` -> ```Convert to...```, then choose ```Application```.
4. Find a suitable icon and make an ```.icns``` file with it.
5. Right-click on the app file and choose ```Get Info```.
6. Paste the icon over the small icon image located in the upper left-hand corner of the ```Info``` dialog.

## Replace strings in files recursively

```shell
export LC_CTYPE=C
export LANG=C
find . *.html -type f -print0 | xargs -0 sed -i "" 's/Software Craftsperson/Solution Developer/g'
```
