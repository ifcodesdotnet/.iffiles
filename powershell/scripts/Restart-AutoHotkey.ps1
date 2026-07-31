function Restart-AutoHotkey {
    & (Join-Path $PSScriptRoot 'Stop-AutoHotkey.ps1')
    & (Join-Path $PSScriptRoot 'Start-AutoHotkey.ps1')
}

Restart-AutoHotkey
