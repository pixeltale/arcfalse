; The CMD file.
[DEFAULTS]
command.time = 20
command.buffer.time = 3

[Command]
name = "released_up"
command = ~U
[Command]
name = "6246L"
command = ~$F, $D, $B, $F, x
buffer.time = 7
[Command]
name = "6246M"
command = ~$F, $D, $B, $F, y
buffer.time = 7
[Command]
name = "6246H"
command = ~$F, $D, $B, $F, z
buffer.time = 7
[Command]
name = "214L"
command = ~$D, B, x
time = 10
buffer.time = 7
[Command]
name = "214M"
command = ~$D, B, y
time = 10
buffer.time = 7
[Command]
name = "214H"
command = ~$D, B, z
time = 10
buffer.time = 7
[Command]
name = "236L"
command = ~$D, F, x
time = 10
buffer.time = 7
[Command]
name = "236M"
command = ~$D, F, y
time = 10
buffer.time = 7
[Command]
name = "236H"
command = ~$D, F, z
time = 10
buffer.time = 7
[Command]
name = "236S"
command = ~D, DF, F, b
time = 10
buffer.time = 7
[Command]
name = "214S"
command = ~D, B, b
time = 10
buffer.time = 7
[Command]
name = "22L"
command = ~D, D, x
time = 10
buffer.time = 7
[Command]
name = "22M"
command = ~D, D, y
time = 10
buffer.time = 7
[Command]
name = "22H"
command = ~D, D, z
time = 10
buffer.time = 7

[Statedef -1]

;===========================================================================
[State -1, Var 1 Set];Var 1 Set
type 	= VarSet
trigger1 	= 1
var(1) 	= 0

[State -1, Combo condition Check]
type 	= VarSet
trigger1 	= ctrl || stateno = [60, 61]
trigger2 	= (stateno = [200,240] || stateno = [400,430] || stateno = [600, 630]) && movecontact || stateno = 1040 && animelemno(0) >= 4
var(1) 	= 1


;---------------------------------------------------------------------------
;Super Jump
[State -1, Super Jump]
type = ChangeState
value = 55
triggerall = statetype != A
triggerall = command = "28" || command = "27" || command = "29"
trigger1 = stateno = [200,220] || stateno = 420
trigger1 = movehit
trigger2 = ctrl || stateno = 100
trigger3 = stateno = 240 && movecontact

[State -1, JC]
type = ChangeState
value = 40
triggerall = command = "up" || movecontact && command = "holdup"
trigger1 = stateno = [200,240] || stateno = 420
trigger1 = movecontact
[State -1,DJC]
type = ChangeState
value = 45
triggerall = command = "up" && map(doubleJump_BUFFFIX) < 2 || movecontact && command = "holdup"
triggerall = stateno!= [45,46]
triggerall = Map(DJCL) > 0
triggerall	= statetype = A
trigger1 = ctrl
trigger2 = movecontact
trigger2 = hitdefattr = A, NA


;Malice Call
[State -1, Malice Call...] ;Outside PW
type = ChangeState
value = 3000
triggerall = command = "236S"
triggerall = power >= 2000 && !map(Perfektwelt)
triggerall = statetype != A || map(Float)
trigger1 = ctrl
trigger2 = var(1) || stateno = [2010, 2060] || stateno = 1005
[State -1, Malice Call...] ;Outside PW
type = ChangeState
value = 3000
triggerall = command = "236S"
triggerall = map(Perfektwelt)
triggerall = statetype != A || map(Float)
trigger1 = ctrl
trigger2 = var(1) || stateno = [2010, 2060] || stateno = 1005

;Perfektwelt
[State -1, GLORY TO MY VISION!!!]
type = ChangeState
value = 3020
triggerall = !map(Perfektwelt)
triggerall = command = "214S"
triggerall = power >= 4000
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1) || stateno = [2010, 2060] || stateno = 1005

;---------------------------------------------------------------------------
;Airdash
[State -1, Forward Airdash]
type = ChangeState
value = 60
triggerall = command != "holdback"
triggerall = command = "a66" || command = "M66"
triggerall = map(ADashUse) < const(AirDashMax)
triggerall = pos y<-35
triggerall = statetype = A 
trigger1 	= ctrl

;---------------------------------------------------------------------------
;Backward Airdash
[State -1, Backward Airdash]
type = ChangeState
value = 61
triggerall = command = "a44" || command = "M44"
triggerall = pos y<-35
triggerall = map(ADashUse) < const(AirDashMax)
triggerall = statetype = A
trigger1 	= ctrl

