;-| Default Values |-------------------------------------------------------
[Defaults]
command.time = 15
command.buffer.time = 3

[Command]
name = "bfhold_x";Required (do not remove)
command = /x
time = 1
buffer.time = 9

[Command]
name = "bfhold_y";Required (do not remove)
command = /y
time = 1
buffer.time = 9

[Command]
name = "bfhold_z";Required (do not remove)
command = /z
time = 1
buffer.time = 9

[Command]
name = "bfhold_a";Required (do not remove)
command = /a
time = 1
buffer.time = 9

[Command]
name = "bfhold_b";Required (do not remove)
command = /b
time = 1
buffer.time = 2

[Command]
name = "bfhold_c";Required (do not remove)
command = /c
time = 1
buffer.time = 9

[Statedef -1]

;===========================================================================
[State -1, Combo condition Reset]
type = VarSet
trigger1 = 1
var(1) = 0

[State -1, Combo condition Check]
type = VarSet
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,299]) || (stateno = [400,503]) || stateno = [600,670] || stateno = [801,802]
trigger2 = movecontact ;&& enemynear, movetype = H
trigger2 = stateno!=421
trigger4 = stateno = 105
var(1) = 1

;---------------------------------------------------------------------------
;Wind Palm
[State -1, Triple Kung Fu Palm]
type = ChangeState
value = 3000
triggerall = command = "236X"
triggerall = power >= 2000
triggerall = statetype != A
trigger1 = ctrl
trigger2 = movecontact || map(remixCancel) && stateno != 3000
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = 1030 && movecontact = 1 ;&& enemynear, movetype = H
trigger5 = stateno = 1033 && movecontact = 1 ;&& enemynear, movetype = H
trigger6 = numexplod(1000) && (var(5) <= 2)
;---------------------------------------------------------------------------
;Typhoon Slap
[State -1, Triple Kung Fu Palm]
type = ChangeState
value = 3500
triggerall = command = "214X"
triggerall = power >= 4000
triggerall = statetype != A
trigger1 = ctrl 
trigger2 = movecontact || map(remixCancel)
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = 1030 && movecontact = 1 ;&& enemynear, movetype = H
trigger5 = stateno = 1033 && movecontact = 1 ;&& enemynear, movetype = H
;===========================================================================
;---------------------------------------------------------------------------

[State -1, DJ Stage 1: Air Detector]
type = Explod
trigger1 = !numexplod(45)
trigger1 = statetype = A
anim = 99999
ID = 45
removetime = -1


[State -1, DJ Stage 2: Up Release Detector]
type = Explod
trigger1 = numexplod(45) = 1
trigger1 = command != "holdup"
anim = 99999
ID = 45
removetime = -1


;Super Jump
[State -1, Super Jump]
type = ChangeState
value = 55
triggerall = statetype != A
triggerall = command = "28" || command = "27" || command = "29"
trigger1 = ctrl
trigger2 = movehit
trigger2 = stateno = [200,220] || stateno = 420

[State -1,DJC]
type = ChangeState
value = 45
triggerall = command = "holdup"
triggerall = numexplod(45) = 2 && map(floatjump)
triggerall = stateno!=45 && stateno!=46 && stateno!= 4260 && (stateno!=[4000,4099]) && !(stateno = [55, 56] && time < 6)
triggerall = var(45)
;triggerall = var(29)>0
trigger1 = ctrl && stateno!=45 && stateno!=46 && stateno!=50 && stateno!=40 && stateno!= 4260 && stateno != 1450
trigger2 = movecontact ;&& enemynear, movetype = H
trigger2 = hitdefattr = A, NA
trigger3 =  stateno=45 || stateno=46|| stateno=50

;---------------------------------------------------------------------------
;Aerial Backdash
[State -1, Air Backdash]
type = ChangeState
value =903
triggerall = command = "a44" || teammode != Tag && command = "M44"
trigger1 = statetype = A
trigger1 = ctrl
triggerall = stateno!=903
triggerall = var(29)>0
triggerall = pos y<-10

;Aerial Dash
[State -1, Airdash]
type = ChangeState
value =904
triggerall = command = "a66" || teammode != Tag && command = "M66"
trigger1 = statetype = A
trigger1 = ctrl
triggerall = stateno!=904
triggerall = var(29)>0
triggerall = pos y<-10

;Taunt
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = command="start"
trigger1 = statetype != A
trigger1 = ctrl

[State -1, 2EX] ; 2EX
type = ChangeState
value = 1010
triggerall=stateno!=40
triggerall = power>=1000
triggerall = command = "b" && command = "c" || command = "EX"
triggerall = command = "holddown"
triggerall = command != "holdback"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = numexplod(1000) && (var(5) <= 2)
trigger4=stateno=105

