#NoEnv
#IfWinActive, Warframe
#SingleInstance, Force
#MaxThreadsPerHotkey, 3

1::
  toggle := !toggle
  While (toggle) {
    Send, 1
    ; Click, L
    Sleep, 100
    ; Sleep, 1000
  }
Return

~Esc::
  Suspend, Permit
  Exitapp 
Return