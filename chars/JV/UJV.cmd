; The CMD file.
;-| Default Values |-------------------------------------------------------
[Defaults]
command.time = 15
command.buffer.time = 5

[Command]
name = "EDD"
command = ~$F, $B, $D, $F, $B, x
time = 120
[Command]
name = "6246L"
command = ~$F, $D, $B, F, x
[Command]
name = "426H"
command = ~$B, $D, F, z
buffer.time = 10
[Command]
name = "624H"
command = ~$F, $D, B, z
time = 20
buffer.time = 10
[Command]
name = "623L"
command = ~$F, D, $F, x
time = 20
buffer.time = 5
[Command]
name = "623M"
command = ~$F, D, $F, y
time = 20
buffer.time = 5
[Command]
name = "623H"
command = ~$F, D, $F, z
time = 20	
buffer.time = 5
[Command]
name = "623R"
command = ~$F, D, $F, c
buffer.time = 5
[Command]
name = "214L"
command = ~$D, B, x
buffer.time = 5
[Command]
name = "214L_unbuffer"
command = ~$D, B, x
buffer.time = 0
[Command]
name = "214M"
command = ~$D, B, y
buffer.time = 5
[Command]
name = "214H"
command = ~$D, B, z
buffer.time = 5
[Command]
name = "214R"
command = ~$D, B, c
buffer.time = 10
[Command]
name = "236L"
command = ~D, >F, x
[Command]
name = "236M"
command = ~D, >F, y
[Command]
name = "236H"
command = ~D, >F, z
[Command]
name = "236R"
command = ~$D, >F, c
buffer.time = 10
[Command]
name = "236S"
command = ~$D, >F, b
buffer.time = 10
[Command]
name = "22L"
command = ~D, D, x
time = 10
[Command]
name = "22M"
command = ~D, D, y
time = 10
[Command]
name = "22H"
command = ~D, D, z
time = 10
[Command]
name = "22R"
command = ~D, D, c
time = 10
[Command]
name = "22S"
command = ~D, D, b
time = 20
[Command]
name = "22"
command = D, D
time = 10
[Command]
name = "2R"
command = /D, c
time = 1
[Command]
name = "6R"
command = /F, c
time = 1
[Command]
name = "4R"
command = /B, c
time = 1

[Command]
name = "Stance_Cancel"
command = c
time = 1
buffer.time = 0
[Command]
name = "Stance_L"
command = /x
time = 1
buffer.time = 0
[Command]
name = "Stance_M"
command = /y
time = 1
buffer.time = 0
[Command]
name = "Stance_H"
command = /z
time = 1
buffer.time = 0

[Command]
name = "feintBuffer_m"
command = /y
time = 1
buffer.time = 0
[Command]
name = "feintBuffer_h"
command = /z
time = 1
buffer.time = 0

[Statedef -1]

;===========================================================================

;===========================================================================
;This is not a move, but it sets up var(1) to be 1 if conditions are right
;for a combo into a special move (used below).
;Since a lot of special moves rely on the same conditions, this reduces
;redundant logic.
[State -1, Combo condition Reset]
type = VarSet
trigger1 = 1
var(1) = 0
[State -1, Combo condition Reset]
type = VarSet
trigger1 = 1
var(2) = 0

[State -1, Combo condition Check]
type = VarSet
trigger1 = statetype != A && ctrl
trigger2 = (stateno = [200,299]) || (stateno = [400,503]) || stateno = [600, 640]
trigger2 = movecontact
trigger3 = stateno = 100 || stateno = 60
var(1) = 1

[State -1, Helper Combo condition Check]
type = VarSet
trigger1 = helper(1226), movecontact || helper(1227), movecontact || helper(1228), movecontact || helper(1229), movecontact || helper(1230), movecontact
var(2) = 1

;===========================================================================
;236X - Judgement
[State -1, 236x]
type = ChangeState
value = 3000
triggerall = command = "236S"
triggerall = power >= 2000
triggerall = statetype != A && stateno != 1207
trigger1 = ctrl || var(1) || var(2)
trigger2 = statetype != A
trigger2 = stateno != [3000,3050)
trigger2 = movecontact
trigger4 = stateno = [100,101]

