; The CMD file.
;-| Default Values |-------------------------------------------------------
[Defaults]
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
trigger2 = (stateno = [200,299]) || (stateno = [400,499]) || stateno = 656
trigger2 = movecontact && !enemy, movereversed
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = 105
var(1) = 1

;===========================================================================
;===========================================================================
;===========================================================================
;=============================LVL1-LVL3 SUPERS===============================
;===========================================================================
;===========================================================================
;===========================================================================

;True Buster
;[State -1, BH]
;type = ChangeState
;value = 3015
;triggerall = var(28)
;triggerall = command = "TrueBuster"
;triggerall = power >= 4000
;trigger1 = statetype != A
;trigger1 = ctrl
;trigger2 = statetype != A
;trigger2 = hitdefattr = SC, NA, SA, HA
;trigger2 = stateno != [3000,3050)
;trigger2 = movecontact
;trigger3 = stateno = 1310 || stateno = 1330 ;From blocking

;SUPER1: Buster Horizon
[State -1, BH]
type = ChangeState
value = 3000
triggerall = !var(28)
triggerall = command = "236x"
triggerall = power >= 2000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != [3000,3050)
trigger2 = movecontact
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = 9065 && movehit

;SUPER1: install buster
[State -1, BH]
type = ChangeState
value = 3005
triggerall = var(28)
triggerall = command = "236x"
triggerall = power >= 2000 
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != [3000,3050)
trigger2 = movecontact
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = 9065 && movehit
;---------------------------------------------------------------------------
;SUPER2: RAGE
[State -1, R]
type = ChangeState
value = 3010
triggerall = stateno !=3010 && var(28)<=0
triggerall = command = "214x"
triggerall = power >= 2000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != [3000,3050)
trigger2 = movecontact
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking


;===========================================================================
;===========================================================================
;===========================================================================
;===============================MOVEMENT===================================
;===========================================================================
;===========================================================================
;===========================================================================
;Super Jump
[State -1, Super Jump]
type = ChangeState
value = 55
triggerall = statetype != A
triggerall = command = "28" || command = "27" || command = "29"
trigger1 = Map(JC)
trigger2 = stateno = [100,111]
trigger3 = ctrl

[State -1,DJC]
type = ChangeState
value = 45
triggerall = command = "up" || movecontact && command = "holdup"
triggerall = stateno != 11 && stateno!=45 && stateno!=46 && stateno!= 4260 && (stateno!=[4000,4099]) && stateno !=[903,904]
triggerall = Map(DJCL) > 0
trigger1 = ctrl && stateno!=45 && stateno!=46 && stateno!=50 && stateno!=40 && stateno!= 4260 && !(stateno = 56 && time < 10)
trigger2 = movecontact && stateno != 230
trigger2 = hitdefattr = A, NA
trigger3 =  stateno = 45 || stateno=46|| stateno=50
trigger3 = vel y>.1


[State -1, JC]
type = ChangeState
value = 40
triggerall = command = "holdup" && stateno != [55,56]
trigger1 = Map(JC)
trigger2 = stateno = [100,111]

;Forward Airdash
[State -1, Run Fwd]
type = ChangeState
value =904
triggerall = command != "holdback"
triggerall = command = "a66" || teammode != Tag && command = "M66"
triggerall = stateno!=904
triggerall = var(29)>0
triggerall = pos y<-30
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = (stateno = [600,640])  && var(8)>0
trigger2 = movecontact


;Backward Airdash
[State -1, Run Fwd]
type = ChangeState
value = 903
triggerall = command = "a44" || teammode != Tag && command = "M44"
triggerall = stateno!=903
triggerall = var(29)>0
triggerall = pos y<-30
trigger1 = statetype = A
trigger1 = ctrl


;Forward Dash
[State -1, Forward Back]
type = ChangeState
value = 100
triggerall = command != "holdback"
triggerall = command = "66" || teammode != Tag && command = "M66"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 250
triggerall = stateno!=110
trigger3 = stateno = 4000

;Run Back
[State -1, Run Back]
type = ChangeState
value = 105
triggerall = command = "44" || teammode != Tag && command = "M44"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 250
triggerall = stateno!=105

[State -1, JS]
type = ChangeState
value = 9969
triggerall = command = "b"
triggerall=command!="c"
trigger1 = statetype = A
trigger1 = ctrl
trigger2=stateno=[600,610]&&movecontact
trigger3=stateno=630&&movecontact


