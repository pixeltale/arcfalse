
;-| Default Values |-------------------------------------------------------
[Defaults]
command.time = 15
command.buffer.time = 3

[Command]
name = "4S"
command = /B, b
[Command]
name = "2S"
command = /$D, b
[Command]
name = "6S"
command = /F, b


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
trigger1 = ctrl || stateno = 105 && prevstateno = 220
trigger2 = stateno = [200,499]
trigger2 = movecontact
trigger2 = stateno!=421
trigger3 = stateno = 1330 ;From blocking
trigger4 = stateno = 1203
var(1) = 1

;Pretty Dancer
[State -1, 236X]
type = ChangeState
value = 3000
triggerall = command = "236X"
triggerall = power >= 2000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = movecontact
trigger3 = (stateno = [200,499]) && movecontact
trigger4 = stateno = [1040, 1045] || stateno = 1021
triggerall = stateno != [3000, 3001]

;Pretty Dancer
[State -1, 214X]
type = ChangeState
value = 3010
triggerall = command = "214X"
triggerall = power >= 2000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = movecontact
trigger3 = (stateno = [200,499])
trigger4 = stateno = [1040, 1045] || stateno = 1021
triggerall = stateno != [3000, 3001]

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
trigger3= stateno = 1030 && movecontact

[State -1, JC]
type = ChangeState
value = 40
triggerall = command = "up" || movecontact && command = "holdup"
trigger1 = stateno = [200,220] || stateno = 420
trigger1 = movehit
trigger2= stateno = 1030 && movehit && command != "holdb"

[State -1,DJC]
type = ChangeState
value = 45
triggerall = command = "up" || movecontact && command = "holdup"
triggerall = stateno != 11 && stateno!=45 && stateno!=46 && stateno!= 4260 && (stateno!=[4000,4099]) && stateno !=[903,904] && stateno != 52
triggerall = Map(DJCL) > 0
trigger1 = ctrl && stateno!=45 && stateno!=46 && !(stateno = 50 && time < 5) && stateno!=40 && stateno!= 4260 && !(stateno = 56 && time < 10)
trigger2 = movecontact && stateno != 230
trigger2 = hitdefattr = A, NA
trigger3 =  stateno = 45 || stateno=46|| stateno=50
trigger3 = vel y > -2

;
;---------------------------------------------------------------------------
;Airdash
;[State -1, Forward Airdash]
;type = ChangeState
;value = 60
;triggerall = command != "holdback"
;triggerall = command = "a66" || command = "M66"
;triggerall = Map(ADash) > 0
;triggerall = pos y<-30
;trigger1 = statetype = A 
;trigger1 = ctrl
;
;;---------------------------------------------------------------------------
;;Backward Airdash
;[State -1, Backward Airdash]
;type = ChangeState
;value = 61
;triggerall = command = "a44" || command = "M44"
;triggerall = pos y<-30
;triggerall = Map(ADash) > 0
;trigger1 = statetype = A
;trigger1 = ctrl

;---------------------------------------------------------------------------

;2S
[State -1, 2S] ;LIAR MASK
type = ChangeState
value = 1050
triggerall = statetype != A && !numhelper(1055)
triggerall = command = "2S"
trigger1 = ctrl
trigger2 = var(1) || stateno = [600, 620] && movecontact

;6S
[State -1, 6S] ;SKYREACH
type = ChangeState
value = 1010
triggerall = !map(j6S) && stateno != 1010
triggerall = command = "6S"
trigger1 = ctrl
trigger2 = var(1) || stateno = [600, 620] && movecontact

;4S
[State -1, 4S] ;LATTICE THEORY
type = ChangeState
value = 1020
triggerall = command = "4S"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)

;5S
[State -1, 5S] ;KAGUYA'S TEAR
type = ChangeState
value = 1000
triggerall = command = "b" && command != "holdback" && command != "holddown" && command != "holdfwd"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)

;j4S
[State -1, j.4S] ;AIR LATTICE THEORY
type = ChangeState
value = 1060
triggerall = command = "b" && command = "holdback"
triggerall = statetype = A && !map(j4S) && pos y <= -30
trigger1 = ctrl || stateno = [600, 620] && movecontact

;---------------------------------------------------------------------------
;Run Fwd
[State -1, Dash]
type = ChangeState
value = 100
triggerall = command != "holdback" && command != "down"
triggerall = command = "66" || command = "M66"
triggerall = statetype != A
triggerall = stateno != 100
trigger1 = ctrl