[State -1, 2S] ; lol whats this called
type = ChangeState
value = 1000
triggerall=stateno!=40
triggerall = command = "b"
triggerall=command!="c"
triggerall = command = "holddown"
triggerall = command != "holdback"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = numexplod(1000) && (var(5) <= 2)
trigger3 = !numexplod(10000)
trigger4=stateno=105

[State -1, j2S] 
type = ChangeState
value = 1450
triggerall = command = "b"
triggerall = command = "holddown"
triggerall = command != "holdback"
triggerall = statetype = A
triggerall = stateno!=1450
triggerall = prevstateno!=1450
trigger1 = ctrl
trigger2 = var(1)

[State -1, 662S]
type = ChangeState
value = 1000
triggerall=stateno!=40
triggerall = command = "buffer_b"
triggerall=command!="c"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = stateno = 100 && time >= 9
trigger2=stateno=105

[State -1, 4EX]
type = ChangeState
value = 1310
triggerall=stateno!=40
triggerall = stateno != 1310
triggerall = power>=1000 && !map(EX4SLimiter)
triggerall = command = "b" && command = "c" || command = "EX"
triggerall = command != "holddown"
triggerall = command = "holdback"
triggerall = statetype != A
trigger1 = var(1)
trigger2 = ctrl
trigger3 = numexplod(1000) && (var(5) <= 2)
trigger4=stateno=105

[State -1, 4Sset] ; trap metal
type = ChangeState
value = 1300
triggerall=stateno!=40
triggerall = stateno != 1310
triggerall = NumHelper(1303) <= 0
triggerall=command!="c"
triggerall = command = "b" && command="holdback"
triggerall = statetype != A
triggerall = !numexplod(1300)
trigger1 = var(1)
trigger2 = ctrl
trigger3 = numexplod(1000) && (var(5) <= 2)
trigger4=stateno=105

[State -1, 4S] 
type = ChangeState
value = 1301
triggerall=stateno!=40
triggerall = NumHelper(1303) >= 1
triggerall=command!="c"
triggerall = command = "b" && command="holdback"
triggerall = statetype != A
triggerall = !numexplod(1301)
trigger1 = ctrl
trigger2 = var(1)
trigger3 = numexplod(1000) && (var(5) <= 2)
trigger3 = stateno != 1300
trigger3 = stateno != 1301
trigger4=stateno=105

[State -1, j4S] 
type = ChangeState
value = 1302
triggerall = NumHelper(1303) >= 1
triggerall=command!="c"
triggerall = command = "b" && command="holdback"
triggerall = statetype = A
triggerall = !numexplod(1301)
trigger1 = ctrl
trigger2 = var(1)
trigger3 = numexplod(1000) && (var(5) <= 2)
trigger3 = stateno != 1300
trigger3 = stateno != 1301


[State -1, 5EX] ; no longer gay; hate those people (I lied)
type = ChangeState
value = 1250
triggerall=stateno!=40
triggerall = numhelper(12050)=0
triggerall = power>=1000  && !map(EX5SLimiter)
triggerall = command != "holdback" && command != "holdfwd" && command != "holddown"
triggerall = command = "b" && command = "c" || command = "EX"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = numexplod(1000) && (var(5) <= 2)
trigger4=stateno=105

[State -1, 5S]
type = ChangeState
value = 1200
triggerall=stateno!=40
triggerall = !numhelper(1204)
triggerall=command!="c"
triggerall = command != "holdback" && command != "holdfwd" && command != "holddown"
triggerall = command = "b"
triggerall = statetype != A
triggerall = !numexplod(1200)
trigger1 = ctrl
trigger2 = var(1)
trigger3 = numexplod(1000) && (var(5) <= 2)
trigger4=stateno=105

[State -1, 5SS] 
type = ChangeState
value = 1201
triggerall=stateno!=40
triggerall = numhelper(1204)
triggerall = !numhelper(1205) || numexplod(1200)
triggerall=command!="c"
triggerall = command != "holdback" && command != "holdfwd" && command != "holddown"
triggerall = command = "b"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = numexplod(1000) && (var(5) <= 2)
trigger3 = !numexplod(1201)
trigger4=stateno=105

[State -1, 6S] ; Painwheel!
type = ChangeState
value = 1100
triggerall=stateno!=40 && stateno != 1100
triggerall = NumHelper(1101) <= 0
triggerall = command = "b" && command = "holdfwd"
triggerall = command != "holdback"
triggerall = command != "holdup"
triggerall = command != "c"
triggerall = statetype != A
triggerall = !numexplod(1100)
trigger1 = ctrl
trigger2 = var(1)
trigger3 = numexplod(1000) && (var(5) <= 2)
trigger4=stateno=105

