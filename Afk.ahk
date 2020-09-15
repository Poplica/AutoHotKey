#NoEnv
#IfWinActive, Warframe
#SingleInstance, Force

End::
  toggle := !toggle
  While (toggle) {
    Send, {w Down}
    Sleep, 1000
    Send, {w Up}
    Send, {s Down}
    Sleep, 1000
    Send, {s Up}
  }
Return
