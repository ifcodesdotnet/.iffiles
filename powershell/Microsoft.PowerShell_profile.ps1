Set-Alias c Clear-Host;
Set-Alias reload Invoke-ProfileReload;

function Invoke-ProfileReload {
    & $profile
}

$env:PATH += "$env:UserProfile\Desktop\test-scripts"