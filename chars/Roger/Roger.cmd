; The CMD file.
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
; Default value for the "time" parameter of a Command. Minimum 1.
command.time = 15
command.buffer.time = 3


; Don't remove the following line. It's required by the CMD standard.
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
trigger2 = (stateno = [200,299]) || (stateno = [400,499]) || stateno = 656 || stateno = [500,562] && stateno != 550
trigger2 = movecontact && !enemy, movereversed
trigger2 = stateno!=421
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = [100,105]
var(1) = 1

;---------------------------------------------------------------------------
;Command Grab
[State -1, Triple Kung Fu Palm]
type = ChangeState
value = 3000
triggerall = command = "236X"
triggerall = power >= 2000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 1310 || stateno = 1330 ;From blocking
trigger3 = stateno = 616
trigger4 = var(1)
;---------------------------------------------------------------------------
;Air Grab
[State -1, Triple Kung Fu Palm]
type = ChangeState
value = 3051
triggerall = command = "214X"
triggerall = power >= 2000
triggerall = stateno !=3050 && var(30)<=0
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != [3000,3050)
trigger2 = movecontact
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = 616
trigger5 = stateno = 10003 ||stateno =40016
trigger6 = stateno = 1405||stateno =1458

;===========================================================================

;Super Jump
[State -1, Super Jump]
type = ChangeState
value = 55
triggerall = statetype != A 
triggerall = command = "28" || command = "27" || command = "29"
trigger1 = stateno = 100 && animelemno(0) > 2
trigger2 = (stateno = 420 || stateno = 210) && movehit
trigger3 = ctrl

;Jump Cancel
[State -1,JC]
type = ChangeState
value = 40
triggerall = statetype != A
triggerall = command = "holdupb" || command = "up"
trigger1 = stateno = 100 && animelemno(0) > 2
trigger2 = (stateno = 420 || stateno = 210) && movehit

;Dash
[State -1, Run Fwd]
type = ChangeState
value = 100
triggerall = command != "holdback"
triggerall = command = "66" || teammode != Tag && command = "M66"
triggerall = stateno!=100
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = [700,701] && power >= 2000 || stateno = [703,704] && power >= 2000
trigger3 = Map(DCFH) > 0 || Map(DCFB) > 0

[State -1,DJC]
type = ChangeState
value = 45
triggerall = command = "up" || movecontact && command = "holdup"
triggerall = stateno!=45 && stateno!=46 && stateno!= 434 && (stateno!=[4000,4099]) && !(stateno = [55, 56] && time < 6)
triggerall = var(45)>0
;triggerall = var(29)>0
trigger1 = ctrl && stateno!=45 && stateno!=46 && stateno!=50 && stateno!=40 && stateno!= 434
trigger2 = movecontact  && enemynear, movetype = H
trigger2 = hitdefattr = A, NA
trigger3 =  stateno=45 || stateno=46|| stateno=50
trigger3 = vel y>.1

;[State -1, Stand Kill Switch]
;type = ChangeState
;value = 901
;=triggerall = var(15)>=1000
;triggerall = statetype != A
;triggerall = command = "c"
;triggerall = command = "z"
;trigger1 = hitdefattr = SCA, NA, SA, HA && movecontact

[State -1, Magma Viper EX]
type = ChangeState
value = 1450
triggerall=stateno!=40
triggerall = power>=1000
triggerall = command = "b" && command = "c" || (command = "EX") && teammode != Tag
triggerall = command = "holdfwd"
triggerall = command != "holddown"
triggerall = statetype != A
triggerall = fvar(24) = 0
trigger1 = ctrl
trigger2 = var(1)
trigger3 = (stateno = [600,640]) 
trigger3 = movecontact


[State -1, Magma Viper]
type = ChangeState
value = 1400
triggerall=stateno!=40
triggerall = command = "b"
triggerall = command != "c"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = (stateno = [600,640]) 
trigger3 = movecontact

