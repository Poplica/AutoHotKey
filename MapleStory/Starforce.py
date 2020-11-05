import Character
import Context
import DataType
import Inventory
import Packet
import time
import GameState

# leroy.jenkins93
# last updated: 10/06/18
# v199.2

# change this to the maximum number of stars you want.
# set it to 100 if you want to go to the maximum number of stars
starTo = 10

# change this to true if you want to use safeguard for stars 13-17
safeguard = False

# change this to true if you want to star whatever item is in equip inventory slot 1
fIStar = False

# change this to true if you want to star all items in your inventory
aIStar = False

# change this to true if you want to star all equipped items
eStar = False

# add the item id for items you want to ignore, separated by a comma
# ex: whitelist = [111111, 222222, 333333]
whitelist = []

# sf header and recv
sfHeader = 0x0130
sfRecv = 0x0147
sfOpcode = 0x34

##############################################################################################
##############################################################################################
##############################################################################################
# DO NOT MODIFY ANYTHING BELOW THIS POINT
# DO NOT MODIFY ANYTHING BELOW THIS POINT
# DO NOT MODIFY ANYTHING BELOW THIS POINT
# DO NOT MODIFY ANYTHING BELOW THIS POINT
# DO NOT MODIFY ANYTHING BELOW THIS POINT
# DO NOT MODIFY ANYTHING BELOW THIS POINT
# DO NOT MODIFY ANYTHING BELOW THIS POINT
# DO NOT MODIFY ANYTHING BELOW THIS POINT
# DO NOT MODIFY ANYTHING BELOW THIS POINT
padding = 20

def toHex(val, nbits):
    return ((val + (1 << nbits)) % (1 << nbits))

# in case anyone is wondering how to break down a packet in a script, the original packet is written below
# 2C 01 01 ** ** ** ** FF FF 00 01 00 00 00 FF FF FF FF 00 00
# 2D 01 01 1E 8B 44 15 06 00 00 01 00 00 00 FF FF FF FF 00 01
def starItem(pos, currStar, itemMaxStar, userMaxStar, itemid):
    print('{0} {1}'.format("Position: ".ljust(padding), str(pos)))
    slotStartingMeso = Character.GetMeso()
    slotStartingStar = currStar
   
    if itemid in whitelist:
        return
    while currStar < userMaxStar and currStar < itemMaxStar and Inventory.GetItem(1, pos).valid:         
        if GameState.IsInGame():
            print("#-----------------------Star-----------------------#")
            print('{0} {1}'.format("Starring From: ".ljust(padding), str(currStar)))
            print('{0} {1}'.format("User Max stars: ".ljust(padding), str(userMaxStar)))
            print('{0} {1}'.format("Item max stars: ".ljust(padding), str(itemMaxStar)))
            print('{0} {1}'.format("Item ID: ".ljust(padding), str(itemid)))
           
            beforeMeso = Character.GetMeso()
           
            # star the item
            oPacket = Packet.COutPacket(sfHeader)
            oPacket.Encode1(0x01)
            oPacket.EncodeBuffer("** ** ** **")
            oPacket.Encode2(toHex(pos, 16))
            oPacket.Encode1(0x00)
            oPacket.Encode4(0x00000001)
            oPacket.Encode4(0xFFFFFFFF)
            if safeguard and currStar in range(12, 17):
                oPacket.Encode2(0x0101)
                print("SAFEGUARDING")
            else:
                oPacket.Encode2(0x0100)
            Packet.SendPacket(oPacket)
         
            # wait for recv
            iPacket = Packet.WaitForRecv(sfRecv, 10000)
               
            afterMeso = Character.GetMeso()
            iCosted = beforeMeso - afterMeso
            print('{0} {1:,}'.format("Meso Cost of Star: ".ljust(padding), iCosted))
            print('{0} {1}'.format("iPacket remaining: ".ljust(padding), iPacket.GetRemaining()), flush = True)
           
            # update current star counter
            currStar = Inventory.GetItem(1, pos).currentStar

            # get max star again in case item blew up
            # item blown up means itemMaxStar = 0
            itemMaxStar = Inventory.GetItem(1, pos).maxStar
           
    slotEndingMeso = Character.GetMeso()
    slotEndingStar = currStar
    slotTotalCost = slotStartingMeso - slotEndingMeso
    if (slotStartingMeso - slotEndingMeso) != 0:
        print('{0} {1:,} meso from star {2} to {3}\n'.format("Total Cost: ".ljust(padding), slotTotalCost, str(slotStartingStar), str(slotEndingStar)), flush = True)
         
def main():
    if GameState.IsInGame():
        if aIStar:
            items = Inventory.GetItems(1)
            for item in items:
                starItem(item.pos, item.currentStar, item.maxStar, starTo, item.id)
             
        elif fIStar:
            # star first item in inventory
            item = Inventory.GetItem(1, 1)
            if item.valid:
                starItem(1, item.currentStar, item.maxStar, starTo, item.id)
             
        if eStar:
            for x in range(-100, 0):
                item = Inventory.GetItem(1, x)
                if item.valid:
                    starItem(x, item.currentStar, item.maxStar, starTo, item.id)   
           
main()