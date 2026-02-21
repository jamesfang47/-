@echo off
setlocal
rem Call the PowerShell script in the same folder; forward args
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0open_urls.ps1" %*
endlocal
