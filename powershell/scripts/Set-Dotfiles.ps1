Import-Module Environment

function Set-Dotfiles {
    $repository = Join-Path $HOME '.iffiles'

    if (-not (Test-Path $repository)) {
        throw "Dotfiles repository not found at '$repository'. Clone it to ~/.iffiles and try again."
    }

    $manifestFiles = Get-ChildItem -Path $repository -Recurse -Filter "manifest.json"

    foreach ($manifestFile in $manifestFiles) {

        $manifest = Get-Content $manifestFile.FullName | ConvertFrom-Json

        $operatingSystem = Get-OperatingSystem

        foreach ($file in $manifest.files) {

            if ([string]::IsNullOrWhiteSpace($file.destination.$operatingSystem)) {
                continue
            }

            $source = Join-Path $manifestFile.DirectoryName $file.source

            $destination = Resolve-HomePath $file.destination.$operatingSystem

            # Create the destination folder if it doesn't already exist.
            $parent = Split-Path $destination -Parent

            if (-not (Test-Path $parent)) {
                New-Item -ItemType Directory -Path $parent -Force | Out-Null
            }

            Copy-Item -Path $source -Destination $destination -Force
        }
    }
}

Set-Dotfiles