[State -1, EX JS]
type = ChangeState
value = 9971
triggerall = command = "b"  && command="buffer_c"|| (command = "EX") && teammode != Tag
triggerall=power>=1000
trigger1 = statetype = A
trigger1 = ctrl
trigger2=stateno=[600,610]&&movecontact
trigger3=stateno=630&&movecontact

;===========================================================================
;===========================================================================
;===========================================================================
;=============================SPECIALS & EX==================================
;===========================================================================
;===========================================================================
;===========================================================================

[State -1, EX 6S: Brawler Rush]
type = ChangeState
value = 9000
triggerall = power>1000
triggerall = stateno != 230
triggerall = stateno != 431
triggerall = var(32)<=0
triggerall = !var(28)
triggerall = (command = "b" && command = "c") && command = "holdfwd" || (command = "EX" && command = "holdfwd") && teammode != Tag
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)

[State -1, EX 6S: Brawler Rush]
type = ChangeState
value = 9100
triggerall = power>1000
triggerall = var(32)<=0
triggerall = var(28)
triggerall = stateno != 230
triggerall = stateno != 431
triggerall = (command = "b" && command = "c") && command = "holdfwd" || (command = "EX" && command = "holdfwd") && teammode != Tag
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
;trigger3 = (stateno = [600,640]) 
;trigger3 = movecontact

[state -1, 4S Brawler Rush Finisher]
type = changestate
triggerall = ifelse(p2dist X> 0, command = "b", command = "b")
triggerall = stateno != 230
triggerall = stateno != 431
triggerall = stateno = 9040 && statetype != A
trigger1 = time > 70
value = 9041

[State -1, 3S: Brawler Rush]
type = ChangeState
value = 10022
triggerall = !var(28)
triggerall = stateno != 230
triggerall = stateno != 431
triggerall = command = "b" && var(28) = 1
triggerall = command = "holddown"
triggerall = command = "holdfwd"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)  

[State -1, 3S: Brawler Rush] ;Install 6SB MANUAL
type = ChangeState
value = 20022
triggerall = var(28)
triggerall = stateno != 230
triggerall = stateno != 431
triggerall = command = "b"
triggerall = command = "holddown"
triggerall = command = "holdfwd"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)

[State -1, 1S: Brawler Rush Install] ;6S B - MANUAL
type = ChangeState
value = 20011
triggerall = stateno != 230
triggerall = stateno != 431
triggerall = command = "b" && var(28) = 1
triggerall = command = "holddown"
triggerall = command = "holdback"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
;trigger3 = (stateno = [600,640]) 
;trigger3 = movecontact = 1

[State -1, 6S: Brawler Rush]
type = ChangeState
value = 1000
triggerall = stateno != 230
triggerall = stateno != 431
triggerall = !var(28)
triggerall = command = "b"
triggerall = command = "holdfwd"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)


[State -1, 6S: Brawler Rush]
type = ChangeState
value = 2001
triggerall = stateno != 230
triggerall = stateno != 431
triggerall = var(28)
triggerall = command = "b"
triggerall = command = "holddown"
triggerall = command = "holdback"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
;trigger3 = (stateno = [600,640]) 
;trigger3 = movecontact = 1

[State -1, 6S: Brawler Rush]
type = ChangeState
value = 2000
triggerall = var(28)
triggerall = stateno != 230
triggerall = stateno != 431
triggerall = command = "b"
triggerall = command = "holdfwd"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
;trigger3 = (stateno = [600,640]) 
;trigger3 = movecontact = 1

[state -1, 4S Primal Rage  Finisher]
type = Changestate
triggerall = command = "b"
triggerall = stateno != 230
triggerall = stateno != 431
triggerall = stateno = 1040 && statetype != A
trigger1 = time > 52
value = 1041

;-------------------------------------------------------------------------

[State -1, EX 5S: Big Fist]
type = ChangeState
value = 9090
triggerall = power>1000
triggerall = var(53)<=0
triggerall = stateno != 230
triggerall = stateno != 431
triggerall = command = "b" && command = "c" || (command = "EX") && teammode != Tag
triggerall = command != "holdback"
triggerall = command != "holdfwd"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = [1000,1001] && movecontact
trigger3 = stateno = [9000,9001] && movecontact
trigger4 = stateno = [2000,2001] && movecontact
trigger5 = var(1)

[State -1, 5S: Big Fist]
type = ChangeState
value = 1090
triggerall = stateno != 230
triggerall = stateno != 431
triggerall = command = "b"
triggerall = command != "holdback"
triggerall = command != "holdfwd"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = [1000,1001] && movecontact
trigger3 = stateno = [9000,9001] && movecontact
trigger4 = stateno = [2000,2001] && movecontact
trigger5 = var(1)
ignorehitpause = 1

