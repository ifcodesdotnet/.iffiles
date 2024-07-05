param (
    [string]
    [Parameter(Mandatory=$true)]
    $name,

    [string]
    [Parameter(Mandatory=$true)]
    $path
)

# Get-Context is sourced from my PowerShell profile and is used to parse the json
#  configuration file that contains all the target directories for my .dotfiles.
$context = Get-Context -Path $path

foreach ($configuration in $context.configurations) {

    if($name -eq $configuration.'name' -or $name -eq "all" ) {

        $source = "$env:USERPROFILE\.iffiles\$($configuration.'name')"

        $target = "$env:USERPROFILE"

        # if the target directory for the corresponding configuration is NOT null or an empty string
        #  reinitialize the target variable with the path to the target-directory from the corresponding
        #  configuration.
        if (![string]::IsNullOrEmpty($configuration.'target-directory')) {
            $target = "$env:USERPROFILE\$($configuration.'target-directory')"
        }

        Copy-Item -Force -Path "$($source)\*" -Destination "$($target)"
        Write-Host "Set configuration(s) for: $($configuration.'name')"

        if ($name -ne "all") {
            break;
        }
    }
}