<#
.SYNOPSIS
    Converts the configurations.json file to an array of PowerShell Objects.

.DESCRIPTION
    Converts the configuration file located at the root directory of the repository to an array of PowerShell objects.
    This function should not be exposed to other scripts as this is just used within the module to get the configuration
    data.
#>
function Get-Configurations {
    return Get-Content -Path $([System.IO.Path]::Combine("$env:IF_HOME", ".iffiles", "configurations.json")) -Raw | ConvertFrom-Json
}

<#
.SYNOPSIS
    Determines the Operating System platform based on the environment.

.DESCRIPTION
    Checks the corresponding host machine's environment to determine what Operating System platform the current script
    is running. For Windows we are checking the $env:OS Environment Variable and for MacOs we are checking the
    PowerShell Automatic variable $IsMacOs.
#>
function Get-Platform {
    if ($env:OS -eq "Windows_NT") {
        return "windows"
    }
    elseif ($IsMacOS) {
        return "mac"
    }
    else {
        throw [System.PlatformNotSupportedException]::new("Unrecoverable error occurred while getting platform, platform not supported.")
    }
}

<#
.SYNOPSIS
    Gets the configuration object based on the corresponding platform of the host machine.

.DESCRIPTION
    Get all the available configurations from the configurations file and filter out the configurations
    that are not for the current platform. This function should only get the configurations that apply
    to the current platform.
#>
function Get-ConfigurationItemsByPlatform {
    return $(Get-Configurations)| Where-Object { $_.platforms | Where-Object { $_.name -eq $(Get-Platform) } }
}

<#
.SYNOPSIS
    Get the configuration that corresponds to the configuration items platform.

.DESCRIPTION
    Get all the available configurations from the configurations file and filter out to the passed in
    name. Once we have the object return it's platform specific cofiguration.

.PARAMETER name
    The name of the configuration item that we want to get the configuration that corresponding to the host
    machine's platform.
#>
function Get-PlatformConfigurationByItemName {
    param (
        [string]
        $name
    )
    return ($(Get-Configurations) | Where-Object { $_.name -eq $name }).platforms | Where-Object { $_.name -eq $(Get-Platform) }
}

<#
.SYNOPSIS
    Recursively get dependencies and transitive dependencies for the specified configuration.

.DESCRIPTION
    Configurations can potentially have multiple dependencies, this function will recursively get
    both direct and transitive dependencies.

.PARAMETER name
    Subdirectory within the .dotfiles repository directory that contains versioned configuration files.

.PARAMETER configurations
    Collection of configuration objects parsed from the configurations.json file.
#>
function Get-DependencyRecursively {
    param (
        [string]
        $name,

        [array]
        $configurations
    )

    $configuration = $configurations | Where-Object { $_.name -eq $name }

    $dependencies = @()

    if ($configuration.dependencies) {

        $dependencies += $configuration.dependencies

        for ($index = 0; $index -lt $configuration.dependencies.Count; $index++) {

            $name = $configuration.dependencies[$index]

            $dependencies += Get-DependencyRecursively -name $name -configurations $configurations
        }
    }

    return $dependencies
}

<#
.SYNOPSIS
    Get dependencies and transitive dependencies for the specified configuration.

.DESCRIPTION
    Wrapper function to abstract recursive function to get dependencies.

.PARAMETER name
    Subdirectory within the .dotfiles repository directory that contains versioned configuration files.

.PARAMETER configurations
    Collection of configuration objects parsed from the configurations.json file.
#>
function Get-Dependency {
    param (
        [string]
        $name
    )

    return Get-DependencyRecursively -name $name -configurations $(Get-Configurations) | Sort-Object -Unique
}

<#
.SYNOPSIS
    Copy versioned configurations from my .dotfiles directory to their corresponding target directory.

.DESCRIPTION`
    This function will copy the version configuration files to their target directory based on my
    configurations.json file.

.PARAMETER name
    Subdirectory within the .dotfiles repository directory contains versioned configuration files.

.PARAMETER target
    The directory where versioned configurations are copied.
#>
function Set-Configuration {
    param (
        [string]
        $name,

        [string]
        $target
    )

    $source = [System.IO.Path]::Combine("$env:IF_HOME", ".iffiles", "$($name)", "*")

    if ([string]::IsNullOrEmpty($target)) {
        $target = "$env:IF_HOME"
    }
    else {
        $target = [System.IO.Path]::Combine("$env:IF_HOME", "$($target)")
    }

    if (-not (Test-Path -Path $target)) {
        New-Item -Path $target -ItemType Directory -Force | Out-Null
    }

    Copy-Item -Force -Path "$($source)" -Destination "$($target)"
}

<#
.SYNOPSIS
    Update my .dotfiles repository to reflect changes made outside of version control.

.DESCRIPTION
    Based on the corresponding configuration subdirectory in my .dotfiles directory this function will take
    updated applied configurations and copy them to the .dotfiles repository to bring in updates that
    have been made outside of source control.

.PARAMETER name
    Subdirectory within the .dotfiles repository directory contains versioned configuration files.

.PARAMETER target
    The directory where versioned configurations are copied.
#>
function Update-Configuration {
    param (
        [string]
        $name,

        [string]
        $target
    )

    # get configuration files being versioned in the corresponding directory within my .dotfiles repository.
    $configurations = [System.IO.Path]::Combine("$env:IF_HOME", ".iffiles", "$($name)") | Get-ChildItem -Force

    foreach ($configuration in $configurations) {

        if ([string]::IsNullOrEmpty($($target))) {
            $source = [System.IO.Path]::Combine("$env:IF_HOME", $configuration.Name)
        }
        else {
            $source = [System.IO.Path]::Combine("$env:IF_HOME", "$($target)", $configuration.Name)
        }

        Copy-Item -Force -Path "$($source)" -Destination "$($configuration.FullName)"
    }
}

Export-ModuleMember -Function 'Get-Dependency', 'Set-Configuration', 'Update-Configuration', 'Get-ItemConfigurationByItemName', 'Get-Platform', 'Get-ConfigurationItemsByPlatform', 'Get-PlatformConfigurationByItemName'