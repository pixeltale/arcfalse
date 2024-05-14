;===========================================================================
;===========================================================================
;===========================================================================
;===============================COMMANDS==================================
;==========This file recognizes every input for everything created for this character==========
;==================Sections are labeled to make workflow easier=======================
;===========================================================================
;===========================================================================
;===========================================================================
;-| Default Values |-------------------------------------------------------
[Defaults]
command.time = 15
command.buffer.time = 3


;-| Super Motions |--------------------------------------------------------
;The following two have the same name, but different motion.
;Either one will be detected by a "command = TripleKFPalm" trigger.
;Time is set to 20 (instead of default of 15) to make the move
;easier to do.

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
trigger2 = (stateno = [200,299]) || (stateno = [400,499]) || stateno = 656 ||stateno = [600, 640]
trigger2 = movecontact ;&& enemynear, movetype = H
trigger2 = stateno!=421
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = 105 && time > 15
var(1) = 1

;===========================================================================
;---------------------------------------------------------------------------
;Ourobubbles
[State -1, Ourobubbles]
type = ChangeState
value = 3050
triggerall = command = "214S"
triggerall = power >= 4000
triggerall = !numhelper(3051)
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = movecontact ;&& enemynear, movetype = H

;Fetid Furball
[State -1, Fetid Furball]
type = ChangeState
value = 3000
triggerall = command = "236X"
triggerall = power >= 2000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = movecontact && enemynear, movetype = H
trigger3 = (stateno = [200,499]) && movecontact ;&& enemynear, movetype = H
trigger4 = stateno = 1053
trigger5 = stateno = 1063
triggerall = stateno != 4000

;Fetid Furball H Alternate
[State -1, Fetid Furball]
type = ChangeState
value = 3070
triggerall = power >= 2000
triggerall = command = "214X"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = movecontact && enemynear, movetype = H
trigger3 = (stateno = [200,499]) && movecontact ;&& enemynear, movetype = H
trigger4 = stateno = 1053
trigger5 = stateno = 1063
triggerall = stateno != 4000
;---------------------------------------------------------------------------
;===========================================================================
;===========================================================================
;===========================================================================
;=============================SPECIALS & EX==================================
;===========================================================================
;===========================================================================
;===========================================================================

[State -1, EX 6S: Rising Knee]
type = ChangeState
value = 1060
triggerall=stateno!=40
triggerall=stateno!= [6000, 6016]
triggerall = stateno!=2062
triggerall=stateno!=1061
triggerall = var(32)<=0 ;Limiter - Only Allowed to use ONCE during a combo
triggerall = power>=1000
triggerall = (command = "b" && command = "c") && command = "holdfwd" || (command = "EX" && command = "holdfwd") && teammode != Tag
triggerall = command != "holdback"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
;trigger3 = movecontact ;&& enemynear, movetype = H
;trigger3 = !ishelper
;trigger4 = stateno = 5120
trigger3 = stateno = 1017 && movecontact ;&& enemynear, movetype = H
trigger4=stateno=105

[State -1, EX 6S: Rising Knee (Air)]
type = ChangeState
value = 1064
triggerall = Pos Y < -20
triggerall=stateno!= [6000, 6016]
triggerall=stateno!=1061
triggerall=stateno!=750
triggerall = var(32)<=0 ;Limiter - Only Allowed to use ONCE during a combo
triggerall = power>=1000
triggerall = (command = "b" && command = "c") && command = "holdfwd" || (command = "EX" && command = "holdfwd") && teammode != Tag
triggerall = command != "holdback"
trigger1 = statetype != S
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = var(1)
;trigger3 = movecontact ;&& enemynear, movetype = H
;trigger3 = !ishelper

[State -1, 6S: Rising Knee]
type = ChangeState
value = 1065
triggerall = Pos Y < -20
triggerall = command = "b"
triggerall=command!="c"
triggerall = command = "holdfwd"
triggerall = command != "holdback"
triggerall = statetype != S
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = [600,650]
trigger2 = movecontact = 1 ;&& enemynear, movetype = H


[State -1, 6S: Rising Knee]
type = ChangeState
value = 1050
triggerall=stateno!=40
triggerall = stateno != 52
triggerall = command = "b"
triggerall=command!="c"
triggerall = command = "holdfwd"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = 100
trigger4 = stateno = 1010
trigger4 = movecontact ;&& enemynear, movetype = H
trigger5 = stateno = 1017 && movecontact ;&& enemynear, movetype = H
trigger6=stateno=105
;-------------------------------------------------------------------------

