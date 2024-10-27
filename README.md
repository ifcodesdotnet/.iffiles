# .iffiles

## Repository Structure
> How to get around...
- Each directory within the repository corresponds to a group of dotfiles.
  - To reduce the complexity of my dotfiles management scripts each dotfiles directory is flat (no sub-directories).
- The json file within the root directory of the repository contains the configuration metadata necessary managing configurations on the host machine:
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

After cloning the repository just execute the ```Set-Configuration``` PowerShell script with my personal.json context file.

```powershell
& ".iffiles\powershell-scripts\Set-Configuration.ps1" -name all -path ".iffiles\personal.json"
```

## Inspiration
- https://github.com/alrra/dotfiles
  - .gitconfig is neatly organizied and easy to understand
  - .gitconfig contains aliases that are multi-line functions
- https://github.com/jayharris/dotfiles-windows
  - PowerShell centric repository
- https://github.com/drmohundro/dotfiles/tree/main
  - Using PowerShell Core to bootstrap configurations and to create symlinks