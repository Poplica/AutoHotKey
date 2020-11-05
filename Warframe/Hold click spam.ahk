#NoEnv
#SingleInstance, Force
#IfWinActive, Warframe
#MaxThreadsPerHotkey, 3

; SendMode, Input

; $LButton::
;   While (GetKeyState("LButton","P")) {
;     Click
;     ; SendPlay, {Click}
;     Sleep 100
;   }
; Return

; $MButton::
;   While (GetKeyState("MButton","P")) {
;     Click, M
;     Sleep 50
;   }
; Return
;===============================
x::
  Send, {XButton1}
  ; While (GetKeyState("x","P")) {
  ;   Click
  ;   ; SendPlay, {Click}
  ;   Sleep 100
  ; }
Return

$XButton1::
  While (GetKeyState("XButton1","P")) {
    ; Click
    Send, {XButton1}
    Sleep, 50
  }
Return

; q::
;   While (GetKeyState("q","P")) {
;     Send, {Space}
;     Sleep, 1
;   }
; Return
; ===============================
; $RButton::
;   Loop { 
;     Click, R
;     sleep 50
;     If (!GetKeyState("RButton","p"))
;       break
;   }
; Return

NumpadSub:: 
  ; Suspend, Toggle
  Reload
Return