[State -1, EX Meteor Drop]
type = ChangeState
value = 1350
triggerall=stateno!=40
triggerall = power>=1000
triggerall = fvar(22) = 0
triggerall = var(33)<=0
triggerall = command = "b" && command = "c" || (command = "EX") && teammode != Tag
triggerall = command = "holddown"
triggerall = command != "holdback"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)


[State -1, Meteor Drop]
type = ChangeState
value = 1300
triggerall=stateno!=40
triggerall = command = "b"
triggerall = command != "c"
triggerall = command = "holddown"
triggerall = command != "holdback"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)


[State -1, EX Flare Press]
type = ChangeState
value = 10050
triggerall=stateno!=40
triggerall = power>=1000
triggerall = var(31)<=0
triggerall = fvar(21) = 0
triggerall = command = "b"  && command = "c" || (command = "EX") && teammode != Tag
triggerall = command="holdback"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)

[State -1, Flare Press]
type = ChangeState
value = 1100
triggerall=stateno!=40
triggerall = command = "b" && command="holdback"
triggerall = command != "c"
triggerall = var(51)<=0
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)

;---------------------------------------------------------------------------
[State -1, jEX Air Grab]
type = ChangeState
value = 1325
triggerall = power>=1000
triggerall = var(32)<=0
triggerall = command = "b" && command = "c" ||  (command = "EX") && teammode != Tag
triggerall = fvar(23) = 0
triggerall = statetype = A
trigger1 = ctrl
trigger2 = (stateno = [600,640]) 
trigger2 = movecontact
trigger3 = stateno = 1350 ;Air blocking
;---------------------------------------------------------------------------
[State -1, jS Air Grab]
type = ChangeState
value = 1320
triggerall = command = "b"
triggerall = command != "c"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = (stateno = [600,640]) 
trigger2 = movecontact
trigger3 = stateno = 1350 ;Air blocking

;---------------------------------------------------------------------------
[State -1, EX Dynamo Slapper]
type = ChangeState
value = 2001
triggerall=stateno!=40
triggerall = power>=1000
triggerall = fvar(20) = 0
triggerall = command = "b" && command = "c" || (command = "EX") && teammode != Tag
trigger1 = statetype != A
trigger1 = ctrl
trigger2 =stateno=105
trigger3 = var(1)
;trigger2 = var(1)


[State -1, Dynamo Slammer]
type = ChangeState
value = 1000
triggerall=stateno!=40
triggerall = command = "b"
triggerall = command != "c"
trigger1 = statetype != A
trigger1 = ctrl
trigger2=stateno =105
trigger3 = var(1)
;trigger2 = var(1)

[State -1, 2R]
type = ChangeState
value = 560
triggerall = stateno!=40
triggerall = stateno != [500,562]
triggerall = command = "c" && command="holddown"
triggerall = command != "b"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger2=stateno!=105

[State -1, 4R]
type = ChangeState
value = 550
triggerall=stateno!=40
triggerall = stateno != [500,562]
triggerall = command = "c" && command="holdback"
triggerall = command != "b"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger2=stateno!=105

[State -1, 5R]
type = ChangeState
value = 500
triggerall=stateno!=40
triggerall = stateno != [500,562]
triggerall = command = "c"
triggerall = command != "b"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger2=stateno!=105
;---------------------------------------------------------------------------

;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;Run Back
[State -1, Run Back]
type = ChangeState
value = 105
triggerall = command = "44" || teammode != Tag && command = "M44"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 250
triggerall = stateno!=105

;Overhead
;[State -1, Stand Strong Punch] 	;This is coded like some yandere dev shit 
;type = ChangeState					-PXN.
;value =  750
;triggerall=stateno!=100
;triggerall=stateno!=40
;trigger1 = statetype = S
;triggerall = command = "y"
;triggerall = command = "holdfwd"
;triggerall = command !="holddown"
;trigger1 = ctrl
;trigger2 = (stateno = 200) && movecontact 
;trigger3 = (stateno = 210) && movecontact 
;trigger4 = (stateno = 220) && movecontact 
;trigger5 = stateno = 411 && movecontact
;trigger6 = (stateno = 400) && movecontact 
;trigger7 = stateno = 410 && movecontact
;trigger8 = stateno = 420 && movecontact
;trigger9 = stateno = 211 && movecontact
;trigger10 = stateno = 201 && movecontact

