Import-Module $([System.IO.Path]::Combine("$env:USERPROFILE", ".iffiles", "powershell-modules","Configuration-Management.psm1"))

function main {

    $configurations = Get-Content -Path $([System.IO.Path]::Combine("$env:USERPROFILE", ".iffiles", "configurations.json")) -Raw | ConvertFrom-Json

    foreach($configuration in $configurations) {

        if($null -ne $($configuration.'dependencies')) {
            $dependencies = Get-Dependency -name $($configuration.'name') -configurations $configurations

            foreach($dependency in $dependencies) {
                $dependant = Get-Configuration -name $dependency -configurations $configurations
                Set-Configuration -name $($dependant.'name') -target $($dependant.'target-directory')
            }
        }

        Set-Configuration -name $($configuration.'name') -target $($configuration.'target-directory')
    }
}

main