[State -1, EX 6S] ; Now THIS is a real painwheel!
type = ChangeState
value = 1110
triggerall=stateno!=40
triggerall = NumprojID(1112) <= 0
triggerall = power>=1000  && !map(EX6SLimiter)
triggerall = fvar(23) = 0
triggerall = command = "b" && command = "c"  || command = "EX"
triggerall = command = "holdfwd"  && command != "holdback" && command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = numexplod(1000) && (var(5) <= 2)
trigger4=stateno=105

[State -1, j6S]
type = ChangeState
value = 1400
triggerall = NumHelper(1101) <= 0
triggerall = command != "holdback" && command = "holdfwd" 
triggerall=command != "holddown"
triggerall = command = "b" && command != "c"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = var(1)
[State -1, j6EX]
type = ChangeState
value = 1410
triggerall = NumprojID(1112) <= 0
triggerall = power>=1000  && !map(EXj6SLimiter)
triggerall = command != "holdback" && command = "holdfwd" && command != "holddown"
triggerall = command = "b" && command = "c" || command = "EX"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = var(1)


[State -1, j5S]
type = ChangeState
value = 1430
triggerall = !map(Airball) && stateno != 1430
triggerall = command != "holdback" && command != "holdfwd" 
triggerall=command != "holddown"
triggerall = command = "b" && command != "c"
triggerall = statetype = A
triggerall = !numexplod(1200)
trigger1 = ctrl
trigger2 = var(1)
trigger3 = numexplod(1000) && (var(5) <= 2)

[State -1, j5EX] ; no longer gay; hate those people (I lied)
type = ChangeState
value = 1440
triggerall = numhelper(12050)=0
triggerall = power>=1000  && !map(EXj5SLimiter)
triggerall = command != "holdback" && command != "holdfwd" && command != "holddown"
triggerall = command = "b" && command = "c" || command = "EX"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = numexplod(1000) && (var(5) <= 2)


[State -1, 4R: Wind Push]
type = ChangeState
value = 1540
triggerall=stateno!=40 && stateno != 1540
triggerall = stateno != 1310
triggerall = statetype != A
triggerall = command != "holddown"
triggerall = command = "holdback"
triggerall = command != "holdfwd"
triggerall = command != "b"
triggerall = command != "z"
triggerall = command = "c"
trigger1 = var(1)
trigger2 = ctrl
trigger3 = map(RemixCancel)
[State -1, 6R: Wind Push]
type = ChangeState
value = 1560
triggerall=stateno!=40 && stateno != 1560
triggerall = statetype != A
triggerall = command != "holddown"
triggerall = command != "holdback"
triggerall = command = "holdfwd"
triggerall = command = "c"
triggerall = command != "b"
triggerall = command != "z"
trigger1 = var(1)
trigger2 = ctrl
trigger3 = map(RemixCancel)
[State -1, 5R: Wind Push]
type = ChangeState
value = 1520
triggerall=stateno!=40 && stateno != 1520
triggerall = statetype != A
triggerall = command = "holddown"
triggerall = command != "holdback"
triggerall = command != "holdfwd"
triggerall = command = "c"
triggerall = command != "b"
triggerall = command != "z"
trigger1 = var(1)
trigger2 = ctrl
trigger3 = map(RemixCancel)


[State -1, 2R: Wind Push]
type = ChangeState
value = 1550
triggerall=stateno!=40 && stateno != 1550
triggerall = statetype != A
triggerall = command != "holddown"
triggerall = command != "holdback"
triggerall = command != "holdfwd"
triggerall = command = "c"
triggerall = command != "b"
triggerall = command != "z"
trigger1 = var(1)
trigger2 = ctrl
trigger3 = map(RemixCancel)

;--------------------------------------------------------------------------
;Forward Dash
[State -1, Run!!]
type = ChangeState
value = 100
triggerall = stateno!=105
triggerall = command != "holdback"
triggerall = command = "66" || teammode != Tag && command = "M66"
trigger1 = statetype != A
trigger1 = ctrl && !(stateno = 100 && time < 15)
;trigger2 = stateno = 1100

;Backdash
[State -1, Backdash]
type = ChangeState
value = 105
triggerall = command = "44" || teammode != Tag && command = "M44"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 250
triggerall = stateno!=105

;===========================================================================
;NORMALS BEHOLD!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;===========================================================================

;5L: Standing Light. Arzon's 5L aint mashable lol
[State -1, Standing Light]
type = ChangeState
value = 200
triggerall=stateno!=40
triggerall = command = "x"
triggerall = command != "holddown" && var(59) !=4
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = command = "buffer_x"
trigger2 = movecontact =1 ;&& enemynear, movetype = H
trigger2 = stateno = 400 && time>1
trigger2 = movecontact = 1 ;&& enemynear, movetype = H
trigger3 = stateno = 101 
 
