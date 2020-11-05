import Terminal, Character, GameState, time, Field, Key, Inventory, Packet

normalDelay = 200

def toHex(val):
	return hex((val + (1 << 16)) % (1 << 16)).upper()[2:].zfill(2)

if GameState.IsInGame() and not Terminal.IsRushing():
	if not Character.HasBuff(1, 2023124) and Field.GetMobCount() > 0 and Inventory.GetItemCount(2023124) > 0:
		Terminal.SetComboBox("Familiar0", 7)
		time.sleep(10)
		Inventory.UseItem(2023124)
	if not Character.HasBuff(1, 2023124) and Inventory.GetItemCount(2023124) == 0:
		Terminal.SetComboBox("Familiar0", 2)

	# if Field.GetID() == 450007070:
	# 	Character.Teleport(1606, 153)
	# 	time.sleep(5)
	# 	Character.Teleport(-89, -205)

	# elite boss
	Terminal.SetSpinBox("SkillInjection", 0 if Field.GetEliteState() == 2 else normalDelay)
	# si toggle
	Terminal.SetCheckBox('Skill Injection', 1 if Character.HasBuff(2, 155000007) and Character.HasBuff(2, 400051035) else 0)


# if GameState.IsInGame() and not Character.HasBuff(2, 155000007) and Field.GetMobCount() > 0: #Checks if you don't have Specter
# 	abyssal = Packet.COutPacket(0x014A)
# 	abyssal.EncodeBuffer("17D84C86 06 [0103000000] 01 [0000000000FFFFFFFF] 8623 05 00 00000000") # skill lvl for first 2-bits
# 	Packet.SendPacket(abyssal)

# 	time.sleep(25)
	
# 	specterMode = Packet.COutPacket(0x0147)
# 	specterMode.EncodeBuffer("** ** ** ** 093EA74E 01 [0103000000] 01 [0000000000FFFFFFFF] 00000000 0000 00") #turn off specter mode
# 	Packet.SendPacket(specterMode)

def get_update_time():
	return int(time.monotonic() * 1000)

def AbyssalRecall():
	if GameState.IsInGame() and Field.GetMobCount() > 0 and (Character.GetBuff(2, 400051035).timeLeft < 21000 or not Character.HasBuff(2, 155000007)):
		AbyssalRecall = Packet.COutPacket(0x014A)
		# AbyssalRecall.EncodeBuffer("17D84C86 " + toHex(Character.GetSkillLevel(400051035)) + " [0103000000] 01 [0000000000FFFFFFFF] 8623 05 00 00000000")
		# print(Character.GetSkillLevel(400051035))
		AbyssalRecall.Encode4(0x17D84C86)
		AbyssalRecall.Encode1(Character.GetSkillLevel(400051035)) #LEVEL OF SKILL
		AbyssalRecall.Encode1(0x01)
		AbyssalRecall.Encode4(0xFFFFFFFF)
		AbyssalRecall.Encode4(0x0003062E)
		AbyssalRecall.Encode4(0x00000000)
		Packet.SendPacket(AbyssalRecall)

def AbyssalRecallCancel():
	if GameState.IsInGame() and Field.GetMobCount() > 0 and (Character.GetBuff(2, 400051035).timeLeft < 21000 or not Character.HasBuff(2, 155000007)):
		AbyssalRecallCancel = Packet.COutPacket(0x0149)
		AbyssalRecallCancel.Encode4(0x17D84C86)
		AbyssalRecallCancel.Encode1(0x01)
		Packet.SendPacket(AbyssalRecallCancel)

def SpecterMode():
	if GameState.IsInGame() and Field.GetMobCount() > 0 and not Character.HasBuff(2, 155000007):
		SpecterMode = Packet.COutPacket(0x0147)
		SpecterMode.Encode4(int(time.monotonic() * 1000))
		SpecterMode.EncodeBuffer("093EA74E 01 [01FFFFFFFF] 00000000 0000 00")
		Packet.SendPacket(SpecterMode)

AbyssalRecall()
AbyssalRecallCancel()
time.sleep(2.5)
SpecterMode()
