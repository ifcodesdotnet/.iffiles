; Script Name:kebab-case-clipboard.ahk
; Description: Replaces spaces in text saved to clipboard with hyphens.
; GitHub Repository: https://github.com/ifcodesdotnet/.iffiles
; References:
;   https://www.autohotkey.com/docs/v2/lib/StrReplace.htm
;     Link to StrReplace documentation
;
;   https://www.autohotkey.com/docs/v2/lib/A_Clipboard.htm
;     Link A_Clipboard documentation

#+k::
{
    A_Clipboard := StrReplace(A_Clipboard, A_SPACE, "-")
}