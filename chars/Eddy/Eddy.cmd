
;-| Default Values |-------------------------------------------------------
[Defaults]
command.time = 15
command.buffer.time = 3

[Command]
name = "unbuffer_5S"
command = b
time = 1
buffer.time = 0
[Command]
name = "unbuffer_ATK"
command = x
time = 1
buffer.time = 0
[Command]
name = "unbuffer_ATK"
command = y
time = 1
buffer.time = 0
[Command]
name = "unbuffer_ATK"
command = z
time = 1
buffer.time = 0
[Command]
name = "focusATK_CHARGE"
command = /c
time = 1
buffer.time = 0

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
trigger2 = movecontact
trigger2 = stateno!=421
trigger3 = stateno = 1200 && time > 3 || stateno = 1203
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
trigger1 = stateno = [200,220] || stateno = 420
trigger1 = movehit

[State -1,DJC]
type = ChangeState
value = 45
triggerall = command = "up" || movecontact && command = "holdup"
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
triggerall = command = "a66" || command = "M66"
triggerall = Map(ADash) > 0
triggerall = pos y<-30
trigger1 = statetype = A 
trigger1 = ctrl

;Airdash Cancel
[State -1, Forward Airdash]
type = ChangeState
value = 60
triggerall = command != "holdback"
triggerall = command = "a66" || command = "M66"
triggerall = pos y<-30
trigger1 	= (stateno = 1105 && !map(DCBurnJ6S)) && Map(ADash) > 0 || stateno = 1106
trigger1	= movecontact

;---------------------------------------------------------------------------
;Backward Airdash
[State -1, Backward Airdash]
type = ChangeState
value = 61
triggerall = command = "a44" || command = "M44"
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
triggerall = command = "b" && command = "c" || (command = "EX") 
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

[State -1, j6EX - Gentle Whisper]
type = ChangeState
value = 1106
triggerall = power>=1000 && !map(LIMITER.J6EX)
triggerall = command = "b" && command = "c" || (command = "EX") 
triggerall = command = "holdfwd"
triggerall = command != "holddown"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = hitdefattr = A, NA & movecontact

[State -1, j6S - Gentle Whisper]
type = ChangeState
value = 1105
triggerall = command = "b"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = hitdefattr = A, NA & movecontact

;---------------------------------------------------------------------------
[State -1, EX Gentle Rocket]
type = ChangeState
value = 1310
triggerall = power>=1000
triggerall = var(51)<=0
triggerall = command = "b" && command = "c" || (command = "EX") 
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
triggerall = command = "b" && command = "c" || (command = "EX") 
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
triggerall = command = "b" && command = "c" || (command = "EX") 
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

[State -1, 2R: Comb Toss]
type = ChangeState
value = 1050
triggerall = !numhelper(1052)=1
triggerall = command = "c"
triggerall = command = "holddown"
triggerall = command != "holdback"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)

[State -1, Stand Strong Punch]
type = ChangeState
value = 230
triggerall = command = "c"
triggerall = statetype != A
triggerall = stateno != 230
trigger1 = ctrl
trigger2 = var(1)

;---------------------------------------------------------------------------
;Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
triggerall = command != "holdback" && command != "down"
triggerall = command = "66" || command = "M66"
triggerall = statetype != A
triggerall = stateno != 100
trigger1 = ctrl
trigger2 = Map(DCFH) > 0 || Map(DCFB) > 0
trigger3 = stateno = 230 && (time > 15 && !(anim = 231 && animelemno(0) > 5) || stateno = 230 && movecontact && map(Charged))

;---------------------------------------------------------------------------
;Run Back
[State -1, Run Back]
type = ChangeState
value = 105
triggerall = command = "44" || command = "M44"
triggerall = stateno!=105
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 230 && (time > 15 && !(anim = 231 && animelemno(0) > 5) || stateno = 230 && movecontact && map(Charged))

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
trigger2 = (stateno = 400) || (stateno = 200) && time>1
trigger2 = movecontact
trigger3 = (stateno = 1203) && time > 5
trigger4 = stateno = 100 && time > 11
 
;---------------------------------------------------------------------------
;4M
[State -1, 4M]
type = ChangeState
value = 210
triggerall = command = "y"
triggerall = command = "holdback"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact
trigger3 = (stateno = 205) && movecontact
trigger4 = (stateno = 1203) && time > 5
trigger5 = stateno = 100 && time > 11 || stateno = 110 && time > 11
trigger6 = stateno = 400 && movecontact


;---------------------------------------------------------------------------
;5M
[State -1, 5M]
type = ChangeState
value = 211
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = [200, 210]) && movecontact

[State -1, 5H]
type = ChangeState
value = 220
triggerall = command = "z"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = [200,211]) && movecontact
trigger3 = (stateno = 1203) && time > 5
trigger4 =(stateno = [400,429])  && movecontact && time > 5

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
[State -1, ]
type = ChangeState
value = 400
triggerall = command = "x"
triggerall = command = "holddown"
triggerall = stateno !=40
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact
trigger3 = stateno = 400 && movecontact
trigger4 = (stateno = 1203) && time > 5

;---------------------------------------------------------------------------
;2M
[State -1, 2M]
type = ChangeState
value = 410
triggerall = command = "y"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 400 || stateno = [200, 211]
trigger2 = movecontact
trigger3 = stateno = 1203 && time > 5

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
trigger2 = stateno = [400, 420] || stateno = [200, 211]
trigger2 = movecontact
trigger3 = stateno = 1203 && time > 5

;---------------------------------------------------------------------------
;2H
[State -1, 2H]
type = ChangeState
value = 420
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = statetype != A
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
;j2H
[State -1, j.2H]
type = ChangeState
value = 630
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = statetype = A && stateno != 630
trigger1 = ctrl
trigger2 = stateno = 1350 || stateno = 60
trigger3 = stateno = [600,620]
trigger3 = movecontact
trigger4 = movehit && stateno = [600, 630]

;---------------------------------------------------------------------------
;jH
[State -1, j.H]
type = ChangeState
value = 620
triggerall = command = "z"
triggerall = statetype = A && stateno != 620
trigger1 = ctrl
trigger2 = stateno = 1350 || stateno = 60
trigger3 = stateno = [600,610]
trigger3 = movecontact
trigger4 = movehit && stateno = [600, 630]

