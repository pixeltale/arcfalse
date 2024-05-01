; The CMD file.
;-| Button Remapping |-----------------------------------------------------
[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s

;-| Default Values |-------------------------------------------------------
[Defaults]
command.time = 15
command.buffer.time = 3
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
trigger2 = (stateno = [200,299]) || (stateno = [400,420]) || (stateno = [500,510])
trigger2 = movecontact
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = 105 && time > 16
var(1) = 1
;===========================================================================

;236X - HATE CRIME OUTSIDE OF 7/11!!!
[State -1, Super Jump]
type = ChangeState
value = 3000
triggerall = statetype != A
triggerall = command = "236X"
triggerall = power >= 2000
trigger1 = ctrl || stateno = 100 || stateno = [300, 305]
trigger2 = var(1)
trigger3 = stateno = [1006,1007] || stateno = 1008 && animelemno(0) > 10  || stateno = 1022 || stateno = 1032 || stateno = [1043,1044]
trigger3 = movecontact

;214X - Senator Armstrong
[State -1, Super Jump]
type = ChangeState
value = 3100
triggerall = statetype != A
triggerall = command = "214X"
triggerall = power >= 2000
trigger1 = ctrl || stateno = 100 || stateno = [300, 305]
trigger2 = var(1)
trigger3 = stateno = [1006,1007] || stateno = 1008 && animelemno(0) > 10  || stateno = 1022 || stateno = 1032  || stateno = [1043,1044]
trigger3 = movecontact

;Super Jump
[State -1, Super Jump]
type = ChangeState
value = 55
triggerall = statetype != A
triggerall = command = "28" || command = "27" || command = "29"
trigger1 = ctrl || stateno = 100
trigger2 = stateno = [220,250] || stateno = 420
trigger2 = movehit

[State -1,DJC]
type = ChangeState
value = 45
triggerall = command = "up" || movecontact && command = "holdup"
triggerall = stateno!=45 && stateno!=46
triggerall = var(29)>0
trigger1 = ctrl && stateno!=45 && stateno!=46 && stateno!=50 && stateno!=40 && stateno!= 4260 && !(stateno = 56 && time < 30)
trigger2 = movecontact ;&& enemynear, movetype = H
trigger2 = statetype = A
trigger3 =  stateno=45 || stateno=46|| stateno=50
trigger3 = vel y>.1

;---------------------------------------------------------------------------
;Aerial Dash
[State -1, Airdash]
type = ChangeState
value =904
triggerall = var(29)>0
triggerall = command != "holdback"
triggerall = command = "a66" || teammode != Tag && command = "M66"
trigger1 = statetype = A
trigger1 = ctrl
triggerall = stateno!=904
triggerall = stateno
triggerall = pos y<-20


;Aerial Backdash
[State -1, Air Backdash]
type = ChangeState
value =903
triggerall = var(29)>0
triggerall = command = "a44" || teammode != Tag && command = "M44"
trigger1 = statetype = A
trigger1 = ctrl
triggerall = stateno!=903
triggerall = pos y<-20

;---------------------------------------------------------------------------
;Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
triggerall = command != "holdback"
triggerall = command = "66" || teammode != Tag && command = "M66"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 510 && animelemno(0) >= 5

;---------------------------------------------------------------------------
;Run Back
[State -1, Run Back]
type = ChangeState
value = 105
triggerall = command = "44"|| teammode != Tag && command = "M44"
triggerall = statetype != A
triggerall = stateno!=105
trigger1 = ctrl
trigger2 = stateno = 510 && animelemno(0) >= 5

;================================

[State -1, EX 6S: Quake Drop]
type = ChangeState
value = 1030
triggerall = power>1000
triggerall = (command = "b" && command = "c") && command = "holdfwd" || (command = "EX" && command = "holdfwd") && teammode != Tag
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = [300, 305] || stateno = [100, 105]

[State -1, 6S: Quake Drop]
type = ChangeState
value = 1020
triggerall = command = "b"
triggerall = command = "holdfwd"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = [300, 305] || stateno = [100, 105]


[State -1, EX 4S]
type = ChangeState
value = 1050
triggerall = power>1000 && !map(EX4S_Used)
triggerall = (command = "b" && command = "c") || command = "EX"
triggerall = command != "holdfwd"
triggerall = command != "holddown"
triggerall = command = "holdback"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = [300, 305] || stateno = [100, 105]

[State -1, 4S]
type = ChangeState
value = 1040
triggerall = command = "b"
triggerall = command != "holdfwd"
triggerall = command = "holdback"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = [300, 305] || stateno = [100, 105]

[State -1, 2EX: Malevolent Thrash]
type = ChangeState
value = 1035
triggerall = power>1000
triggerall = (command = "b" && command = "c") && command = "holddown" || (command = "EX" && command = "holddown") && teammode != Tag
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = [300, 305] || stateno = [100, 105]

[State -1, 2S: Malevolent Thrash]
type = ChangeState
value = 1034
triggerall = command = "b"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = [300, 305] || stateno = [100, 105]

[State -1, EX 5S]
type = ChangeState
value = 1014
triggerall = power>1000
triggerall = (command = "b" && command = "c") || command = "EX" && teammode != Tag
triggerall = command != "holdfwd"
triggerall = command != "holddown"
triggerall = command != "holdback"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = [300, 305] || stateno = [100, 105]

[State -1, 5S]
type = ChangeState
value = 1000
triggerall = command = "b"
triggerall = command != "holdfwd"
triggerall = command != "holdback"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = [300, 305] || stateno = [100, 105]

;---------------------------------------------------------------------------
;jR
[State -1, jR]
type = ChangeState
value = 650
triggerall = command = "c"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = (stateno = [600,630]) 
trigger2 = movecontact
trigger3 = stateno = 1350
trigger4 = stateno = 904 && time > 3

;6R
[State -1, Run Fwd]
type = ChangeState
value = 300
triggerall = command = "c"
triggerall = command != "b"
triggerall = command = "holdfwd"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1) && stateno != [500,520]
trigger3 = stateno =100

