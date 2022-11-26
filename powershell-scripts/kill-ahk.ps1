$process = Get-Process -Name "AutoHotkey64"
Stop-Process -Id $process.Id -Force