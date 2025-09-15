<#
 .SYNOPSIS
 Displays a form with three buttons sharing a single click event handler
#>
using namespace System.Windows.Forms

Add-Type -AssemblyName System.Windows.Forms

$btn1 = [Button]::New()
$btn1.Text = "Button 1"
$btn1.Location = [Drawing.Point]::New(10,10)
$btn2 = [Button]::New()
$btn2.Text = "Button 2"
$btn2.Location = [Drawing.Point]::New(100,10)
$btn3 = [Button]::New()
$btn3.Text = "Button 3"
$btn3.Location = [Drawing.Point]::New(190,10)
$form = [Form]::New()
$form.Text = "Form with three Buttons"
$form.Controls.Add($btn1)
$form.Controls.Add($btn2)
$form.Controls.Add($btn3)

# Now comes the click event handler
$SbClick = {
    # type names are optional of course
    param([Object]$sender, [EventArgs]$eventArgs)
    [MessageBox]::Show("You clicked $($sender.Text)", "Aloha")
}
$btn1.Add_Click($SbClick)
$btn2.Add_Click($SbClick)
$btn3.Add_Click($SbClick)

$form.Size = [Drawing.Size]::New(320,200)
[Void]$form.ShowDialog()