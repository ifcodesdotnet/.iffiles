# aliases for commands
Set-Alias -Name c -Value Clear-Host;

$env:PATH += ";$env:USERPROFILE\.iffiles\powershell-scripts"

# start functions
function touch {
    param (
        [string]
        $file
    )

    if ([string]::IsNullOrEmpty($file)) {
        throw "touch: missing file operand"
    }

    if ([System.IO.File]::Exists($file)) {
        (Get-Item $file).LastWriteTime = Get-Date
    }
    else {
		New-Item -Path $file -ItemType File -Force | Out-Null
    }
}

function Get-Context {
    param (
        [string]
        [Parameter(Mandatory=$true)]
        $path
    )

    if(Test-Path $path) {
        $json = Get-Content -Raw -Path $path

        $context = $json | ConvertFrom-Json

        return $context;
    }
    else {
        throw "Context file not found at path: $path"
    }
}

function .. {
    Set-Location -Path ".."
}

function ... {
    Set-Location -Path "../.."
}


function d {
    Set-Location -Path "$env:USERPROFILE\Desktop\"
}

function h
{
    Set-Location -Path "$env:USERPROFILE\"
}
