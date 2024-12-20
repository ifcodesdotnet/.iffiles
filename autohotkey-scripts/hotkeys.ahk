#Requires AutoHotkey v2.0
#SingleInstance

; Remaps alt + f4 to windows + shift + q
#+q::
{
    Send "!{F4}"
}

; Open windows terminal with windows + shift + enter
#+Enter::
{
  Run "wt.exe"
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

; The below hotstrings will use a different syntax that accounts for targeting both left and right
;   variations of modifier keys.
;  https://www.autohotkey.com/docs/v2/KeyList.htm

; Delete one character at a time with windows + shift + backspace
<#<+BackSpace::
{
    Send "{Del}"
}

; Delete one word at a time with control + shift + backspace
<^<+BackSpace::
{
    Send "^{Del}"
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
#HotIf

; Replaces spaces with hyphens when the Save As prompt in File Explorer is the active window
#HotIf WinActive("Save As")
Space::-
#HotIf


; Start movement controls

TraySetIcon("C:\Users\" . A_UserName . "\.iffiles\images\move-mode-disabled.ico",,)

moveMode := false
; https://www.autohotkey.com/boards/viewtopic.php?style=7&t=104397
~Shift::
{
  global moveMode
  if (A_ThisHotkey = A_PriorHotkey and A_TimeSincePriorHotkey < 200)
    if (!moveMode)
    {
        TraySetIcon("C:\Users\" . A_UserName . "\.iffiles\images\move-mode-enabled.ico",,)
        moveMode := true
    }
    else
    {
        TraySetIcon("C:\Users\" . A_UserName . "\.iffiles\images\move-mode-disabled.ico",,)
        moveMode := false
    }
}

#HotIf moveMode
j::
{
    Send "{Left}"
}

l::
{
    Send "{Right}"
}

i::
{
    Send "{Up}"
}

k::
{
    Send "{Down}"
}


; start code for moving word by word...
<^j::
{
    Send "^{Left}"
}

<^l::
{
    Send "^{Right}"
}


; Start code for  highlighting text...
<^<+l::
{
    Send "^+{Right}"
}

<^<+j::
{
    Send "^+{Left}"
}
#HotIf



; need to work on this some more..

; how am i going to replace home and end



; Move to the start of a line with windows + left
#+Left::
{
    Send "{Home}"
}

; Move to the end of a line with windows + right
#+Right::
{
    Send "{End}"
}

; Highlight the entire line from left to start using control + shift
<^+Left::
{
    Send "+{Home}"
}

; Highlight the entire line from right to end using control + shift
<^+Right::
{
    Send "+{End}"
}