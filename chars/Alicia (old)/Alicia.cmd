; The CMD file.
[DEFAULTS]
command.time = 15
command.buffer.time = 3

;=======================================+
;Command Inputs - Special, With Buttons/
;======================================+
[Command]
name = "632146L"
command = ~F, DF, D, DB, B, F, x
[Command]
name = "632146M"
command = ~F, DF, D, DB, B, F, y
[Command]
name = "632146H"
command = ~F, DF, D, DB, B, F, z
[Command]
name = "632146R"
command = ~F, DF, D, DB, B, F, c

[Command]
name = "41236L"
command = ~B, DB, D, DF, F, x
[Command]
name = "41236M"
command = ~B, DB, D, DF, F, y
[Command]
name = "41236H"
command = ~B, DB, D, DF, F, z
[Command]
name = "41236R"
command = ~B, DB, D, DF, F, c

[Command]
name = "63214L"
command = ~F, DF, D, DB, B, x
[Command]
name = "63214M"
command = ~F, DF, D, DB, B, y
[Command]
name = "63214H"
command = ~F, DF, D, DB, B, z
[Command]
name = "63214R"
command = ~F, DF, D, DB, B, c

[Command]
name = "214214L"
command = ~D, DB, B, D, DB, B, x
time = 20
[Command]
name = "214214M"
command = ~D, DB, B, D, DB, B, y
time = 20
[Command]
name = "214214H"
command = ~D, DB, B, D, DB, B, z
time = 20
[Command]
name = "214214R"
command = ~D, DB, B, D, DB, B, c
time = 20

[Command]
name = "214214"
command = ~D, DB, B, D, DB, B
time = 20
[Command]
name = "214214"
command = ~D, DB, B, n, D, DB, B
time = 20
[Command]
name = "236236"
command = ~D, DF, F, D, DF, F
time = 20
[Command]
name = "236236"
command = ~D, DF, F, n, D, DF, F
time = 20
[Command]
name = "236"
command = ~D, DF, F
time = 10
[Command]
name = "214"
command = ~D, DB, B
time = 10
[Command]
name = "22"
command = ~D, n, D
time = 10

[Command]
name = "[L]"
command = ~60/x
[Command]
name = "[M]"
command = ~60/y
[Command]
name = "[H]"
command = ~60/z

[Command]
name = "[4]6H"
command = ~30$B, F, z
[Command]
name = "[4]6H"
command = ~30$B, N, F, z

[Command]
name = "236R"
command = ~D, DF, F, c
[Command]
name = "214R"
command = ~D, DB, B, c

[Command]
name = "holdstart"
command = start


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
trigger2 = (stateno = [200,299]) || (stateno = [400,503]) || stateno = [600, 670] || stateno = [801,802]
trigger2 = stateno != 421
trigger2 = movecontact
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = 105 || stateno = 1000 && movecontact
var(1) = 1


;---------------------------------------------------------------------------
;Super Jump
[State -1, Super Jump]
type = ChangeState
value = 55
triggerall = statetype != A && anim != 1086
triggerall = command = "28" || command = "27" || command = "29"
trigger1 = stateno = [200,220] || stateno = 420
trigger1 = movehit
trigger2 = stateno = 105 && time > 5
trigger3 = ctrl

[State -1, JC] ;jump cancel
type = ChangeState
value = 40
triggerall = statetype != A && stateno != [55, 56]
triggerall = command = "holdup" || command = "up"
trigger1 = stateno = [200,220] || stateno = [400,430]
trigger1 = movehit
trigger2 = stateno = 105 && time > 5
trigger3 = stateno = 1000 && movecontact

[State -1,DJC] ;Double Jump Raw
type = ChangeState
value = 45
triggerall = statetype = A && pos y < -15
triggerall =  command = "up"
triggerall = stateno!=45 && stateno!=46
triggerall = Map(DJCL) > 0 && map(FLOAT) = 0
trigger1 = ctrl && stateno!= [40, 45] && stateno!= 4260 && !(stateno = [50,56] && time < 5)

[State -1,DJC] ;Double Jump Cancel
type = ChangeState
value = 45
triggerall = statetype = A && pos y < -15
triggerall =  command = "holdup"
triggerall = Map(DJCL) > 0
trigger1 = movecontact ;&& enemynear, movetype = H
trigger1 = hitdefattr = A, NA && stateno != 900
trigger2 = stateno = 1005 && statetype = A

[State -1, FLOAT] ;Float
type = ChangeState
value = 110
triggerall = statetype = A && pos y < -15
triggerall =  command = "holdc" 
triggerall = Map(DJCL) > 0 && stateno != 110 && !map(Float) && map(CanFloat)
trigger1 = movecontact
trigger1 = hitdefattr = A, NA && stateno != 900
trigger2 = stateno = 1005 && statetype = A
trigger3 = ctrl


