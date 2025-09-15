<#
 .SYNOPSIS
Displays a dialog box with ShowDialog()  
#>

Add-Type -AssemblyName System.Windows.Forms
$f = [System.Windows.Forms.Form]::new()
$f.Text = "Aloa!"
$f.ShowDialog()

# or in one line
& {$a=[System.Windows.Forms.Form]::new();$a.Text="Aloha!";$a.ShowDialog()}
