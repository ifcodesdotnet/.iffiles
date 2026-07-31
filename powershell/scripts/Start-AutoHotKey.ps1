function Start-AutoHotkey {
    $startupPath = [Environment]::GetFolderPath('Startup')
    $autoHotkeyScripts = Get-ChildItem -Path $startupPath -Filter *.ahk

    if (Test-Path "$env:ProgramFiles\AutoHotkey\UX\AutoHotkeyUX.exe") {
        $autoHotkeyExecutable = "$env:ProgramFiles\AutoHotkey\UX\AutoHotkeyUX.exe"
    } else {
        $autoHotkeyExecutable = "$env:LOCALAPPDATA\Programs\AutoHotkey\UX\AutoHotkeyUX.exe"
    }

    foreach ($autoHotkeyscript in $autoHotkeyScripts) {
        Start-Process -FilePath $autoHotkeyExecutable -ArgumentList "`"$($autoHotkeyscript.FullName)`""
    }
}

Start-AutoHotkey