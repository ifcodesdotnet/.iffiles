# .iffiles

## Repository Structure
> How to get around...
- Each directory within the repository corresponds to a group of dotfiles.
  - To reduce the complexity of my dotfiles management scripts each dotfiles directory is flat (no sub-directories).
- The json file (configurations.json) within the root directory of the repository contains the configuration metadata necessary for managing configurations on the host machine:
  - Name of each dotfiles directory.
  - Directory where the contents of each dotfiles folder should be copied to apply configurations to the host machine.

## Naming Convention
> I'm sick of forgetting the name of a script or shortcut...
- To keep my scripts and shortcuts (except for AutoHotkey scripts) within the repository consistent (and in my brain) I've decided to adopt the PowerShell cmdlet naming convention.
- In a nutshell the naming convention for a PowerShell cmdlets is:
  - verb-and-noun
- I've also saved the following documents to the Repository that are directly from Microsoft's PowerShell documentation to reference (because I will forget in the future).
  - [Cmdlet Overview](docs/powershell/cmdlet-overview.pdf)
  - [Approved Verbs for PowerShell Commands](docs/powershell/cmdlet-overview.pdf)

## Installation
> Where is the code...

The following PowerShell script snippet can be used to clone the repository and synchronize dotfiles to the host machine.

> **Note:** Make sure your PowerShell execution policy is set to either Bypass or Unrestricted to allow the script to run. To do this, open PowerShell as an administrator and execute the following command:
```powershell
Set-ExecutionPolicy Bypass -Scope CurrentUser
```

Once the execution policy is updated, you can run the below script:
```powershell
Set-Location $env:USERPROFILE; & git clone https://www.github.com/ifcodesdotnet/.iffiles; & Set-Location .iffiles; & $(Join-Path -Path powershell-scripts -ChildPath Sync-Dotfiles.ps1)
```

## Inspiration
- https://github.com/alrra/dotfiles
  - .gitconfig is neatly organized, easy to understand, and contains aliases that are multi-line functions.
- https://github.com/jayharris/dotfiles-windows
  - PowerShell centric repository
- https://github.com/drmohundro/dotfiles
  - Using PowerShell Core to [bootstrap](https://github.com/drmohundro/dotfiles/blob/main/install.ps1) configurations and to create symlinks