[State -1, EX 2S: Acid Stomp]
type = ChangeState
value = 1011
triggerall=stateno!=40
triggerall=stateno!=6000
triggerall=stateno!=6010
triggerall=stateno!=6011
triggerall=stateno!=6012
triggerall=stateno!=6013
triggerall=stateno!=6014
triggerall=stateno!=6015
triggerall=stateno!=6016
triggerall=numhelper(6002)!=1
triggerall = var(31)<=0 ;Limiter - Only Allowed to use ONCE during a combo
triggerall = power>=1000
;triggerall = command = "b"
;triggerall = command = "c"
triggerall = (command = "b" && command = "c") && command = "holddown" || (command = "EX" && command = "holddown") && teammode != Tag
triggerall = command != "holdback"
triggerall = statetype != A
trigger1 = stateno != 1064
trigger1 = stateno != 1050
trigger1 = ctrl
trigger2 = var(1)
;trigger3 = movecontact ;&& enemynear, movetype = H
;trigger3 = stateno = 1010
trigger3 = stateno = 1017 && movecontact ;&& enemynear, movetype = H
trigger4=stateno=105


[State -1, 2S: Acid Stomp]
type = ChangeState
value = 1010
triggerall=!numhelper(2054)||Helper(2054),rootdist x != [-100,100]
triggerall=stateno!=40
triggerall = stateno !=1017
triggerall = command = "b"
triggerall=command!="c"
triggerall = command = "holddown"
triggerall = command != "holdback"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3=stateno=105

[State -1, 2S: Acid Stomp]
type = ChangeState
value = 1017
triggerall=numhelper(2054) && Helper(2054),rootdist x = [-100,100]
triggerall=stateno!=40
triggerall = stateno !=1017
triggerall = command = "b"
triggerall=command!="c"
triggerall = command = "holddown"
triggerall = command != "holdback"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3=stateno=105

;-------------------------------------------------------------------------

[State -1, EX 4S: xxx]
type = ChangeState
value = 2059
triggerall=stateno!=40
triggerall=stateno!=6000
triggerall=stateno!=6010
triggerall=stateno!=6011
triggerall=stateno!=6012
triggerall=stateno!=6013
triggerall=stateno!=6014
triggerall=stateno!=6015
triggerall=stateno!=6016
triggerall = numhelper(2053)!=1
triggerall = var(34)<=0 ;Limiter - Only Allowed to use ONCE during a combo
triggerall = power>=1000
triggerall = (command = "b" && command = "c") && command = "holdback" || (command = "EX" && command = "holdback") && teammode != Tag
triggerall = command="holdback" 
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = 1010
trigger3 = movecontact ;&& enemynear, movetype = H
trigger4=stateno=105

[State -1, 4S: Acid Grab]
type = ChangeState
value = 2050
triggerall=stateno!=40
triggerall = command = "b" && command="holdback"
triggerall=command!="c"
trigger1 = statetype != A
trigger1 = ctrl
trigger2=stateno=105

;-------------------------------------------------------------------------

[State -1, j5S: (Air) Rayzah]
type = ChangeState
value = 1600
triggerall = NumProjID(9002) = 0
triggerall = numhelper(1005) != 1
triggerall = numhelper(1025) != 1
triggerall = numhelper(1605) != 1
triggerall = stateno != 1605
triggerall = command = "b"
triggerall=command!="c"
triggerall = command != "holdfwd"
triggerall = command != "holdback"
triggerall = statetype != S
triggerall = statetype = A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = [600,650]
trigger3 = movecontact ;&& enemynear, movetype = H

[State -1, j5SEX: (Air) Rayzah]
type = ChangeState
value = 1030
triggerall=power>=1000
triggerall = stateno != 1605
triggerall = (command = "b" && command = "c") || command = "EX" && teammode != Tag
triggerall = command != "holdfwd"
triggerall = command != "holdback"
triggerall = statetype != S
triggerall = statetype = A
triggerall = numhelper(1035) != 1
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = [600,650]
trigger3 = movecontact ;&& enemynear, movetype = H