[State -1, 2S: Raging DP]
type = ChangeState
value = 1051
triggerall = command = "b"
triggerall = command = "holddown"
triggerall = command != "holdback"
triggerall = command != "c"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = movecontact && stateno = 421
ignorehitpause = 1

[State -1, EX 2S: Raging Counter]
type = ChangeState
value = 1054
triggerall = power>1000
triggerall = command = "b" && command = "c" || (command = "EX") && teammode != Tag
triggerall = command = "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)


[State -1, EX 4S: Brutaller Angrier Pisseder Fucker You Grab]
type = ChangeState
value = 10414
triggerall = power>1000
triggerall = stateno != 431
triggerall = var(31)<=0
triggerall = stateno != 230
triggerall = command = "holdback"
triggerall = command = "b" && command = "c" || (command = "EX") && teammode != Tag
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = [1000,1001] && movecontact
trigger3 = stateno = [9000,9001] && movecontact
trigger4 = stateno = [2000,2001] && movecontact
trigger5 = var(1)

[State -1, 4S: Brutal Angry Piss Fuck You Grab]
type = ChangeState
value = 10400
triggerall = stateno != 230
triggerall = stateno != 431
triggerall = command = "b" && command="holdback"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = [1000,1001] && movecontact
trigger3 = stateno = [9000,9001] && movecontact
trigger4 = stateno = [2000,2001] && movecontact
trigger5 = var(1)

;===========================================================================
;===========================================================================
;===========================================================================
;=============================BREAKER ATK==================================
;===========================================================================
;===========================================================================
;===========================================================================

[State -1, 5R: Rage Charge]
type = ChangeState
value = 1060
triggerall = StateType != A
triggerall = stateno != 1060
triggerall = stateno != 9020
triggerall = stateno != 230
triggerall = stateno != 431
triggerall = command != "holddown"
triggerall = command != "holdback"
triggerall = command != "holdfwd"
triggerall = command = "c"
triggerall = command != "b"
trigger1 = Ctrl


[State -1, 4R: Overhead]
type = ChangeState
value = 1062
triggerall = !var(28)
triggerall = stateno != 1060
triggerall = command != "holddown"
triggerall = command != "holdfwd"
triggerall = command = "c"
triggerall = command = "holdback"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = [1000,1001]) 
trigger2 = movecontact
trigger3 = (stateno = [9000,9001])
trigger3 = movecontact
trigger4 = stateno = [2000,2001]
trigger4 = movecontact
trigger5 = stateno = [9100,9101]
trigger5 = movecontact
trigger6 = stateno = 10011 && movecontact
trigger7 = stateno = 20011 && movecontact
trigger8 = stateno = 90011 && movecontact
trigger9 = stateno = 91011 && movecontact
trigger10 = stateno = [200, 220] && movecontact 
trigger11 = stateno = [400,421] && movecontact
trigger12 = stateno = 110 && time > 7 
trigger13 = stateno = 111
trigger14 = stateno = 105

[State -1, Install 4R: Overhead]
type = ChangeState
value = 1063
triggerall = var(28)
triggerall = stateno != 1060
triggerall = command != "holddown"
triggerall = command != "holdfwd"
triggerall = command = "c"
triggerall = command = "holdback"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = [1000,1001]) 
trigger2 = movecontact
trigger3 = (stateno = [9000,9001])
trigger3 = movecontact
trigger4 = stateno = [2000,2001]
trigger4 = movecontact
trigger5 = stateno = [9100,9101]
trigger5 = movecontact
trigger6 = stateno = 10011 && movecontact
trigger7 = stateno = 20011 && movecontact
trigger8 = stateno = 90011 && movecontact
trigger9 = stateno = 91011 && movecontact
trigger10 = stateno = [200, 220] && movecontact 
trigger11 = stateno = [400,421] && movecontact
trigger12 = stateno = 110 && time > 7 
trigger13 = stateno = 111
trigger14 = stateno = 105

[State -1, 6R: Twirl]
type = ChangeState
value = 1070
triggerall = command != "holddown"
triggerall = command != "holdback"
triggerall = command = "c"
triggerall = command = "holdfwd"
triggerall = stateno != 230 && stateno != 225
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = [1000,1001]
trigger3 = movecontact
trigger4 = stateno = [9000,9001]
trigger4 = movecontact
trigger5 = stateno = [2000,2001]
trigger5 = movecontact
trigger6 = stateno = [9100,9101]
trigger6 = movecontact
trigger7 = stateno = 10011 && movecontact
trigger8 = stateno = 20011 && movecontact
trigger9 = stateno = 90011 && movecontact
trigger10 = stateno = 91011 && movecontact
trigger11 = stateno = 110 && time > 7
trigger12 = stateno = 111
;===========================================================================
;---------------------------------------------------------------------------
;Taunt
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = command = "start"
trigger1 = statetype != A
trigger1 = ctrl

