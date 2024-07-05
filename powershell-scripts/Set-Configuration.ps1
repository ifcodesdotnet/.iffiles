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
}
else {
    throw "Context file not found at path: $path"
}