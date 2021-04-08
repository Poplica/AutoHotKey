#NoEnv
#IfWinActive, Guild Wars 2
#SingleInstance, Force

SendMode, Input
SetKeyDelay, 0

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

; Auto Draconis Mons
; ^Insert::
;   sleepDuration := 100
;   numScroll := 1

;   MouseGetPos, currX, currY
;   Click, 2
;   Sleep, 10000
;   Send, f ; loot
;   Sleep, 10000
;   Send, {F12}
;   Sleep, sleepDuration
;   Click, 950, 600 ; char select
;   Sleep, 5000
;   Click, numScroll, 1385, 985 ; char scroll bar 
;   Sleep, sleepDuration
;   MouseMove, currX, currY
; Return

; Destroy moused item
; Delete::
;   MouseGetPos, currX, currY
;   MouseClick, Right
;   Sleep, 100
;   MouseMove, currX+40, currY+30
;   Sleep, 100
;   Click
;   MouseMove, 960, 590
;   Sleep, 100
;   Click
;   MouseMove, currX, currY
; Return

; Dodge jump
; ~XButton1::
;   Send, {space}
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

; Double jump spam at 30 fps
; CapsLock::
;   Send, {space}
;   Sleep, 48
;   Send, {1}
;   Sleep, 28
;   Send, {``}
;   Sleep, 50
; Return

; Devourer precast
; Z::
; Send, {F4}
; Sleep, 100
; Send, {F2}
; Sleep, 1250
; Send, {F4}{F5}
; Return

; Slb bugged pretraps. 
; X::
; x := 1020 ; trap 1 x pos

; Loop 4 {
;   Click, R, 1095, 1030 ; util key: e
;   Sleep, 700
;   MouseMove, x, 970
;   Click
;   Sleep, 700
;   Send, {e}
;   Sleep, 400  
;   Click, 83, 335 ; trait swap
;   Sleep, 300
;   Click, 83, 335 ; trait swap

;   Sleep, 1500
;   Click, 555, 95 ; revert build
;   Sleep, 500
;   x += 45
; }
; Return

; Siax ligma precast
; Z::
; Send, {5}
; Sleep, 332
; Send, {F4}
; Sleep, 201
; Send, {F2}
; Sleep, 1169
; Send, {F4}
; Sleep, 300
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

; ~F1::
;   Sleep, 10
;   Send, {F2}
; Return

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