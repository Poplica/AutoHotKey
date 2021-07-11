#SingleInstance, Force
#MaxThreadsPerHotkey, 3

SetControlDelay, 0
; 72% bluelight filter: far left color | 1024, 576 | 1026w, 608h
; pause: pause 		| reload = alt + pause
; farm: alt + # 	| # of iterations, 1 retry = 1, 2-8 runs
; spam blocks + goddess: mforward | default settings = mback
; spam goddess: num+ | num- = toggle ac safety & ac = ~
; quest reject: ctrl + del,end,pgdn == 1 2 3 | reject all: ctrl + home
; toggle suspend on scripts:: ctrl + shift + down / ScrollLock | bring front and mid: ctrl + shift + left
; ctrl + pgup: exploration

winName := "BlueStacks App Player"

xSpam := 845 
ySpam := 535 
xGoddess := 1000
yGoddess := 200
yChampion := 435

xStage := 360 
yStage := 460
xTown := 785 
xConfirm := 540
yConfirm := 425

yQuest1 := 175

defaultSettings()

~XButton2:: ; spam blocks
	if WinActive(winName) {
		start:
		if (numRetry >= 0) {
			toggleBlock := !toggleBlock
			countTick := 0
			while toggleBlock {
				spamBlock()
				if (++countTick > timeRun) {
					toggleBlock := 0 
					if (--numRetry > 0) {
						clickPos(xConfirm, yConfirm, 1) ; confirm button
						clickPos(xStage, yStage, 12) ; stage
						loop 2 
							clickPos(xSpam, ySpam, 4) ; ready, start
						Goto, start
					} else {
						clickPos(xConfirm, yConfirm, 1) 
						clickPos(xTown, yStage) ; town
						defaultSettings()
					}
				}
			}
		}
	}
Return

defaultSettings() {
	global
	numRetry := 0
	timeRun := 10 * 140 ; # secs = # * .1
	toggleBlock := false 
	toggleGoddess := false 
	toggleAC := false
	flagAC := false
}

clickPos(x, y, slp:=.05) {
	ControlClick, x%x% y%y%, % winName,,,, NA
	Sleep, slp * 1000
}
clickPos2(x, y, slp:=.05) {
	MouseMove, x, y
	Click
	Sleep, slp * 1000
}

spamBlock() {
	WinGetPos,,, Width, Height, %winName%
	if (Width != 1024 && Height != 576) {
		Click
		WinMove, %winName%,,,, 1024, 576
	} else {
		clickPos(xSpam, ySpam) ; block spam, ready, start
		clickPos(xGoddess, yGoddess) ; goddess activation
		clickPos(xGoddess, yChampion) ; champion
	}
}

setAutoFarm(num:=0, dur:=1000) {
	global
	numRetry := num
	timeRun := dur
}

questReject(y, slp:=.05) {
	clickPos(1000,  y, .5) ; quest: 1 2 3 
	clickPos(615, 385, .3) ; reject
	clickPos(655, 450, .2) ; confirm
	Sleep, slp * 1000
}

completeExploration() {
	clickPos2(985, 105) ; top map
	clickPos2(xSpam, ySpam, 4) ; explore
	clickPos2(xSpam, ySpam, 4) ; OK
	clickPos2(xSpam, ySpam, 4) ; screen
	clickPos2(xConfirm, yConfirm+100, 3) ; confirm
	acceptBottomMap()
}

rushExploration() {
	clickPos2(xSpam, ySpam, 4) ; explore
	clickPos2(xSpam, ySpam, 2) ; quick exploration
	clickPos2(xConfirm, yConfirm, 3) ; confirm
	clickPos2(xConfirm, yConfirm, 4) ; screen
	clickPos2(xConfirm, yConfirm+100, 3) ; confirm
	acceptBottomMap()
}

acceptBottomMap() {
	clickPos2(985, 430) ; bottom map
	clickPos2(xSpam, ySpam, 1) ; explore
	clickPos2(760, 530, 2) ; hero suggestion
	clickPos2(xSpam, ySpam, 3) ; confirm
	clickPos2(xSpam, ySpam, 2) ; screen
	clickPos2(910, 50) ; close
}

^+Left::
	WinActivate, % winName
	WinMove, % winName,, 447, 0
Return

~NumpadSub:: ; toggle ac safety
	if WinActive(winName) 
		flagAC := !flagAC
Return

~`:: ; toggle ac
	if flagAC and WinActive(winName) 
		toggleAC := !toggleAC
	while toggleAC {
		Click
    	Sleep, 100
	}
Return

~NumpadAdd:: ; goddess only spam
	toggleGoddess := !toggleGoddess
	if WinActive(winName) 
		while toggleGoddess 
			clickPos(xGoddess, yGoddess, 4.75) ; goddess activation : 1.75 sera
Return

!1::setAutoFarm(2, timeRun) ; for longer stgs
Return
!2::setAutoFarm(2)
Return
!3::setAutoFarm(3)
Return
!4::setAutoFarm(4)
Return
!5::setAutoFarm(5)
Return
!6::setAutoFarm(6)
Return
!7::setAutoFarm(7)
Return
!8::setAutoFarm(8)
Return

~^Delete::
	KeyWait, Ctrl
	if WinActive(winName) 
		questReject(yQuest1)
Return
~^End::
	KeyWait, Ctrl
	if WinActive(winName) 
		questReject(yQuest1+70)
Return
~^PgDn::
	KeyWait, Ctrl
	if WinActive(winName) 
		questReject(yQuest1+140)
Return
~^Home::
	KeyWait, Ctrl
	if WinActive(winName) {
		questReject(yQuest1, 1.5)
		questReject(yQuest1+70, 1.5)
		questReject(yQuest1+140)
	}
Return
~^PgUp::
	KeyWait, Ctrl
	if WinActive(winName)
		completeExploration()
Return
~^+PgUp::
	KeyWait, Ctrl
	if WinActive(winName)
		rushExploration()
Return

Pause::Pause
Return
!Pause::Reload
Return

~XButton1::
	WinGetPos,,, Width, Height, %winName%
	if (Width != 1024 && Height != 576)
		WinMove, %winName%,,,, 1024, 576
	if WinActive(winName) 
		defaultSettings()
	if WinExist("BlueStacksTV")
		WinClose, BlueStacksTV
	KeyWait, XButton1, T1 ; wait # seconds for release key
	if ErrorLevel  ; more than # sec have passed
		Exitapp
Return

ScrollLock::
^+Down:: ; swap suspends
	defaultSettings()
	MouseGetPos, xPos
	MouseMove, xPos, 1079
	Suspend, On
	DetectHiddenWindows, On
	SetTitleMatchMode, 1
	PostMessage, 0x111, 65305,,, %A_ScriptDir%\Popo Farm.ahk ; suspend popo farm.ahk
Return
