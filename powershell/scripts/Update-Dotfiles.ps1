Import-Module Environment

function Update-Dotfiles {
    $manifestFiles = Get-ChildItem -Path (Join-Path $HOME '.iffiles') -Recurse -Filter "manifest.json"

    foreach ($manifestFile in $manifestFiles) {

        $manifest = Get-Content $manifestFile.FullName | ConvertFrom-Json

        $operatingSystem = Get-OperatingSystem

        foreach ($file in $manifest.files) {

            if ([string]::IsNullOrWhiteSpace($file.destination.$operatingSystem)) {
                continue
            }

            $source = Resolve-HomePath $file.destination.$operatingSystem

            $destination = Join-Path $manifestFile.DirectoryName $file.source

            if (-not (Test-Path $source)) {
                continue
            }

            Copy-Item -Path $source -Destination $destination -Force
        }
    }
}

Update-Dotfiles