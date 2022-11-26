#Requires AutoHotkey v2.0
#SingleInstance
#Include <WinGetPosEx>
#Include <GetFirstPortraitMonitorIndex>

#+z::
{
    Monitor := GetFirstPortraitMonitorIndex()

    if(Monitor > 0) {
        MonitorGetWorkArea(Monitor, &MonitorWorkAreaLeft, &MonitorWorkAreaTop, &MonitorWorkAreaRight, &MonitorWorkAreaBottom)

        WindowHeight := (MonitorWorkAreaBottom - MonitorWorkAreaTop)/2
        WindowWidth := (MonitorWorkAreaRight - MonitorWorkAreaLeft)

        WindowXCoordinates := MonitorWorkAreaLeft
        WindowYCoordinates := MonitorWorkAreaBottom - WindowHeight

        ; check if the window we want to snap is maximized, if the window is
        ;  maximized we need to restore it since we can't move windows that
        ;  are maximized:
        ;    -1 the window is minimized
        ;    1 the window is maximized
        ;    0 the window is neither minimized nor maximized.
        state := WinGetMinMax("A")

        if(state == 1) {
            title := WinGetTitle("A")
            WinRestore(title)
        }

        window := WinGetID("A")

        ; Use WinGetPosEx to determine position/size offsets (to remove gaps around windows)
        WinGetPosEx(window, &X, &Y, &realWidth, &realHeight, &offsetX, &offsetY)

        ; Move and resize the active window
        WinMove((WindowXCoordinates + offsetX), (WindowYCoordinates + offsetY), (WindowWidth + offsetX * -2), (WindowHeight + (offsetY - 2) * -2), "A")
    }
}