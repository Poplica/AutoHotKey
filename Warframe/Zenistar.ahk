#NoEnv
#IfWinActive, Warframe
#SingleInstance, Force

End::
  toggle := !toggle
  While (toggle) {
    Send, {e Down}
    Sleep, 2500
    Send, {e Up}
    Sleep, 2000

    Send, {w Down}
    Sleep, 1000
    Send, {w Up}
    Send, {s Down}
    Sleep, 1100
    Send, {s Up}

    Sleep, 44500
  }
Return

PrintScreen::Reload
Return
