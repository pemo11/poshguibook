<#
 .SYNOPSIS
 Displays a form with a button at a specific location
#>
using namespace System.Windows.Forms
using namespace System.Drawing

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$btn1 = [Button]::New()
$btn1.Text = "Click Me!"
$btn1.Location = [Drawing.Point]::New(50,50)

$form = [Form]::New()
$form.Text = "Form with Button"
$form.Controls.Add($btn1)
$form.ShowDialog()