# .iffiles

My personal collection of scripts and configurations for both Windows and macOS. Here are some of the major components I use daily:
- PowerShell Scripts & Profile:
  - PowerShell is my primary scripting language, the major scripts that synchronize and update my dotfiles are all written in PowerShell. I’ve also created a few aliases in my profile to navigate through the terminal quickly.
- AutoHotkey:
  - On my Windows platforms, I use AutoHotkey to manage application windows, text expansion, and remapped keyboard shortcuts.
- git:
  - To streamline my Git workflow, I created aliases that follow the PowerShell cmdlet naming convention, creating consistency between my PowerShell script names and my custom Git aliases (more on this in the [Naming Convention](#naming-convention) section).

## Repository Structure
> How to get around...
- Each directory within the repository corresponds to a group of dotfiles.
  - To reduce the complexity of my dotfiles management scripts each dotfiles directory is flat (no sub-directories).
- The json file (configurations.json) within the root directory of the repository contains the configuration metadata necessary for managing configurations on the host machine:
  - Name of each dotfiles directory.
  - Directory where the contents of each dotfiles directory should be copied to apply configurations to the host machine.

## Naming Convention
> I'm sick of forgetting the name of a script or shortcut...
- To keep my scripts, shortcuts and aliases (except for AutoHotkey scripts) within the repository consistent (and in my brain) I've decided to adopt the PowerShell cmdlet naming convention.
- In a nutshell the naming convention for a PowerShell cmdlets is:
  - verb-and-noun
- I've also saved the following documents to the repository that are directly from Microsoft's PowerShell documentation for reference (because I will forget in the future).
  - [Cmdlet Overview](docs/powershell/cmdlet-overview.pdf)
  - [Approved Verbs for PowerShell Commands](docs/powershell/cmdlet-overview.pdf)

## Software Dependencies
> The stuff that needs to be installed...

My dotfiles management scripts will apply configurations based on the current platform, regardless if the corresponding software is installed. To see which configurations will be applied based on platform, refer to the table below:

| Application   | Windows    | macOS     |
|---------------|------------|-----------|
| AutoHotkey    | Yes        | No        |
| Via           | Yes        | Yes       |
| Git           | Yes        | Yes       |
| Git Bash      | Yes        | No        |
| PowerShell    | Yes        | Yes       |
| VS Code       | Yes        | Yes       |
| zsh           | No         | Yes       |

## Cloning Repository & Bootstrapping Environment
> Where is the code...

To quickly clone the repository run the following PowerShell snippets based on your platform:

### Windows Platforms
```powershell
Set-Location $env:USERPROFILE; & git clone https://www.github.com/ifcodesdotnet/.iffiles
```

### macOS Platforms
```powershell
Set-Location $env:HOME; & git clone https://www.github.com/ifcodesdotnet/.iffiles
```

### Bootstrapping the Environment
Once the repository has been successfully cloned, the environment needs to be bootstrapped with the necessary environment variables. My dotfiles are heavily dependent on environment variables to make my scripts as cross platform as possible. The following environment variables will be created after running the ```Invoke-BootstrapEnvironment``` script:
  - ```IF_BOOTSTRAPPED```:
    - A flag that marks the environment as already bootstrapped.
  - ```IF_HOME```:
    - Windows and macOS use different environment variables to reference the user's home directory. This environment variable points to the current user's home directory, regardless of the platform.

To finally run the ```Invoke-BootstrapEnvironment``` PowerShell script run the following code snippet in the root directory of the repository:
```powershell
& ([System.IO.Path]::Combine("powershell-scripts", "Invoke-BootstrapEnvironment.ps1"))
```

- **Note:** The PowerShell execution policy must be set to Bypass or Unrestricted in order for the script to run. To set this, open PowerShell as an administrator and execute the following command:

  ```powershell
  Set-ExecutionPolicy Bypass -Scope CurrentUser
  ```

## Applying & Managing Dotfiles

The following PowerShell scripts can be used to manage my dotfiles:
- ```Sync-Dotfiles```:
  - This script is used to copy configurations from the repository to the target directory on the host machine.
- ```Update-Dotfiles```
  - This script is used to copy changes made outside of the repository back into the repository.

## Inspiration
- https://github.com/alrra/dotfiles
  - .gitconfig is neatly organized, easy to understand, and contains aliases that are multi-line functions.
- https://github.com/jayharris/dotfiles-windows
  - PowerShell centric repository
- https://github.com/drmohundro/dotfiles
  - Using PowerShell Core to [bootstrap](https://github.com/drmohundro/dotfiles/blob/main/install.ps1) configurations and to create symlinks