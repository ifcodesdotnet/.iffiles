#Requires AutoHotkey v2.0
#SingleInstance

; Remaps alt + f4 to windows + shift + q
#+q::
{
    Send "!{F4}"
}

; Minimizes the active window with windows + shift + m
#+m::
{
    WinMinimize("A")
}

; Opens my .dotfiles repository in vscode with windows + shift + c
#+c::
{
    ; I had some issues trying to use whatever corresponds to vscode in the path. It would temporarily
    ;  open up a terminal window and then open up my .dotfiles in vscode. When I hard code the path to
    ;  the vscode executable like so I don't this strange behavior.
    code := "C:\Users\" . A_UserName . "\AppData\Local\Programs\Microsoft VS Code\Code.exe"

    dotfiles := "C:\Users\" . A_UserName . "\.iffiles"

    Run code . " " . dotfiles
}

; Lowers the volumne by 2 with windows + shift + _
#+_::
{
    Send "{Volume_Down 2}"
}

; Raises the volume by 2 with windows + shift + +
#++::
{
    Send "{Volume_Up 2}"
}

; Mutes the volume with windows + shift + 0
#+0::
{
    Send "{Volume_Mute}"
}

; Remaps hyphen (-) to capslock
;  I can still use the regular functionality of capslock by using shift + capslock:
;  https://www.autohotkey.com/docs/v2/misc/Remap.htm#other-useful-remappings
+CapsLock::CapsLock
CapsLock::-

; Start context-sensitive hotkeys
;  https://www.autohotkey.com/docs/v2/lib/_HotIf.htm

; Replaces spaces with hyphens when File Explorer is the active window or when the Desktop is active
#HotIf WinActive("ahk_exe explorer.exe")
Space::-

; Replaces spaces with hyphens when the Save As prompt in File Explorer is the active window
#HotIf WinActive("Save As")
Space::-