[State -1, 5S: EX Acid Razor]
type = ChangeState
value = 1020
triggerall=stateno!=40
triggerall=stateno!=6000
triggerall=stateno!=6010
triggerall=stateno!=6011
triggerall=stateno!=6012
triggerall=stateno!=6013
triggerall=stateno!=6014
triggerall=stateno!=6015
triggerall=stateno!=6016
triggerall=power>=1000 && !map(EX5SLimiter)
triggerall = numhelper(1025) != 1
triggerall = stateno != 1025
triggerall = stateno != 1020
triggerall = (command = "b" && command = "c")|| command = "EX" && teammode != Tag
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
;trigger3 = stateno = 1010
;trigger3 = movecontact ;&& enemynear, movetype = H
;trigger4 = stateno=1000
trigger3 = stateno=1017 && movecontact ;&& enemynear, movetype = H
trigger4=stateno=105

[State -1, 5S: Acid Razor]
type = ChangeState
value = 1000
triggerall=stateno!=40
triggerall = NumProjID(9002) = 0
triggerall = enemynear, stateno != 5110
triggerall = numhelper(1605) != 1
triggerall = numhelper(1005) != 1
triggerall = numhelper(1025) != 1
triggerall=stateno!=6016
triggerall = command = "b"
triggerall=command!="c"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3=stateno=105

;===========================================================================
;===========================================================================
;===========================================================================
;=============================BREAKER ATK==================================
;===========================================================================
;===========================================================================
;===========================================================================

[State -1, nB: Acid Bubble]
type = ChangeState
value =6000
triggerall=stateno!=40
;triggerall = enemynear(0), movetype != H
triggerall = var(11)<=1
triggerall = numhelper(6001) = 0
triggerall = stateno != 6008
triggerall = stateno != 6009
triggerall = stateno != 6000
triggerall = stateno != 6001
triggerall = stateno != 6005
triggerall = stateno != 6002
triggerall=command!="b"
triggerall = command != "holddown"
triggerall = command != "holdback"
triggerall = command != "holdfwd"
triggerall = command != "holdup"
triggerall = command = "buffer_c"
triggerall = StateType != A
trigger1 = StateType = S
trigger1 = ctrl
trigger2= var(1)

[State -1, nB: F Acid Bubble]
type = ChangeState
value =6010
triggerall=stateno!=40
;triggerall = enemynear(0), movetype != H
triggerall = var(11)<=1
triggerall = numhelper(6001) = 0
triggerall = stateno != 6008
triggerall = stateno != 6009
triggerall = stateno != 6000
triggerall = stateno != 6001
triggerall = stateno != 6005
triggerall = stateno != 6002
triggerall = command != "holddown"
triggerall = command != "holdback"
triggerall = command != "holdup"
triggerall=command!="b"
triggerall = command = "buffer_c"&& command="holdfwd"
triggerall = StateType != A
trigger1 = StateType = S
trigger1 = ctrl
trigger2= var(1)

[State -1, nB: B Acid Bubble]
type = ChangeState
value =6011
triggerall=stateno!=40
;triggerall = enemynear(0), movetype != H
triggerall = var(11)<=1
triggerall = numhelper(6001) = 0
triggerall = stateno != 6008
triggerall = stateno != 6009
triggerall = stateno != 6000
triggerall = stateno != 6001
triggerall = stateno != 6005
triggerall = stateno != 6002
triggerall=command!="b"
triggerall = command != "holddown"
triggerall = command != "holdfwd"
triggerall = command != "holdup"
triggerall = command = "buffer_c"&& command="holdback"
triggerall = StateType != A
trigger1 = StateType = S
trigger1 = ctrl
trigger2= var(1)

[State -1, Puddle]
type = ChangeState
value =6012
triggerall=stateno!=40
;triggerall = enemynear(0), movetype != H
triggerall = numhelper(6001) = 0
triggerall = stateno != 6008
triggerall = stateno != 6009
triggerall = stateno != 6000
triggerall = stateno != 6001
triggerall = stateno != 6005
triggerall = stateno != 6002
triggerall=command!="b"
triggerall = command != "holdup"
triggerall = command != "holdfwd"
triggerall = command != "holdback"
triggerall = command = "buffer_c"&& command="holddown"
triggerall = StateType != A
trigger1 = StateType = S
trigger1 = ctrl
trigger2= var(1)

