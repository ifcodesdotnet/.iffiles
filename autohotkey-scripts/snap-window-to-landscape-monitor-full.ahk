#Requires AutoHotkey v2.0
#SingleInstance

#+w::
{
     WinMove(0,0,,, "A")

     title := WinGetTitle("A")

     WinMaximize(title)
}