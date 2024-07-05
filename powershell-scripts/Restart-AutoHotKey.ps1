
& "$env:USERPROFILE\.iffiles\powershell-scripts\Stop-AutoHotkey.ps1"

& "$env:USERPROFILE\.iffiles\powershell-scripts\Set-Configuration.ps1" -name autohotkey-scripts -path "$env:USERPROFILE\.iffiles\personal.json"

& "$env:USERPROFILE\.iffiles\powershell-scripts\Start-AutoHotkey.ps1"