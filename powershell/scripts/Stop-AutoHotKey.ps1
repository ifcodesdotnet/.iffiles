function Stop-AutoHotkey {
    $processes = Get-Process -Name "AutoHotkey*"

    foreach ($process in $processes) {
        Stop-Process -Id $process.Id -Force
    }
}

Stop-AutoHotkey