;22S - Snake Charge
[State -1, 22S]
type = ChangeState
value = 3100
triggerall = command = "22S"
triggerall = power >= 2000
triggerall = statetype != A && stateno != 1207
trigger1 = ctrl || var(1) || var(2)
trigger2 = stateno != [3000,3050)
trigger2 = movecontact
trigger3 = stateno = [100,101]

;214S- Maw of Serpent
[State -1, 214S]
type = ChangeState
value = 3200
triggerall = command = "214S"
triggerall = power >= 4000
triggerall = statetype != A && stateno != 1207
trigger1 = ctrl || var(1) || var(2) || stateno < 3000 && movehit && stateno != [800, 805]

;===============================================================================
;---------------------------------------------------------------------------

;Super Jump
[State -1, Super Jump]
type = ChangeState
value = 55
triggerall = statetype != A
triggerall = command = "28" || command = "27" || command = "29"
trigger1 = ctrl
trigger2 = Map(JC)

[State -1,JC]
type = ChangeState
value = 40
triggerall = statetype != A
triggerall = command = "holdup" || command = "up"
trigger1 = map(JC)
trigger2 = ctrl ||stateno = 100 && time > 3

;Double Jump Raw
[State -1,DJC]
type = ChangeState
value = 45
triggerall = Map(DoubleJump)  < 1
triggerall = command = "up"
trigger1 = ctrl && stateno!= [40,60]

[State -1,DJC]
type = ChangeState
value = 45
triggerall = command = "up" || movecontact && command = "holdup"
triggerall = Map(DoubleJump) < 1
trigger1 = ctrl && stateno!= [40,55] && !(stateno = 56 && time < 30)
trigger2 = movecontact ;&& enemynear, movetype = H
trigger2 = hitdefattr = A, NA
trigger2 = stateno!=620
trigger3 =  stateno=45 || stateno=46|| stateno=50
trigger3 = vel y>.1



;---------------------------------------------------------------------------
;Forward Airdash
[State -1, Airdash]
type = ChangeState
value = 60
triggerall = command != "holdback"
triggerall = command = "a66" || command = "M66"
triggerall = statetype = A && stateno != 2011
triggerall = Map(ADash) > 0
triggerall = pos y<-30 || vel y > 0
trigger1 = ctrl


;Backward Airdash
[State -1, Air Backdash]
type = ChangeState
value = 61
triggerall = command = "a44" || command = "M44"
trigger1 = statetype = A
trigger1 = ctrl
triggerall = Map(ADash) > 0
triggerall = pos y<-10
;--------------------------------------------------------------------------

;Dash
[State -1, Run Fwd]
type = ChangeState
value = 100
triggerall = command != "holdback"
triggerall = command = "66" || command = "M66"
triggerall = stateno!=100
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 250

;Backdash
[State -1, Backdash]
type = ChangeState
value = 105
triggerall = command = "44" || command = "M44"
triggerall = stateno!=105
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 250

;===========================================================================
;Unlimited Attacks
;===========================================================================
;214R
[State -1, EX Crossroads Murder]
type = ChangeState
value = 2000
triggerall = command = "214R" && map(SERPENT.FANG) 
triggerall = statetype != A && stateno != 2000
trigger1 = ctrl
trigger2 =  var(1) || var(2) || MoveContact && stateno < 3000

;623R
[State -1, Boom.]
type = ChangeState
value = 2005
triggerall = command = "623R" && stateno != 2005
triggerall = statetype != A && map(SERPENT.FANG)
trigger1 = ctrl
trigger2 =  var(1) || var(2) || MoveContact && stateno < 3000 || stateno = 40 || stateno = 55 

;236R - Sviga Lae: Dreifing
[State -1, REMEMBER, THIS IS WHAT YOU WANTED.]
type = ChangeState
value = 2010
triggerall = command = "236R" && stateno != 2010
triggerall = statetype != A && map(SERPENT.FANG)
trigger1 = ctrl
trigger2 =  var(1) || var(2) || MoveContact && stateno < 3000 || stateno = 40 || stateno = 55 
;Dreifing Dash
[State -1, SPEED FEAT FOR DEUS]
type = ChangeState
value = 2011
triggerall = map(DREIFING.ACTIVE)
triggerall = command = "66" || command = "M66"
triggerall = stateno != 1207
trigger1 = movecontact || var(2)
;Dreifing Dash
;[State -1, SPEED FEAT FOR DEUS]
;type = ChangeState
;value = 2012
;triggerall = map(DREIFING.ACTIVE)
;triggerall = command = "44" || command = "M44"
;triggerall = stateno != 1207
;trigger1 = movecontact || var(2)



