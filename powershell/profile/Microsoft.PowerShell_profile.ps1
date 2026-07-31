# Operating Specific Configurations

if ($IsWindows) {
    $env:PATH += ";$(Join-Path $HOME "bin")"

    function touch {
        param(
            [string]
            $Path
        )

        if ([string]::IsNullOrWhiteSpace($Path)) {
            Write-Error "touch: missing file operand"
            return
        }

        if (Test-Path $Path) {
            (Get-Item $Path).LastWriteTime = Get-Date
        } else {
            New-Item -ItemType File -Path $Path | Out-Null
        }
    }
}
elseif ($IsLinux) {
    # insert linux specific configurations here...
}
elseif ($IsMacOS) {
    # insert macos specific configurations here...
}

# Functions

function Get-GitBranch {
    try {
        $branch = git branch --show-current 2>$null
        if ($branch) {
            return " ($branch)"
        }
    }
    catch {

    }
    return ""
}

function prompt {
    $path = $executionContext.SessionState.Path.CurrentLocation
    $user = if ($IsWindows) { $env:USERNAME } else { $env:USER }
    $hostName = if ($IsWindows) { ($env:COMPUTERNAME -split '\.')[0] } else { (hostname) -split '\.' | Select-Object -First 1 }

    if ($path.Path.StartsWith($home)) {
        $pathFormatted = "~" + $path.Path.Substring($home.Length)
    }
    else {
        $pathFormatted = $path.Path
    }

    $branch = Get-GitBranch

    if (-not [string]::IsNullOrWhiteSpace($branch)) {
        $branchColored = "$($PSStyle.Foreground.Green)${branch}$($PSStyle.Reset)"
        return "${user}@${hostName}:${pathFormatted} on${branchColored}`n> "
    } else {
        return "${user}@${hostName}:${pathFormatted}`n> "
    }
}

function Stop-PowerShellSession {
    exit
}

function Set-LocationParent {
    Set-Location -Path ".."
}

function Set-LocationHome {
    Set-Location -Path $HOME
}

function Set-LocationDesktop {
    Set-Location -Path (Join-Path $HOME "Desktop")
}

function Set-LocationDotfiles {
    Set-Location -Path (Join-Path $HOME ".iffiles")
}

function Update-PowerShellProfile {
    . $PROFILE
}

# Aliases

if (Test-Path Alias:h) {
    Remove-Item -Path Alias:h
}

Set-Alias -Name c -Value Clear-Host;

Set-Alias -Name q -Value Stop-PowerShellSession
Set-Alias -Name .. -Value Set-LocationParent
Set-Alias -Name h -Value Set-LocationHome
Set-Alias -Name d -Value Set-LocationDesktop
Set-Alias -Name i -Value Set-LocationDotfiles
Set-Alias -Name r -Value Update-PowerShellProfile

Set-Alias -Name g -Value git;
Set-Alias -Name n -Value npm;
Set-Alias -Name t -Value terraform;