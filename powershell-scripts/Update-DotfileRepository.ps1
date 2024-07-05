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

        # get the files for the current .dotfiles configuration directory, these are
        #  going to be our targets since we want to update the .dotfiles repository.
        $targets = Get-ChildItem -Path "$env:USERPROFILE\.iffiles\$($configuration.'name')"

c
        foreach($target in $targets) {

            $source = "$env:USERPROFILE\$target"

            # if the target directory for the corresponding configuration is NOT null or an empty string
            #  reinitialize the source variable with the path to the target-directory from the corresponding
            #  configuration.
            if (![string]::IsNullOrEmpty($configuration.'target-directory')) {
                $source = "$env:USERPROFILE\$($configuration.'target-directory')\$target"
            }

            Copy-Item -Force -Path "$source" -Destination "$($target.FullName)"
        }

        Write-Host "Copied configuration(s) for: $($configuration.'name')"

        if ($name -ne "all") {
            break;
        }
    }
}