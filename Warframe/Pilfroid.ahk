#SingleInstance, Force
#IfWinActive, Warframe
#MaxThreadsPerHotkey, 3

SetControlDelay, -1
SetMouseDelay, -1

NumpadSub::
  toggle := !toggle
  while (toggle) { ; && WinActive("WARFRAME")
    Send {4 down}
    Sleep 2000
    Send {4 up}
    Sleep 40000
  }
return

~Esc::
  toggle := false
  ; suspend permit
  ; exitapp 
return
