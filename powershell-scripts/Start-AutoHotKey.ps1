$path = "$env:USERPROFILE\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"

$files = Get-ChildItem -Path $path -Filter *.ahk

foreach ($file in $files) {

    $scriptPath = $file.FullName

    if (Test-Path -Path "C:\Program Files\AutoHotkey\UX\AutoHotkeyUX.exe") {
        Start-Process -FilePath "C:\Program Files\AutoHotkey\UX\AutoHotkeyUX.exe" -ArgumentList "`"$scriptPath`""
    }
    else {
        Start-Process -FilePath "$env:USERPROFILE\AppData\Local\Programs\AutoHotkey\UX\AutoHotkeyUX.exe" -ArgumentList "`"$scriptPath`""
    }
}