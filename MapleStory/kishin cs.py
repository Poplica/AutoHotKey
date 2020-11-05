import GameState, Key, Terminal, time, Packet, Character, Field

followMultiple = False
followIDs = {
	# "Main": 1,
	# "monkaMega": 30,
	"BlarkBlark": 23
	,"monkaS001": 29
	,"monkaS002": 14
	,"monkaS003": 31
	# ,"monkaS004": 38
}
csDuration = 143

def toHex(val):
	return hex((val + (1 << 16)) % (1 << 16)).upper()[2:].zfill(4)


def castKish(x=0, y=0):
	pos = Character.GetPos()
	posX = toHex(pos.x + x)
	posY = toHex(pos.y + y)

	kishin = Packet.COutPacket(0x0144)
	kishin.EncodeBuffer("** ** ** ** 0282901B 14 00 00000000 " + posX + " " + posY + " 00 00 00")
	Packet.SendPacket(kishin)


if GameState.IsInGame() and not Terminal.IsRushing():
	if followMultiple:
		for i in followIDs.values():
			Terminal.SetFollowID(i)

			startTime = time.time()
			while not Terminal.IsRushing() and time.time() < startTime + 3:
				time.sleep(.5)
			startTime = time.time()
			while Terminal.IsRushing() and time.time() < startTime + 5:
				time.sleep(.5)

			mapid = Field.GetID()
			if mapid == 450005411: # UP2
				castKish(-3000, 400)
			elif mapid == 450007070: # LS7
				castKish(-1500, -750)
			else:
				castKish()
		Terminal.SetFollowID(0)
	else:
		time.sleep(2)
		while Terminal.IsRushing():
			time.sleep(1)
		castKish()

	while not GameState.IsInCashShop():
		Terminal.EnterCashShop()
		time.sleep(.2)

if GameState.IsInCashShop():
	if followMultiple:
		time.sleep(csDuration - len(followIDs) * 5)
	else:
		time.sleep(csDuration)
		
	Terminal.LeaveCashShop()
