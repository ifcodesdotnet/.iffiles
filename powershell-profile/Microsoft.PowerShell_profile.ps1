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

    if(Test-Path $file) {
        (Get-Item $file).LastWriteTime = Get-Date
    }
    else {
		New-Item -Path $file -ItemType File -Force | Out-Null
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
