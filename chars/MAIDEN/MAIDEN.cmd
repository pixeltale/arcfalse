
;-| Default Values |-------------------------------------------------------
[Defaults]
command.time = 15
command.buffer.time = 3

;MOVE.
[Command]
name = "dash";Required (do not remove)
command = w
time = 1
buffer.time=5
[Command]
name = "holddash";Required (do not remove)
command = /w
time = 1

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
[State -1, Gentleman's Beatdown]
type = ChangeState
value = 3000
triggerall = command = "236X"
triggerall = power >= 2000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA, HA ;&& enemynear, movetype = H
trigger2 = movecontact
trigger3 = (stateno = [200,499]) && movecontact = 1 ;&& enemynear, movetype = H
trigger4 = stateno = 1303 
triggerall = stateno != [3000, 3001]

;---------------------------------------------------------------------------
;Gentleman Rising
[State -1, Gentleman Rising]
type = ChangeState
value = 3010
triggerall = command = "214X"
triggerall = power >= 2000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA, HA ;&& enemynear, movetype = H
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = 1303 
triggerall = stateno != 3010
;===========================================================================
;Super Jump
[State -1, Super Jump]
type = ChangeState
value = 55
triggerall = statetype != A
triggerall = command = "28" || command = "27" || command = "29"
trigger1 = stateno = [200,220] || stateno = 420
trigger1 = movehit
trigger2 = ctrl || stateno = 100

[State -1, JC]
type = ChangeState
value = 40
triggerall = command = "up" || movecontact && command = "holdup"
trigger1 = stateno = [200,230] || stateno = 420
trigger1 = movehit

[State -1,DJC]
type = ChangeState
value = 45
triggerall = command = "up" || movecontact && command = "holdup"
triggerall = stateno != [250,350]
triggerall = stateno != 11 && stateno!=45 && stateno!=46 && stateno!= 4260 && (stateno!=[4000,4099]) && stateno !=[903,904]
triggerall = Map(DJCL) > 0
trigger1 = ctrl && stateno!=45 && stateno!=46 && !(stateno = 50 && time < 5) && stateno!=40 && stateno!= 4260 && !(stateno = 56 && time < 10)
trigger2 = movecontact && stateno != 230
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
triggerall = stateno != 253
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
[State -1, EX Gentle Dash]
type = ChangeState
value = 1120
triggerall = power>1000
triggerall = command = "b" && command = "c" || (command = "EX") && teammode != Tag
triggerall = command = "holdfwd"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
;---------------------------------------------------------------------------
[State -1, Gentle Dash]
type = ChangeState
value = 1100
triggerall = command = "b"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
;trigger3 = stateno = 100

;---------------------------------------------------------------------------
[State -1, EX Gentle Rocket]
type = ChangeState
value = 1310
triggerall = power>1000
triggerall = var(51)<=0
triggerall = command = "b" && command = "c" || (command = "EX") && teammode != Tag
triggerall = command = "holddown"
triggerall = command != "holdback"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
;trigger4 = stateno = 100
;---------------------------------------------------------------------------
[State -1, Gentle Rocket]
type = ChangeState
value = 1300
triggerall = command = "b"
triggerall = command = "holddown"
triggerall = command != "holdback"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
;trigger3 = stateno = 100
;---------------------------------------------------------------------------
[State -1, EX Gentle Step]
type = ChangeState
value = 1200
triggerall = power>1000
triggerall = command = "b" && command = "c" || (command = "EX") && teammode != Tag
triggerall = command = "holdback"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
;---------------------------------------------------------------------------
[State -1, Gentle Step]
type = ChangeState
value = 1000
triggerall = command = "b"
triggerall = command = "holdback"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
;trigger3 = stateno = 100

;---------------------------------------------------------------------------
[State -1, EX Gentle Thrust]
type = ChangeState
value = 1510
triggerall = power>1000
triggerall = var(50)<=0
triggerall = command = "b" && command = "c" || (command = "EX") && teammode != Tag
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
;trigger4 = stateno = 100
;---------------------------------------------------------------------------
[State -1, Gentle Thrust]
type = ChangeState
value = 1500
triggerall = command = "b"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
;trigger3 = stateno = 100

[State -1, UP HUNT]
type = ChangeState
value = 251
triggerall = command = "c"
triggerall = command = "holdfwd"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno=[200,230])
trigger2 = movecontact =1 ;&& enemynear, movetype = H
trigger3 = (stateno = 1203) 
trigger3 = stateno = 100 
trigger4 = (stateno = [400,499]) 
trigger4 = movecontact =1 ;&& enemynear, movetype = H

[State -1, HUNT]
type = ChangeState
value = 250
triggerall = command = "c"
triggerall = command != "holdfwd"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno=[200,230])
trigger2 = movecontact =1 ;&& enemynear, movetype = H
trigger3 = (stateno = 1203) 
trigger3 = stateno = 100 
trigger4 = (stateno = [400,499]) 
trigger4 = movecontact =1 ;&& enemynear, movetype = H

