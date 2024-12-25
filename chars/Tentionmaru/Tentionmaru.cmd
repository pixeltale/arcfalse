
;-| Default Values |-------------------------------------------------------
[Defaults]
command.time = 15
command.buffer.time = 3

[Statedef -1]

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
trigger2 = stateno = [200,499]
trigger2 = movecontact ;&& enemynear, movetype = H
trigger2 = stateno!=421
trigger3 = stateno = 1330 ;From blocking
trigger4 = stateno = 105
trigger5 = stateno = 1203
var(1) = 1

;Gentleman's Beatdown
;[State -1, Gentleman's Beatdown]
;type = ChangeState
;value = 3000
;triggerall = command = "236X"
;triggerall = power >= 2000
;trigger1 = statetype != A
;trigger1 = ctrl
;trigger2 = statetype != A
;trigger2 = hitdefattr = SC, NA, SA, HA ;&& enemynear, movetype = H
;trigger2 = movecontact
;trigger3 = (stateno = [200,499]) && movecontact = 1 ;&& enemynear, movetype = H
;trigger4 = stateno = 1303 
;triggerall = stateno != [3000, 3001]

;---------------------------------------------------------------------------
;Gentleman Rising
;[State -1, Gentleman Rising]
;type = ChangeState
;value = 3010
;triggerall = command = "214X"
;triggerall = power >= 2000
;trigger1 = statetype != A
;trigger1 = ctrl
;trigger2 = statetype != A
;trigger2 = hitdefattr = SC, NA, SA, HA ;&& enemynear, movetype = H
;trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
;trigger4 = stateno = 1303 
;triggerall = stateno != 3010
;===========================================================================
;Super Jump
[State -1, Super Jump]
type = ChangeState
value = 55
triggerall = statetype != A
triggerall = command = "28" || command = "27" || command = "29"
trigger1 = stateno = [200,230] || stateno = 420 || stateno = 425 || stateno = 430
trigger1 = movehit
trigger2 = ctrl || stateno = 100

[State -1, JC]
type = ChangeState
value = 40
triggerall = command = "up" || movecontact && command = "holdup"
trigger1 = stateno = [200,230] || stateno = 420 || stateno = 425 || stateno = 430
trigger1 = movehit

[State -1,DJC]
type = ChangeState
value = 45
triggerall = command = "up" || movecontact && command = "holdup"
triggerall = stateno != 11 && stateno!=45 && stateno!=46 && stateno!= 4260 && (stateno!=[4000,4099]) && stateno !=[903,904]
triggerall = Map(DJCL) > 0
trigger1 = ctrl && stateno!=45 && stateno!=46 && !(stateno = 50 && time < 5) && stateno!=40 && stateno!= 4260 && !(stateno = 56 && time < 10)
trigger2 = movecontact && stateno != 218
trigger2 = hitdefattr = A, NA
trigger3 =  stateno = 45 || stateno=46|| stateno=50
trigger3 = vel y > -2

;
;---------------------------------------------------------------------------
;Airdash
[State -1, Forward Airdash]
type = ChangeState
value = 60
triggerall = command != "holdback"
triggerall = command = "a66" || teammode != Tag && command = "M66"
triggerall = Map(ADash) > 0
triggerall = pos y<-30
trigger1 = statetype = A 
trigger1 = ctrl

;---------------------------------------------------------------------------
;Backward Airdash
[State -1, Backward Airdash]
type = ChangeState
value = 61
triggerall = command = "a44" || teammode != Tag && command = "M44"
triggerall = pos y<-30
triggerall = Map(ADash) > 0
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------


;---------------------------------------------------------------------------
;[State -1, EX Gentle Dash]
;type = ChangeState
;value = 1120
;triggerall = power>1000
;triggerall = command = "b" && command = "c" || (command = "EX") && teammode != Tag
;triggerall = command = "holdfwd"
;triggerall = command != "holddown"
;trigger1 = statetype != A
;trigger1 = ctrl
;trigger2 = var(1)
;---------------------------------------------------------------------------
;[State -1, Gentle Dash]
;type = ChangeState
;value = 1100
;triggerall = command = "b"
;triggerall = command = "holdfwd"
;triggerall = command != "holddown"
;trigger1 = statetype != A
;trigger1 = ctrl
;trigger2 = var(1)
;trigger3 = stateno = 100

;---------------------------------------------------------------------------
;[State -1, EX Gentle Rocket]
;type = ChangeState
;value = 1310
;triggerall = power>1000
;triggerall = var(51)<=0
;triggerall = command = "b" && command = "c" || (command = "EX") && teammode != Tag
;triggerall = command = "holddown"
;triggerall = command != "holdback"
;trigger1 = statetype != A
;trigger1 = ctrl
;trigger2 = var(1)
;trigger4 = stateno = 100
;---------------------------------------------------------------------------
;[State -1, Gentle Rocket]
;type = ChangeState
;value = 1300
;triggerall = command = "b"
;triggerall = command = "holddown"
;triggerall = command != "holdback"
;trigger1 = statetype != A
;trigger1 = ctrl
;trigger2 = var(1)
;trigger3 = stateno = 100

[State -1, jS Kick]
type = ChangeState
value = 545
triggerall = roundstate = 2 ;only attack during the round
triggerall = command != "holdfwd"
;triggerall = command = "holddown"
triggerall = command = "b"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 1350 || stateno = 60
trigger2 = stateno = 545
trigger2 = var(1)
trigger3 = movecontact 
trigger4 = movehit && stateno = [600, 630]

;---------------------------------------------------------------------------
[State -1, 4S EX Zetapalm]
type = ChangeState
value = 1041
triggerall = power>1000
triggerall = !numexplod(99755) ;this is the EX 4S limiter
triggerall = command = "b" && command = "c" || (command = "EX") && teammode != Tag
triggerall = command = "holdback"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
;---------------------------------------------------------------------------
[State -1, 4S Zetapalm]
type = ChangeState
value = 1040
triggerall = command = "b"
triggerall = command = "holdback"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)