;---------------------------------------------------------------------------
;Malice Call
[State -1, Malice Call...] ;Outside PW
type = ChangeState
value = 3000
triggerall = command = "holdfwd"
triggerall = command = "b" && map(236)
triggerall = power >= 2000 && !map(Perfektwelt)
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1) || stateno = [2010, 2060] || stateno = 1005
[State -1, Malice Call...] ;Outside PW
type = ChangeState
value = 3000
triggerall = command = "holdfwd"
triggerall = command = "b" && map(236)
triggerall = map(Perfektwelt)
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1) || stateno = [2010, 2060] || stateno = 1005

;Perfektwelt
[State -1, GLORY TO MY VISION!!!]
type = ChangeState
value = 3020
triggerall = !map(Perfektwelt)
triggerall = command = "b" && map(214)
triggerall = power >= 4000
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1) || stateno = [2010, 2060] || stateno = 1005

;===========================================================================
;Seven Weights - Seven Steps to Heaven
;===========================================================================
;4R - The Silence
[State -1, 4R]
type = ChangeState
value = 2010
triggerall = command = "c" && command = "holdback"
triggerall = map(Terror) >= 150
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)

;6R - The Binding Vow
[State -1, 6R]
type = ChangeState
value = 2060
triggerall = command = "c" && command = "holdfwd"
triggerall = map(Terror) >= 150 && numhelper(2061) < 2
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)

;2R - The Reverse Will
[State -1, 2R]
type = ChangeState
value = 2020
triggerall = command = "c" && command = "holddown"
triggerall = map(Terror) >= 150
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)

;5R - The Swarm
[State -1, 5R]
type = ChangeState
value = 2050
triggerall = command = "c"
triggerall = command != "holdback" && command != "holddown" && command != "holdfwd" 
triggerall = map(Terror) >= 150
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)

;===========================================================================
;Special Moves
;===========================================================================
;236L - Leuchtend Walzen
[State -1, Luminous Danser L]
type = ChangeState
value = 1040
triggerall = map(236) && command = "x"
triggerall = !numhelper(250) && !map(EXE)
trigger1 = ctrl && !map(NoLumenWaltz)
trigger2 = var(1)
;236M - Leuchtend Walzen
[State -1, Luminous Danser M]
type = ChangeState
value = 1038
triggerall = map(236) && command = "y"
triggerall = !numhelper(251) && !map(EXE)
trigger1 = ctrl && !map(NoLumenWaltz)
trigger2 = var(1)
;236H - Leuchtend Walzen
[State -1, Luminous Danser H]
type = ChangeState
value = 1045
triggerall = map(236) && command = "z"
triggerall = !numhelper(252) && !map(EXE)
trigger1 = ctrl
trigger2 = var(1)

;236H - Leuchtend Walzen
;[State -1, Luminous Danser H]
;type = ChangeState
;value = 1039
;triggerall = map(236) && command = "z"
;triggerall = !numhelper(252)
;trigger1 = ctrl
;trigger2 = var(1)

;236L - Divekick
;[State -1, Bladesight L]
;type = ChangeState
;value = 1050
;triggerall = map(236) && command = "x"
;triggerall = map(EXE) && statetype = A
;trigger1 = ctrl
;trigger2 = var(1)
;
;;236M - Divekick
;[State -1, Bladesight L]
;type = ChangeState
;value = 1052
;triggerall = map(236) && command = "y"
;triggerall = map(EXE) && statetype = A && map(DJCL)
;trigger1 = ctrl
;trigger2 = var(1)

;214L - Bladesight
[State -1, Bladesight L]
type = ChangeState
value = 1030
triggerall = map(236) && command = "x"
triggerall = numhelper(250) && map(EXE)
trigger1 = ctrl
trigger2 = var(1) || stateno = 1030
;214M - Bladesight
[State -1, Bladesight M]
type = ChangeState
value = 1028
triggerall = map(236) && command = "y"
triggerall = numhelper(251) && map(EXE)
trigger1 = ctrl
trigger2 = var(1) || stateno = 1030
;214H - Bladesight
[State -1, Bladesight H]
type = ChangeState
value = 1029
triggerall = map(236) && command = "z"
triggerall = numhelper(252) && map(EXE)
trigger1 = ctrl
trigger2 = var(1) || stateno =  1030

;22L - Lunatic Tears
[State -1, Lunatic Tears L]
type = ChangeState
value = 1005
triggerall = map(22) && command = "x"
triggerall = numhelper(250) && !map(EXE)
trigger1 = ctrl
trigger2 = var(1)
;22M - Lunatic Tears
[State -1, Lunatic Tears M]
type = ChangeState
value = 1005
triggerall = map(22) && command = "y"
triggerall = numhelper(251) && !map(EXE)
trigger1 = ctrl
trigger2 = var(1)
;22H - Lunatic Tears
[State -1, Lunatic Tears H]
type = ChangeState
value = 1005
triggerall = map(22) && command = "z"
triggerall = numhelper(252) && !map(EXE)
trigger1 = ctrl
trigger2 = var(1)


