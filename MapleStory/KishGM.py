import GameState
import Terminal
import time
import Field
import datetime
import os

NamelessMapIDs = []
ChuchuMapIDs = []
LachMapIDs = []
ArcanaMapIDs = []
MorassMapIDs = []
EsferaMapIDs = []
RestMap = 

KISHIN_DUARTION = 150

TERMINAL_IDS_TO_FOLLOW = []
#

def logger(text):
	f = open(os.path.join(os.path.expandvars(r"%USERPROFILE%"), "Desktop", "kannalog.txt"), "a")
	f.write(text)
	f.close

def logger2(text):
	f = open(os.path.join(os.path.expandvars(r"%USERPROFILE%"), "Desktop", "kannalog2.txt"), "a")
	f.write(text)
	f.close
	
def follow(clientid):
	if Terminal.IsRushing():
		Terminal.StopRush()
	
	while (Field.GetID() < 450001000 or Field.GetID() > 450008000) and Field.GetID() != 999999999:#If GM teleported out of Arcane River
		logger2(str(datetime.datetime.now()) + '\n')
		logger2('GM teleported to ' + str(Field.GetID()) + '\n')
		Terminal.ChangeStatus('GM Teleported')
		time.sleep(1200)#rest for 20 minutes
		
	if Terminal.GetLocalUser(clientid) is not None:
		mapid = Terminal.GetLocalUser(clientid).mapid
		channel = Terminal.GetLocalUser(clientid).channel
		
		Terminal.ChangeStatus('Going to ' + Terminal.GetLocalUser(clientid).charname)
		
		if mapid in NamelessMapIDs or mapid in ChuchuMapIDs or mapid in LachMapIDs or mapid in ArcanaMapIDs or mapid in MorassMapIDs or mapid in EsferaMapIDs:
			if GameState.GetChannel() != channel:
				Terminal.ChangeChannel(channel)
			attempt = 0
			while GameState.GetChannel() != channel and attempt < 10:
				time.sleep(1)
				logger('Changing to channel ' +  str(channel) + '\n')
				attempt += 1
			attempt = 0
			while Field.GetID() != mapid and attempt < 10:
				attempt += 1
				Terminal.Rush(mapid)
				while Terminal.IsRushing():
					time.sleep(1)
					logger('Map Rushing to ' + str(mapid) + '\n')
			time.sleep(5)
		else:
			logger2(str(datetime.datetime.now()) + '\n')
			logger2(Terminal.GetLocalUser(clientid).charname + ' was at ' + str(mapid) + '\n')	
			while Field.GetID() != RestMap:
				Terminal.Rush(RestMap)
				while Terminal.IsRushing():
					time.sleep(1)
					logger2('Map Rushing to Rest Map\n')

if GameState.IsInGame():
	logger("loaded")
	start_time = time.time()
	for clientid in TERMINAL_IDS_TO_FOLLOW:
		follow(clientid)
	while Field.GetID() != RestMap:
		Terminal.Rush(RestMap)
		while Terminal.IsRushing():
			time.sleep(1)
	end_time = time.time()
	total_rush_time = end_time - start_time
	rest_time = KISHIN_DUARTION - total_rush_time
	time.sleep(rest_time)
else:
	time.sleep(2)