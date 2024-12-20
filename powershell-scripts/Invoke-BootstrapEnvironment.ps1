

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


$path = $(Split-Path -Path $MyInvocation.MyCommand.Path -Parent)

Write-Host $path

main
