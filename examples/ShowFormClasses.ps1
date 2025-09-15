<#
 .SYNOPSIS
 Display all form classes available in the current session.
#>

Add-Type -AssemblyName System.Windows.Forms
# Display all public classes in the System.Windows.Forms assembly
[System.Windows.Forms.Form].Assembly.GetTypes().Where{$_.IsClass -and $_.IsPublic}.Name

# Display all public classes in the System.Windows.Forms assembly excluding delegates and event args
[System.Windows.Forms.Form].Assembly.GetTypes().Where{$_.IsClass -and $_.IsPublic -and $_.BaseType.Name -ne "Object" -and $_.BaseType.Name -notmatch "Delegate" -and $_.BaseType.Name -notlike "*eventargs"}.Name