[State -1, air HUNT]
type = ChangeState
value = 254
triggerall = command = "c"
triggerall = map(jRUse)
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = (stateno=[600,631])
trigger2 = movecontact =1 ;&& enemynear, movetype = H
trigger6 = (stateno = 1203) 
trigger7 = stateno = 100

;---------------------------------------------------------------------------
;Run Fwd
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
;Run Back
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
trigger3 = (stateno = 1203) && time > 5
trigger4 = stateno = 100 && time > 11

;---------------------------------------------------------------------------
;5M
[State -1, 5M]
type = ChangeState
value = 210
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact
trigger3 = (stateno = 400) && movecontact
trigger4 = (stateno = 1203) && time > 5
trigger5 = stateno = [100, 110] && time > 11

[State -1, 6H]
type = ChangeState
value = 230
triggerall = command = "z"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = [200,220]) && movecontact
trigger3 = (stateno = 1203) && time > 5
trigger4 = stateno = 100 && time > 11 || stateno = 110 && time > 11  ;|| stateno = 40
trigger5 =(stateno = [400,419])  && movecontact && time > 5

[State -1, 5H]
type = ChangeState
value = 220
triggerall = command = "z"
triggerall = command != "holddown"
;triggerall = stateno !=40
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = [200,211]) && movecontact
trigger3 = (stateno = 1203) && time > 5
trigger4 = stateno = 100 && time > 11 || stateno = 110 && time > 11  ;|| stateno = 40
trigger5 =(stateno = [400,419])  && movecontact && time > 5

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
[State -1, 2L]
type = ChangeState
value = 400
triggerall = command = "x"
triggerall = command = "holddown"
triggerall = stateno !=40
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 200
trigger2 = movecontact
trigger3 = (stateno = 1203) && time > 5
trigger4 = stateno = [100, 111] && time > 11

;---------------------------------------------------------------------------
;2M
[State -1, 2M]
type = ChangeState
value = 410
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 400 || stateno = 200
trigger2 = movecontact
trigger3 = stateno = 1203 && time > 5
trigger4 = stateno = 100 && time > 11 || stateno = 110 && time > 11

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
trigger2 = stateno = [400, 410] || stateno = [200, 211]
trigger2 = movecontact
trigger3 = stateno = 1203 && time > 5

;---------------------------------------------------------------------------
;2H
[State -1, 2H]
type = ChangeState
value = 420
triggerall = command = "z"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 200)|| (stateno = 210)||(stateno = 211)|| (stateno = 410)
trigger2 = (movecontact)
trigger3 = (stateno = 1203) && time > 5
trigger4 = stateno = 100 && time > 11  || stateno = 110 && time > 11

;---------------------------------------------------------------------------
;(HUNT)STOP
[State -1, (HUNT)STOP]
type = ChangeState
value = 255
triggerall = command = "back"
triggerall = statetype != L
trigger1 = stateno = 253
trigger2 = movecontact && stateno = [310,320]
trigger3 = stateno = 1350

;---------------------------------------------------------------------------
;(HUNT)R
[State -1, (HUNT)R]
type = ChangeState
value = 300
triggerall = command = "c"
triggerall = statetype = A
trigger1 = stateno = 253
trigger2 = movecontact && stateno = [310,320]
trigger3 = stateno = 1350

;---------------------------------------------------------------------------
;(HUNT)L
[State -1, (HUNT)L]
type = ChangeState
value = 310
triggerall = command = "x"
triggerall = command = "buffer_x"
triggerall = statetype = A
trigger1 = stateno = 253
trigger2 = movecontact && stateno = 320
trigger3 = stateno = 1350

;---------------------------------------------------------------------------
;(HUNT)M
[State -1, (HUNT)M]
type = ChangeState
value = 320
triggerall = command = "y"
triggerall = statetype = A
triggerall = command = "buffer_y"
trigger1 = stateno = 253
trigger2 = movecontact && stateno = 320
trigger3 = stateno = 1350

;---------------------------------------------------------------------------
;(HUNT)H
[State -1, (HUNT)H]
type = ChangeState
value = 330
triggerall = command = "z"
triggerall = command = "buffer_z"
triggerall = statetype = A
trigger1 = stateno = 253
trigger2 = movecontact && stateno = [310,320]
trigger3 = stateno = 1350

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
trigger3 = movehit && stateno = [600, 619]

;---------------------------------------------------------------------------
;j2H
[State -1, j.2H]
type = ChangeState
value = 630
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = statetype = A && stateno != 630
trigger1 = ctrl
trigger2 = stateno = 1350 || stateno = 60
trigger3 = stateno = [600,610]
trigger3 = movecontact

;---------------------------------------------------------------------------
;jH
[State -1, j.H]
type = ChangeState
value = 620
triggerall = command = "z"
triggerall = command != "holddown"
triggerall = statetype = A && stateno != 620
trigger1 = ctrl
trigger2 = stateno = 1350 || stateno = 60
trigger3 = stateno = [600,610]
trigger3 = movecontact
trigger4 = movecontact && stateno = 630
