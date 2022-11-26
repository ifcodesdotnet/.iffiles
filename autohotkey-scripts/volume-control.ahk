#Requires AutoHotkey v2.0
#SingleInstance

#+_::
{
    Send "{Volume_Down 2}"
}

#++::
{
    Send "{Volume_Up 2}"
}

#+0::
{
    Send "{Volume_Mute}"
}