;5M: Standing Medium
[State -1, Standing Medium]
type = ChangeState
value =  210
triggerall=stateno!=40
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact ;5L
;trigger3 = stateno = 100 && time > 3
trigger3 = stateno = 400 && movecontact ;2L

;5H: Standing Heavy
[State -1, Standing Heavy]
type = ChangeState
value =  220
triggerall=stateno!=40
trigger1 = statetype = S
triggerall = command = "z"
triggerall = command != "holddown"
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact ;5L
trigger3 = (stateno = 210) && movecontact ;5M
trigger4 = (stateno = 410) && movecontact ;2M
trigger5 = (stateno = 420) && movecontact ;2H

;6H: Standing Heavy
[State -1, Standing Heavy]
type = ChangeState
value = 230
triggerall=stateno!=40
trigger1 = statetype != A
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = command = "holdfwd"
triggerall = numhelper(230) = 0
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact ;5L
trigger3 = (stateno = 210) && movecontact ;5M
trigger4 = (stateno = 410) && movecontact ;2M
trigger5 = (stateno = 420) && movecontact ;2H

;6H: Standing Heavy
[State -1, Standing Heavy]
type = ChangeState
value =  231
triggerall=stateno!=40
triggerall = statetype != A
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = command = "holdfwd"
triggerall = numhelper(230) != 0
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact ;5L
trigger3 = (stateno = 210) && movecontact ;5M
trigger4 = (stateno = 410) && movecontact ;2M
trigger5 = (stateno = 420) && movecontact ;2H
;---------------------------------------------------------------------------
;2L: Crouching Light
[State -1, Crouching Light]
type = ChangeState
value = 400
triggerall=stateno!=40
triggerall = command = "buffer_x"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact ;5L
;---------------------------------------------------------------------------
;2M: Crouching Medium
[State -1, Crouching Medium]
type = ChangeState
value = 410
triggerall=stateno!=40
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 200)  || (stateno = 210) 
trigger2 = (movecontact) ;&& enemynear, movetype = H
trigger3 = stateno = 101 ;runstop

;---------------------------------------------------------------------------
;Crouching Heavy (2H)
[State -1, Crouching Heavy]
type = ChangeState
value = 420
triggerall=stateno!=40
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = command != "holdfwd"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 410)|| (stateno = 200)|| (stateno = 210) || (stateno = 430)
trigger2 = movecontact

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
trigger2 = movehit && stateno = 600 ;&& enemynear, movetype = H
trigger3 = stateno = 1350 ;Air blocking
trigger4 = stateno = 630 && movehit
trigger5 = stateno = 610 && movehit
;trigger4 = stateno = 904 && time > 3
;---------------------------------------------------------------------------
;j.5M: Jumping Medium
[State -1, Jumping Medium]
type = ChangeState
value = 610
triggerall = command = "y"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 601  ;jump_x or jump_a
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1350 ;Air blocking
trigger4 = stateno = 630 && movehit

;---------------------------------------------------------------------------
;j.5H: Jumping Heavy
[State -1, Jumping Heavy]
type = ChangeState
value = 630
triggerall = command != "holdfwd"
triggerall = command = "z"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = (stateno = [600,610]) 
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1350 ;Air blocking

[State -1, j6H]
type = ChangeState
triggerall = command = "holdfwd"
triggerall = command = "z"
triggerall = statetype = A
trigger1 = ctrl 
trigger2 = (stateno = [600,610]) 
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1350 ;Air blocking
value = 640


;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;LOL PARRY IS DEAD!!!!!!!!!!!!!!!!!!!!!!!!!!!
;[State -1, Standing Parry]
;type = HitOverRide
;trigger1 = roundstate = 2 && (statetype = S || stateno = 5120)
;trigger1 = command = "fwd" && command != "back" && command != "up" && command != "down"
;trigger1 = ctrl || (stateno = [700, 701]) || stateno = 5120
;attr = SA, AA, AP, HP, HA, NA, SA, SP, NP
;stateno = 700
;slot = 0
;time = 8

;[State -1, Crouching Parry]
;type = hitoverride
;trigger1 = roundstate = 2 && statetype != A
;trigger1 = command = "down" && command != "fwd" && command != "back" && command != "up"
;trigger1 = ctrl || (stateno = [700, 701]) || stateno = 5120
;attr = C, AA, AP, HP, HA, NA, SA
;stateno = 701
;slot = 0
;time = 8

;[State -1, Air Parry]
;type = hitoverride
;trigger1 = roundstate = 2 && statetype = A
;trigger1 = command = "fwd" && command != "back" && command != "up" && command != "down"
;trigger1 = ctrl || stateno = 702
;attr = SA, AA, AP, HP, HA, NA, SA
;stateno = 702
;forceair = 1
;slot = 0
;time = 7