import Character
import DataType
import Field
import Inventory
import Npc
import Quest
import Terminal
import time
import GameState

print("run")
if GameState.IsInGame():
    job = Character.GetJob()
    level = Character.GetLevel()
    field_id = Field.GetID()
    if level <= 13:
        print("lvl")
        Terminal.SetCheckBox("main/nolag", False)
        Terminal.SetRushByLevel(False)
        time.sleep(2)
    quest3 = Quest.GetQuestState(57402)
    if quest3 != 2:
        print("quest3not2")
        if field_id == 807040000:
            quest1 = Quest.GetQuestState(57400)
            quest2 = Quest.GetQuestState(57401)
            if quest1 != 2:
                if quest1 == 0:
                    Quest.StartQuest(57400, 0)
                    time.sleep(2)
            elif quest2 != 2:
                if quest2 == 0:
                    Quest.StartQuest(57401, 9130082)
                    time.sleep(2)
                elif quest2 == 1:
                    Quest.CompleteQuest(57401, 9130082)
                    time.sleep(2)
            if quest3 == 0:
                Quest.StartQuest(57402, 0)
                time.sleep(2)
            elif quest3 == 1:
                portal = Field.FindPortal("east00")
                if portal.valid:
                    pos = Character.GetPos()
                    if portal.x != pos.x:
                        Character.Teleport(portal.x, portal.y -10)
                        time.sleep(1)
                    else:
                        Character.EnterPortal()
                        time.sleep(2)
        elif field_id == 807040100:
            if quest3 == 1:
                Quest.CompleteQuest(57402, 9130083)
                Terminal.SetLineEdit("SISkillID", "42001000")
                Terminal.SetSpinBox("SkillInjection", 50)
                Terminal.SetCheckBox("Skill Injection", True)
                Terminal.SetCheckBox("bot/kanna_kami", True)
                Terminal.SetCheckBox("Mob Disarm", True)
                Terminal.SetCheckBox("Mob No Death Animation", True)
                Terminal.SetCheckBox("Mob No Spawn Animation", True)
                Terminal.SetCheckBox("Auto Rune", True)
                Terminal.SetCheckBox("Auto SP", True)
                Terminal.SetCheckBox("Auto Buff", True)
                Terminal.SetCheckBox("Auto Equip", True)
                Terminal.SetCheckBox("Auto Feed", True)
                Terminal.SetCheckBox("Auto AP", True)
                Terminal.SetCheckBox("Unlimtd Attack", True)
                Terminal.SetCheckBox("Spawn Control", True)
                Terminal.SetCheckBox("Rush By Level", True)
                Terminal.SetRushByLevel(True)
                Terminal.SaveProfile()
                time.sleep(5)
    else:
        print("sleeping")
        time.sleep(10)
else:
    time.sleep(1)