;===========================================================================
;===========================================================================
;===========================================================================
;================================NORMALS==================================
;===========================================================================
;===========================================================================
;===========================================================================

;6M - Overhead
;[State -1, Stand Strong Punch]
;type = ChangeState
;value =  750
;trigger1 = statetype = S
;triggerall = command = "y"
;triggerall = command = "holdfwd"
;triggerall = command !="holddown"
;trigger1 = ctrl
;trigger2 = (stateno = 200) && movecontact ;&& enemynear, movetype = H 
;trigger3 = (stateno = 210) && movecontact ;&& enemynear, movetype = H 
;trigger4 = (stateno = 220) && movecontact ;&& enemynear, movetype = H 
;trigger5 = (stateno = 400) && movecontact ;&& enemynear, movetype = H 
;trigger6 = stateno = 410 && movecontact ;&& enemynear, movetype = H 
;trigger7 = stateno = 420 && movecontact ;&& enemynear, movetype = H  
;trigger8 = stateno = [1000,1001] && movecontact
;trigger9 = stateno = [9000,9001] && movecontact 
;trigger9 = stateno = [9100,9101] && movecontact
;trigger10 = stateno = [2000,2001] && movecontact
;trigger11 = stateno = 111

;5L
[State -1, 5L]
type = ChangeState
value = 200
triggerall = command = "x"
triggerall = command != "holddown" && var(59) !=4
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = command = "buffer_x"
trigger2 = movecontact 
trigger2 = (stateno = 400) || (stateno = 200) && time>1
trigger2 = movecontact 
trigger3 = stateno = 110
trigger4 = stateno = 111

;5M
[State -1,5M]
type = ChangeState
value =  210
triggerall = command = "y"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact 
trigger3 = stateno = [100,111]
trigger4 = stateno = [400,410] && movecontact

;6H
[State -1, 6H]
type = ChangeState
value =  230
trigger1 = statetype = S
triggerall = command = "z"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
trigger1 = ctrl
trigger2 = (stateno = [200, 220]) && movecontact 
trigger3 = (stateno = [410,430]) && movecontact 
trigger4 = stateno = [100,111]
trigger5 = stateno = [1000,1001] && movecontact 
trigger6 = stateno = [9000,9001] && movecontact 
trigger7 = stateno = [2000,2001] && movecontact

;5H
[State -1, 5H]
type = ChangeState
value =  220
triggerall = statetype != A
triggerall = command = "z"
triggerall = command != "holddown"
triggerall = command != "holdfwd"
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact 
trigger3 = (stateno = 210) && movecontact 
trigger4 = (stateno = 410) && movecontact 
trigger5 = (stateno = 420) && movecontact 
trigger6 = stateno = 100 && time > 3
trigger7 = stateno = 110
trigger8 = stateno = 111

[State -1, Hmash]
type = ChangeState
value = 225
triggerall = statetype != A && stateno != 421
triggerall = command = "c" && (command = "holddown" || command = "down")
trigger1 = ctrl
trigger2 = stateno = [200,421] & movecontact
trigger2 = stateno != [225,227] & movecontact
trigger3 = stateno = 220 

;-----------------------------------------------------------------------------------------------------------
;-----------------------------------------------------------------------------------------------------------

;2L
[State -1, 2L]
type = ChangeState
value = 400
triggerall = command = "buffer_x"
triggerall = command = "holddown"
trigger1 = statetype != A 
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 200)
trigger2 = movecontact 
trigger3 = stateno = [100, 111]

;---------------------------------------------------------------------------
;2M
[State -1, 2M]
type = ChangeState
value = 410
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype != A 
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 200)  || (stateno = 210) 
trigger2 = (movecontact)
trigger3 = stateno = [100, 111]
;---------------------------------------------------------------------------
;2H
[State -1, 2H]
type = ChangeState
value = 420
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = command != "holdfwd"
trigger1 = statetype != A 
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 410)|| (stateno = 200)|| (stateno = 210)|| (stateno = 430)
trigger2 = (movecontact)
trigger3 = stateno = [100, 111]

