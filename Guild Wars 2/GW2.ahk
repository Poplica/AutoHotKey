#NoEnv
#IfWinActive, Guild Wars 2
#SingleInstance, Force

SendMode, Input
; SetKeyDelay, 0
SetBatchLines, -1

; Forge first 4 slots
Insert::
  ; Loop 40 {
    sleepDuration := 25
    Click, 541, 265 ; slot 0
    Click, 541, 265
    Sleep, sleepDuration
    Click, 606, 265 ; slot 1
    Click, 606, 265
    Sleep, sleepDuration
    Click, 662, 265 ; slot 3
    Click, 662, 265
    Sleep, sleepDuration
    Click, 715, 265 ; slot 4
    Click, 715, 265

    Sleep, sleepDuration
    Click, 1111, 710 ; forge

    Send, f ; Open forge window again
    ; Click, 1640, 195
    ; Click, 1640, 195

  ;   Sleep, 300
  ; }
Return

Return

; GG macro
NumpadDiv::
  Send, /
  Sleep, 50
  Send, gg{Enter}
Return

; ===== SAB macros =====
; Dodge jump & Jump spam
; XButton1::
;   Send, {Space}{XButton1}
; Return
; Space::
;   While (GetKeyState("Space","P")) {
;     Send, {Space}
;     Sleep, 50
;   }
; Return

; Double jump spam at 30 fps
; CapsLock::
;   Send, {Space}
;   Sleep, 48
;   Send, {1}
;   Sleep, 28
;   Send, {``}
;   Sleep, 50
; Return

; Emote dodge cancel for LOYF
; XButton1::
;   Send, /
;   Sleep, 50
;   Send, laugh
;   Send, {Enter}
;   Send, {XButton1}
;   ; Sleep, 60 ; uncomment for 2x loyf single press
;   ; Send, {XButton1}
; Return

; Devourer precast
; Z::
; Send, {F4}
; Sleep, 100
; Send, {F2}
; Sleep, 1250
; Send, {F4}{F5}
; Return

; Siax ligma precast
; Z::
; Send, {5}
; Sleep, 132
; Send, {F4}
; Sleep, 201
; Send, {F2}
; Sleep, 1169
; Send, {F4}
; Sleep, 200
; Send, {F5}
; Sleep, 133
; Send, {``}
; Return

; Infinite Crystallized Magic
; Hover mouse over the CM, then start script. Alt + Equal to start. Ctrl + NumpadSub to stop
!=::
  MouseGetPos, currX, currY
  Loop {
    Click, currX, currY
    Click, currX, currY
    Sleep, 12000
    Send, {Escape}
    Sleep, 1500 ; 1460
    Send, {i}
    Sleep, 200
    MouseMove, currX, currY
  }
Return

; Hold home to auto click
Home::
  While (GetKeyState("Home","P")) {
    Click
    Sleep, 50
  }
Return

; Feed Candy Corn Gobbler
PgUp::
  Loop 12 {
    Click, 2
    Sleep, 5100
  }
Return

; Deposit all and take all
PgDn::
  sleepDuration := 120

  Click, 1825, 60 ; deposit all
  Sleep, sleepDuration
  ; Click, 1060, 620 ; take all
  ; Sleep, sleepDuration

  ; Click, right, 1460, 135 ; right click copper kit
  Click, right, 1515, 135 ; right click runecrafter kit
  ; Click, right, 1570, 135 ; right click silver kit
  Sleep, sleepDuration + 50
  ; Click, 1520, 170 ; salvage blues
  Click, 1520, 200 ; salvage greens
  ; Click, 1600, 220 ; salvage yellows
  Sleep, sleepDuration
  Click, 900, 765 ; ok (with a lot of greens in inventory)
  Sleep, sleepDuration
Return

; Give 250 exotic luck to Drooburt
; PgUp::
;   Loop 10000 {
;     Send, f
;     Sleep, 400
;     Click
;     Sleep, 300
;   }
; Return

^NumpadSub::
  Reload
Return

^NumpadMult::
  Suspend, Toggle
Return