[State -1, Puddle]
type = ChangeState
value =6017
triggerall=stateno!=40
;triggerall = enemynear(0), movetype != H
triggerall = numhelper(6001) = 0
triggerall = stateno != 6008
triggerall = stateno != 6009
triggerall = stateno != 6000
triggerall = stateno != 6001
triggerall = stateno != 6005
triggerall = stateno != 6002
triggerall=command!="b"
triggerall = command != "holdup"
triggerall = command = "holdfwd"
triggerall = command != "holdback"
triggerall = command = "buffer_c"&& command="holddown"
triggerall = StateType != A
trigger1 = StateType = S
trigger1 = ctrl
trigger2= var(1)

[State -1, Puddle]
type 	= ChangeState
value 	= 6018
triggerall	= stateno!=40
triggerall 	= numhelper(6001) = 0
triggerall 	= stateno != 6008
triggerall 	= stateno != 6009
triggerall 	= stateno != 6000
triggerall 	= stateno != 6001
triggerall 	= stateno != 6005
triggerall 	= stateno != 6002
triggerall	= command!="b"
triggerall	= command != "holdup"
triggerall 	= command != "holdfwd"
triggerall 	= command = "holdback"
triggerall 	= command = "buffer_c"&& command="holddown"
triggerall 	= StateType != A
trigger1 	= StateType = S
trigger1 	= ctrl
trigger2	= var(1)

;============================================================================================


[State -1, nB: (Air) Acid Bubble]
type = ChangeState
value =6013
triggerall = var(11)<=1
triggerall = numhelper(6001) = 0
triggerall = command != "holdback"
triggerall = command != "holdfwd"
triggerall = command != "holdup"
triggerall=command!="b"
triggerall = command != "holddown"
triggerall = command = "buffer_c" 
triggerall = StateType = A
trigger1 = ctrl
trigger2= movecontact = 1 && (stateno = [600,650))

[State -1, nB: (Air) D Acid Bubble]
type = ChangeState
value =6014
triggerall = var(11)<=1
triggerall = numhelper(6001) = 0
triggerall = command != "holdback"
triggerall = command != "holdfwd"
triggerall = command != "holdup"
triggerall=command!="b"
triggerall = command = "buffer_c" && command = "holddown"
triggerall = StateType != S
triggerall = StateType = A
trigger1 = ctrl
trigger2= movecontact = 1 && (stateno = [600,650))

[State -1, nB: (Air) B Acid Bubble]
type = ChangeState
value =6015
;triggerall = enemynear(0), movetype != H
;triggerall = Pos Y < -12
triggerall = var(11)<=1
triggerall = numhelper(6001) = 0
triggerall = command != "holddown"
triggerall = command != "holdfwd"
triggerall = command != "holdup"
triggerall=command!="b"
triggerall = command = "buffer_c" && command = "holdback"
triggerall = StateType != S
triggerall = StateType = A
trigger1 = ctrl
trigger2= movecontact = 1 && (stateno = [600,650))

[State -1, nB: (Air) F Acid Bubble]
type = ChangeState
value =6016
;triggerall = Pos Y < -20 
triggerall = var(11)<=1
triggerall = numhelper(6001) = 0
triggerall = command != "holdback"
triggerall = command != "holddown"
triggerall = command != "holdup"
triggerall=command!="b"
triggerall = command = "buffer_c" && command = "holdfwd"
triggerall = StateType = A
trigger1 = ctrl
trigger2= movecontact = 1 && (stateno = [600,650))


;--------------------------------------------------------------------------------------------------------------------------

;[State -1, nB: Acid Bubble]
;type = ChangeState
;value =6013
;triggerall = enemynear(0), movetype != H
;triggerall = var(11)<=0
;triggerall = numhelper(6001) != 1
;triggerall = numhelper(6005) != 1
;triggerall = numhelper(6002) != 1
;triggerall = stateno != 6000
;triggerall = stateno != 6001
;triggerall = stateno != 6005
;triggerall = stateno != 6002
;triggerall = command != "holddown"
;triggerall = command != "holdback"
;triggerall = command != "holdfwd"
;triggerall = command != "holdup"
;triggerall = command = "buffer_c"
;triggerall = StateType != S
;trigger1 = StateType = A
;trigger1 = ctrl
;trigger2= var(1)



;===========================================================================
;===========================================================================
;===========================================================================
;===============================MOVEMENT==================================
;===========================================================================
;===========================================================================
;===========================================================================

;Super Jump
[State -1, Super Jump]
type = ChangeState
value = 55
triggerall = statetype != A
triggerall = command = "28" || command = "27" || command = "29"
trigger1 = ctrl
trigger2 = (stateno = 215 || stateno = 420) && movehit