;===========================================================================
;SPECIAL ATTACKS
;===========================================================================
;623L
[State -1, Boom.]
type = ChangeState
value = 1225
triggerall = command = "623L"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1) || stateno = 40 || stateno = 55

;623M
[State -1, Boom.]
type = ChangeState
value = 1223
triggerall = command = "623M"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1) || stateno = 40 || stateno = 55

;623H
[State -1, Boom.]
type = ChangeState
value = 1224
triggerall = command = "623H"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1) || stateno = 40 || stateno = 55


;THE BEAST UNLEASHED ....
[State -1, Beast Elbow]
type = changeState
value = 1205
triggerall = command = "624H"
triggerall = statetype != A
trigger1 = MAP(StrikeCount) = 2
trigger2 = stateno = 1100 && movecontact

;IRON MOUNTAIN'S COFFIN
[State -1, One Inch Punch]
type = changeState
value = 1209
triggerall = command = "214H"
triggerall = statetype != A
trigger1 = MAP(StrikeCount) = 2
trigger2 = stateno = 1100 && movecontact

;THE TREE OF LIFE AND DEATH......
[State -1, Yggdrasil]
type = changeState
value = 1206
triggerall = command = "236H"
triggerall = statetype != A
trigger1 = MAP(StrikeCount) = 2
trigger2 = stateno = 1100 && movecontact

;ALL EXISTENCE DENIED......
[State -1, EGO DEATH DRIVER]
type = changeState
value = 1207
triggerall = command = "6246L"
triggerall = statetype != A
trigger1 = MAP(StrikeCount) = 2
trigger2 = stateno = 1100 && movecontact

[State -1, EGO DEATH DRIVER]
type = changeState
value = 1207
triggerall = command = "EDD"
triggerall = statetype != A
trigger1 = ctrl || stateno = [200, 707]
trigger2 = stateno = 1100 && movecontact

;===========================================================================
;214L - Dead Pulse
[State -1, Spotdodge]
type = ChangeState
value = 1010
triggerall = command = "214L"
triggerall = stateno = 40 || stateno = 55 || !map(EN) && statetype != A
trigger1 = ctrl
trigger2 = var(1) || stateno = 40 || stateno = 55

;EN 214L - Wandering
[State -1, Spotdodge]
type = ChangeState
value = 1011
triggerall = command = "214L" && prevstateno != 1010 || command = "214L_unbuffer" && prevstateno = 1010 
triggerall = map(EN)
triggerall = statetype != A && !(stateno = 100 && time < 2) 
trigger1 = var(1)

;===========================================================================
;236M - Strike the Earth
[State -1, STE]
type = ChangeState
value = 1200
triggerall = command = "236M"
triggerall = statetype != A
trigger1 = var(1)
 
;236H - Sviga Lae
[State -1, I AM YOUR BAD FATE. SCATTER.]
type = ChangeState
value = 1100
triggerall = command = "236H" && command != "426H"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)

;214M
[State -1, Counter]
type = ChangeState
value = 1214
triggerall = command = "214M"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)

;214H
[State -1, Counter]
type = ChangeState
value = 1215
triggerall = command = "214H"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)

;j22H FASTFALL
[State -1, Fastfall]
type = changeState
value = 650
triggerall = command = "2R"
triggerall = statetype = A
trigger1 = var(1) || ctrl

;5S: One-Inch Punch
[State -1, One Inch Punch]
type = changeState
value = 1000
triggerall = command = "236L"
triggerall = statetype != A
triggerall = !map(EN)
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = [200,220] || stateno = [400,431]
trigger3 = movecontact


;5SEN: One-Inch Punch
[State -1, One Inch Punch]
type = changeState
value = 1001
triggerall = command = "236L"
triggerall = statetype != A
triggerall = map(EN)
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = [200,220] || stateno = [400,431]
trigger3 = movecontact
trigger4 = stateno = 100 && time > 2

