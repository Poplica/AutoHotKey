#SingleInstance force
#MaxThreadsPerHotkey 3
SetControlDelay -1

; 72% in BlueLight Filter
toggle = 0

`::
    toggle := !toggle
    while toggle{
        Click
        Sleep 100
    }
return

^!z::  ; Control+Alt+Z hotkey.
MouseGetPos, MouseX, MouseY
PixelGetColor, color, %MouseX%, %MouseY%
MsgBox The color at the current cursor position is %color%
return