;--------------------------------------------------------------------------
;Hoverdash
[State -1, Run Fwd]
type = ChangeState
value = 100
triggerall = command != "holdback"
triggerall = command = "66" || command = "M66"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 250
trigger3 = stateno = 52
trigger4 = stateno = 690000
triggerall = stateno!=100

;Backdash
[State -1, Backdash]
type = ChangeState
value = 105
triggerall = command = "44" || command = "M44"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 250
triggerall = stateno!=105

;===========================================================================
;Special Moves
;===========================================================================
;j.R
[State -1, FEIGN DIVINITY]
type = ChangeState
value = 110
triggerall = command = "c"
triggerall = statetype = A && pos y <= -20
triggerall = !map(Float) && map(CanFloat)
trigger1 = ctrl || stateno = [600,620] && movecontact

;632146M
[State -1, Desire Distortion M]
type = ChangeState
value = 1000
triggerall = command = "6246M"
trigger1 = var(1)

;632146H
[State -1, Desire Distortion H]
type = ChangeState
value = 1005
triggerall = command = "6246H"
trigger1 = var(1)

;214L
[State -1, Grim Visage L]
type = ChangeState
value = 1010
triggerall = command = "214L" && !numhelper(1015)
trigger1 = var(1)
;22L
[State -1, Redwall L]
type = ChangeState
value = 1020
triggerall = command = "22L"
triggerall = numhelper(1015) && map(EyeAction_L)
trigger1 = var(1)
;214L [EYE]
[State -1, Schadenfreude Step L]
type = ChangeState
value = 1030
triggerall = command = "214L" && numhelper(1015) && map(EyeAction_L)
trigger1 = var(1)
;236L [EYE]
[State -1, The Demons The Demons The Demons L]
type = ChangeState
value = 1040
triggerall = command = "236L" && numhelper(1015) && map(EyeAction_L)
trigger1 = var(1)

;214M
[State -1, Grim Visage M]
type = ChangeState
value = 1008
triggerall = command = "214M" && !numhelper(1016)
trigger1 = var(1)
;22M
[State -1, Redwall M]
type = ChangeState
value = 1020
triggerall = command = "22M" && numhelper(1016) && map(EyeAction_M)
trigger1 = var(1)
;214M [EYE]
[State -1, Schadenfreude Step M]
type = ChangeState
value = 1028
triggerall = command = "214M" && numhelper(1016) && map(EyeAction_M)
trigger1 = var(1)
;236M [EYE]
[State -1, The Demons The Demons The Demons L]
type = ChangeState
value = 1038
triggerall = command = "236M" && numhelper(1016) && map(EyeAction_M)
trigger1 = var(1)

;214H
[State -1, Grim Visage H]
type = ChangeState
value = 1009
triggerall = command = "214H" && !numhelper(1017)
trigger1 = var(1)
;22H
[State -1, Redwall H]
type = ChangeState
value = 1020
triggerall = command = "22H" && numhelper(1017) && map(EyeAction_H)
trigger1 = var(1)
;214H [EYE]
[State -1, Schadenfreude Step H]
type = ChangeState
value = 1029
triggerall = command = "214H" && numhelper(1017) && map(EyeAction_H)
trigger1 = var(1)
;236L [EYE]
[State -1, The Demons The Demons The Demons L]
type = ChangeState
value = 1039
triggerall = command = "236H" && numhelper(1017) && map(EyeAction_H)
trigger1 = var(1)
;===========================================================================
;Normal Moves								   | |
;===========================================================================
;5L: Standing Light
[State -1, 5L]
type = ChangeState
value = 200
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = statetype != A || map(Float)
trigger1 = ctrl
trigger2 = (stateno = 400 || stateno = 200) && movecontact
 
;6M: The Slay Button
[State -1, 6M]
type 	= ChangeState
value 	=  230
triggerall = command = "y"
triggerall = command = "holdfwd" && command != "holddown"
triggerall = statetype != A || map(Float)
trigger1 = ctrl
trigger2 = stateno = [400,420] || stateno = [200,220]
trigger2 = movecontact

;5M: Standing Medium
[State -1, 5M]
type = ChangeState
value =  210
triggerall = command = "y"
triggerall = command != "holddown"
triggerall = statetype != A || map(Float)
trigger1 = ctrl
trigger2 = (stateno = 200 || stateno = 400) && movecontact

;---------------------------------------------------------------------------
;Xenocide Cutter
[State -1, 3H]
type = ChangeState
value = 430
triggerall = command = "z"
triggerall = command = "holddown" && command = "holdfwd"
triggerall = statetype != A || map(Float)
trigger1 = ctrl
trigger2 = stateno = [400,420] || stateno = [200,220] 
trigger2 = movecontact