;---------------------------------------------------------------------------
;Run Back
[State -1, Backdash]
type = ChangeState
value = 105
triggerall = command = "44" || command = "M44"
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
;5L
[State -1, 5L]
type = ChangeState
value = 200
triggerall = command = "x"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 400 || stateno = 200) && movecontact


;---------------------------------------------------------------------------
;5M
[State -1, 5M]
type = ChangeState
value = 210
triggerall = command = "y"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [400,410] && prevstateno != 210 || stateno = 200) && movecontact

[State -1, 5H]
type = ChangeState
value = 220
triggerall = command = "z"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,211] || stateno = [400, 420]) && movecontact

;---------------------------------------------------------------------------
;2L
[State -1, 2L]
type = ChangeState
value = 400
triggerall = command = "x"
triggerall = command = "holddown"
triggerall = statetype != A
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
trigger2 = stateno = 400 || stateno = [200, 211]
trigger2 = movecontact

;---------------------------------------------------------------------------
;3H
[State -1, Sweep]
type = ChangeState
value = 430
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = command = "holdfwd"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [400, 420] || stateno = [200, 220]) && movecontact

;---------------------------------------------------------------------------
;2H
[State -1, 2H]
type = ChangeState
value = 420
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [400,410] || stateno = [200,210]) && movecontact

;---------------------------------------------------------------------------
;jL
[State -1, j.L]
type = ChangeState
value = 600
triggerall = command = "x"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = movehit && stateno = 610

;---------------------------------------------------------------------------
;jM
[State -1, j.M]
type = ChangeState
value = 610
triggerall = command = "y"
triggerall = statetype = A && stateno != 610
trigger1 = ctrl
trigger2 = stateno = [600,601] && movecontact
trigger3 = movehit && stateno = [600, 610]

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

;LATTICE CONSTRUCT STANCE CANCELS
[State 0, ChangeState]
type = ChangeState
triggerall = stateno = [1020,1035]
triggerall = map(STCancel) > 0
triggerall = movecontact
trigger1 = command = "holdup"
value = 1042
[State 0, ChangeState]
type = ChangeState
triggerall = stateno = [1020,1035]
triggerall = map(STCancel) > 0
triggerall = movecontact
trigger1 = command = "holdback"
value = 1040
[State 0, ChangeState]
type = ChangeState
triggerall = stateno = [1020,1035]
triggerall = map(STCancel) > 0
triggerall = movecontact
trigger1 = command = "holdfwd"
value = 1041


[State 0, ChangeState]
type = ChangeState
triggerall = stateno = [1020,1035]
triggerall = stateno != 1025 && map(STCancel) > 0
triggerall = movecontact
trigger1 = command = "x" || root, command = "x"
value = 1025
[State 0, ChangeState]
type = ChangeState
triggerall = stateno = [1020,1035]
triggerall = stateno != 1030 && map(STCancel) > 0
triggerall = movecontact
trigger1 = command = "y" || root, command = "y"
value = 1030
[State 0, ChangeState]
type = ChangeState
triggerall = stateno = [1020,1035]
triggerall = stateno != 1035 && map(STCancel) > 0
triggerall = movecontact
trigger1 = command = "z" || root, command = "z"
value = 1035



;Air Version
[State 0, ChangeState]
type = ChangeState
triggerall = stateno = [1060,1085]
triggerall = map(STCancel) > 0
triggerall = movecontact && stateno != 1065
trigger1 = command = "x"
value = 1065
[State 0, ChangeState]
type = ChangeState
triggerall = stateno = [1060,1085]
triggerall = map(STCancel) > 0
triggerall = movecontact && stateno != 1071
trigger1 = command = "y"
value = 1071
[State 0, ChangeState]
type = ChangeState
triggerall = stateno = [1060,1085]
triggerall = map(STCancel) > 0
triggerall = movecontact && stateno != 1075
trigger1 = command = "z"
value = 1075

[State 0, ChangeState]
type = ChangeState
triggerall = stateno = [1060,1085]
triggerall = movecontact && map(STCancel) > 0
trigger1 = command = "holdback"
value = 1080
[State 0, ChangeState]
type = ChangeState
triggerall = stateno = [1060,1085]
triggerall = movecontact && map(STCancel) > 0
trigger1 = command = "holdfwd"
value = 1081
[State 0, ChangeState]
type = ChangeState
triggerall = stateno = [1060,1085]
triggerall = movecontact && map(STCancel) > 0
trigger1 = command = "holddown"
value = 1082





[State 0, DestroySelf]
type = DestroySelf
triggerall = IsHelper
trigger1 = movetype = H
ignorehitpause = 1