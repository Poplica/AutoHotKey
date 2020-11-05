import os, sys, Terminal, Character, GameState, time, Field, Key

if not any("SunCat" in s for s in sys.path):
	sys.path.append(os.getcwd() + "\SunCat")
try:
	import SunCat, SCHotkey, SCLib
except:
	print("Couldn't find SunCat module")

job = Character.GetJob()
haveSkill = False  # 5th Job Skill (defines SpectreMode to use this skill in SI) - False if you dont have it
autoAttackSpectre = True  # AutoAttacks with Omnious Nightmare on spectre mode during job 1st-3rd
SpectreKey = 0x56

#------------------------------------------------------------------#

if GameState.IsInGame() and not Terminal.IsRushing():
	# and Field.GetMobCount() > 0

	#------------------------- Mode Switch ---------------------------#
	def SpectreMode():
		if (job == 15500 or job == 15510 or job == 15511) and autoAttackSpectre:
			Terminal.SetCheckBox("Skill Injection", False)
			Terminal.SetCheckBox("Melee No Delay", False)
			Terminal.SetCheckBox("Auto Attack", True) # OmniousNightmare
		if job == 15512 and haveSkill:
			Terminal.SetLineEdit('SISkillID', '400051035') # Abyssal Recall
		else:
			Terminal.SetLineEdit('SISkillID', '155121007') # Blissful

	def FloraMode():
		print("Flora Mode On")
		if job == 15500 or job == 15510 or job == 15511:
			Terminal.SetCheckBox("Auto Attack", False)
			Terminal.SetCheckBox("Skill Injection", True)
			Terminal.SetCheckBox("Melee No Delay", True)
			Terminal.SetLineEdit('SISkillID', '155001100') # Basic Drive
		if job == 15512:
			Terminal.SetLineEdit('SISkillID', '155121007') # Blissful

	def BossMode():
		if job == 15512:
			Terminal.SetSpinBox("SkillInjection", 0)

	def NormalMode():
		if job == 15500 or job == 15510 or job == 15511:
			Terminal.SetSpinBox("SkillInjection", 250)
		if job == 15512:
			Terminal.SetSpinBox("SkillInjection", 150)

	#------------------------- Elite Toggle ---------------------------#
	if Field.GetEliteState() == 2:  # elite boss
		BossMode()
	else:
		NormalMode()

	#----------------------- Spectre Toggle ---------------------------#

	if Character.HasBuff(2, 155000007) and SunCat.GetArk() < 150:
	    # Remove Spectre Mode
	    print("Leaving Spectre Mode")
	    Key.Press(SpectreKey)
	    FloraMode()
	if not Character.HasBuff(2, 155000007) and SunCat.GetArk() > 550:
	    # Enter Spectre Mode
	    print("Entering Spectre Mode")
	    Key.Press(SpectreKey)
	    SpectreMode()
