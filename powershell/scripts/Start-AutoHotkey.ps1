function Start-AutoHotkey {
    $startupPath = [Environment]::GetFolderPath('Startup')
    $autoHotkeyScripts = Get-ChildItem -Path $startupPath -Filter *.ahk

    if (Test-Path "$env:ProgramFiles\AutoHotkey\UX\AutoHotkeyUX.exe") {
        $autoHotkeyExecutable = "$env:ProgramFiles\AutoHotkey\UX\AutoHotkeyUX.exe"
    } elseif (Test-Path "$env:LOCALAPPDATA\Programs\AutoHotkey\UX\AutoHotkeyUX.exe") {
        $autoHotkeyExecutable = "$env:LOCALAPPDATA\Programs\AutoHotkey\UX\AutoHotkeyUX.exe"
    } else {
        throw "AutoHotkey v2 not found. Install it with: winget install AutoHotkey.AutoHotkey"
    }

    foreach ($autoHotkeyScript in $autoHotkeyScripts) {
        Start-Process -FilePath $autoHotkeyExecutable -ArgumentList "`"$($autoHotkeyScript.FullName)`""
    }

    Write-Host "Started $($autoHotkeyScripts.Count) AutoHotkey script(s)."
}

Start-AutoHotkey
