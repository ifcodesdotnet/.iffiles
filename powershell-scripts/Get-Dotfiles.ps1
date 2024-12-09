Import-Module $([System.IO.Path]::Combine("$env:USERPROFILE", ".iffiles", "powershell-modules","Configuration-Management.psm1"))

function main {
    $configurations = Get-Content -Path $([System.IO.Path]::Combine("$env:USERPROFILE", ".iffiles", "configurations.json")) -Raw | ConvertFrom-Json

    foreach ($configuration in $configurations) {
        Write-Host "Configuration Name:" $configuration.name

        # print target directory
        if ([string]::IsNullOrEmpty($($configuration.'target-directory'))) {
            Write-Host "  - Target Directory:" $($env:USERPROFILE)
        }
        else{
            Write-Host "  - Target Directory:" $configuration.'target-directory'
        }

        # print dependency information
        Write-Host "  - Dependencies:"
        if ($null -ne $configuration.dependencies) {
            $dependencies = Get-Dependency -name $configuration.name -configurations $configurations

            foreach ($dependency in $dependencies) {
                $dependencyConfig = Get-Configuration -name $dependency -configurations $configurations
                Write-Host "    - $($dependencyConfig.name)"
            }
        }
        else {
            Write-Host "    - none"
        }

        Write-Host " "
    }
}

main