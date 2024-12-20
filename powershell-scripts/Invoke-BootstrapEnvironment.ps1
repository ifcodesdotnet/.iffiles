
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