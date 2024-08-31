# aliases for commands
Set-Alias -Name c -Value Clear-Host;
Set-Alias -Name g -Value git;

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

function .. {
    Set-Location -Path ".."
}

function ... {
    Set-Location -Path "../.."
}


function d {
    Set-Location -Path "$env:USERPROFILE\Desktop\"
}

if (Get-Alias -Name h -ErrorAction SilentlyContinue) {
    Remove-Item Alias:h
}

function h {
    Set-Location "$env:USERPROFILE"
}