;j236H: Jotunn's Wrath
[State -1, Jotunn's Wrath]
type = changeState
value = cond(map(EN), 1030, 1025)
triggerall = command = "236H"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = 60
trigger4 = movecontact && stateno = [600,640]

;===========================================================================

[State -1, 5R: Coiled Serpent]
type = ChangeState
value = 700 + 1*(MAP(EnState))
triggerall = command = "c"
triggerall = prevstateno != 632
triggerall = statetype !=A && stateno != 704
trigger1 = var(1)
trigger1 = ctrl
trigger2 = stateno = [200,230] || stateno = [400,431]
trigger2 = movecontact
trigger3 = stateno = [100,101] && !(prevstateno = 2000 && time <= 5)

;===========================================================================
;NORMALS
;===========================================================================
;6H
[State -1, Forward Light]
type = ChangeState
value = 230
triggerall = command = "buffer_z"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
triggerall = !map(NoNormals)
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = [400,420] || stateno = 200 || stateno = [210,220]
trigger2 = movecontact
trigger3 = stateno = [100,101] ;run and runstop

;5L: Standing Light
[State -1, Standing Light]
type = ChangeState
value = 200
triggerall = command = "x"
triggerall = command != "holddown" && var(59) !=4
triggerall = !map(NoNormals)
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 400 && movecontact
trigger3 = stateno = [100,101] 
 
;5M: Standing Medium
[State -1, Standing Medium]
type = ChangeState
value =  210
triggerall = command = "y"
triggerall = command != "holddown"
triggerall = !map(NoNormals) 
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact
trigger3 = stateno = [400,410] && movecontact && prevstateno != 210
trigger4 = stateno = [100,101]

;5H: Standing Heavy
[State -1, Standing Heavy]
type = ChangeState
value =  220
trigger1 = statetype != A
triggerall = command = "z"
triggerall = command != "holddown"
triggerall = !map(NoNormals)
trigger1 = ctrl
trigger2 = (stateno = [200,210] || stateno = [400,420]) && MoveContact
trigger3 = stateno = [100,101] ;run and runstop

;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;2L: Crouching Light
[State -1, Crouching Light]
type = ChangeState
value = 400
triggerall = command = "buffer_x"
triggerall = command = "holddown"
triggerall = !map(NoNormals)
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact ;5L
trigger3 = stateno = [100,101] 

;---------------------------------------------------------------------------
;2M: Crouching Medium
[State -1, Crouching Medium]
type = ChangeState
value = 410
triggerall = command = "y"
triggerall = command = "holddown"
triggerall = !map(NoNormals) 
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 400 || stateno = [200,210] && PrevStateNo != 410
trigger2 = (movecontact) ;&& enemynear, movetype = H
trigger3 = stateno = [100,101] 

;---------------------------------------------------------------------------
;Crouching Heavy (2H)
[State -1, Crouching Heavy]
type = ChangeState
value = 420
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = command != "holdfwd"
triggerall = !map(NoNormals)
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 410)|| (stateno = 200)|| (stateno = 210) 
trigger2 = (movecontact) ;&& enemynear, movetype = H
trigger3 = stateno = [100,101] 

;---------------------------------------------------------------------------
;3H: Sweep
[State -1, 3H]
type = ChangeState
value = 430
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = command = "holdfwd"
triggerall = !map(NoNormals)
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 410) || (stateno = 210)  || (stateno = 200) 
trigger2 = (movecontact) ;&& enemynear, movetype = H
trigger3 = stateno = [100,101] 

;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------

;j.5L: Jumping Light
[State -1, Jumping Light] ;jL
type = ChangeState
value = 600
triggerall = command = "x" || command = "buffer_x"
triggerall = statetype = A
trigger1 = ctrl || stateno = 60

;---------------------------------------------------------------------------
;j.5M: Jumping Medium
[State -1, Jumping Medium]
type = ChangeState
value = 610
triggerall = command = "y"
triggerall = statetype = A
trigger1 = ctrl || stateno = 60
trigger2 = stateno = 600 && movecontact

;j.2H: Jumping Heavy
[State -1, Jumping Heavy]
type = ChangeState
value = 640
triggerall = command = "z"
triggerall	= command = "holddown"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = [600, 630] && movecontact
trigger3 = stateno = 1350 ;Air blocking
trigger4 = stateno = 60

;j.5H: Jumping Heavy
[State -1, Jumping Heavy]
type = ChangeState
value = 630
triggerall = command = "z"
triggerall = statetype = A
trigger1 = ctrl || stateno = 60
trigger2 = stateno = [600,610] && movecontact

