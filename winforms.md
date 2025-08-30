# GUIs based on Windows Forms (WinForms)

*WinForms* (or *WinForms* for short) is the name for the classes in the namespace *Syxstem.Windows.Forms* that allow the creation of more or less sophisticated graphical user interfaces for .Net desktop applicatations on Windows.

*WinForms* does **NOT** work on *Linux*, *MacOS* etc.

It can be used for PowerShell scripts very easily, but again **Windows only**.

Although *PowerShell 7* can be used on many platforms, unfortunately this does not include the Windows specific "ingredients" like WinForms (or WMI).

## What is WinForms?

*WinForms* is the short name for the classes in the two namespaces *System.Windows.Forms* and *System.Drawing*. One example is the *Form* class that represents a rectangle area on the screen with certain visual attributes like a border, a title and the builtin abiblity to move the retangle with a mouse. The rectangle is either called *Window* or *Dialog box*.

Since the classes of both *System.Windows.Forms* and *System.Drawing* are both part of the .Net Runtime and therefore part of *PowerShell* as well there is no need to install anything. Everything works "out of the box".

**example:**

The following example displays a Windows on the screen. You can type this command in the PowerShell commandline (both Windows PowerShell and PowerShell 7 on Windows).

```PowerShell
Add-Type -AssemblyName System.Windows.Forms
$f = [System.Windows.Forms.Form]::new()
$f.Text = "Aloa!"
[System.Windows.Forms.Application]::Run($f)
```



