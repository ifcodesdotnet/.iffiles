$process = Get-Process -Name "AutoHotkey*"

if ($process) {
    Stop-Process -Id $process.Id -Force
}