; The CMD file.
;-| Default Values |-------------------------------------------------------
[Defaults]
command.time = 15
command.buffer.time = 3

[Command]
name = "heavyCharge"
command = /z
time = 1
buffer.time = 0

[Command]
name = "buffered_holdfwd" ;Required (do not remove)
command = /$F
time = 1
[Command]
name = "buffered_holddown" ;Required (do not remove)
command = /$D
time = 1
[Command]
name = "buffered_holdback" ;Required (do not remove)
command = /$B
time = 1
[Command]
name = "buffered_holdup" ;Required (do not remove)
command = /$U
time = 1

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

[State -1, Combo condition Check]
type = VarSet
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,299]) || (stateno = [400,503]) || stateno = 656 || stateno = 670
trigger2 = movecontact ;&& enemynear, movetype = H
trigger2 = stateno!=421
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = 105
var(1) = 1

;===========================================================================
;236X - FUNERAL
[State -1, 236x]
type = ChangeState
value = 3000
triggerall = command = "236x"
triggerall = power >= 2000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = stateno != [3000,3050)
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1310 || stateno = 1330

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

;--------------------------------------------------------------------------

;Dash
[State -1, Run Fwd]
type = ChangeState
value = 100
triggerall = command != "holdback"
triggerall = command = "66" || teammode != Tag && command = "M66"
triggerall = stateno!=100
trigger1 = statetype = S
trigger1 = ctrl

;Backdash
[State -1, Backdash]
type = ChangeState
value = 105
triggerall = command = "44" || teammode != Tag && command = "M44"
triggerall = stateno!=105
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 1000 && time > 5 || stateno = 1050 && animelemno(0) >= 5

;===========================================================================
;EX MOVES
;===========================================================================
;2EX
[State -1, SKULLSPLITTER]
type = ChangeState
value = 1090
triggerall = power > 1000
triggerall = command = "EX" && command = "holddown"
triggerall = !map(Limiter_2EX)
trigger1 = ctrl || stateno = 100
trigger2 = var(1) || stateno = [600,620] && movecontact

;4EX
[State -1, bombos]
type = ChangeState
value = 1070
triggerall = power > 1000
triggerall = command = "EX" 
triggerall = command = "holdback"
triggerall = !map(Limiter_4EX)
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)

;5EX
[State -1, RELOADRELOAD]
type = ChangeState
value = 1030
triggerall = power > 1000
triggerall = command = "EX" && map(ShotCount) < 2
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1) || stateno = 1000



;===========================================================================
;SPECIAL MOVES
;===========================================================================
;2S
[State -1, SKULLSPLITTER]
type = ChangeState
value = 1080
triggerall = stateno != 1090
triggerall = command = "b" && command = "holddown"
trigger1 = ctrl || stateno = 100
trigger2 = var(1) || stateno = [600,620] && movecontact

;4S
[State -1, MALICIOUS PRESSURE CONSUMES YOU]
type = ChangeState
value = 1060
triggerall = command = "b"
triggerall = command = "holdback"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)

;6S
[State -1, ABSOLUTE ESSENCE OF SHOTGUN]
type = ChangeState
value = 1050
triggerall = command = "b"
triggerall = command = "holdfwd"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)

;5S
[State -1, ABSOLUTE ESSENCE OF SHOTGUN]
type = ChangeState
value = 1000
triggerall = command = "b"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)


;===========================================================================
;REMIX
;===========================================================================
;5R
[State -1, MALICIOUS PRESSURE CONSUMES YOU]
type = ChangeState
value = 700
triggerall = command = "c"
trigger1 = statetype != A
trigger1 = ctrl || prevstateno = [120,155] || stateno = 701
trigger2 = var(1) && stateno != 105

;===========================================================================
;COMMAND NORMALS
;===========================================================================
;---------------------------------------------------------------------------
;3H: Sweep
[State -1, 3H]
type = ChangeState
value = 430
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = command = "holdfwd"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = movecontact
trigger2 = stateno = [200,420] && stateno != 225 && stateno != 415 && stateno != 430

;---------------------------------------------------------------------------
;3M: Linker
;[State -1, 3H]
;type = ChangeState
;value = 425
;triggerall = command = "y"
;triggerall = command = "holddown"
;triggerall = command = "holdback"
;triggerall = statetype != A
;trigger1 = ctrl
;trigger2 = movecontact
;trigger2 = stateno = [200,420] && stateno != 225 && stateno != 415 && stateno != 430

;---------------------------------------------------------------------------
;6H: SKELE-TON!!!
[State -1, 3H]
type = ChangeState
value = 225
triggerall = command = "z"
triggerall = command = "holdfwd"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = movecontact
trigger2 = stateno = [200,420] && stateno != 225 && stateno != 415 && stateno != 430

;===========================================================================
;NORMALS
;===========================================================================

;5L: Standing Light
[State -1, Standing Light]
type = ChangeState
value = 200
triggerall = command = "x"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
 
;5M: Standing Medium
[State -1, Standing Medium]
type = ChangeState
value =  210
triggerall = command = "y"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = movecontact
trigger2 = stateno = 400 || stateno = 200

;5H: Standing Heavy
[State -1, Standing Heavy]
type = ChangeState
value =  220
triggerall = statetype != A
triggerall = command = "z"
triggerall = command != "holddown"
trigger1 = ctrl
trigger2 = movecontact
trigger2 = stateno = [400,420] || stateno = [200,210]

;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;2L: Crouching Light
[State -1, Crouching Light]
type = ChangeState
value = 400
triggerall = command = "buffer_x"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
;2M: Crouching Medium
[State -1, Crouching Medium]
type = ChangeState
value = 410
triggerall = command = "y"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = movecontact
trigger2 = stateno = 400 || stateno = 200

;---------------------------------------------------------------------------
;Crouching Heavy (2H)
[State -1, Crouching Heavy]
type = ChangeState
value = 420
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = command != "holdfwd"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = movecontact
trigger2 = stateno = [400,410] || stateno = [200,210]

;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------

;j.5L: Jumping Light
[State -1, Jumping Light] ;jL
type = ChangeState
value = 600
triggerall = command = "x" || command = "buffer_x"
triggerall = statetype = A
trigger1 = ctrl || stateno = 100
trigger2 = stateno = 1350
trigger3 = stateno = 60
trigger4 = stateno = [610, 640] && movehit
;---------------------------------------------------------------------------
;j.5M: Jumping Medium
[State -1, Jumping Medium]
type = ChangeState
value = 610
triggerall = command = "y"
triggerall = statetype = A
trigger1 = ctrl || stateno = 100
trigger2 = movecontact && stateno!= 610
trigger2 = stateno = [620,630] && movehit || stateno = 600 && movecontact
trigger3 = stateno = 1350 ;Air blocking
trigger4 = stateno = 60

;j.5H: Jumping Heavy
[State -1, Jumping Heavy]
type = ChangeState
value = 620
triggerall = command = "z"
triggerall = statetype = A
trigger1 = ctrl || stateno = 100
trigger2 = stateno = [600,610] && movecontact || stateno = 640 && movehit
trigger3 = stateno = 1350 ;Air blocking
trigger4 = stateno = 60



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
