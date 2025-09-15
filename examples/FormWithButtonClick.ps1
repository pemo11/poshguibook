<#
 .SYNOPSIS
 Displays a form with a button and a click event handler
#>
using namespace System.Windows.Forms

Add-Type -AssemblyName System.Windows.Forms

$btn1 = [Button]::New()
$btn1.Text = "Click Me!"
$btn1.Add_Click({
    [MessageBox]::Show("Thank you for clicking me!", "Aloha")
})
$form = [Form]::New()
$form.Text = "Form with Click Event Handler"
$form.Width = 400
$form.Controls.Add($btn1)
[Void]$form.ShowDialog()