<#
 .SYNOPSIS
 Displays a form with a button
#>
using namespace System.Windows.Forms

Add-Type -AssemblyName System.Windows.Forms

$btn1 = [Button]::New()
$btn1.Text = "Click Me!"

$form = [Form]::New()
$form.Text = "Form with Button"
$form.Controls.Add($btn1)
$form.ShowDialog()