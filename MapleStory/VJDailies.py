import Character
import DataType
import Field
import Inventory
import Key
import Npc
import Packet
import Quest
import Terminal
import time
import GameState

def RushCheck(ID): #define RushCheck to first check if you're in the map
	if map != ID: #if you're not in the map rush to the map
		Terminal.Rush(ID)
	else:
		time.sleep(1) #if you are, do nothing and check again in a second to not stress CPU <3
		
def RushAndComplete(completemap, questid, npcid):
	if map != completemap:
		Terminal.Rush(completemap)
	else:
		if completemap == 450001000:
			pos = Character.GetPos()
			if pos.x != -1941:
				Character.Teleport(-1941, 60)
			else:
				Quest.CompleteQuest(questid, npcid)
		else:
			Quest.CompleteQuest(questid, npcid)

if GameState.IsInGame():
	map = Field.GetID()		
	time.sleep(1) #no stress CPU please
	daily1 = Quest.GetQuestState(34130)
	daily2 = Quest.GetQuestState(34131)
	daily3 = Quest.GetQuestState(34132)
	daily4 = Quest.GetQuestState(34133)
	daily5 = Quest.GetQuestState(34134)
	daily6 = Quest.GetQuestState(34135)
	daily7 = Quest.GetQuestState(34136)
	daily8 = Quest.GetQuestState(34137)
	daily9 = Quest.GetQuestState(34138)
	daily10 = Quest.GetQuestState(34139)
	daily11 = Quest.GetQuestState(34140)
	daily12 = Quest.GetQuestState(34141)
	daily13 = Quest.GetQuestState(34142)
	daily14 = Quest.GetQuestState(34143)
	daily15 = Quest.GetQuestState(34144)
	daily16 = Quest.GetQuestState(34145)
	daily17 = Quest.GetQuestState(34146)
	daily18 = Quest.GetQuestState(34147)
	daily19 = Quest.GetQuestState(34148)
	daily20 = Quest.GetQuestState(34149)
	daily21 = Quest.GetQuestState(34150)

	if Terminal.IsRushing():
		time.sleep(1)
		#loops so we can use statements like break and continue
	
	elif daily1 == 1: #if daily quest 1 is active
		if Quest.CheckCompleteDemand(34130, 3003104) == False: #if demand is met and can be turned in
			RushAndComplete(450001000, 34130, 3003104)
		else:#isn't ready to turn in
			RushCheck(450001010) #check if current map is killing map, if not rush there, check def above.
					
					

	elif daily2 == 1:
		if Quest.CheckCompleteDemand(34131, 3003104) == False:
			RushAndComplete(450001000, 34131, 3003104)
		else:
			RushCheck(450001012)
					
					
	elif daily3 == 1:
		if Quest.CheckCompleteDemand(34132, 3003104) == False:
			RushAndComplete(450001000, 34132, 3003104)
		else:
			RushCheck(450001014)
			
			

	elif daily4 == 1:
		if Quest.CheckCompleteDemand(34133, 3003104) == False:
			RushAndComplete(450001000, 34133, 3003104)	
		else:
			RushCheck(450001016)
		

	elif daily5 == 1:
		if Quest.CheckCompleteDemand(34134, 3003104) == False:
			RushAndComplete(450001000, 34134, 3003104)
		else:
			RushCheck(450001110)
					
					

	elif daily6 == 1:
		if Quest.CheckCompleteDemand(34135, 3003104) == False:
			RushAndComplete(450001000, 34135, 3003104)
		else:
			RushCheck(450001112)		
		
		

	elif daily7 == 1:
		if Quest.CheckCompleteDemand(34136, 3003104) == False:
			RushAndComplete(450001000, 34136, 3003104)
		else:
			RushCheck(450001114)
					
					

	elif daily8 == 1:
		if Quest.CheckCompleteDemand(34137, 3003104) == False:
			RushAndComplete(450001000, 34137, 3003104)
		else:
			RushCheck(450001210)



	elif daily9 == 1:
		if Quest.CheckCompleteDemand(34138, 3003104) == False:
			RushAndComplete(450001000, 34138, 3003104)
		else:
			RushCheck(450001210)


				
	elif daily10 == 1:
		if Quest.CheckCompleteDemand(34139, 3003104) == False:
			RushAndComplete(450001000, 34139, 3003104)
		else:
			RushCheck(450001010)



	elif daily11 == 1:
		if Quest.CheckCompleteDemand(34140, 3003104) == False:
			RushAndComplete(450001000, 34140, 3003104)
		else:
			RushCheck(450001012)



	elif daily12 == 1:
		if Quest.CheckCompleteDemand(34141, 3003104) == False:
			RushAndComplete(450001000, 34141, 3003104)
		else:
			RushCheck(450001014)
					


	elif daily13 == 1:
		if Quest.CheckCompleteDemand(34142, 3003104) == False:
			RushAndComplete(450001000, 34142, 3003104)
		else:
			RushCheck(450001016)
					
					
	elif daily14 == 1:
		if Quest.CheckCompleteDemand(34143, 3003104) == False:
			RushAndComplete(450001000, 34143, 3003104)
		else:
			RushCheck(450001110)
					
					

	elif daily15 == 1:
		if Quest.CheckCompleteDemand(34144, 3003104) == False:
			RushAndComplete(450001000, 34144, 3003104)
		else:
			RushCheck(450001112)
					


	elif daily16 == 1:
		if Quest.CheckCompleteDemand(34145, 3003104) == False:
			RushAndComplete(450001000, 34145, 3003104)
		else:
			RushCheck(450001114)
					
					

	elif daily17 == 1:
		if Quest.CheckCompleteDemand(34146, 3003104) == False:
			RushAndComplete(450001000, 34146, 3003104)
		else:
			RushCheck(450001210)
					

	elif daily18 == 1:
		if Quest.CheckCompleteDemand(34147, 3003104) == False:
			RushAndComplete(450001000, 34147, 3003104)
		else:
			RushCheck(450001210)
			
			

	elif daily19 == 1:
		if Quest.CheckCompleteDemand(34148, 3003107) == False:
			Terminal.Rush(450001013)
			RushAndComplete(450001013, 34148, 3003104)
		else:
			RushCheck(450001013)
					

					
	elif daily20 == 1:
		if Quest.CheckCompleteDemand(34149, 3003108) == False:
			Terminal.Rush(450001112)
			RushAndComplete(450001112, 34149, 3003104)
		else:
			RushCheck(450001112)
					
					

	elif daily21 == 1:
		if Quest.CheckCompleteDemand(34150, 3003109) == False:
			Terminal.Rush(450001216)
			RushAndComplete(450001216, 34150, 3003104)
		else:
			RushCheck(450001216)
else:
	time.sleep(2)