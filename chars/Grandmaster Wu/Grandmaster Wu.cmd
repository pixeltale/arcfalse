[Defaults]
command.time = 15
command.buffer.time = 3

[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s

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

[State -1, baseddept]
type = ChangeState
value = 770
triggerall = ishelper(777)
trigger1 = root, movetype = H

[State -1, Combo condition Check]
type = VarSet
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,299]) || (stateno = [400,499]) || stateno = 656
trigger2 = movecontact
trigger2 = stateno!=421 ;&& stateno!=210 
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = 105 && time > 15
var(1) = 1

;===========================================================================
;===========================================================================
;===========================================================================
;=============================LVL1-LVL3 SUPERS===============================
;===========================================================================
;===========================================================================
;===========================================================================

;---------------------------------------------------------------------------

;Equanimity (Lv4)
[State -1, R]
type = ChangeState
value = 3020
triggerall = !ishelper
triggerall = command = "214x"
triggerall = power >= 4000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != [3000,3050)
trigger2 = movecontact

;Sobriety (Air Lv2)
[State -1, Triple Kung Fu Palm]
type = ChangeState
value = 3000
triggerall = !ishelper
triggerall = command = "236x"
triggerall = power >= 2000
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = statetype = A
trigger2 = hitdefattr = A, NA, SA
trigger2 = stateno != [3000,3050)
trigger2 = movecontact
;---------------------------------------------------------------------------
;Super 1: 1-Inch Pawnch
[State -1, R]
type = ChangeState
value = 3010
triggerall = !ishelper
triggerall = command = "236x"
triggerall = power >= 2000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != [3000,3050)
trigger2 = movecontact

;===========================================================================
;===========================================================================
;===========================================================================
;=================================SYSTEMS==================================
;===========================================================================
;===========================================================================
;===========================================================================

[State -1,DJC]
type = ChangeState
value = 45
triggerall = command = "holdupb"
triggerall =stateno!=45 && stateno!=46 && stateno!= 4260 && (stateno!=[4000,4099]) && stateno !=[903,904]
triggerall = var(29)>0
trigger1 = stateno!=640 && ctrl && stateno!=45 && stateno!=46 && stateno!=50 && stateno!=40 && stateno!= 4260 && !(stateno = 56 && time < 10)
trigger2 = stateno!=640 && movecontact
trigger2 = stateno!=640 && hitdefattr = A, NA
trigger3 =  stateno!=640 && stateno=45 || stateno=46|| stateno=50
trigger3 = stateno!=640 && vel y>.1

;Super Jump
[State -1, Super Jump]
type = ChangeState
value = 55
triggerall = statetype != A
triggerall = command = "28" || command = "27" || command = "29"
trigger1 = ctrl

[State -1, JC]
type = ChangeState
value = 40
triggerall = command = "up" || movecontact && command = "holdup"
trigger1 = stateno = [200,220] || stateno = 420
trigger1 = movehit

;===========================================================================
;===========================================================================
;===========================================================================
;=============================SPECIALS & EX==================================
;===========================================================================
;===========================================================================
;===========================================================================

[State -1, 2S: Astral Rise EX]
type = ChangeState
value = 1043
triggerall = !ishelper
triggerall = var(34)<=0 ;Limiter - Only Allowed to use ONCE during a combo
triggerall = command = "b"
triggerall = command = "c"
triggerall = power>1000
triggerall = command = "holddown"
triggerall = command != "holdback"
triggerall = command != "holdfwd"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)

[State -1, EX Revelation Lv3]
type = ChangeState
value = 1014
triggerall = !ishelper
triggerall = var(32)<=0 ;Limiter - Only Allowed to use ONCE during a combo
triggerall = !ishelper
triggerall = power>1000
triggerall = command = "b"
triggerall = command = "c"
triggerall = command = "holdfwd"
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = 210 && movecontact
trigger4 = stateno = 610 && movecontact
trigger5 = stateno = 630 && movecontact
trigger6 = stateno = 640 && movehit

[State -1, EX Ascension Lv3]
type = ChangeState
value = 1003
triggerall = !ishelper
triggerall = var(35)<=0 ;Limiter - Only Allowed to use ONCE during a combo
triggerall = power>1000
triggerall = command = "b"
triggerall = command = "c"
triggerall = command = "holdback"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)

[State -1, EX Holy Flame Lv3]
type = ChangeState
value = 1033
triggerall = var(33)<=0 ;Limiter - Only Allowed to use ONCE during a combo
triggerall = !ishelper
triggerall = !numhelper(10311)
triggerall = !numhelper(10322)
triggerall = power>1000
triggerall = command = "b"
triggerall = command = "c"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)


[State -1, Ascension Lv3]
type = ChangeState
value = 1002
triggerall = fvar(19) >= 200 ;Used to be > 199, ty graganick
triggerall = command = "b"
triggerall = command = "holdback"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)

