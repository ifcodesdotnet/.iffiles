$path = [System.IO.Path]::Combine($env:IF_HOME,"AppData","Roaming","Microsoft","Windows","Start Menu","Programs","Startup")

$files = Get-ChildItem -Path $path -Filter *.ahk

foreach ($file in $files) {

    $scriptPath = $file.FullName

    if (Test-Path -Path ([System.IO.Path]::Combine($env:ProgramFiles, "AutoHotkey", "UX", "AutoHotkeyUX.exe"))) {
        Start-Process -FilePath ([System.IO.Path]::Combine($env:ProgramFiles, "AutoHotkey", "UX", "AutoHotkeyUX.exe")) -ArgumentList "`"$scriptPath`""
    }
    else {
        Start-Process -FilePath ([System.IO.Path]::Combine($env:LOCALAPPDATA, "Programs", "AutoHotkey", "UX", "AutoHotkeyUX.exe")) -ArgumentList "`"$scriptPath`""
    }
}