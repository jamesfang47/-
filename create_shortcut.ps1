$w = New-Object -ComObject WScript.Shell
$lnkPath = Join-Path $env:USERPROFILE "Desktop\Open URLs.lnk"
$target = Join-Path $env:USERPROFILE "Downloads\open_urls.bat"
$s = $w.CreateShortcut($lnkPath)
$s.TargetPath = $target
$s.WorkingDirectory = Join-Path $env:USERPROFILE "Downloads"
$s.IconLocation = $target
$s.Save()
Write-Output "Shortcut created: $lnkPath"
