# Notes for Microsoft Windows 

[Contents](contents.md) | [KWIC Index](kwic-index.md)
* [Disable Automatic Restart](#disable-automatic-restart)
* [Equivalent of kill command](#equivalent-of-kill-command)
* [Equivalent of touch command](#equivalent-of-touch-command)
* [HP printer drivers for Windows](#hp-printer-drivers-for-windows)
* [Open command line elevated](#command-line-elevated)
* [VisualStudio](#visualstudio)
    * [Nuget executable not found](#nuget-executable-not-found)
    * [NUnit tests not discovered](#nunit-tests-not-discovered)
* [Windows Subsystem for Linux](#windows-subsystem-for-linux)
    * [Access Windows files from Linux](#access-windows-files-from-linux)
    * [Access Linux files from Windows](#access-linux-files-from-windows)

### Disable automatic restart

Edit the Registry. Navigate to ```Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows```. Add key ```WindowsUpdate```.  Under ```WindowsUpdate```, add key ```AU```. 

Under key ```AU```, add ```DWORD (32-bit) value``` with the name ```NoAutoBootWithLoggedOnUsers```. Set the value to 1.

Restart Windows.

Additional references:
* [4 Ways to Disable Windows 10 Automatic Restart](https://www.itechtics.com/disable-automatic-restart/)

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

### VisualStudio

#### Nuget executable not found

VisualStudio can't find a nuget.exe when it tries to build a project.

Solution: Download a nuget.exe from https://dist.nuget.org/index.html

#### NUnit tests not discovered

When you run tests, it says there are no NUnit tests to run.

Solution: 
* In VisualStudio, go to Tools => Extensions and Updates
* Search for "nunit"
* Look for the NUnit 3 Test Adapter and install it

### Windows Subsystem for Linux 

#### Access Windows Files from Linux

Your Windows C: drive is located at /mnt/c.

#### Access Linux Files from Windows

In Windows, enter \\wsl$ in the address bar of Windows Explorer. It will show a list of installed Linux instances. You can navigate through them using Explorer.

On a WSL command line, enter "explorer.exe ." to open Windows Explorer in the current directory.