;DEVIANT REDLINE CANCEL
[State -1, REDLINE CANCEL]
type = ChangeState
value = 4005
triggerall = power >=1000 && stateno != 4005 && teammode != Tag
triggerall = command = "SP"
triggerall = statetype != A
triggerall = stateno != [900,915] && stateno != 803
trigger1 = map(FRC)

;DEVIANT REDLINE CANCEL (AIR)
[State -1, REDLINE CANCEL]
type = ChangeState
value = 4006
triggerall = power>=1000 && stateno != 4006 && teammode != Tag
triggerall = command = "SP"
triggerall = statetype = A 
triggerall = stateno != [900,915] && stateno != 803
trigger1 = map(FRC)


;REDLINE CANCEL
[State -1, REDLINE CANCEL]
type = ChangeState
value = 4000
triggerall = !map(ScratchLockout) && enemy, Alive && teammode != Tag
triggerall = power >=2000 && !map(FRC)
triggerall = stateno != 803
triggerall = command = "SP"
triggerall = statetype != A
triggerall = stateno != [900,915] && stateno != 803
trigger1 = movecontact

;REDLINE CANCEL (AIR)
[State -1, REDLINE CANCEL]
type = ChangeState
value = 4001
triggerall = !map(ScratchLockout) && enemy, Alive && teammode != Tag
triggerall = power>=2000 && !map(FRC)
triggerall = stateno !=750
triggerall = stateno != 900
triggerall = command = "SP"
triggerall = statetype = A
triggerall = stateno != [900,915] && stateno != 803
trigger1 = movecontact


;---------------------------------------------------------------------------
;===========================================================================
;PARRY (RED)                                                              []
;==========================================================================
;
;[State -1, Standing RED Parry]
;type = HitOverRide
;trigger1 = roundstate = 2 && (statetype = S || stateno = 5120)
;trigger1 = command = "fwd" && command != "back" && command != "up" && command != "down"
;trigger1 = movetype != A
;trigger1 = stateno = [151,153]
;attr = SA, AA, AP, HP, HA, NA, SA, SP, NP
;stateno = 703
;slot = 0
;time = 2

;[State -1, Crouching RED Parry]
;type = hitoverride
;trigger1 = roundstate = 2 && statetype != A
;trigger1 = command = "down" && command != "back" && command != "back" && command != "up"
;trigger1 = movetype != A
;trigger1 = stateno = [151,153]
;attr = C, AA, AP, HP, HA, NA, SA
;stateno = 704
;slot = 0
;time = 2
;
;[State -1, Air RED Parry]
;type = hitoverride
;trigger1 = roundstate = 2 && statetype = A
;trigger1 = command = "fwd" && command != "back" && command != "up" && command != "down"
;trigger1 = movetype != A
;trigger1 = stateno = [154,155]
;attr = SA, AA, AP, HP, HA, NA, SA
;stateno = 705
;forceair = 1
;slot = 0
;time = 2

;===========================================================================
;PARRY (BLUE)                                                             []
;==========================================================================

;[State -1, Standing Parry]
;type = HitOverRide
;triggerall = enemy, !map(LOW)
;trigger1 = roundstate = 2 && (statetype = S || stateno = 5120)
;trigger1 = command = "fwd" && command != "back" && command != "up" && command != "down"
;trigger1 = ctrl || (stateno = [700, 701])||(stateno = [703, 704]) || stateno = 5120
;trigger1 = movetype != A
;attr = SA, AA, AP, HP, HA, NA, SA, SP, NP
;stateno = 700
;slot = 0
;time = 6
;
;[State -1, Crouching Parry]
;type = hitoverride
;triggerall = enemy, !map(Overhead)
;trigger1 = roundstate = 2 && statetype != A
;trigger1 = command = "down" && command != "fwd" && command != "back" && command != "up"
;trigger1 = ctrl || (stateno = [700, 701])||(stateno = [703, 704]) || stateno = 5120
;trigger1 = movetype != A
;attr = C, AA, AP, HP, HA, NA, SA
;stateno = 701
;slot = 0
;time = 6
;
;[State -1, Air Parry]
;type = hitoverride
;trigger1 = roundstate = 2 && statetype = A
;trigger1 = command = "fwd" && command != "back" && command != "up" && command != "down"
;trigger1 = ctrl || stateno = 702 || stateno = 705
;trigger1 = movetype != A
;attr = SA, AA, AP, HP, HA, NA, SA
;stateno = 702
;forceair = 1
;slot = 0
;time = 8
