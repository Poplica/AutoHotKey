import Character, GameState, time, Field

if GameState.IsInGame():
  map = Field.GetID()
  if map == 993000650 or map == 993000651:
    Character.JumpDown()
    time.sleep(12)
else:
  time.sleep(5)
