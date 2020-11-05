import Character, Packet, time, Field, GameState, Terminal

#Turns off specter mode before Abysall Recall runs out and recasts
# if GameState.IsInGame() and Character.GetJob() == 15512 and not Character.HasBuff(2, 155000007) and Field.GetMobCount() > 0: #Checks if you don't have Specter
# 		abyssal = Packet.COutPacket(0x014A)
# 		abyssal.EncodeBuffer("17D84C86 1E [0103000000] 01 [0000000000FFFFFFFF] 8623 05 00 00000000") # skill lvl for first 2-bits
# 		Packet.SendPacket(abyssal)

# 		time.sleep(20)
		
# 		specterMode = Packet.COutPacket(0x0147)
# 		specterMode.EncodeBuffer("** ** ** ** 093EA74E 01 [0103000000] 01 [0000000000FFFFFFFF] 00000000 0000 00") #turn off specter mode
# 		Packet.SendPacket(specterMode)
def get_update_time():
	return int(time.monotonic() * 1000)

def AbyssalRecall():
	if GameState.IsInGame() and Field.GetMobCount() > 0 and Character.GetJob() == 15512:
		AbyssalRecall = Packet.COutPacket(0x014A)
		abyssalLevel = hex((Character.GetSkillLevel(400051035) + (1 << 16)) % (1 << 16)).upper()[2:].zfill(2)
		AbyssalRecall.EncodeBuffer("17D84C86 " + abyssalLevel + " [0103000000] 01 [0000000000FFFFFFFF] 8623 05 00 00000000")
		Packet.SendPacket(AbyssalRecall)

def AbyssalRecallCancel():
	if GameState.IsInGame() and Field.GetMobCount() > 0 and Character.GetJob() == 15512:
		AbyssalRecallCancel = Packet.COutPacket(0x0149)
		AbyssalRecallCancel.Encode4(0x17D84C86)
		AbyssalRecallCancel.Encode1(0x01)
		Packet.SendPacket(AbyssalRecallCancel)

def SpecterMode():
	if GameState.IsInGame() and Field.GetMobCount() > 0 and Character.GetJob() == 15512 and not Character.HasBuff(2, 155000007):
		SpecterMode = Packet.COutPacket(0x0147)
		SpecterMode.Encode4(int(time.monotonic() * 1000))
		SpecterMode.EncodeBuffer("093EA74E 01 [01FFFFFFFF] 00000000 0000 00")
		Packet.SendPacket(SpecterMode)

# if GameState.IsInGame() and Field.GetMobCount() > 0 and Character.HasBuff(2, 155000007) and Character.HasBuff(2, 400051035):
# 	Terminal.SetCheckBox('Skill Injection', 1)
# else:
# 	Terminal.SetCheckBox('Skill Injection', 0)

AbyssalRecall()
AbyssalRecallCancel()
time.sleep(9)
SpecterMode()
