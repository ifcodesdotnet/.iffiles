# .iffiles

## Repository Structure
> How to get around...
- Each directory within the repository corresponds to a group of dotfiles.
  - To reduce the complexity of my dotfiles management scripts each dotfile directory is flat (no sub-directories).
- Each json file within the root directory of the repository contains instructions for my management scripts:
  - Name of each dotfile directory.
  - Directory the contents of each dotfile directory needs to be copied to.

## Naming Convention
> I'm sick of forgetting the name of a script or shortcut...
- To keep my scripts and shortcuts (except for AutoHotkey scripts) within the repository consistent (and in my brain) I've decided to adopt the PowerShell cmdlet naming convention.
- In a nutshell the naming convention for a PowerShell cmdlets is:
  - verb-and-noun
- I've also saved the following documents to the Repository that are directly from Microsoft's PowerShell documentation to reference (because I will forget in the future).
  - [Cmdlet Overview](docs/powershell/cmdlet-overview.pdf)
  - [Approved Verbs for PowerShell Commands](docs/powershell/cmdlet-overview.pdf)

## Installation
> Where is the 
After download the repository just execute the ```Set-Configuration``` PowerShell script with my personal.json instructions file.
```powershell
& ".iffiles\powershell-scripts\Set-Configuration.ps1" -name all -path ".iffiles\personal.json"
```