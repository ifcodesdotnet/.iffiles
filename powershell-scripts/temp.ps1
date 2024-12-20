
$configurations = Get-Content -Path $([System.IO.Path]::Combine("$env:USERPROFILE", ".iffiles", "configv2.json")) -Raw | ConvertFrom-Json

$application =  $configurations | Where-Object { $_.name -eq "vscode" }

$platform = $application.platforms | Where-Object { $_.name -eq "mac" }

#  Write-Host $($platform."target-directory")



$platform = ($configurations | Where-Object { $_.name -eq "vscode" }).platforms | Where-Object { $_.name -eq "mac" }

Write-Host $($platform."target-directory")