import Character
import Context
import DataType
import Field
import Inventory
import Key
import Packet
import Npc
import Packet
import Quest
import Terminal
import GameState
import time
#turn off script by turning it off and rushing or reloginng
map = Field.GetID()
#based off bully script, this choose random victim
#Subtract rules
if map == 993026900: #arena waiting room
	Choose = Packet.COutPacket(0x0245)
	Choose.EncodeBuffer("[01000000]")
	Packet.SendPacket(Choose)
	time.sleep(1)
	Bully = Packet.COutPacket(0x0245)
	Bully.EncodeBuffer("00000006")
	Packet.SendPacket(Bully)
	time.sleep(3)