[State -1, Ascension Lv2]
type = ChangeState
value = 1001
triggerall = fvar(19) >= 100
triggerall = command = "b"
triggerall = command = "holdback"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)

[State -1, Ascension Palm]
type = ChangeState
value = 1000
triggerall = command = "b"
triggerall = command = "holdback"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)

[State -1, 2S: Astral Rise Lv3]
type = ChangeState
value = 1042
triggerall = !ishelper
triggerall = fvar(19) >= 200
triggerall = command = "b"
triggerall = command = "holddown"
triggerall = command != "holdback"
triggerall = command != "holdfwd"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)

[State -1, 2S: Astral Rise Lv2]
type = ChangeState
value = 1041
triggerall = !ishelper
triggerall = fvar(19) >= 100
triggerall = command = "b"
triggerall = command = "holddown"
triggerall = command != "holdback"
triggerall = command != "holdfwd"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)

[State -1, 2S: Astral Rise Lv2]
type = ChangeState
value = 1041
triggerall = !ishelper
triggerall = fvar(19) < 100
triggerall = command = "b"
triggerall = command = "holddown"
triggerall = command != "holdback"
triggerall = command != "holdfwd"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)

[State -1, 2R: Kum Kick]
type = ChangeState
value = 2010
triggerall = !ishelper
triggerall = command = "c"
triggerall = command = "holddown"
triggerall = command != "holdback"
triggerall = command != "holdfwd"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)

[State -1, Revelation Lv3]
type = ChangeState
value = 1012
triggerall = fvar(19) >= 200
triggerall = command = "b"
triggerall = command = "holdfwd"
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = 210 && movecontact
trigger4 = stateno = 610 && movecontact
trigger5 = stateno = 630 && movecontact
trigger6 = stateno = 640 && movehit

[State -1, Revelation Lv2]
type = ChangeState
value = 1011
triggerall = fvar(19) >= 100
triggerall = command = "b"
triggerall = command = "holdfwd"
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = 210 && movecontact
trigger4 = stateno = 610 && movecontact
trigger5 = stateno = 630 && movecontact

[State -1, Revelation]
type = ChangeState
value = 1010
triggerall = command = "b"
triggerall = command = "holdfwd"
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = 210 && movecontact
trigger4 = stateno = 610 && movecontact
trigger5 = stateno = 630 && movecontact

[State -1, Holy Flame Lv3]
type = ChangeState
value = 1032
triggerall = !ishelper
triggerall = !numhelper(10322)
triggerall = fvar(19) >= 200
triggerall = command = "b"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)

[State -1, Holy Flame Lv2]
type = ChangeState
value = 1031
triggerall = !ishelper
triggerall = !numhelper(10311)
triggerall = !numhelper(10322)
triggerall = fvar(19) >= 100
triggerall = command = "b"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)

[State -1, Holy Flame Lv1]
type = ChangeState
value = 1030
triggerall = !ishelper
triggerall = !numhelper(10311)
triggerall = !numhelper(10322)
triggerall = command = "b"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)


;[State -1, 2R: Coom Kick]
;type = ChangeState
;value = 2010
;triggerall = !ishelper
;triggerall = command = "c"
;triggerall = command = "holddown"
;triggerall = command != "holdback"
;triggerall = command != "holdfwd"
;trigger1 = statetype != A
;trigger1 = ctrl
;trigger2 = var(1)

;===========================================================================
;===========================================================================
;===========================================================================
;===============================MOVEMENT==================================
;===========================================================================
;===========================================================================
;===========================================================================

;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;airdash fwd
[State -1, Run Fwd]
type 		= ChangeState
value 		= 904
triggerall 	= command = "66" || command = "M66" && command != "holdback"
trigger1 	= statetype = A
trigger1 	= ctrl
triggerall 	= stateno!=904
triggerall 	= var(29)>0

;airdash back
[State -1, Run Fwd]
type 		= ChangeState
value 		= 903
triggerall 	= command = "44" || command = "M44"
trigger1 	= statetype = A
trigger1 	= ctrl
triggerall 	= stateno!=903
triggerall 	= var(29)>0

;Run Back
[State -1, Run Back]
type = ChangeState
value = 105
triggerall = stateno!=105
triggerall = stateno!=100
triggerall = command = "44" || command = "M44"
trigger1 = statetype = S
trigger1 = ctrl

;Forward Dash
[State -1, Run Back]
type = ChangeState
value = 100
triggerall = stateno!=105
triggerall = command = "66" || command = "M66"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 1100
;---------------------------------------------------------------------------



;===========================================================================
;===========================================================================
;===========================================================================
;================================NORMALS==================================
;===========================================================================
;===========================================================================

;5L
[State -1, 5L]
type = ChangeState
value = 200
triggerall = command = "x"
triggerall = command != "holddown" && var(59) !=4
trigger1 = statetype = S
trigger1 = ctrl 
trigger2 = stateno = 200 && movecontact

;5M
[State -1,5M]
type = ChangeState
value =  210
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 410 && movecontact && time > 15
trigger3 = stateno = 200 && movecontact && time > 10
trigger4 = stateno = 400 && movecontact && time > 10