[State -1,DJC]
type = ChangeState
value = 45
triggerall = command = "up" || movecontact && command = "holdup"
triggerall = stateno!=45 && stateno!=46 && stateno!= 4260 && (stateno!=[4000,4099]) && !(stateno = [55, 56] && time < 6)
triggerall = var(45)>0
triggerall = var(29)>0
trigger1 = stateno!= 640 && ctrl && stateno!=45 && stateno!=46 && stateno!=50 && stateno!=40 && stateno!= 4260
trigger2 = stateno!= 640 && movecontact ;&& enemynear, movetype = H
trigger2 = stateno!= 640 && hitdefattr = A, NA
trigger3 = stateno!= 640 && stateno=45 || stateno=46|| stateno=50
trigger3 = stateno!= 640 && vel y>.1
trigger4 = stateno = 640 && movehit =1

;Backdash
[State -1, Run Back]
type = ChangeState
value = 105
triggerall = stateno!=105
triggerall = stateno!=100
triggerall = command = "44" || teammode != Tag && command = "M44"
trigger1 = statetype = S
trigger1 = ctrl

;Forward Dash
[State -1, Run Back]
type = ChangeState
value = 100
triggerall = stateno!=105
triggerall = command != "holdback"
triggerall = command = "66" || teammode != Tag && command = "M66"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 1100

;---------------------------------------------------------------------------

;Forward Airdash
[State -1, Run Fwd]
type = ChangeState
value = 904
triggerall = command != "holdback"
triggerall = command = "a66" || teammode != Tag && command = "M66"
triggerall = pos y<-20
triggerall = var(29)>0
triggerall = stateno !=904
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = (stateno = 600) || (stateno = 610) || (stateno = 630)
trigger2 = movehit
;trigger4 = stateno = 1052 && movehit ;airdash cancel on 2nd hit
;trigger4 = stateno = 1062 && movehit ;airdash cancel on EX 2nd hit

;Backward Airdash
[State -1, Run Fwd]
type = ChangeState
value = 903
triggerall = command = "a44" || teammode != Tag && command = "M44"
triggerall = pos y<-20
triggerall = var(29)>0
triggerall = stateno !=903
trigger1 = statetype = A
trigger1 = ctrl
;trigger2 = !ishelper

;===========================================================================
;===========================================================================
;===========================================================================
;================================NORMALS==================================
;===========================================================================
;===========================================================================
;===========================================================================

;Overhead
;[State -1, Stand Strong Punch]
;type = ChangeState
;value =  750
;triggerall=stateno!=100
;triggerall=stateno!=40
;trigger1 = statetype = S
;triggerall = command = "y"
;triggerall = command = "holdfwd"
;triggerall = command !="holddown"
;trigger1 = ctrl
;trigger2 = (stateno = 200) ;&& movecontact && enemynear, movetype = H 
;trigger3 = (stateno = 210) ;&& movecontact && enemynear, movetype = H 
;trigger4 = (stateno = 220) ;&& movecontact && enemynear, movetype = H 
;trigger5 = stateno = 230 ;&& movecontact && enemynear, movetype = H 
;trigger6 = (stateno = 400) ;&& movecontact && enemynear, movetype = H 
;trigger7 = stateno = 410 ;&& movecontact && enemynear, movetype = H 
;trigger8 = stateno = 420 ;&& movecontact && enemynear, movetype = H 
;trigger9 = stateno = 215 ;&& movecontact && enemynear, movetype = H  
;trigger10 = stateno = 101 

;4L
[State -1,4L]
type = ChangeState
value =  200
triggerall=stateno!=40
triggerall = command = "x"
triggerall = command = "holdback"
triggerall = command != "holddown"
triggerall = stateno !=200
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact ;&& enemynear, movetype = H  
trigger3 = stateno = 400 && movecontact
trigger4 = stateno = 100

;5L
[State -1,5L]
type = ChangeState
value =  210
triggerall=stateno!=40
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact ;&& enemynear, movetype = H  
trigger3 = stateno = 100

;5M
[State -1,5M]
type = ChangeState
value =  215
triggerall=stateno!=40
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact && enemynear, movetype = H
trigger3 = stateno = 100
trigger4 = stateno = 210 && movecontact && enemynear, movetype = H
trigger5 = stateno = 400 && movecontact && enemynear, movetype = H

