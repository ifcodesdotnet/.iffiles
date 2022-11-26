# .iffiles
> My personal .dotfiles for streamlining my workflow.

## Quick Apply .dotfiles
```powershell
& "$env:USERPROFILE\.iffiles\powershell-scripts\apply-dotfiles.ps1"
```
## Windows Dependencies
- autohotkey
- vscode
- gitbash

## AutoHotKey Scripts
- Hotkeys:
  - `Win` + `Shift` + `Q`
    - Remap for `Alt` + `F4` via the [close-application.ahk](autohotkey-scripts/close-application.ahk) script.
  - `Win` + `Shift` + `0`
    - Shortcut for muting my volume via the [volume-control.ahk](autohotkey-scripts/volume-control.ahk) script.
  - `Win` + `Shift` + `-`
    - Shortcut for my decreasing my volume via the [volume-control.ahk](autohotkey-scripts/volume-control.ahk) script.
  - `Win` + `Shift` + `+`
    - Shortcut for increasing my volume via the [volume-control.ahk](autohotkey-scripts/volume-control.ahk) script.
- Application Shortcuts:
  - `Win` + `Shift` + `C`
    - Shortcut for opening up my .dotfiles in vscode via the [open-vscode.ahk](autohotkey-scripts/open-vscode.ahk) script.
- Window Management:
  - `Win` + `Shift` + `A`
    - Shortcut for snapping the active window to the top of my portrait mode monitor via the [snap-window-to-portrait-monitor-top.ahk](autohotkey-scripts/snap-window-to-portrait-monitor-top.ahk) script.
  - `Win` + `Shift` + `Z`
    - Shortcut for snapping the active window to the bottom of my portrait mode monitor via the [snap-window-to-portrait-monitor-bottom.ahk](autohotkey-scripts/snap-window-to-portrait-monitor-bottom.ahk) script.

## Visual Studio Code Extensions
- rhalaly.scope-to-this
- streetsidesoftware.code-spell-checker
- tomoki1207.pdf
- vscode-icons-team.vscode-icons