import GameState, Key, Terminal, time, Packet, Character, Field

followMultiple = True
followIDs = {
	# "Main": 1,
	# "Mega": 30,
	"blark": 23
	# ,"m01": 29
	# ,"m02": 14
	# ,"m03": 31
	,"m04": 38
	,"m05": 40
}
soloID = 1
restDuration = 150
restMap = 450001005
# restMap = 450005431 # LP1
# restMap = 450005430 # CLP
# restMap = 450005510 # UP

def toHex(val):
	return hex((val + (1 << 16)) % (1 << 16)).upper()[2:].zfill(4)

def castKish(x=0, y=0):
	time.sleep(1)
	Character.UseSkill(42111003)
	# if x == 0 and y == 0:
	# 	time.sleep(1)
	# 	pos = Character.GetPos()
	# 	x = pos.x
	# 	y = pos.y
	# posX = toHex(x)
	# posY = toHex(y)

	# kishin = Packet.COutPacket(0x0147)
	# kishin.EncodeBuffer("** ** ** ** 0282901B 14 00 00000000 " + posX + " " + posY + " 00 00 00")
	# Packet.SendPacket(kishin)

def waitForRush(expectedRushWaitDuration=6, expectedRushDuration=15):
	startTime = time.time()
	while not Terminal.IsRushing():
		time.sleep(.5)
		if time.time() > startTime + expectedRushWaitDuration:
			Terminal.StopRush()
			break
	startTime = time.time()
	while Terminal.IsRushing():
		time.sleep(.3)
		if time.time() > startTime + expectedRushDuration:
			Terminal.StopRush()
			# Terminal.Logout()
			Terminal.SendLog("**Rush took too long**")
			break


if GameState.IsInGame():
	Terminal.StopRush()
	if followMultiple:
		followList = sorted(followIDs.keys())
		for i in followList:
			Terminal.SetFollowID(followIDs[i])
			waitForRush()

			mapID = Field.GetID()
			if mapID == 450005411: # UP2
				castKish(-3650, 92)
			elif mapID == 450007070: # LS7
				castKish(-1420, -705)
			elif mapID == 450007160:
				castKish(1050, 215)
			else:
				castKish()
	else:
		Terminal.SetFollowID(soloID)
		waitForRush()
		castKish()

	Terminal.SetFollowID(0)
	while Field.GetID() != restMap:
		Terminal.Rush(restMap)
		time.sleep(2)

	if followMultiple:
		ch = Terminal.GetLocalUser(followIDs[followList[0]]).channel
		# ch = 20
		while GameState.GetChannel() != ch:
			Terminal.ChangeChannel(ch)
			time.sleep(3)
	time.sleep(restDuration - len(followIDs) * 6 if followMultiple else restDuration)