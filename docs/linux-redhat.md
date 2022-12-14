# Notes for RedHat Linux and derivatives

[Contents](contents.md) | [KWIC Index](kwic-index.md)

* [yum](#yum)
    * [Yum lock is held by another process](#yum-lock-is-held)


### yum

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

