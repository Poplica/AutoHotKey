import GameState, Key, Terminal, time, Packet, Character, Field

followMultiple = False
followIDs = {
	# "Main": 1,
	# "monkaMega": 30,
	# "BlarkBlark": 23
	"monkaS001": 29
	# ,"monkaS002": 14
	,"monkaS003": 31
	# ,"monkaS004": 38
}
kishHeader = 0x0144
csDuration = 170

def toHex(val):
	return hex((val + (1 << 16)) % (1 << 16)).upper()[2:].zfill(4)


def castKish(x=0, y=0):
	pos = Character.GetPos()
	posX = toHex(pos.x + x)
	posY = toHex(pos.y + y)

	kishin = Packet.COutPacket(kishHeader)
	kishin.EncodeBuffer("** ** ** ** 0282901B 14 00 00000000 " + posX + " " + posY + " 00 00 00")
	Packet.SendPacket(kishin)


if GameState.IsInGame() and not Terminal.IsRushing():
	if followMultiple:
		for i in followIDs.values():
			Terminal.SetFollowID(i)

			endTime = time.time() + 7
			while not Terminal.IsRushing() and time.time() < endTime:
				time.sleep(.5)
			endTime = time.time() + 7
			while Terminal.IsRushing() and time.time() < endTime:
				time.sleep(.5)

			mapid = Field.GetID()
			# if mapid == 450005411:
			# 	castKish(-3000, 400)
			# else:
			# 	castKish()
			Key.Press(0x11) # auto attk CTRL key (<=5s delay)
			time.sleep(2)
		Terminal.SetFollowID(0)
	else:
		time.sleep(2)
		while Terminal.IsRushing():
			time.sleep(1)
		# castKish()
		Key.Press(0x11)
		time.sleep(2)

	while not GameState.IsInCashShop():
		Terminal.EnterCashShop()
		time.sleep(.2)

if GameState.IsInCashShop():
	if followMultiple:
		time.sleep(csDuration - len(followIDs) * 5)
	else:
		time.sleep(csDuration)
		
	Terminal.LeaveCashShop()