;22L - Eyeset
[State -1, GRIM VISAGE L]
type = ChangeState
value = 1000
triggerall = map(22) && command = "x"
triggerall = !numhelper(250) && !map(EXE) && stateno != [998,1000]
trigger1 = ctrl
trigger2 = var(1)
;22M Eyeset
[State -1, GRIM VISAGE M]
type = ChangeState
value = 998
triggerall = map(22) && command = "y"
triggerall = !numhelper(251) && !map(EXE) && stateno != [998,1000]
trigger1 = ctrl
trigger2 = var(1)
;22H Eyeset
[State -1, GRIM VISAGE H]
type = ChangeState
value = 999
triggerall = map(22) && command = "z"
triggerall = !numhelper(252) && !map(EXE) && stateno != [998,1000]
trigger1 = ctrl
trigger2 = var(1)

;Alicia grippin yo shit. 6 fingers on each hand. Nails dug in. You just gotta hold that.
[State -1,  {EXE}4S]
type = ChangeState
value = 1020
triggerall = map(EyeCount)
triggerall = command = "b"
triggerall = command = "holdback" || command = "back"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)

;Cry for the Blocker. Cry for the one who wanted no part in this senseless blockstring.
[State -1, {EXE}2S]
type = ChangeState
value = 1025
triggerall = map(EyeCount)
triggerall = command = "b"
triggerall = command = "holddown" || command = "down"
trigger1 = ctrl
trigger2 = var(1)

;I use these to eat cheese.
;[State -1, {EXE}2S]
;type = ChangeState
;value = 1030
;triggerall = map(EXE) && map(EyeCount)
;triggerall = command = "b"
;triggerall = command = "holdfwd" || command = "fwd"
;trigger1 = ctrl
;trigger2 = var(1)

;5S - Modeswitch
[State -1, Mode Switch]
type = ChangeState
value = 1010
triggerall = map(EyeCount) || map(EXE)
triggerall = !numhelper(1031)
triggerall = command = "b"
trigger1 = ctrl && stateno != 1010
trigger2 = var(1) || stateno = 1000
;==========================================================================================
;==========================================================================================

;Forward Airdash
[State -1, Airdash]
type = ChangeState
value = 60
triggerall = Map(ADash) > 0
triggerall = statetype = A && !(stateno = 60 && time < 20)
triggerall = command = "a66" || command = "M66" && command != "holdback"
triggerall = pos y < -30 && stateno != 62
trigger1 = ctrl || map(Float)

;Backward Airdash
[State -1, Air Backdash]
type = ChangeState
value = 61
triggerall = Map(ADash) > 0
triggerall = statetype = A && !(stateno = 61 && time < 6)
triggerall = command = "a44" || command = "M44"
trigger1 = ctrl || map(Float)


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
trigger2 = command = "x"
trigger2 = movecontact =1 ;&& enemynear, movetype = H
trigger2 = stateno = 400 && time>1
trigger2 = movecontact = 1 ;&& enemynear, movetype = H
trigger3 = stateno = 200 && movecontact
 
;6M: The Slay Button
[State -1, 6M]
type 	= ChangeState
value 	=  240
triggerall = command = "y"
triggerall = command = "holdfwd" && command != "holddown"
triggerall = statetype != A || map(Float)
trigger1 = ctrl
trigger2 = stateno = [400,420] || stateno = [200,230]
trigger2 = movecontact

;5M: Standing Medium
[State -1, 5M]
type = ChangeState
value =  210
triggerall = command = "y"
triggerall = command != "holddown"
triggerall = statetype != A || map(Float)
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact
trigger3 = stateno = 400 && movecontact

;---------------------------------------------------------------------------
;3H: Slide!!!
[State -1, 3H]
type = ChangeState
value = 430
triggerall = command = "z"
triggerall = command = "holddown" && command = "holdfwd"
triggerall = statetype != A || map(Float)
trigger1 = ctrl
trigger2 = stateno = [400,410] || stateno = [200,210] 
trigger2 = movecontact

;5H: Standing Heavy
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
;2L: Crouching Light
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
trigger1 = ctrl
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
trigger1 = ctrl
trigger2 = stateno = 600 && movecontact
trigger3 = movehit && stateno = [600, 630]

;---------------------------------------------------------------------------

;j.2H
[State -1, jH]
type = ChangeState
value = 630
triggerall = command = "z" && command = "holddown"
triggerall = statetype = A
triggerall = stateno != 630
trigger1 = ctrl
trigger2 = stateno = [600, 620] && movecontact
trigger3 = movehit && stateno = [600, 630]

;j.5H
[State -1, jH]
type = ChangeState
value = 620
triggerall = command = "z"
triggerall = statetype = A
triggerall = stateno != 620
trigger1 = ctrl
trigger2 = stateno = [600,610] && movecontact
trigger3 = movehit && stateno = [600, 630]
;--------------------------------------------------------------------------

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
triggerall = map(Float) && stateno != 115
triggerall = command != "down"
triggerall = command = "c" && time > 5
trigger1 = movecontact
trigger2 = ctrl


[State 20, 4]
type = Changestate
value = 45
triggerall = map(Float)
triggerall = command = "up"
trigger1 = movecontact
trigger2 = ctrl
