param (
    [string]
    $path = $env:USERPROFILE + "\.iffiles\configuration-targets-personal.json"
)

# The -Raw parameter here will bring back the contents of the file as a single string
#  as opposed to an array of lines.
$json = Get-Content -Raw -Path $path

$targets = $json | ConvertFrom-Json

foreach ($configuration in $targets.configurations) {
    $source = $env:USERPROFILE + "\.iffiles\" + $configuration.'name'

    $target = $env:USERPROFILE + "\" + $configuration.'target-directory'

    Copy-Item -Force -Path "$source\*"  -Destination $target
}