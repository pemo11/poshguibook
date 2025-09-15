# GUIs based on Windows Forms (WinForms)

**last update**: 15/09/2025

*WinForms* (or *WinForms* for short) is the name for the classes in the namespace *Syxstem.Windows.Forms* that allow the creation of more or less sophisticated graphical user interfaces for .Net desktop applicatations on Windows.

*WinForms* (as part of *.Net*) does **NOT** work on *Linux*, *MacOS* etc. (although there have been working implementations as part of the *Mono* project)

It can be used for PowerShell scripts very easily, but again **Windows only**.

Although *PowerShell 7* can be used on many platforms, unfortunately this does not include the Windows specific "ingredients" like WinForms (or WMI).

## What is WinForms?

*WinForms* is the short name for several dozen classes in the two namespaces *System.Windows.Forms* and *System.Drawing*. Where as the classes in *System.Windows.Forms* contains the definitions for the different control types, the classes in *System.Drawing* are responsible for drawing the controls to the screen.

**example:**

Its no problem of course to display the name of all public classes in the *System.Windows.Forms* namespace. Since the assembly *System.Windows.Forms.dll* that contains the class definition is not loaded per default it has to be loaded with the *Add-Type* cmdlet first.

```PowerShell
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Form].Assembly.GetTypes().Where{$_.IsClass -and $_.IsPublic}.Name
```

**example:**

Since the output contains too many names, the next example only display classes who base type name is neither "object" nor does it contains the name "delegate" nor does it ends with "eventargs" since these classes are definitely no control classes. This results in a much shorter list with mostly only "important" classes.

```PowerShell
[System.Windows.Forms.Form].Assembly.GetTypes().Where{$_.IsClass -and $_.IsPublic -and $_.BaseType.Name -ne "Object" -and $_.BaseType.Name -notmatch "Delegate" -and $_.BaseType.Name -notlike "*eventargs"}.Name
```

One example of a control class is the *Form* class that represents a rectangle area on the screen with certain visual attributes like a thick border, a title and the builtin abibility to resize and move the retangle with a mouse. The rectangle is either called *Window* or *Dialogbox*.

Since the classes of both *System.Windows.Forms* and *System.Drawing* are both part of the .Net Runtime and therefore part of *PowerShell* as well there is no need to install anything. Everything works "out of the box".

**example:**

The following example displays a Window on the screen. You can type this command in the PowerShell CLI (both Windows PowerShell and PowerShell 7 on Windows).

```PowerShell
Add-Type -AssemblyName System.Windows.Forms
$f = [System.Windows.Forms.Form]::new()
$f.Text = "Aloa!"
$f.ShowDialog()
```

Or if you prefer a one liner:

```PowerShell
& {$a=[System.Windows.Forms.Form]::new();$a.Text="Aloha!";$a.ShowDialog()}
```

In both cases the windows is shown "modal". That just means its blocking all other windows of that application so none of them can get the focus. In case of the *PowerShell CLI* the PowerShell console is blocked.

What happened to the *Add-Type*-Cmdlet? Its needed only once in a PowerShell session (and is not necessary if you are still using the "ISE";).

**note:**

Since *ShowDialog()* returns a *True/False* parameter indicating if the dialogbox had been closed through the *OK* (*True*) or the *Cancel* (*False*) button its often preceded by a *[Void]* so that the return value is not put into the pipeline.

The form is shown as a dialog and not as a "real" window. In practice this distinction is not so important since in most cases a dialogbox is all that is needed and wanted.

A dialogbox does not have its own message loop.

To create a "real" window based on a form the static *Run()* method of the *System.Windows.Forms.Application* class is used. But there is a caveat. This can not be done in the CLI but in *VS Code* or *PowerShell ISE* on *Windows* for example.

**example:**

The following example creates a "real" Window. To present an alternative, the *Form* class is instantiated by the *New-Object*-Cmdlet. A small advantage is that properties can be set through the *Property* parameter.

```PowerShell
using namespace System.Windows.Forms

$f = New-Object -Type Form -Property @{"Text" = "Example 1"}
[Application]::Run($f)
```

**expert mode:**

*PowerShell* is a fascinating scripting language, even after nearly 20 years (version 1.0 was released in 2006). Thanks to user *mklement0* on *StackOverflow* here is a really cool alternative that is using a *hashtable* for initializing the properties on an object (if it has a public constructor without parameters):

```PowerShell
[System.Windows.Forms.Application]::Run([System.Windows.Forms.Form]@{ Text="Aloha!" })
```