;---------------------------------------------------------------------------
;[State -1, EX Gentle Thrust]
;type = ChangeState
;value = 1510
;triggerall = power>1000
;triggerall = var(50)<=0
;triggerall = command = "b" && command = "c" || (command = "EX") && teammode != Tag
;trigger1 = statetype != A
;trigger1 = ctrl
;trigger2 = var(1)
;trigger4 = stateno = 100
;---------------------------------------------------------------------------
;[State -1, Gentle Thrust]
;type = ChangeState
;value = 1500
;triggerall = command = "b"
;trigger1 = statetype != A
;trigger1 = ctrl
;trigger2 = var(1)
;trigger3 = stateno = 100

[State -1, 5R: Sword Activation]
type = ChangeState
value = 1045
triggerall = var(41) != 1
triggerall = !numexplod(99750) ;this is the 5R limiter
triggerall = command = "c"
triggerall = command != "holddown"
triggerall = command != "holdback"
triggerall = command != "holdfwd"
triggerall = command != "fwd"
triggerall = command != "b"
trigger1 = statetype != A
trigger1 = var(1)


[State -1, 4R: Bat Activation]
type = ChangeState
value = 1050
triggerall = var(42) != 1
triggerall = !numexplod(99751) ;this is the 4R limiter
triggerall = command = "c"
triggerall = command!="holddown" 
triggerall = command!="holdfwd" 
triggerall = command!="holddown" 
triggerall = command="holdback" && command = "c" 
triggerall = command != "b"
trigger1 = statetype != A
trigger1 = var(1)

[State -1, 6R: Sword Activation]
type = ChangeState
value = 1055
triggerall = var(43) != 1
triggerall = !numexplod(99752) ;this is the 6R limiter
triggerall = command = "holdfwd"
triggerall = command = "c"
triggerall = command != "holddown"
triggerall = command != "holdback"
triggerall=command!="b"
trigger1 = statetype != A
trigger1 = var(1)


;---------------------------------------------------------------------------
;Dash Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
triggerall = command != "holdback" && command != "down"
triggerall = command = "66" || teammode != Tag && command = "M66"
triggerall = statetype != A
triggerall = stateno != 100
trigger1 = ctrl
trigger2 = Map(DCFH) > 0 || Map(DCFB) > 0

