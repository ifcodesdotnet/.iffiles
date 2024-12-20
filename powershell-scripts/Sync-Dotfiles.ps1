Import-Module $([System.IO.Path]::Combine("$env:IF_HOME", ".iffiles", "powershell-modules","Configuration-Management.psm1"))

function main {
    foreach($item in $(Get-ConfigurationItemsByPlatform)) {

        if($null -ne $($item.dependencies)) {
            $dependencies = Get-Dependency -name $item.name
            foreach($dependency in $dependencies) {
                $dependant = Get-PlatformConfigurationByItemName -name $dependency

                Set-Configuration -name $($dependant.'name') -target $($dependant.'target-directory')
            }
        }

        $platform = Get-PlatformConfigurationByItemName -name $item.name

        Set-Configuration -name $($item.'name') -target $($platform.'target-directory')
    }
}

main