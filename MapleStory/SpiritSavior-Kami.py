#SunCat's Spirit Savior

import sys, os, Field, Terminal, time, GameState, Key, DataType

if not any("SunCat" in s for s in sys.path):
	sys.path.append(os.getcwd() + "\SunCat")

try:
	import SunCat, SCLib
except:
	print("Couldn't find SunCat module")

ssMapStart = 921172300
ssMapEnd = 921172399
mobArray = [8644101, 8644102, 8644103, 8644104, 8644105, 8644106, 8644107, 8644108, 8644109, 8644110, 8644111, 8644112]
baseX = -175
baseY = -491

#https://msdn.microsoft.com/en-us/library/windows/desktop/dd375731(v=vs.85).aspx

#CHANGE THESE VARIABLES
npcChatKey = 0x59 #NPC chat key (default spacebar)
killTime = 1 #How long it takes you to kill the mob (can be set to a fraction)
waitTime = .5 #How long to wait after killing before picking up (for lag reasons)
roundWaitTime = .5 #How long to wait when handing in spirits
roundsPerRun = 6 #How many times you want to collect 5 spirits per run

def inSS():
	return Field.GetID() >= ssMapStart and Field.GetID() <= ssMapEnd

def doSS():
	Terminal.SetCheckBox("bot/si_no_wait", True)
	Terminal.SetCheckBox("main/boss_freeze", True)
	Terminal.SetCheckBox("Auto Buff", False)
	
	for i in range(roundsPerRun):
		killCount = 0
		
		mobsKilled = []
		
		while killCount < 5:
			if not GameState.IsInGame() or not inSS():
				print("Not in SS!")
				break

			curMob = ""
			
			for mobID in mobArray:
				mob = Field.FindMob(mobID)
				if mob.valid and mob not in mobsKilled:
					curMob = mob
					mobsKilled.append(mob)
					break
			
			if curMob != "":
				SunCat.KamiTP(curMob.x, curMob.y)
				time.sleep(killTime)
				Key.Press(npcChatKey)
				time.sleep(0.2)
				Key.Press(npcChatKey)
				time.sleep(waitTime)
				killCount += 1
			else:
				print("No mobs left!")
				time.sleep(3) #Wait for mobs to respawn - this should never be hit

		time.sleep(1)
		SunCat.KamiTP(baseX, baseY)
		time.sleep(roundWaitTime)
	
	Terminal.SetCheckBox("bot/si_no_wait", False)
	Terminal.SetCheckBox("main/boss_freeze", False)
	Terminal.SetCheckBox("Auto Buff", True)
	
	SunCat.StopTP()
	print("Finished!")

if SCLib.CheckVersion(19):
	if GameState.IsInGame() and inSS():
		print("Starting")
		doSS()
	else:
		print("Not in SS, run the script after you've entered.")