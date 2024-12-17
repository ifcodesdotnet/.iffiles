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

# take me to my desktop directory
function d {
    Set-Location -Path "$env:USERPROFILE\Desktop\"
}

# take me to my home directory
function h {
    Set-Location -Path "$env:USERPROFILE"
}

# quit
function q {
    Invoke-command -ScriptBlock {exit}
}

# take me to my powershell scripts
function s {
    Set-Location -Path $($([System.IO.Path]::Combine("$env:USERPROFILE", ".iffiles", "powershell-scripts")))
}

# take me to my .dotfiles directory
function i {
    Set-Location -Path $($([System.IO.Path]::Combine("$env:USERPROFILE", ".iffiles")))
}