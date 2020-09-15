#SingleInstance, Force
#MaxThreadsPerHotkey, 3
SetControlDelay, -1
SetMouseDelay, -1

~e::
	toggle := !toggle
	while (toggle && WinActive("WARFRAME")) {
		Send E
		Sleep 100
	}
return

~Esc::
	suspend permit
	exitapp 
return