;4H
[State -1,4H]
type = ChangeState
value = 223
triggerall=stateno!=40
triggerall = command = "z"
triggerall = command = "holdback"
triggerall = command != "holddown"
triggerall = stateno !=223
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 100
;trigger3 = (stateno = 420) && movecontact && enemynear, movetype = H

;5H
[State -1, 5H]
type = ChangeState
value =  220
triggerall=stateno!=40
trigger1 = statetype = S
triggerall = command = "z"
triggerall = command != "holddown"
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact && enemynear, movetype = H
trigger3 = (stateno = 210) && movecontact && enemynear, movetype = H
trigger4 = (stateno = 410) && movecontact && enemynear, movetype = H
trigger5 = (stateno = 420) && movecontact && enemynear, movetype = H
trigger6 = (stateno = 215) && movecontact && enemynear, movetype = H



;-----------------------------------------------------------------------------------------------------------
;-----------------------------------------------------------------------------------------------------------

;2L
[State -1, 2L]
type = ChangeState
value = 400
triggerall=stateno!=40
triggerall = command = "buffer_x"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 200 
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 100

;---------------------------------------------------------------------------
;2M
[State -1, 2M]
type = ChangeState
value = 410
triggerall=stateno!=40
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 200)  || (stateno = 210) || (stateno = 215)
trigger2 = (movecontact) ;&& enemynear, movetype = H
trigger3 = stateno = 100
;---------------------------------------------------------------------------
;2H
[State -1, 2H]
type = ChangeState
value = 420
triggerall=stateno!=40
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = command != "holdfwd"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 410)|| (stateno = 200)|| (stateno = 210)|| (stateno = 215)
trigger2 = (movecontact) ;&& enemynear, movetype = H
trigger3 = stateno = 100


;---------------------------------------------------------------------------
;3H
[State -1, 3H]
type = ChangeState
value = 430
triggerall=stateno!=40
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = command = "holdfwd"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 410) || (stateno = 210)  || (stateno = 200) || (stateno = 420) 
trigger2 = (movecontact) ;&& enemynear, movetype = H
trigger3 = stateno = 100
trigger4 = stateno = 105
trigger5 = stateno = 215 ;&& movecontact && enemynear, movetype = H
;-----------------------------------------------------------------------------------------------------------
;-----------------------------------------------------------------------------------------------------------

;jL
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = command = "x"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 1350 ;Air blocking
trigger3 = stateno = [610, 630] && movehit
trigger4 = stateno = 600 && movecontact

;---------------------------------------------------------------------------
;jM
[State -1, jM]
type = ChangeState
value = 610
triggerall = command = "y"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1350 ;Air blocking
trigger4 = stateno = 630 && movehit

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
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1350 ;Air blocking

;---------------------------------------------------------------------------
;j3H
[State -1, jH]
type = ChangeState
value = 640
triggerall = command = "z"
triggerall = command = "holddown" && command= "holdfwd"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = (stateno = [600,630]) 
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1350 ;Air blocking
triggerall = pos y<-20


;===========================================================================
;===========================================================================
;===========================================================================
;==================================PARRIES==================================
;===========================================================================
;===========================================================================
;===========================================================================


;[State -1, Standing Parry]
;type = HitOverRide
;trigger1 = roundstate = 2 && (statetype = S || stateno = 5120)
;trigger1 = command = "fwd" && command != "back" && command != "up" && command != "down"
;trigger1 = ctrl || (stateno = [700, 701]) || stateno = 5120
;attr = SA, AA, AP, HP, HA, NA, SA, SP, NP
;stateno = 700
;slot = 0
;time = 8

;[State -1, Crouching Parry]
;type = hitoverride
;trigger1 = roundstate = 2 && statetype != A
;trigger1 = command = "down" && command != "fwd" && command != "back" && command != "up"
;trigger1 = ctrl || (stateno = [700, 701]) || stateno = 5120
;attr = C, AA, AP, HP, HA, NA, SA
;stateno = 701
;slot = 0
;time = 8

;[State -1, Air Parry]
;type = hitoverride
;trigger1 = roundstate = 2 && statetype = A
;trigger1 = command = "fwd" && command != "back" && command != "up" && command != "down"
;trigger1 = ctrl || stateno = 702
;attr = SA, AA, AP, HP, HA, NA, SA
;stateno = 702
;forceair = 1
;slot = 0
;time = 7

;==================================================