;6H
[State -1, 6H]
type = ChangeState
value =  230
triggerall = command = "z"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
trigger1 = ctrl
trigger1 = statetype = S
trigger2 = stateno = [200,220] || stateno = [400,420]
;-----------------------------------------------------------------------------------------------------------

;5H
[State -1, 5H]
type = ChangeState
value =  220
trigger1 = statetype = S
triggerall = command = "z"
triggerall = command != "holddown"
trigger1 = ctrl

;-----------------------------------------------------------------------------------------------------------
;-----------------------------------------------------------------------------------------------------------

;2L
[State -1, 2L]
type = ChangeState
value = 400
triggerall = command = "buffer_x"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl

;---------------------------------------------------------------------------
;2M
[State -1, 2M]
type = ChangeState
value = 410
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl

;---------------------------------------------------------------------------
;2H
[State -1, 2H]
type = ChangeState
value = 420
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = command != "holdfwd"
trigger1 = statetype = C
trigger1 = ctrl

;---------------------------------------------------------------------------
;3H
[State -1, 3H]
type = ChangeState
value = 430
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = command = "holdfwd"
trigger1 = statetype = C
trigger1 = ctrl

;j2M
[State -1, j2M]
type = ChangeState
value = 640
triggerall = command = "y"
triggerall = command = "holddown" 
triggerall = statetype = A
triggerall = pos y<-20
trigger1 = ctrl
trigger2 = (stateno = [600,630]) 
trigger2 = movecontact
trigger3 = stateno = 1350 ;Air blocking
;-----------------------------------------------------------------------------------------------------------

;jL
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = command = "x"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 
trigger2 = movecontact
trigger3 = stateno = 1350 ;Air blocking

;---------------------------------------------------------------------------
;jM
[State -1, jM]
type = ChangeState
value = 610
triggerall = command = "y"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 
trigger2 = movecontact
trigger3 = stateno = 1350 ;Air blocking


;---------------------------------------------------------------------------
;jH
[State -1, jH]
type = ChangeState
value = 630
triggerall = command != "holddown"
triggerall = command = "z"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = (stateno = [600,610]) 
trigger2 = movecontact
trigger3 = stateno = 1350 ;Air blocking
;---------------------------------------------------------------------------


;===========================================================================
;===========================================================================
;===========================================================================
;==================================PARRIES==================================
;===========================================================================
;===========================================================================
;===========================================================================


;===========================================================================
;PARRY (RED)                                                              []
;==========================================================================

[State -1, Standing RED Parry]
type = HitOverRide
triggerall = enemy, !map(Low)
trigger1 = roundstate = 2 && (statetype = S || stateno = 5120)
trigger1 = command = "fwd" && command != "back" && command != "up" && command != "down"
trigger1 = movetype != A
trigger1 = stateno = [151,153]
attr = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
stateno = 703
slot = 0
time = 2

[State -1, Crouching RED Parry]
type = hitoverride
triggerall = enemy, map(Low)
trigger1 = roundstate = 2 && statetype != A
trigger1 = command = "down" && command != "fwd" && command != "back" && command != "up"
trigger1 = movetype != A
trigger1 = stateno = [151,153]
attr = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
stateno = 704
slot = 0
time = 2

[State -1, Air RED Parry]
type = hitoverride
trigger1 = roundstate = 2 && statetype = A
trigger1 = command = "fwd" && command != "back" && command != "up" && command != "down"
trigger1 = movetype != A
trigger1 = stateno = [154,155]
attr = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
stateno = 705
forceair = 1
slot = 0
time = 2

;===========================================================================
;PARRY (BLUE)                                                             []
;==========================================================================
[State -1, Standing Parry]
type = HitOverRide
triggerall = enemy, !map(Low)
trigger1 = roundstate = 2 && (statetype = S || stateno = 5120)
trigger1 = command = "fwd" && command != "back" && command != "up" && command != "down"
trigger1 = ctrl || (stateno = [700, 701])||(stateno = [703, 704]) || stateno = 5120
trigger1 = movetype != A
attr = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
stateno = 700
slot = 0
time = 6

[State -1, Crouching Parry]
type = hitoverride
triggerall = enemy, map(Low)
trigger1 = roundstate = 2 && statetype != A
trigger1 = command = "down" && command != "fwd" && command != "back" && command != "up"
trigger1 = ctrl || (stateno = [700, 701])||(stateno = [703, 704]) || stateno = 5120
trigger1 = movetype != A
attr = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
stateno = 701
slot = 0
time = 6

[State -1, Air Parry]
type = hitoverride
trigger1 = roundstate = 2 && statetype = A
trigger1 = command = "fwd" && command != "back" && command != "up" && command != "down"
trigger1 = ctrl || stateno = 702 || stateno = 705
trigger1 = movetype != A
attr = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
stateno = 702
forceair = 1
slot = 0
time = 8

;==================================================
