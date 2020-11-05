import Character, GameState, Field, Packet, Terminal, time

def toPortal(portal):
    tPortal = Field.FindPortal(portal)
    if tPortal.valid:
        while tPortal.x != Character.GetPos().x:
            # Character.AMoveX(tPortal.x+30)
            # Character.Teleport(tPortal.x, tPortal.y - 20)
            time.sleep(.1)
            if tPortal.x == Character.GetPos().x:
                # Character.StopMove()
                break
        Character.EnterPortal()
        time.sleep(2)

if GameState.IsInGame() and Character.GetLevel() >= 140:
    if Field.GetID() != 271041000 and not Character.HasBuff(2, 2311003):
        oPacket = Packet.COutPacket(0x02CA)
        oPacket.Encode4(0x0000000F)
        oPacket.Encode4(0x00000000)
        oPacket.Encode4(0x1027C1E8)
        Packet.SendPacket(oPacket)
        time.sleep(3)
    elif Field.GetID() == 271041000 and Character.HasBuff(2, 2311003):
        toPortal("out00")
else:
    print("Not level 140 or above")
time.sleep(5)