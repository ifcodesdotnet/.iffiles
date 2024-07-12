Set-Alias -Name c -Value Clear-Host;
Set-Alias -Name g -Value git;

$env:PATH += ";$env:UserProfile\.iffiles\powershell-scripts"

function touch
{
    param (
        [string]$file
    )

    if ([string]::IsNullOrEmpty($file)) {
        throw "touch: missing file operand"
    }

    if (Test-Path $file)
    {
        (Get-Item $file).LastWriteTime = Get-Date
    }
    else
    {
        New-Item -Path $file -ItemType File -Force | Out-Null
    }
}

function ..
{
    Set-Location -Path ".."
}

function ....
{
    Set-Location -Path "../.."
}