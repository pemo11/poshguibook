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
Or if you prefer a one liner:

```PowerShell
[System.Windows.Forms.Application]::Run((New-Object System.Windows.Forms.Form -Property @{ Text = 'Aloa!' }))

```

What happened to the *Add-Type*-Cmdlet? Its needed only once in a PowerShell session (and is not necessary if you are still using the "ISE";).

Thats a lot of typing for displaying a simple Window. But since these commands are allmost used inside a script the effort is not as much as it might seem. And there are some helpers that will generate all these commands for you (more on this later).

## The Add-Type command and the using namespace directive

Since *PowerShell* only loads a few assemblies (another name for a dll file that can be used by the .Net runtime) other assemblies have to be loaded by the universal *Add-Type*-Cmdlet. Like the *System.Windows.Forms.dll* assembly as already shown.

```PowerShell
Add-Type -AssemblyName System.Windows.Forms
```

But what about the path of the dll file? When using the *AssemblyName* parameter the assembly is assumed to be in the *Global Assembly Cache* (*GAC)* directory so no path is needed (and no file extension too).

Usually a class is referenced in *PowerShell* by its complete name that includes the namespace too.

The full name of the *form* class is *System.Windows.Form.Form*, the full name of the *Button* class is accordingly *System.Windows.Forms.Button* and so on.

Wouldn't it be convinient if the namespace does not have to be include each time? This would be very convinient and its possible by using the *using namespace* directive at the beginning.

```PowerShell
Using Namespace System.Windows.Forms
```

Now everything becomes a little simpler.

```PowerShell
[Application]::Run((New-Object Form -Property @{ Text = 'Aloa!' }))

```

**note:**
In the command line *Using Namespace* can only hold one reference so using it twice will override the first "shortcut". Inside a script you can use as many *using namespace* as you like.

**note:**
I have absolutely of proof for the following assertion. But when *Jeffrey Snover* once asked me what feature was missing in the version 2.0 of *PowerShell* I said there should be a "using namespace" like in *C#*.

## The form class

The *form* class represents a window. It can be the main window of the application but it can also be a dialog box.

The first step is to create a new *form* object.

There are two ways to show the new window:

1. By using the static *ShowDialog()* method
2. By using the *run()* method of the *Application* class



