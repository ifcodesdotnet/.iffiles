

function main{
    if($IsWindows){
        # [System.Environment]::SetEnvironmentVariable("IF_HOME", $env:USERPROFILE, [System.EnvironmentVariableTarget]::User)
        Write-Host "Windows"
    }
    elseif($IsMacOs){
        # [System.Environment]::SetEnvironmentVariable("IF_HOME", $env:HOME, [System.EnvironmentVariableTarget]::User)
        Write-Host "Mac"
    }
    elseif($IsLinux){
        # [System.Environment]::SetEnvironmentVariable("IF_HOME", $env:HOME, [System.EnvironmentVariableTarget]::User)
        Write-Host "Linux"
    }
    else {
        Write-Host "bad"
    }
}


# $path = $(Split-Path -Path $MyInvocation.MyCommand.Path -Parent)


#main



# Import-Module $([System.IO.Path]::Combine("$env:HOME", ".iffiles", "powershell-modules","Configuration-Management.psm1"))

# $configurations = Get-Content -Path $([System.IO.Path]::Combine("$env:HOME", ".iffiles", "configurations.json")) -Raw | ConvertFrom-Json

# $temp = Get-Configuration -name vscode -configuration $configurations

# Write-Host $temp.platform.mac.$("target-directory")


# i can do a check on this variable to see if it's Darwin or windows nt...
# $PSVersionTable.OS 