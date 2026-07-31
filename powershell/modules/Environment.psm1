function Get-OperatingSystem {
    if ($IsWindows) {
        return 'windows'
    }

    if ($IsLinux) {
        return 'linux'
    }

    if ($IsMacOS) {
        return 'macos'
    }

    throw [System.PlatformNotSupportedException]::new(
        "Unrecoverable error occurred while getting operating system, operating system not supported.")
}

function Resolve-HomePath {
    param(
        [Parameter(Mandatory)]
        [string]$Path
    )

    if ([string]::IsNullOrWhiteSpace($Path)) {
        return $Path
    }

    switch -Regex ($Path) {
        '^~$' {
            return $HOME
        }

        '^~[\\/]' {
            return Join-Path $HOME $Path.Substring(2)
        }

        default {
            return $Path
        }
    }
}

Export-ModuleMember -Function Get-OperatingSystem, Resolve-HomePath