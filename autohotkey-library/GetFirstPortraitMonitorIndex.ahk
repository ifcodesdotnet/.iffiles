GetFirstPortraitMonitorIndex() {

    Count := MonitorGetCount()

    Loop Count {
        ;bounding coordinates, in pixels.
        monitor := MonitorGet(A_Index, &Left, &Top, &Right, &Bottom)

        width := Right - Left
        height := Bottom - Top

        if(height > width) {
             return A_Index
        }
    }

    return 0
}