;4R
[State -1, Backdash]
type = ChangeState
value = 305
triggerall = command = "c"
triggerall = command != "b"
triggerall = command = "holdback"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1) && stateno != [500,520]
trigger3 = stateno =100

[State -1, 2R: Shatter Stomp]
type = ChangeState
value = 500
triggerall = command = "c"
triggerall = command = "holddown"
triggerall = stateno != 500
triggerall = statetype != A
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = 510 || stateno = 442
trigger3 = movecontact

[State -1, 5R: Charging Angel]
type = ChangeState
value = 510
triggerall = command = "c" 
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = 500 || stateno = 442
trigger3 = movecontact


;===========================================================================
;NORMALS 
;===========================================================================
;5L
[State -1, 5L]
type = ChangeState
value = 200
triggerall = command = "x"
triggerall = command != "holddown" && var(59) !=4
triggerall = statetype != A 
trigger1 = ctrl ||stateno = 400 && movecontact
trigger2 = stateno = 100
 
;5M: Standing Medium
[State -1, Standing Medium]
type = ChangeState
value =  210
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact ;5L
trigger3 = stateno = 400 && movecontact ;2L
trigger4 = stateno = 100

;6H: Forward Heavy
[State -1, Standing Heavy]
type = ChangeState
value =  250
trigger1 = statetype = S
triggerall = command = "z"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
trigger1 = ctrl
trigger2 = stateno = [200,220] && movecontact 
trigger3 = stateno = [400,420] && movecontact
trigger4 = stateno = 100

;5H: Standing Heavy
[State -1, Standing Heavy]
type = ChangeState
value =  220
trigger1 = statetype = S
triggerall = command = "z"
triggerall = command != "holddown"
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact ;5L
trigger3 = (stateno = 210) && movecontact ;5M
trigger4 = (stateno = 410) && movecontact ;2M
trigger5 = stateno = 400 && movecontact ;2L
trigger6 = stateno = 100

;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;2L: Crouching Light
[State -1, Crouching Light]
type = ChangeState
value = 400
triggerall = command = "buffer_x" || command = "x"
triggerall = command = "holddown" || command = "down"
triggerall = statetype != A
trigger1 = ctrl || stateno = 200 && movecontact
trigger2 = stateno = 100
;---------------------------------------------------------------------------
;2M: Crouching Medium
[State -1, Crouching Medium]
type = ChangeState
value = 410
triggerall = command = "y"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 200)  || (stateno = 210) 
trigger2 = (movecontact)
trigger3 = stateno = 100
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
trigger2 = (stateno = 400) || (stateno = 200)|| (stateno = 210) || (stateno = 410)
trigger2 = (movecontact) ;&& enemynear, movetype = H
trigger3 = stateno = 100


;---------------------------------------------------------------------------
;3H: Slide!!!
[State -1, 3H]
type = ChangeState
value = 440
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = command = "holdfwd"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 410) || (stateno = 210)  || (stateno = 200) 
trigger2 = (movecontact) ;&& enemynear, movetype = H
trigger3 = stateno = 100

;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------

;j.5L: Jumping Light
[State -1, Jumping Light]
type = ChangeState
value = 600
triggerall = command = "buffer_x"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = movecontact && (stateno = [600 , 630])
trigger3 = stateno = 1350 ;Air blocking
trigger4 = stateno = 904 && time > 3
;---------------------------------------------------------------------------
;j.5M: Jumping Medium
[State -1, Jumping Medium]
type = ChangeState
value = 610
triggerall = command = "y"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 601  || stateno = 630
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1350 ;Air blocking
trigger4 = stateno = 904 && time > 3
;---------------------------------------------------------------------------
;j.5H: Jumping Heavy
[State -1, Jumping Heavy]
type = ChangeState
value = 630
triggerall = command = "z"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = (stateno = [600,610]) 
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1350 ;Air blocking
trigger4 = stateno = 904 && time > 3

;===========================================================================
;PARRY (RED)                                                              []
;==========================================================================

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
;
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
;
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