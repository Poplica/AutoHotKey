import Character, GameState, Field, Packet, Terminal, time, Inventory

def toPortal(portal):
    tPortal = Field.FindPortal(portal)
    if tPortal.valid:
        while tPortal.x != Character.GetPos().x:
            Character.Teleport(tPortal.x, tPortal.y - 20)
            time.sleep(.1)
            if tPortal.x == Character.GetPos().x:
                break
        Character.EnterPortal()
        time.sleep(1)

if GameState.IsInGame():
    mapID = Field.GetID()
    if mapID == 992000000:
        toPortal("go1F")
    if mapID == 992001000:
        Character.UseSkill(155001102)
        time.sleep(1)
        toPortal("out00")
    if mapID == 992002000:
        Inventory.UseItem(2432461)
# else:
#     time.sleep(1)