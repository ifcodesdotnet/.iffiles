; Script Name: move-window-to-reference-screen-bottom.ahk
; Description: Executes my ifwin console utility when keyboard shortcut
;              Windows+Shift+z is pressed to quickly snap the active window to
;              the bottom of my second monitor / reference screen.
; GitHub Repository: https://github.com/ifcodesdotnet/.iffiles
; References:
;   https://www.autohotkey.com/docs/v2/lib/WinGetTitle.htm
;     Link to WinGetTitle documentation, explains that adding the A flag is
;     used for getting the title of the active window.
;   https://www.autohotkey.com/docs/v2/lib/Run.htm
;     Link to Run documentation, explains that adding the Hide flag will run
;     ifwin in the background so that it is hidden.

#+z::
{
    WinGetTitle, title, A
    Run, ifwin -t "%title%" -p bottom, , Hide
}