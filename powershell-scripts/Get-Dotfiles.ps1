Import-Module $([System.IO.Path]::Combine("$env:IF_HOME", ".iffiles", "powershell-modules","Configuration-Management.psm1"))

function main {
    foreach($item in $(Get-ConfigurationItemsByPlatform)) {
        Write-Host "Configuration Name:" $item.name

        $platform = Get-PlatformConfigurationByItemName  -name $item.name

        # print target directory
        if ([string]::IsNullOrEmpty($($platform.'target-directory'))) {
            Write-Host "  - Target Directory:" $($env:IF_HOME)
        }
        else{
            Write-Host "  - Target Directory:" $([System.IO.Path]::Combine("$env:IF_HOME", $($platform.'target-directory')))
        }

        # print dependency information
        Write-Host "  - Dependencies:"
        if ($null -ne $item.dependencies) {
            $dependencies = Get-Dependency -name $item.name

            foreach ($dependency in $dependencies) {
                Write-Host "    - $($dependency)"
            }
        }
        else {
            Write-Host "    - none"
        }

        Write-Host " "
    }
}

main

# todo document somewhere that ths will only show dependencies for the current platform ..