But since these commands are usually part of a script there is no need to come up with such abbrevations. And there are usually some helpers that will generate all these commands for you (more on this later).

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
[Application]::Run([Form]@{ Text="Aloha!" })
```

**note:**
In the command line *Using Namespace* can only hold one reference so using it twice will override the first "shortcut". Inside a script you can use as many *using namespace* as you like.

**note:**
I have absolutely of proof for the following assertion. But when *Jeffrey Snover* (the inventor of what became later *PowerShell*) once asked me at a software developer conference what feature was missing in the version 2.0 of *PowerShell* I said there should be a "using namespace" like in *C#*.

## The form class

The *form* class represents a window. It can be the main window of the application but it can also be a dialogbox.

The first step is to create a new *form* object.

There are two ways to show the new window:

1. By using the static *ShowDialog()* method
2. By using the *run()* method of the *Application* class

For the PowerShell CLI only *ShowDialog()* works.

## Control classes

The *System.Windows.Forms* namespace contains serveral dozen control classes. A few examples are *Button* (for a command button), *label* (for a text field), *TextBox* (for a text input field) or *ListBox* (for a list of text items).

Each of theses classes are instantiated through its static *new* method that is always parameterless.

**example:**

The following example creates a command button.

```PowerShell
[System.Windows.Forms.Button]::New()
```
or a little shorter assuming a `using namespace System.Windows.Forms`:

```PowerShell
[Button]::New()
```
Since it does not make any sense to create the instance of class without assigning it to variable there has to an assignment to a PowerShell variable.

```PowerShell
$btn1 = [Button]::New()
```

And it does make any sense to not set at least the *Text*-Property so something is displayed inside the button area.

This can be done either in two steps:

```PowerShell
$btn1 = [Button]::New()
$btn1.Text = "Click Me!"
```

It can also be done when instanciating the class but only by using the *New-Object* cmdlet and its *Property*-Parameter and a hashtable.

```PowerShell
$btn1 = New-Object -Type Button -Property @{Text = "Click Me!"}
```

Using this syntax is more convenient if several properties should be set. And its really convenient if several controls should be set with the same property values since a single hashtable variable can be used.

Having a button does not mean that its already visible. It has to added to the *Control* collection of either the *Form* or another control with a *Control* property.

**example:**

The following example creates a form with a button and displays the form (with the button of course).

```PowerShell
using namespace System.Windows.Forms

$f = New-Object -Type Form -Property @{"Text" = "Example 1"}
$btn1 = New-Object -Type Button -Property @{Text = "Click Me!"}
$f.Controls.Add($btn1)
$f.ShowDialog()
```

**example:**

The following example creates a form with a button and displays the form. But this time the button is placed in the middle of the inner "client area" of the form. Its amazing how much more effort this little additional feature requires. For setting a position, the *Point* class from the *System.Drawing* namespace is needed. And calculating the middle position requires some "math" which is not a part where *PowerShell* stands out.

```PowerShell
using namespace System.Windows.Forms
using namespace System.Drawing

$f = New-Object -Type Form -Property @{"Text" = "Example 1"}
$btn1 = New-Object -Type Button -Property @{Text = "Click Me!";Width=120;Height=34}
$pos1 = [Point]::new(($f.ClientRectangle.Width/2-$btn1.Width/2),($f.ClientRectangle.Height / 2 - $btn1.Height / 2))
$btn1.Location = $pos1
$f.Controls.Add($btn1)
$f.ShowDialog()
```

### Placing a control in a container

A control is always placed inside a container. A container is either the *Form* or a container control like a *GroupBox*. Each control has a *Location* property that expects a *Point* object. The upper left corner has the location 0/0.

**example:**

The following example places three button in a horizontal line.


### Setting the size of a control

A control has a *height* and a *width* property that sets the size of the control. The unit is pixel. There is a also a *Size* property for setting both the height and the width. This property expects a *Rectangle* object.


## Connecting events

Controls like a *Button* are meant for that something happens when the button is clicked. The purpose of a *ListBox* is not only to display several items but also that something happens when an item is selected. To achieve an action the events come into the play. An event is a another name for a callback mechanism that allows an internal call to call any outside methods that have "subscribed" to that call.

Each control offers several dozen events like *Click*, *MouseClick* or *GotFocus* and many more.

**example**

Since events are members like *Properties* and *Methods* they can be listed to by *Get-Member*. The following example lists all of the 94 (!) events of the *Form* class.

```PowerShell
[System.WIndows.Forms.Form]::New() | Get-Member -MemberType Event
```
or by going directly through the *type* object:

```PowerShell
[System.Windows.Forms.Form].GetEvents().Name
```

How can a PowerShell function subscribe to an event? Although *PowerShell* offers Cmdlets for dealing with events like *New-Event* its much easier to use the (private) methods that are added by the *PowerShell Type System*. For every event an object offers, the type system adds a method for adding a scriptblock that will handle that event. The name of that method always starts with "add_" followed by the name of the event. The *add_click*-method adds a scriptblock for handling the *click* event.

**example**

The following example lists all "event handler method" of the *Form* class.

```Powershell
[System.Windows.Forms.Form]::new() | Get-Member -MemberType Method -Name add_* -Force
```

All the methods accept either a *System.EventHandler* or an object that is derived from *System.EventHandler*. Thanks to the virtuosity of the *PowerShell* type system any Scriptblock can be used which will be type casted to an *EventHandler* object.

**example**

The following examples display a form with a button. Clicking the button will display a messagebox. Since the script only contains the bare minimum neeed to display the form with a button it does not look nice but the click event has been connected with a Scriptblock.

```PowerShell
using namespace System.Windows.Forms

$f = [Form]::New()
$f.Text = "Aloha"
$btn1 = [Button]::New()
$btn1.Text = "Click Me!"
$f.Controls.Add($btn1)
$btn1.add_click({ [Messagebox]::Show("Thank you for clicking me!", [DateTime]::Now)})
$f.ShowDialog()

```
