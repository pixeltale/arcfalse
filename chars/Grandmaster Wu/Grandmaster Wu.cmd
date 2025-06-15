[Defaults]
command.time = 15
command.buffer.time = 3

[Command]
name = "BACK.CHARGE"
command = /$B
buffer.time = 0
time = 1
[Command]
name = "S.RELEASE"
command = ~b
buffer.time = 3
time = 1
[Command]
name = "4S"
command = /B, b
[Command]
name = "2S"
command = /$D, b
[Command]
name = "6S"
command = /F, b



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
[State -1, Combo condition Reset]
type = VarSet
trigger1 = 1
var(1) = 0

[State -1, Combo condition Check]
type = VarSet
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,299]) || (stateno = [400,499]) || stateno = 656 || stateno = [610,640]
trigger2 = movecontact
trigger2 = stateno!=421
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

;Sobriety (Air Lv2)
[State -1, Triple Kung Fu Palm]
type = ChangeState
value = 3000
triggerall = stateno!=40
triggerall = !ishelper
triggerall = command = "236x"
triggerall = power >= 2000
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = statetype = A
trigger2 = hitdefattr = A, NA, SA
triggerall=stateno!=7501
trigger2 = stateno != [3000,3050)
trigger2 = movecontact

;===========================================================================
;===========================================================================
;===========================================================================
;=================================SYSTEMS==================================
;===========================================================================
;===========================================================================
;===========================================================================
;Super Jump
[State -1, Super Jump]
type = ChangeState
value = 55
triggerall = statetype != A
triggerall = command = "28" || command = "27" || command = "29"
trigger1 = ctrl || stateno = 100
trigger2 = stateno = [200,220] || stateno = 420
trigger2 = movehit


[State -1,DJC]
type = ChangeState
value = 45
triggerall = statetype = A
triggerall = command = "up" || movecontact && command = "holdup"
triggerall = var(29) > 0
trigger1 = ctrl && stateno!= [40,55] && !(stateno = 56 && time < 30) && stateno != 40
trigger2 = movecontact
trigger2 = hitdefattr = A, NA
trigger2 = stateno!=620
trigger3 =  stateno=45 || stateno=46|| stateno=50
trigger3 = vel y>.1

;Double Jump Raw
[State -1,DJC]
type = ChangeState
value = 45
triggerall = var(29) > 0
triggerall = command = "up"
trigger1 = ctrl && stateno!= [40,60]

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

[State -1, EX 2S] ;2EX
type = ChangeState
value = 1043
triggerall = var(34)<=0 && power >= 1000 ;v(34) is ex limiter
triggerall = command = "b" && command = "c"
triggerall = command = "holddown" && command != "holdback" && command != "holdfwd"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)

[State -1, EX 4S] ;4EX
type = ChangeState
value = 1003
triggerall = power>=1000
triggerall = command = "b" && command = "c" && (command = "holdback" || command = "back")
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)

[State -1, EX 6S] ;6EX
type = ChangeState
value = 1014
triggerall = power>=1000 && var(32)<=0 ;Limiter - Only Allowed to use ONCE during a combo
triggerall = command = "b" && command = "c" && command = "holdfwd"
trigger1 = ctrl
trigger2 = var(1)


[State -1, EX 5S] ;5EX
type = ChangeState
value = 1038
triggerall = statetype != A
triggerall = var(33)<=0 ;Limiter - Only Allowed to use ONCE during a combo
triggerall = !ishelper
triggerall = !numhelper(10311)
triggerall = !numhelper(10322)
triggerall = power>1000
triggerall = command = "b" && command = "c" && command != "holdback"
trigger1 = ctrl
trigger2 = var(1)

[State -1, 4S]
type = ChangeState
value = 1000
triggerall = statetype != A
triggerall = command = "4S"
trigger1 = ctrl
trigger2 = var(1)

[State -1, 2S]
type = ChangeState
value = 1040
triggerall = statetype != A
triggerall = command = "2S"
trigger1 = ctrl
trigger2 = var(1)

[State -1, 6S]
type = ChangeState
value = 1012
triggerall = command = "6S"
trigger1 = ctrl
trigger2 = var(1)

[State -1, 5S]
type = ChangeState
value = 1030
triggerall = statetype != A
triggerall = !numhelper(1031)
triggerall = !numhelper(10322)
triggerall = command = "b"
trigger1 = ctrl
trigger2 = var(1)

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
triggerall	= pos y <= -10

;airdash back
[State -1, Run Fwd]
type 		= ChangeState
value 		= 903
triggerall 	= command = "44" || command = "M44"
trigger1 	= statetype = A
trigger1 	= ctrl
triggerall 	= stateno!=903
triggerall 	= var(29)>0
triggerall	= pos y <= -10

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
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl 
trigger2 = (stateno = 200 || stateno = 400) && movecontact