;---------------------------------------------------------------------------
;Dash Back
[State -1, Run Back]
type = ChangeState
value = 105
triggerall = command = "44" || teammode != Tag && command = "M44"
triggerall = stateno!=105
triggerall = statetype != A
trigger1 = ctrl 

;Super Jump
;[State -1, Super Jump]
;type = ChangeState
;value = 55
;triggerall = statetype != A
;triggerall = command = "28" || command = "27" || command = "29"
;trigger1 = ctrl
;trigger2 = Map(JCH) > 0 || Map(JCB) > 0
;===========================================================================

;---------------------------------------------------------------------------
;Taunt
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = command = "start"
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
;5L
[State -1, 5L]
type = ChangeState
value = 200
triggerall = command = "x"
triggerall = command != "holddown" && var(59) !=4
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = command = "hold_x" || command = "x"
trigger2 = movecontact
trigger2 = (stateno = 400) 
trigger2 = movecontact
trigger3 = (stateno = 1203) && time > 5
trigger4 = stateno = 100 && time > 11

[State -1, 4M]
type = ChangeState
value = 216
triggerall = command = "y"
triggerall = command = "holdback"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact
trigger3 = (stateno = 211) && movecontact
trigger3 = (stateno = 211) && movecontact
trigger5 = stateno = 400 && movecontact


;---------------------------------------------------------------------------
;5M
[State -1, 5M]
type = ChangeState
value = 211
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact || stateno = 400 && movecontact ;---- 5L  & 2L cancels
trigger3 = (stateno = 210) && movecontact
trigger4 = (stateno = 1203) && time > 5
trigger5 = stateno = [100, 110] && time > 11
;---------------------------------------------------------------------------

;6H
[State -1, 6H]
type = ChangeState
value =  218
triggerall=stateno!=40
trigger1 = statetype !=A
triggerall = command = "z"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact 
trigger3 = (stateno = 211) && movecontact 
trigger4 = (stateno = 400) && movecontact 
trigger5 = (stateno = 420) && movecontact 
trigger6 = stateno = 100 && time > 8
trigger7 = stateno = [1000,1001] && movecontact 


[State -1, 5H~5R Hands]
type = ChangeState
value = 220
triggerall = var(41)
triggerall = var(43) != 1
triggerall = var(42) != 1
triggerall = command = "z"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = [200,211]) && movecontact
trigger3 = (stateno = 1203) && time > 5
trigger4 = stateno = 100 && time > 11 || stateno = 110 && time > 11  ;|| stateno = 40
trigger5 =(stateno = [400,429])  && movecontact && time > 5

[State -1, 5H~4R Bat]
type = ChangeState
value = 225
triggerall = var(42)
triggerall = var(43) != 1
triggerall = var(41) != 1
triggerall = command = "z"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = [200,211]) && movecontact
trigger3 = (stateno = 1203) && time > 5
trigger4 = stateno = 100 && time > 11 || stateno = 110 && time > 11  ;|| stateno = 40
trigger5 =(stateno = [400,429])  && movecontact && time > 5

[State -1, 5H~6R Sword]
type = ChangeState
value = 230
triggerall = var(43)
triggerall = var(41) != 1
triggerall = var(42) != 1
triggerall = command = "z"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = [200,211]) && movecontact
trigger3 = (stateno = 1203) && time > 5
trigger4 = stateno = 100 && time > 11 || stateno = 110 && time > 11  ;|| stateno = 40
trigger5 =(stateno = [400,429])  && movecontact && time > 5
;---------------------------------------------------------------------------




;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;Taunt
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = command = "start"
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
;2L
[State -1, Crouching Light]
type = ChangeState
value = 400
triggerall = command = "x"
triggerall = command = "holddown"
triggerall = stateno !=40
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 211 && movecontact
trigger3 = stateno = 400 && movecontact
trigger4 = (stateno = 1203) && time > 5
trigger5 = stateno = [100, 111] && time > 11