;Charge 2H
[State -1, 2HH]
type = ChangeState
value = 421
triggerall = command = "z"
triggerall = command != "holdfwd"
triggerall = command = "holddown"
triggerall = stateno !=421
triggerall = statetype != A 
trigger1 = stateno = [100, 111]
trigger2 = stateno = 226 && movecontact
;---------------------------------------------------------------------------
;3H
[State -1, 3H]
type = ChangeState
value = 430
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = command = "holdfwd"
trigger1 = statetype != A 
trigger1 = ctrl
trigger2 = stateno = [400,420] || stateno = [210,220]
trigger2 = (movecontact)
trigger3 = stateno = 100 && time > 3
trigger4 = stateno = 110 && time > 7
trigger5 = stateno = 111
trigger6 = stateno = [1000,1001] && movecontact
trigger7 = stateno = [9000,9001] && movecontact
trigger8 = stateno = [2000,2001] && movecontact

;-----------------------------------------------------------------------------------------------------------
;-----------------------------------------------------------------------------------------------------------

;jL
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = command = "x"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = [610, 620] && movehit
;---------------------------------------------------------------------------
;jM
[State -1, jM]
type = ChangeState
value = 610
triggerall = command = "y"
triggerall = statetype = A
trigger1 = ctrl || stateno = 600 && movecontact
trigger2 = (stateno = [600,620]) 
trigger2 = movehit && stateno != 610

;---------------------------------------------------------------------------
;jH
[State -1, jH]
type = ChangeState
value = 620
triggerall = command = "z"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = (stateno = [600,610]) 
trigger2 = movecontact

;jR
;[State -1, jR]
;type = ChangeState
;value = 630
;triggerall = command = "c"
;triggerall = statetype = A
;trigger1 = ctrl
;trigger2 = (stateno = [600,610]) 
;trigger2 = movecontact
;trigger3 = stateno = 1350

;===========================================================================
;PARRY (RED)                                                              []
;==========================================================================
;
;[State -1, Standing RED Parry]
;type = HitOverRide
;trigger1 = roundstate = 2 && (statetype = S || stateno = 5120)
;trigger1 = command = "fwd" && command != "back" && command != "up" && command != "down"
;trigger1 = movetype != A
;trigger1 = stateno = [151,153]
;attr = SA, AA, AP, HP, HA, NA, SA, SP, NP
;stateno = 703
;slot = 0
;time = 2
;
;[State -1, Crouching RED Parry]
;type = hitoverride
;trigger1 = roundstate = 2 && statetype != A
;trigger1 = command = "down" && command != "back" && command != "back" && command != "up"
;trigger1 = movetype != A
;trigger1 = stateno = [151,153]
;attr = C, AA, AP, HP, HA, NA, SA
;stateno = 704
;slot = 0
;time = 2
;
;[State -1, Air RED Parry]
;type = hitoverride
;trigger1 = roundstate = 2 && statetype = A
;trigger1 = command = "fwd" && command != "back" && command != "up" && command != "down"
;trigger1 = movetype != A
;trigger1 = stateno = [154,155]
;attr = SA, AA, AP, HP, HA, NA, SA
;stateno = 705
;forceair = 1
;slot = 0
;time = 2

;===========================================================================
;PARRY (BLUE)                                                             []
;==========================================================================

;[State -1, Standing Parry]
;type = HitOverRide
;triggerall = enemy, !map(LOW)
;trigger1 = roundstate = 2 && (statetype = S || stateno = 5120)
;trigger1 = command = "fwd" && command != "back" && command != "up" && command != "down"
;trigger1 = ctrl || (stateno = [700, 701])||(stateno = [703, 704]) || stateno = 5120
;trigger1 = movetype != A
;attr = SA, AA, AP, HP, HA, NA, SA, SP, NP
;stateno = 700
;slot = 0
;time = 6
;
;[State -1, Crouching Parry]
;type = hitoverride
;triggerall = enemy, !map(Overhead)
;trigger1 = roundstate = 2 && statetype != A
;trigger1 = command = "down" && command != "fwd" && command != "back" && command != "up"
;trigger1 = ctrl || (stateno = [700, 701])||(stateno = [703, 704]) || stateno = 5120
;trigger1 = movetype != A
;attr = C, AA, AP, HP, HA, NA, SA
;stateno = 701
;slot = 0
;time = 6
;
;[State -1, Air Parry]
;type = hitoverride
;trigger1 = roundstate = 2 && statetype = A
;trigger1 = command = "fwd" && command != "back" && command != "up" && command != "down"
;trigger1 = ctrl || stateno = 702 || stateno = 705
;trigger1 = movetype != A
;attr = SA, AA, AP, HP, HA, NA, SA
;stateno = 702
;forceair = 1
;slot = 0
;time = 8