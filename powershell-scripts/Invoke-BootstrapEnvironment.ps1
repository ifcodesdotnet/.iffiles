
# How do i set environment variables on mac os via powershell...
# https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_environment_variables?view=powershell-7.4#create-persistent-environment-variables-on-non-windows-platforms

function main {
    if(-not ([bool]$env:IF_BOOTSTRAPPED)) {
        if($env:os -eq "Windows_NT"){
            # for windows just set the environment variables on the user level
            [System.Environment]::SetEnvironmentVariable("IF_BOOTSTRAPPED", "true", [System.EnvironmentVariableTarget]::User)
            [System.Environment]::SetEnvironmentVariable("IF_HOME", $env:USERPROFILE, [System.EnvironmentVariableTarget]::User)
        }
        elseif($IsMacOs) {
            # for mac update .zshrc file
            $file = "$env:HOME/.zshrc"

            if (-not (Test-Path -Path $file)) {
                New-Item -Path $file -ItemType File
            }

            Add-Content -Path $file -Value "export IF_BOOTSTRAPPED=true"
            Add-Content -Path $file -Value "export IF_HOME=$($env:HOME)"
        }
        else {
            throw [System.PlatformNotSupportedException]::new("Unrecoverable error occurred while bootstrapping environment, platform not supported.")
        }
    }
    else {
        throw [System.InvalidOperationException]::new("Unrecoverable error occurred while bootstrapping environment, environment already bootstrapped.")
    }
}

main

# todo document how i need to restart my computer for the environment variable change to take effect...