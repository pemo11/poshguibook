# GUIs for the Console Window

GUIs for the Console Window are text based only, so logically they are abrevated as **TUIs**. Altough using a TUI means no drawings, no pixels, no bitmaps etc. its absolutely amazing what can be done with libraries like *ncurses* or *PDCurses* (they are probably many more).

At the moment of this writing (August 2025) none of this is availabe for PowerShell but since its an open source project anybody is invited to do some work for the benefit of the community.

But fear not, at least some interesting project is available (altough its not clear, at least for me, if it has a future).

The name of the module is *Microsoft.PowerShell.ConsoleGuiTools*. It only contains two commands

- Out-ConsoleGridView
- Show-ObjectTree

**Out-ConsoleGridView** is the TUI equivalent of the popular *Out-GridView*-cmdlet from the Windows PowerShell that is also part of PowerShell 7 on Windows.

**Show-ObjectTree** does what the name implies by showing the "inner workings" of an single object or multiple objects.

The repo address is https://github.com/PowerShell/ConsoleGuiTools

Both commands uses *Terminal.Gui v2* which is a toolkit for building rich console apps for Windows, Mac and of course Linux. It has its own repo

https://github.com/gui-cs/Terminal.Gui

*Terminal.Gui* is based on the original *gui.cs* library that *Miguel de Icaza* wrote for *mono-curses* in 2007. But before I continue throwing more fancy names you might not have about before please read the short description in the original repo which is very interesting.

![https://github.com/gui-cs/](https://github.com/gui-cs/)