;===========================================================================
;---------------------------------------------------------------------------
[State -1, Stand Strong Punch]
type = ChangeState
value =  200
triggerall=stateno!=40
triggerall = command = "x"
triggerall = command = "holdback"
trigger1 = statetype = S
trigger1 = ctrl
;trigger2 = (stateno = 200) && movecontact =1

[State -1, Stand Strong Punch]
type = ChangeState
value =  201
triggerall=stateno!=40
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 400) && movecontact =1

;Stand Strong Punch
[State -1, Stand Strong Punch]
type = ChangeState
value =  210
triggerall=stateno!=40
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 201) && movecontact =1

[State -1, Stand Strong Punch]
type = ChangeState
value =  210
triggerall=stateno!=40
triggerall = command = "y" || command = "hold_y"
triggerall = command != "holddown"
trigger1 = (prevstateno!= 210 && stateno = 410) && movecontact =1

[State -1, Stand Strong Punch]
type = ChangeState
value =  410
triggerall=stateno!=40
triggerall = command = "y" || command = "hold_y"
triggerall = command = "holddown"
trigger1 =  (prevstateno!= 410 && stateno = 210)  && movecontact =1
trigger2 = stateno = 200 && movecontact = 1
trigger3 = stateno = 201 && movecontact = 1



;Stand Strong Punch
[State -1, Stand Strong Punch]
type = ChangeState
value =  220
triggerall=stateno!=40
trigger1 = statetype = S
triggerall = command = "z"
triggerall = command != "holddown"
trigger1 = ctrl
trigger2 = (stateno = 201) && movecontact =1
trigger3 = (stateno = 210 || stateno=211)&& movecontact =1
trigger4 = (stateno = [400,420]) && movecontact =1




;---------------------------------------------------------------------------
;Crouching Light Punch
[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerall=stateno!=40
triggerall = command = "buffer_x"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 200)
trigger2 = movecontact = 1

;---------------------------------------------------------------------------
;Crouching Strong Punch
[State -1, Crouching Strong Punch]
type = ChangeState
value = 410
triggerall=stateno!=40
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) 
trigger2 = (movecontact)
;---------------------------------------------------------------------------
;Crouching Light Kick
[State -1, Crouching Light Kick]
type = ChangeState
value = 430
triggerall=stateno!=40
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = command = "holdfwd"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 200)|| (stateno = 210)|| (stateno = 410)|| (stateno = 420)
trigger2 = (movecontact)

;---------------------------------------------------------------------------
;Crouching Light Kick
[State -1, Crouching Light Kick]
type = ChangeState
value = 420
triggerall=stateno!=40
triggerall = command = "z"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 200)|| (stateno = 210)|| (stateno = 410) || (stateno = 211) || (stateno = 411)
trigger2 = (movecontact)

;---------------------------------------------------------------------------
;Jump Light Punch
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = command = "buffer_x"
triggerall = statetype = A
trigger1 = ctrl
;trigger2 = movecontact && stateno = 600
trigger2 = stateno = 1350 ;Air blocking
trigger3 = stateno = 100
trigger4 = stateno = 615 && movehit
trigger5 = stateno = 610 && movehit
trigger6 = stateno = 600 && movehit
;---------------------------------------------------------------------------

;Jump Strong Punch
[State -1, Jump Strong Punch]
type = ChangeState
value = 610
triggerall = command = "y"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 601  ;jump_x or jump_a
trigger2 = movecontact
trigger3 = stateno = 1350 ;Air blocking
trigger4 = stateno = 100
trigger5 = stateno = 615 && movehit
;---------------------------------------------------------------------------
;Jump Strong Kick
[State -1, Jump Strong Kick]
type = ChangeState
value = 615
triggerall = command = "z"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = (stateno = [600,610]) 
trigger2 = movecontact
trigger3 = stateno = 1350 ;Air blocking
trigger4 = stateno = 100
;---------------------------------------------------------------------------