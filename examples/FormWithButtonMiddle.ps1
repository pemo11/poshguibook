<#
 .SYNOPSIS
 Displays a form with a button in the middle of the form
#>

using namespace System.Windows.Forms
using namespace System.Drawing

$f = New-Object -Type Form -Property @{"Text" = "Example 1"}
$btn1 = New-Object -Type Button -Property @{Text = "Click Me!";Width=120;Height=34}
$pos1 = [Point]::new(($f.ClientRectangle.Width/2-$btn1.Width/2),($f.ClientRectangle.Height / 2 - $btn1.Height / 2))
$btn1.Location = $pos1
$f.Controls.Add($btn1)
[Void]$f.ShowDialog()
