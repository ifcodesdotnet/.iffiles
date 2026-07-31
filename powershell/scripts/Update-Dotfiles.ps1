Import-Module Environment

function Update-Dotfiles {
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