;---------------------------------------------------------------------------
;2M
[State -1, Crouching Medium]
type = ChangeState
value = 410
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 400 || stateno = [200, 211]
trigger2 = movecontact
trigger3 = stateno = 1203 && time > 5
trigger4 = stateno = 100 && time > 11 || stateno = 110 && time > 11

;---------------------------------------------------------------------------

;---------------------------------------------------------------------------
;2H~5R Hands
[State -1, 2H~5R Hands]
type = ChangeState
value = 420
triggerall = var(41)
triggerall = command = "z"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 200)|| (stateno = 210)||(stateno = 211)|| (stateno = 410)
trigger2 = (movecontact)
trigger3 = (stateno = 1203) && time > 5
trigger4 = stateno = 100 && time > 11  || stateno = 110 && time > 11

[State -1, 2H~4R Bat]
type = ChangeState
value = 425
triggerall = var(42)
triggerall = command = "z"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 200)|| (stateno = 210)||(stateno = 211)|| (stateno = 410)
trigger2 = (movecontact)
trigger3 = (stateno = 1203) && time > 5
trigger4 = stateno = 100 && time > 11  || stateno = 110 && time > 11

[State -1, 2H~6R Sword]
type = ChangeState
value = 430
triggerall = var(43)
triggerall = command = "z"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 200)|| (stateno = 210)||(stateno = 211)|| (stateno = 410)
trigger2 = (movecontact)
trigger3 = (stateno = 1203) && time > 5
trigger4 = stateno = 100 && time > 11  || stateno = 110 && time > 11


;---------------------------------------------------------------------------
;jL
[State -1, j.L]
type = ChangeState
value = 600
triggerall = command = "x"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = movecontact && stateno = 600 || movehit && stateno = [610, 630]
trigger3 = stateno = 1350

;---------------------------------------------------------------------------
;jM
[State -1, j.M]
type = ChangeState
value = 610
triggerall = command = "y"
triggerall = statetype = A && stateno != 610
trigger1 = ctrl
trigger2 = stateno = [600,601]
trigger2 = movecontact
trigger3 = movehit && stateno = [600, 630]

;---------------------------------------------------------------------------
;jH
[State -1, j.H]
type = ChangeState
value = 620
triggerall = var(41)
triggerall = command = "z"
triggerall = statetype = A && stateno != 620
trigger1 = ctrl
trigger2 = stateno = 1350 || stateno = 60
trigger3 = stateno = [600,610]
trigger3 = movecontact
trigger4 = movehit && stateno = [600, 630]

;jH - 4R Bat
[State -1, j.H 4R Bat]
type = ChangeState
value = 625
triggerall = var(42)
triggerall = command = "z"
triggerall = statetype = A && stateno != 620
trigger1 = ctrl
trigger2 = stateno = 1350 || stateno = 60
trigger3 = stateno = [600,610]
trigger3 = movecontact
trigger4 = movehit && stateno = [600, 630]

;jH - 6R Sword
[State -1, j.H 6R Sword]
type = ChangeState
value = 630
triggerall = var(43)
triggerall = command = "z"
triggerall = statetype = A && stateno != 620
trigger1 = ctrl
trigger2 = stateno = 1350 || stateno = 60
trigger3 = stateno = [600,610]
trigger3 = movecontact

;---------------------------------------------------------------------------
[State 100, Forward Dash Cancel]
type = ChangeState
value = 100
triggerall = command != "holdback"
triggerall = command = "66" || teammode != Tag && command = "M66"
triggerall = movehit
triggerall = statetype != A
triggerall = !numexplod(10100) 
trigger1 = stateno = [1001,1002] || stateno = [1101,1102] || stateno = 1500 || stateno = 1300 || stateno % 100 = 20 

[State 100, Back Dash Cancel]
type = ChangeState
value = 105
triggerall = command = "44" || teammode != Tag && command = "M44"
triggerall = movehit
triggerall = statetype != A
triggerall = !numexplod(10100) 
trigger1 = stateno = [1001,1002] || stateno = [1101,1102] || stateno = 1500 || stateno = 1300 || stateno % 100 = 20
