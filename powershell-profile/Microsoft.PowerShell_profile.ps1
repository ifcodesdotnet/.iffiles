Import-Module $([System.IO.Path]::Combine("$env:IF_HOME", ".iffiles", "powershell-modules","Configuration-Management.psm1"))

# start platform specific configurations
switch ($(Get-Platform)) {
    "windows" {
        $env:PATH += ";$([System.IO.Path]::Combine("$env:IF_HOME", ".iffiles", "powershell-scripts"))"

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
    }
    "mac" {
        $env:PATH += ":$([System.IO.Path]::Combine("$env:IF_HOME", ".iffiles", "powershell-scripts"))"
    }
    default {
        throw [System.PlatformNotSupportedException]::new("Unrecoverable error occurred while loading PowerShell profile, platform not supported.")
    }
}

# start functions
function Stop-PowerShellSession {
    Invoke-command -ScriptBlock {exit}
}

# start directory movement functions
function Set-LocationToPreviousDirectory {
    Set-Location -Path ".."
}

function Set-LocationToTwoDirectoriesUp {
    Set-Location -Path $([System.IO.Path]::Combine("..", ".."))
}

function Set-LocationToHome {
    Set-Location -Path "$env:IF_HOME"
}

function Set-LocationToDesktop {
    Set-Location -Path $([System.IO.Path]::Combine("$env:IF_HOME", "Desktop"))
}

function Set-LocationToPowerShellScripts {
    Set-Location -Path $([System.IO.Path]::Combine("$env:IF_HOME", ".iffiles", "powershell-scripts"))
}

function Set-LocationToDotfiles {
    Set-Location -Path $([System.IO.Path]::Combine("$env:IF_HOME", ".iffiles"))
}

# removal of default powershell aliases
if (Get-Alias -Name h -ErrorAction SilentlyContinue) {
    Remove-Item -Path Alias:h
}

# aliases for default cmdlets
Set-Alias -Name c -Value Clear-Host;

# aliases for my custom functions
Set-Alias -Name q -Value Stop-PowerShellSession
Set-Alias -Name .. -Value Set-LocationToPreviousDirectory
Set-Alias -Name ... -Value Set-LocationToTwoDirectoriesUp
Set-Alias -Name h -Value Set-LocationToHome
Set-Alias -Name s -Value Set-LocationToPowerShellScripts
Set-Alias -Name d -Value Set-LocationToDesktop
Set-Alias -Name i -Value Set-LocationToDotfiles

# aliases third party software
Set-Alias -Name g -Value git;
Set-Alias -Name n -Value npm;