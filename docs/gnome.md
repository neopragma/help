[Contents](contents.md) | [KWIC Index](kwic-index.md)

# Notes for Gnome desktop

* [disable overlay scrollbars](#disable-overlay-scrollbars)
* [disable screen timeout](#disable-screen-timeout)
* [gnomekeyring for github](#gnomekeyring-for-github)


## Disable overlay scrollbars

### Problem

Those pesky overlay scrollbars that are enabled by default in Ubuntu prevent you from grabbing the side of a window to resize it. Seems like you should be able to set this in Settings -> Appearance -> Behavior, but you can't.

### Solution

```shell
gsettings set org.gnome.desktop.interface ubuntu-overlay-scrollbars false
```

## Disable screen timeout

### Problem 

Screen times out and locks during presentations, demonstrations, mobbing sessions, etc.

### Solution 

```shell 
gsettings set org.gnome.desktop.session idle-delay 0
gsettings set org.gnome.desktop.screensaver lock-enabled false
```

## Gnomekeyring for github

### Problem

How to store the Github Personal Access Token locally on a Linux instance using Gnome Keyring

### Solution

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

