function Initialize-Environment {
    $source = Join-Path $PSScriptRoot '..' 'modules' 'Environment.psm1'

    if ($IsWindows) {
        $modules = Join-Path $HOME 'Documents/PowerShell/Modules'
    }

    if ($IsLinux) {
        $modules = Join-Path $HOME '.local/share/powershell/Modules'
    }

    if ($IsMacOS) {
        $modules = Join-Path $HOME '.local/share/powershell/Modules'
    }

    $destination = Join-Path $modules Environment

    # Create the module folder if it doesn't already exist.
    if (-not (Test-Path $destination)) {
        New-Item -ItemType Directory -Path $destination -Force | Out-Null
    }

    Copy-Item -Path $source -Destination $destination -Force
}

Initialize-Environment