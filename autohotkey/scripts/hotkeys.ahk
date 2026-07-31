#Requires AutoHotkey v2.0
#SingleInstance

; Hotkeys for Window Management

; Windows + Shift + Q:
; Close the currently active window by sending Alt + F4.
#+q::
{
    Send "!{F4}"
}

; Windows + Shift + M:
; Minimize the currently active window.
#+m::
{
    WinMinimize("A")
}

; Windows + Shift + _:
; Lower the system volume by 2.
#+_::
{
    Send "{Volume_Down 2}"
}

; Windows + Shift + +:
; Raise the system volume by 2.
#++::
{
    Send "{Volume_Up 2}"
}

; Windows + Shift + 0:
; Toggle system mute.
#+0::
{
    Send "{Volume_Mute}"
}

; Hotkeys for Launching Applications

; Windows + Shift + Enter:
; Activate an existing Windows Terminal window,
; or launch Windows Terminal if it isn't already running.
#+Enter::
{
    if WinExist("ahk_exe WindowsTerminal.exe")
    {
        WinActivate("ahk_exe WindowsTerminal.exe")
    }
    else
    {
        Run "wt.exe"
        WinWait("ahk_exe WindowsTerminal.exe")
        WinActivate("ahk_exe WindowsTerminal.exe")
    }
}

; Windows + Shift + C:
; Open the .iffiles repository in VS Code.
#+c::
{
    code := A_LocalAppData . "\Programs\Microsoft VS Code\Code.exe"
    dotfiles := A_UserProfile . "\.iffiles"

    Run '"' . code . '" "' . dotfiles . '"'
}