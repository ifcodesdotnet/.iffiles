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
        $name,

        [array]
        $configurations
    )

    return Get-DependencyRecursively -name $name -configurations $configurations | Sort-Object -Unique
}

<#
.SYNOPSIS
    Get the specified configuration object from the collection of configuration objects by name.

.DESCRIPTION
    Returns the corresponding configuration object based on the specfied name.

.PARAMETER name
    Subdirectory within the .dotfiles repository directory contains versioned configuration files.

.PARAMETER configurations
    Collection of configuration objects parsed from the configurations.json file.
#>
function Get-Configuration {
    param (
        [string]
        $name,

        [array]
        $configurations
    )

    return $configurations | Where-Object { $_.name -eq $name }
}

<#
.SYNOPSIS
    Copy versioned configurations from my .dotfiles directory to their corresponding target directory.

.DESCRIPTION
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

    $source = [System.IO.Path]::Combine("$env:USERPROFILE", ".iffiles", "$($name)", "*")

    if ([string]::IsNullOrEmpty($target)) {
        $target = "$env:USERPROFILE"
    }
    else {
        $target = [System.IO.Path]::Combine("$env:USERPROFILE", "$($target)")
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
    $configurations = [System.IO.Path]::Combine("$env:USERPROFILE", ".iffiles", "$($name)") | Get-ChildItem

    foreach ($configuration in $configurations) {

        if ([string]::IsNullOrEmpty($($target))) {
            $source = [System.IO.Path]::Combine("$env:USERPROFILE", "$configuration")
        }
        else {
            $source = [System.IO.Path]::Combine("$env:USERPROFILE", "$($target)", "$configuration")
        }

        Copy-Item -Path "$($source)" -Destination "$($configuration.FullName)"
    }
}

Export-ModuleMember -Function 'Get-Dependency', 'Get-Configuration', 'Set-Configuration', 'Update-Configuration'