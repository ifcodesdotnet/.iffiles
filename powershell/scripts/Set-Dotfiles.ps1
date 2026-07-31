Import-Module Environment

function Set-Dotfiles {
    $manifestFiles = Get-ChildItem -Path (Join-Path $HOME '.iffiles') -Recurse -Filter "manifest.json"

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