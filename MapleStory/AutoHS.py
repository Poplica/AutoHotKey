import GameState, Key, Terminal, time, Packet, Character, Field, Party

# hasNonLocal = True
hasNonLocal = False
partyLeaderID = 1

if hasNonLocal:
	if GameState.GetChannel() != 20:
		Terminal.ChangeChannel(20)
else:
	ldrChannel = Terminal.GetLocalUser(partyLeaderID).channel
	if GameState.GetChannel() != ldrChannel:
		Terminal.ChangeChannel(ldrChannel)

if GameState.IsInGame():
	lst = Field.GetCharacters()
	for i in lst:
		if Party.IsPartyMember(i.name):
			Terminal.SetCheckBox("macro1_check", True)
			time.sleep(5)
			Terminal.SetCheckBox("macro1_check", False)
time.sleep(5)
