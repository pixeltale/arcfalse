
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
name = "RIGHT"
command = /R
time = 1
buffer.time = 0
[Command]
name = "LEFT"
command = /L
time = 1
buffer.time = 0
[Command]
name = "DOWNRIGHT"
command = /DR
time = 1
buffer.time = 0
[Command]
name = "DOWNLEFT"
command = /DL
time = 1
buffer.time = 0

[Command]
name = "5S"
command = N, b
time = 1
buffer.time = 0
[Command]
name = "6S"
command = /F, b
time = 1
[Command]
name = "4S"
command = /B, b
time = 1
[Command]
name = "2S"
command = /D | /DB, b
time = 1

[Statedef -1]

;===========================================================================
;This is not a move, but it sets up var(1) to be 1 if conditions are right
;for a combo into a special move (used below).
;Since a lot of special moves rely on the same conditions, this reduces
;redundant logic.
[State -1, Combo condition Reset]
type = null
triggerall = 1
trigger1 = var(1) := 0
trigger2 = var(2) := 0

[State -1, Combo condition Check]
type = VarSet
trigger1 = ctrl
trigger2 = stateno = [200,620] && MoveContact
var(1) = 1

[State -1, Combo condition Check]
type = VarSet
trigger1 = stateno = [1000,1020] && MoveContact
var(2) = 1

;Witch Piercer
[State -1, Gentleman's Beatdown]
type = ChangeState
value = 3000
triggerall = command = "236X"
triggerall = power >= 2000
trigger1 = ctrl || var(1)  || var(2)

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
triggerall = command = "up" && map(doubleJump_BUFFFIX) < 2 || movecontact && command = "holdup"
triggerall = Map(DoubleJump) < 2 && stateno != 40
trigger1 = ctrl  || hitdefattr = A, NA && movecontact
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
;Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
triggerall = command != "holdback" && command != "down"
triggerall = command = "66" || command = "M66"
triggerall = statetype != A
triggerall = stateno != 100
trigger1 = ctrl

;---------------------------------------------------------------------------
;Run Back
[State -1, Run Back]
type = ChangeState
value = 105
triggerall = command = "44" || command = "M44"
triggerall = stateno!=105
triggerall = statetype != A
trigger1 = ctrl


;===========================================================================
;SPECIALS
;===========================================================================


;4S - Blud Explosion
[State -1, 4S]
type = ChangeState
value = 1030
triggerall = statetype != A
triggerall = command = "4S"
trigger1 = ctrl || var(1)

;2S - Blud Explosion
[State -1, 3S]
type = ChangeState
value = 1020
triggerall = command = "2S"
triggerall = command = "holddown"
trigger1 = ctrl || var(1)

;6S - Witch Lancer & Followups ===========================================================================
;3S - Up
[State -1, 3S]
type = ChangeState
value = 1011
triggerall = map(Lancer) < 3
triggerall = command = "b"
triggerall = command = "holdfwd" && (cond(statetype = S, command = "holddown", command = "holdup"))
trigger1 = ctrl || var(1) || movecontact > 2 && stateno = [1010, 1020)
;3S - Down
[State -1, 3S]
type = ChangeState
value = 1012
triggerall = map(Lancer) < 3
triggerall = statetype = A
triggerall = command = "b"
triggerall = command = "holdfwd" && command = "holddown"
trigger1 = ctrl || var(1) || movecontact > 2 && stateno = [1010, 1020)
;3S - Up Backward Followup
[State -1, 6S]
type = ChangeState
value = 1014
triggerall = map(Lancer) < 3
triggerall = stateno = [1010, 1020)
triggerall = command = "b"
triggerall = command = "holdback" && command = "holdup"
trigger1 = movecontact > 2
;3S - Down Backward
[State -1, 6S]
type = ChangeState
value = 1015
triggerall = map(Lancer) < 3
triggerall = stateno = [1010, 1020)
triggerall = command = "b"
triggerall = command = "holdback" && command = "holddown"
trigger1 = movecontact > 2
;6S - Backward
[State -1, 6S]
type = ChangeState
value = 1013
triggerall = map(Lancer) < 3
triggerall = stateno = [1010, 1020)
triggerall = command = "b"
triggerall = command = "holdback"
trigger1 = movecontact > 2
;6S
[State -1, 6S]
type = ChangeState
value = 1010
triggerall = map(Lancer) < 3
triggerall = command = "b"
triggerall = command = "holdfwd"
trigger1 = ctrl || var(1) || movecontact > 2 && stateno = [1010, 1020)
;===========================================================================
;5S - Rave On/Rave Off
[State -1, 5S]
type = ChangeState
value = 1000
triggerall = statetype != A && helper(999), stateno != 998
triggerall = command = "b"
trigger1 = ctrl || var(1)


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
;6M
[State -1, 6M]
type = ChangeState
value = 215
triggerall = command = "y"
triggerall = command = "holdfwd" && command != "holddown"
triggerall = statetype != A && stateno != 215
trigger1 = ctrl
trigger2 = (stateno= [200,220] || stateno = [400,420]) && movecontact

;5M
[State -1, 5M]
type = ChangeState
value = 210
triggerall = command = "y"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno= 200 || stateno = 400) && movecontact

[State -1, 6H]
type = ChangeState
value = 225
triggerall = command = "z" && command = "holdfwd"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,220] || stateno = [400,429]) && movecontact

[State -1, 5H]
type = ChangeState
value = 220
triggerall = command = "z"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,215] || stateno = [400,429]) && movecontact

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

;---------------------------------------------------------------------------
;2M
[State -1, 2M]
type = ChangeState
value = 410
triggerall = command = "y"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 400 || stateno = [200, 211]) && movecontact

;---------------------------------------------------------------------------
;2H
[State -1, 2H]
type = ChangeState
value = 420
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [400,410] || stateno = [200,215]) && movecontact

;---------------------------------------------------------------------------
;jL
[State -1, j.L]
type = ChangeState
value = 600
triggerall = command = "x"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = movecontact && stateno = 600 || movehit && stateno = [610, 630]

;---------------------------------------------------------------------------
;jM
[State -1, j.M]
type = ChangeState
value = 610
triggerall = command = "y"
triggerall = statetype = A && stateno != 610
trigger1 = ctrl
trigger2 = stateno = [600,601] && movecontact
trigger3 = movehit && stateno = [600, 630]

;jH
[State -1, j.H]
type = ChangeState
value = 620
triggerall = command = "z"
triggerall = statetype = A && stateno != 620
trigger1 = ctrl
trigger2 = stateno = [600,610] && movecontact

