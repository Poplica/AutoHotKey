import GameState, Key, Terminal, time, Packet, Character, Field

if GameState.IsInGame() and not Terminal.IsRushing() and Field.GetMobCount() > 0:
	oPacket = Packet.COutPacket(0x00D9)
	oPacket.EncodeBuffer("** ** ** ** 3BA33DA7 FF 00 00000001 00 00 020EFCF7 0083E5A8 020EFCF7 01 00000000 00000000 00 00 00 00000000 00000000 00000000 00")
	for i in range (100):
		Packet.SendPacket(oPacket)
		time.sleep(0.03)
	time.sleep(31)
else:
	time.sleep(10)
