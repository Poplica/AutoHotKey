#SingleInstance, Force
#MaxThreadsPerHotkey, 3

SetControlDelay, -1

armor := 19789.14
hpNom := 740
hpEff := hpNom * (1 + armor / 300)
DR := armor / (300 + armor)

~Home::
	MsgBox, EHP: %hpEff% and DR: %DR%
return


~XButton1::
	if WinActive(winName) 
		toggle := 0
	KeyWait, XButton1, T1 ; wait 2 seconds for release key
	if ErrorLevel { ; more than 2 sec have passed
		toggle := 0
		Suspend On
 	}
return

Pause::Pause
Return
!Pause::Reload
Return