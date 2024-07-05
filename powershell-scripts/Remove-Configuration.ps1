param (
    [string]
    [Parameter(Mandatory=$true)]
    $name,

    [string]
    [Parameter(Mandatory=$true)]
    $path
)

if (Test-Path $path) {

    $json = Get-Content -Raw -Path $path

    $context = $json | ConvertFrom-Json

    foreach ($configuration in $context.configurations) {

        if ($name -eq $configuration.'name' -or $name -eq "all" ) {

            # get the files we're going to delete from my repository
            $sources = Get-ChildItem -Path "$env:USERPROFILE\.iffiles\$($configuration.'name')"

            # loop through all the files in the current .dotfiles configuration directory,
            #  concatenating their names with the USERPROFILE environment variable as a default value.
            foreach ($source in $sources) {

                $target = "$env:USERPROFILE\$source"

                # if the target directory for the corresponding configuration is NOT null or an empty string
                #  reinitialize the target variable with the path to the target-directory from the corresponding
                #  configuration.
                if (![string]::IsNullOrEmpty($configuration.'target-directory')) {
                    $target = "$env:USERPROFILE\$($configuration.'target-directory')\$source"
                }

                Remove-Item -Path "$($target)"
                Write-Host "Removed configuration(s) for: $($configuration.'name')"
            }

            if ($name -ne "all") {
                break;
            }
        }
    }
}
else {
    throw "Context file not found at path: $path"
}