;5M
[State -1,5M]
type = ChangeState
value =  210
triggerall = command = "y"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200 || stateno = 400 || stateno = 410) && movecontact

;6H
[State -1, 6H]
type = ChangeState
value =  230
triggerall = command = "z"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,220] || stateno = [400,420]) && movecontact

[State -1, 5R]
type = ChangeState
value = 42000
triggerall = numexplod(893) = 0
triggerall = !ishelper
triggerall = stateno != 2000
triggerall = !numhelper(750)
triggerall = command != "holddown"
triggerall = command != "holdfwd"
triggerall = command != "holdback"
triggerall = command != "b"
trigger1 = Ctrl
triggerall = command = "buffer_c"
trigger2 = var(1)
trigger3 = stateno = [600,640] || stateno =1003 || stateno = [1014,1017] || stateno = 1043
trigger3 = movecontact

[State -1, 6R]
type = ChangeState
value = 62000
triggerall=stateno!=40
triggerall = numexplod(893) = 0
triggerall = !ishelper
triggerall = stateno != 2000
triggerall = !numhelper(750)
triggerall = command = "holdfwd"
triggerall = command != "b"
trigger1 = Ctrl
triggerall = command = "buffer_c"
trigger2 = var(1)
trigger3 = stateno = [600,640] || stateno =1003 || stateno = [1014,1017] || stateno = 1043
trigger3 = movecontact

[State -1, 4R]
type = ChangeState
value = 32000
triggerall=stateno!=40
triggerall = numexplod(893) = 0
triggerall = !ishelper
triggerall = stateno != 2000
triggerall = !numhelper(750)
triggerall = command = "holdback"
triggerall = command != "b"
trigger1 = Ctrl
triggerall = command = "buffer_c"
trigger2 = var(1)
trigger3 = stateno = [600,640] || stateno =1003 || stateno = [1014,1017] || stateno = 1043
trigger3 = movecontact

[State -1, 2R: Tranquililty 1]
type = ChangeState
value = 12000
triggerall=stateno!=40
triggerall = numexplod(893) = 0
triggerall = !ishelper
triggerall = stateno != 2000
triggerall = !numhelper(750)
triggerall = command = "holddown"
triggerall = command != "b"
trigger1 = Ctrl
triggerall = command = "buffer_c"
trigger2 = var(1)
trigger3 = stateno = [600,640] || stateno =1003 || stateno = [1014,1017] || stateno = 1043
trigger3 = movecontact

[State -1, 2R: Tranquililty 1]
type = ChangeState
value = 12000
triggerall=stateno!=40
triggerall = numexplod(893) = 0
triggerall = !ishelper
triggerall = stateno != 2000
triggerall = !numhelper(750)
triggerall = command = "holddown"
triggerall = command != "b"
trigger1 = Ctrl
triggerall = command = "buffer_c"
trigger2 = var(1)
trigger3 = stateno = [600,640] || stateno =1003 || stateno = [1014,1017] || stateno = 1043
trigger3 = movecontact

;-----------------------------------------------------------------------------------------------------------

;5H
[State -1, 5H]
type = ChangeState
value =  220
triggerall = statetype != A
triggerall = command = "z"
triggerall = command != "holddown"
trigger1 = ctrl
trigger2 = (stateno = [200,210] || stateno = [400,420]) && movecontact

;-----------------------------------------------------------------------------------------------------------
;-----------------------------------------------------------------------------------------------------------

;2L
[State -1, 2L]
type = ChangeState
value = 400
triggerall = statetype != A
triggerall = command = "x"
triggerall = command = "holddown"
trigger1 = ctrl
trigger2 = (stateno = 200 || stateno = 400) && movecontact

;---------------------------------------------------------------------------
;2M
[State -1, 2M]
type = ChangeState
value = 410
triggerall = command = "y"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200 || stateno = 400 || stateno = 210) && movecontact

;---------------------------------------------------------------------------
;2H
[State -1, 2H]
type = ChangeState
value = 420
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = command != "holdfwd"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,210] || stateno = [400,410]) && movecontact

;---------------------------------------------------------------------------
;3H
[State -1, 3H]
type = ChangeState
value = 430
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = command = "holdfwd"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,220] || stateno = [400,420]) && movecontact

;j2M
[State -1, j2M]
type = ChangeState
value = 640
triggerall = command = "y"
triggerall = command = "holddown" 
triggerall = statetype = A
triggerall = pos y < -20
trigger1 = ctrl
trigger2 = (stateno = [600,630]) 
trigger2 = movecontact

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
