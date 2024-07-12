& ".\powershell-scripts\ahk-stop.ps1"
Start-Sleep -Milliseconds 500
& ".\powershell-scripts\dotfiles-apply.ps1"
Start-Sleep -Milliseconds 500
& ".\powershell-scripts\ahk-start.ps1"