<#
 .SYNOPSIS
Displays a form with a message loop using Application.Run()
#>

using namespace System.Windows.Forms

$f = New-Object -Type Form -Property @{"Text" = "Example 1"}
[Application]::Run($f)
