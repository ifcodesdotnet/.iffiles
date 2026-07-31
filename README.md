# .iffiles

.iffiles is my personal dotfiles repository for Windows, Linux, and macOS.

Instead of using symbolic links, I organize my configuration files with explicit manifests that define exactly what gets deployed and where it belongs. Everything is deployed using PowerShell Core, giving me a simple, predictable way to keep my development environment consistent across machines.

This repository is the source of truth for my development environment, while the files deployed to each machine remain independent copies.

## Design Principles

A few ideas guide how this repository is organized:

- **Explicit over implicit**: Every deployed file is listed in a manifest.
- **Copy, don't symlink**: Configuration files are copied to their destinations instead of being linked.
- **Cross-platform**: The same repository works across Windows, Linux, and macOS.
- **PowerShell first**: Deployment is handled entirely with PowerShell Core.

Nothing happens by convention or directory structure. If a file is deployed, it's because it was intentionally declared in a manifest.

## Quick Start

Follow these steps in order on any new machine. All commands are run from the root of this repository, using `pwsh` (not `powershell.exe`).

1. **Install PowerShell Core**, if you don't already have it — see [Prerequisites](#prerequisites).
2. **Clone this repository** and open a `pwsh` prompt in its root folder.
3. **Run `Initialize-Environment.ps1`** to install the `Environment` helper module. This is a one-time setup step (rerun only when the module itself changes):

   ```powershell
   pwsh ./powershell/scripts/Initialize-Environment.ps1
   ```

4. **Run `Set-Dotfiles.ps1`** to deploy every configuration file in the repository to its correct location for your OS:

   ```powershell
   pwsh ./powershell/scripts/Set-Dotfiles.ps1
   ```

That's it your environment is provisioned. Whenever you pull new changes from this repository, redeploy them by running steps 3 and 4 again (step 3 only matters if `Environment.psm1` changed; step 4 is safe and needed every time).

## Repository Layout

Each application has its own directory containing its configuration files and a `manifest.json` file.

```text
.
├── autohotkey/
│   ├── manifest.json
│   └── ...
├── git/
│   ├── manifest.json
│   └── ...
├── powershell/
│   ├── manifest.json
│   └── ...
└── ...
```

## Manifest Format

Each manifest explicitly declares every file that should be copied, and where it goes on each supported operating system.

Example:

```json
{
    "files": [
        {
            "source": "init.lua",
            "destination": {
                "macos": "~/.hammerspoon/init.lua"
            }
        }
    ]
}
```

### `source`

Path to the file, relative to the directory containing the manifest.

### `destination`

An object mapping operating system name (`windows`, `macos`, `linux`) to the path the file should be copied to on that OS. `~` is resolved to the current user's home directory.

If an OS key is omitted, that file simply isn't deployed on that OS. For example, [autohotkey/manifest.json](autohotkey/manifest.json) only declares a `windows` destination, since AutoHotkey doesn't apply to macOS or Linux.

## Prerequisites

All scripts in this repository are written for **PowerShell Core (`pwsh`)**, not Windows PowerShell (`powershell.exe`). Install it before running anything here:

- **Windows**: `winget install --id Microsoft.PowerShell --source winget`
- **macOS**: `brew install --cask powershell`
- **Linux**: see the [official installation instructions](https://learn.microsoft.com/powershell/scripting/install/installing-powershell-on-linux) for your distribution

Verify it's installed and on your `PATH`:

```powershell
pwsh --version
```

Run every command in this README (and every script in the repository) with `pwsh`, not `powershell.exe`.

## The `Initialize-Environment` Script

[powershell/scripts/Initialize-Environment.ps1](powershell/scripts/Initialize-Environment.ps1) installs the `Environment` PowerShell module — a small helper module (`Get-OperatingSystem`, `Resolve-HomePath`) that `Set-Dotfiles.ps1` depends on to figure out which OS it's running on and to expand `~` in destination paths.

Run it with:

```powershell
pwsh ./powershell/scripts/Initialize-Environment.ps1
```

What it does:

1. Determines your OS-specific PowerShell user module directory (see below).
2. Creates that directory if it doesn't already exist.
3. Copies [powershell/modules/Environment.psm1](powershell/modules/Environment.psm1) into it.

From that point on, the module is loaded by name (`Import-Module Environment`) like any other installed module — it is **not** loaded from the repository path.

**You must run this before running `Set-Dotfiles.ps1` for the first time**, since `Set-Dotfiles.ps1` starts with `Import-Module Environment` and will fail if the module isn't installed yet.

Because `Initialize-Environment.ps1` copies the module rather than linking it, you need to **rerun it any time `Environment.psm1` changes** in the repository (e.g. after pulling new commits) to pick up the update. Editing the installed copy directly has no effect on the repository, and vice versa.

User module install location:

- **Windows**: `C:\Users\<username>\Documents\PowerShell\Modules`
- **macOS / Linux**: `~/.local/share/powershell/Modules`

## Applying the Configuration

Once the `Environment` module is installed, deploy all configurations:

```powershell
pwsh ./powershell/scripts/Set-Dotfiles.ps1
```

The deployment script:

1. Discovers every `manifest.json` in the repository.
2. Determines the current operating system.
3. Resolves user-relative paths (such as `~`).
4. Copies each configured file to its destination, creating destination folders as needed.

## Deployment Model

Configuration files are **copied**, not linked.

Once deployed, the files on the target machine are independent from the repository. This allows me to experiment with or temporarily modify deployed configurations without affecting the source files stored in Git.

When I want to update my environment from the repository, I simply run `Set-Dotfiles.ps1` again to redeploy the latest versions.

## Inspiration

- [alrra/dotfiles](https://github.com/alrra/dotfiles): a clean, well-organized `.gitconfig` with readable multi-line alias functions.
- [jayharris/dotfiles-windows](https://github.com/jayharris/dotfiles-windows): a PowerShell-centric approach to managing dotfiles on Windows.
- [drmohundro/dotfiles](https://github.com/drmohundro/dotfiles): uses PowerShell Core to [bootstrap](https://github.com/drmohundro/dotfiles/blob/main/install.ps1) configuration and create symlinks.