;5H
[State -1, 5H]
type = ChangeState
value =  220
triggerall = statetype != A || map(Float)
triggerall = command = "z"
triggerall = command != "holddown"
trigger1 = ctrl
trigger2 = (stateno = [200,210] || stateno = [400,420]) && movecontact
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;2L
[State -1, 2L]
type = ChangeState
value = 400
triggerall = command = "x"
triggerall = command = "holddown"
triggerall = statetype != A || map(Float)
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact ;5L
trigger3 = stateno = 400 && movecontact ;2L

;---------------------------------------------------------------------------
;2M: Crouching Medium
[State -1, 2M]
type = ChangeState
value = 410
triggerall = command = "y"
triggerall = command = "holddown" || command = "down"
triggerall = statetype != A || map(Float)
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 200)  || (stateno = 210) 
trigger2 = (movecontact)

;---------------------------------------------------------------------------
;2H: Crouching Heavy (2H)

[State -1, 2H]
type = ChangeState
value = 420
triggerall = command = "z"
triggerall = command = "holddown" || command = "down"
triggerall = command != "holdfwd"
triggerall = statetype != A || map(Float)
trigger1 = ctrl
trigger2 = stateno = [400,410] || stateno = [200,210]
trigger2 = movecontact

;---------------------------------------------------------------------------

;j.5L
[State -1, jL]
type = ChangeState
value = 600
triggerall = command = "x"
triggerall = statetype = A
trigger1 = ctrl || stateno = 60
trigger2 = stateno = 600 && movecontact
trigger3 = movehit && stateno = [600, 630]

;---------------------------------------------------------------------------

;j.5M
[State -1, jM]
type = ChangeState
value = 610
triggerall = command = "y"
triggerall = statetype = A
triggerall = stateno != 610
trigger1 = ctrl || stateno = 60
trigger2 = stateno = 600 && movecontact
trigger3 = movehit && stateno = [600, 630]

;---------------------------------------------------------------------------

;j.5H
[State -1, jH]
type = ChangeState
value = 620
triggerall = command = "z"
triggerall = statetype = A
triggerall = stateno != 620
trigger1 = ctrl || stateno = [600,610] && movecontact  || stateno = 60
;--------------------------------------------------------------------------

;REDLINE CANCEL
[State -1, REDLINE CANCEL]
type = ChangeState
value = 4000
triggerall = !map(ScratchLockout) && enemy, Alive && teammode != Tag
triggerall = power >=2000 && !map(FRC)
triggerall = stateno != 803
triggerall = command = "SP"
triggerall = statetype != A
triggerall = stateno != [900,915] && stateno != 803
trigger1 = movecontact

;REDLINE CANCEL (AIR)
[State -1, REDLINE CANCEL]
type = ChangeState
value = 4001
triggerall = !map(ScratchLockout) && enemy, Alive && teammode != Tag
triggerall = power>=2000 && !map(FRC)
triggerall = stateno !=750
triggerall = stateno != 900
triggerall = command = "SP"
triggerall = statetype = A
triggerall = stateno != [900,915] && stateno != 803
trigger1 = movecontact

;DEVIANT REDLINE CANCEL
[State -1, REDLINE CANCEL]
type = ChangeState
value = 4005
triggerall = power >=1000 && stateno != 4005
triggerall = command = "SP"
triggerall = statetype != A
triggerall = stateno != [900,915] && stateno != 803
trigger1 = map(FRC)

;DEVIANT REDLINE CANCEL (AIR)
[State -1, REDLINE CANCEL]
type = ChangeState
value = 4006
triggerall = power>=1000 && stateno != 4006
triggerall = command = "SP"
triggerall = statetype = A 
triggerall = stateno != [900,915] && stateno != 803
trigger1 = map(FRC)

;Float Cancels
[State 20, 4]
type = Changestate
value = 115
triggerall = map(Float)
triggerall = command = "down" || command = "holddown"
triggerall = command = "c"
trigger1 = movecontact || movehit
trigger2 = ctrl
ignorehitpause = 1

[State 20, 4]
type = Changestate
value = 120
trigger1 = map(Float) && stateno != 115
trigger1 = command != "down" && command = "c" && time > 5
trigger1 = movecontact || ctrl
trigger2 = map(FloatTimer) = 299 && pos y < 0


[State 20, 4]
type = Changestate
value = 45
triggerall = map(Float)
triggerall = command = "up"
trigger1 = movecontact