
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
trigger1 = ctrl || stateno = 100
trigger2 = hitdefattr = SCA ,NA&&movecontact
var(1) = 1

;---------------------------------------------------------------------------
[State Divekick Super]
type = ChangeState
value = 3000
triggerall = map(phoenix)=0
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "QCF"
triggerall = power >= 2000
trigger1 = ctrl
trigger2 = hitdefattr = SCA, NA, SA, ST
trigger2 = stateno != [3000,3600)
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = 1030 && movecontact ;&& enemynear, movetype = H
trigger5 = stateno = 1033 && movecontact ;&& enemynear, movetype = H

[State Fireball Super]
type = ChangeState
value = 3100
triggerall = map(phoenix)=0
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "QCB"
triggerall = power >= 2000
triggerall = statetype = A
trigger1 = ctrl
trigger2 = hitdefattr = SCA, NA, SA, ST
trigger2 = stateno != [3000,3600)
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = 1030 && movecontact ;&& enemynear, movetype = H
trigger5 = stateno = 1033 && movecontact ;&& enemynear, movetype = H

[State Hellzone Super]
type = ChangeState
value = 3500
triggerall=stateno!=40
triggerall = map(phoenix)=0
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "QCB"
triggerall = power >= 2000
triggerall = statetype != A
triggerall = !numhelper(3500)&&!numhelper(3501)&&!numhelper(3502)&&!numhelper(3503)&&!numhelper(3504)
trigger1 = ctrl
trigger2 = hitdefattr = SCA, NA, SA, ST
trigger2 = stateno != [3000,3600)
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = 1030 && movecontact ;&& enemynear, movetype = H
trigger5 = stateno = 1033 && movecontact ;&& enemynear, movetype = H

[State Hellzone Collapse]
type = ChangeState
value = 3505
triggerall=stateno!=40
triggerall = map(Collapse)=0
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "QCB"
triggerall = statetype != A
triggerall = numhelper(3500)||numhelper(3501)||numhelper(3502)||numhelper(3503)||numhelper(3504)
trigger1 = ctrl
trigger2 = hitdefattr = SCA, NA, SA, ST
trigger2 = stateno != [3000,3600)
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = 1030 && movecontact ;&& enemynear, movetype = H
trigger5 = stateno = 1033 && movecontact ;&& enemynear, movetype = H


;[State Manual Install FOR TESTING PURPOSES ONLY]
;type = ChangeState
;value = 4000
;triggerall = roundstate = 2 ;only attack during the round
;triggerall = command = "QCBs"
;triggerall = statetype != A
;triggerall = map(phoenix)=0
;trigger1 = ctrl

[State Final Divekick Super]
type = ChangeState
value = 4100
triggerall = map(phoenix)=1
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "QCF"
trigger1 = ctrl
trigger2 = hitdefattr = SCA, NA, SA, ST
trigger2 = stateno != [3000,3600)
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = 1030 && movecontact ;&& enemynear, movetype = H
trigger5 = stateno = 1033 && movecontact ;&& enemynear, movetype = H


;===========================================================================

[State -1, Grab]
type = ChangeState
value = 800
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
trigger1 = command = "throwtech"
trigger1 = statetype != A
trigger1 = ctrl

;Super Jump
[State -1, Super Jump]
type = ChangeState
value = 55
triggerall = statetype != A
triggerall = command = "28" || command = "27" || command = "29"
trigger1 = ctrl
trigger2 = Map(JC)

[State -1,JC]
type = ChangeState
value = 40
triggerall = statetype != A
triggerall = command = "holdup" || command = "up"
trigger1 = map(JC)
trigger2 = ctrl || stateno = 100 && time > 3

[State -1,DJC]
type = ChangeState
value = 45
triggerall = command = "up" && map(doubleJump_BUFFFIX) < 2 || movecontact && command = "holdup"
triggerall = Map(DJCL) > 0
trigger1 = ctrl && stateno!= [40,55]
trigger2 = movecontact
trigger2 = hitdefattr = A, NA
trigger2 = stateno!=620
trigger3 =  stateno=45 || stateno=46|| stateno=50

;---------------------------------------------------------------------------
;Air dash
[State -1, Airdash] ;Air dash
type = ChangeState
value =60
triggerall = command = "a66" || command = "M66"
triggerall = command != "holdback" 
trigger1 = statetype = A
trigger1 = ctrl
triggerall = stateno!=904
triggerall = Map(ADash) > 0
triggerall = (pos y<-30 && vel y < 0) || (vel y >=0)
;Aerial Backdash
[State -1, Air Backdash]
type = ChangeState
value =61
triggerall = command = "a44" || command = "M44"
triggerall = command = "holdback" 
trigger1 = statetype = A
trigger1 = ctrl
triggerall = stateno!=903
triggerall = Map(ADash) > 0
triggerall = (pos y<-30 && vel y < 0) || (vel y >=0)

;--------------------------------------------------------------------------
;Forward Dash
[State -1, Run!!]
type = ChangeState
value = 100
triggerall = stateno!=105
triggerall = stateno!=100
triggerall = stateno!=101
triggerall = command = "FF" || (command = "dash"&&teammode!=tag) || (command = "dash"&&teammode=tag && partner,stateno=5150)
triggerall = command != "holdback"
trigger1 = statetype != A
trigger1 = ctrl
;Backdash
[State -1, Backdash]
type = ChangeState
value = 105
triggerall = command = "BB" || (command = "dash"&&teammode!=tag) || (command = "dash"&&teammode=tag && partner,stateno=5150)
triggerall = command = "holdback"
trigger1 = statetype != A
trigger1 = ctrl
triggerall = stateno!=105

;===========================================================================
;---------------------------------------------------------------------------
;Taunt
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = GameMode != "Training"
triggerall = command="start"
trigger1 = statetype != A
trigger1 = ctrl

[State 5S]
type = ChangeState
value = 1040
triggerall=stateno!=40
triggerall = command = "b"
triggerall = command != "c" && command != "EX"
triggerall = command != "holddown"
triggerall = command != "holdfwd"
triggerall = command != "holdback"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)

[State EX5S]
type = ChangeState
value = 1050
triggerall=stateno!=40
triggerall=map(EXLimiter4)=0
triggerall = command = "EX"
triggerall = power>=1000||map(phoenix)=0
triggerall = command != "holddown"
triggerall = command != "holdfwd"
triggerall = command != "holdback"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)

[State j5S]
type = ChangeState
value = 1045
triggerall = command = "b"
triggerall = command != "c" && command != "EX"
triggerall = command != "holddown"
triggerall = command != "holdfwd"
triggerall = command != "holdback"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = var(1)

[State EXj5S]
type = ChangeState
value = 1055
triggerall=map(EXLimiter4)=0
triggerall = command = "EX"
triggerall = power>=1000||map(phoenix)=0
triggerall = command != "holddown"
triggerall = command != "holdfwd"
triggerall = command != "holdback"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = var(1)

[State EX 2S]
type = ChangeState
value = 1005
triggerall=map(EXLimiter1)=0
triggerall = roundstate = 2 ;only attack during the round
triggerall = power>=1000||map(phoenix)=0
triggerall = command = "EX"
triggerall = command = "holddown"
triggerall = stateno != 1020
trigger1 = ctrl
trigger2 = var(1)

[State 2S]
type = ChangeState
value = 1000
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = ctrl
trigger2 = var(1)

[State 4S]
type = ChangeState
value = 1010
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "b" && command="holdback"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)

[State EX4S]
type = ChangeState
value = 1016
triggerall=stateno!=40
triggerall=map(EXLimiter2)=0
triggerall = numhelper(1013)=0
triggerall = roundstate = 2 ;only attack during the round
triggerall = power>=1000||map(phoenix)=0
triggerall = command="holdback" 
triggerall = command != "holddown"
triggerall = command = "EX"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)

[State j4S]
type = ChangeState
value = 1021
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "b" && command="holdback"
triggerall = command != "holddown"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = var(1)

[State EX j4S]
type = ChangeState
value = 1022
triggerall=map(EXLimiter2)=0
triggerall = numhelper(1013)=0
triggerall = roundstate = 2 ;only attack during the round
triggerall = power>=1000||map(phoenix)=0
triggerall = command="holdback" 
triggerall = command != "holddown"
triggerall = command = "EX"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = var(1)

[State EX6S]
type = ChangeState
value = 1035
triggerall=map(EXLimiter3)=0
triggerall = power>=1000||map(phoenix)=0
triggerall = command = "holdfwd"
triggerall = command = "EX"
trigger1 = ctrl
trigger2 = var(1)

[State 6S]
type = ChangeState
value = 1025
triggerall=stateno!=40
triggerall = stateno!=1025
triggerall = command = "holdfwd"
triggerall = command = "b"
triggerall = command != "c" && command != "EX"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)

[State j6S]
type = ChangeState
value = 1030
triggerall = stateno!=1030
triggerall = command = "holdfwd"
triggerall = command = "b"
triggerall = command != "c" && command != "EX"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = var(1)

[State Overhead]
type = ChangeState
value =  750
triggerall=stateno!=100
triggerall=stateno!=40
trigger1 = statetype != A
triggerall = command = "y"
triggerall = command = "holdfwd"
triggerall = command !="holddown"
triggerall = command !="holdup"
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact ;&& enemynear, movetype = H
trigger3 = (stateno = 210) && movecontact ;&& enemynear, movetype = H
trigger4 = (stateno = 400) && movecontact ;&& enemynear, movetype = H
trigger5 = stateno = 410 && movecontact ;&& enemynear, movetype = H
trigger6 = stateno = 101 

[State 5L]
type = ChangeState
value = 200
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 400 && movecontact&&prevstateno!=200
trigger3 = stateno = 200 && movecontact
trigger4 = stateno = 101 
 
[State 5M]
type = ChangeState
value =  210
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact ;&& enemynear, movetype = H
;trigger3 = stateno = 100 && time > 3
trigger3 = stateno = 400 && movecontact ;&& enemynear, movetype = H
trigger4 = stateno = 410 && movecontact&&prevstateno!=210

[State 6H]
type = ChangeState
value =  230
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
trigger1 = statetype != A
triggerall = command = "z"
triggerall = command = "holdfwd"
triggerall = command !="holddown"
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact ;&& enemynear, movetype = H
trigger3 = (stateno = 210) && movecontact ;&& enemynear, movetype = H
trigger4 = (stateno = 220) && movecontact ;&& enemynear, movetype = H
trigger5 = (stateno = 410) && movecontact ;&& enemynear, movetype = H
trigger6 = (stateno = 420) && movecontact ;&& enemynear, movetype = H
trigger7 = stateno = 101 
trigger8 = stateno = 400 && movecontact ;&& enemynear, movetype = H

[State 5H]
type = ChangeState
value =  220
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
trigger1 = statetype != A
triggerall = command = "z"
triggerall = command != "holddown"
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact ;&& enemynear, movetype = H
trigger3 = (stateno = 210) && movecontact ;&& enemynear, movetype = H
trigger4 = (stateno = 410) && movecontact ;&& enemynear, movetype = H
trigger5 = stateno = 420 && movecontact&&prevstateno!=220
;trigger6 = stateno = 100 && time > 3
trigger6 = stateno = 400 && movecontact ;&& enemynear, movetype = H

;---------------------------------------------------------------------------
[State 2L]
type = ChangeState
value = 400
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "x"
triggerall = command = "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact&&prevstateno!=400
trigger3 = stateno = 400 && movecontact ;&& enemynear, movetype = H

;---------------------------------------------------------------------------
[State 2M]
type = ChangeState
value = 410
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 200) 
trigger2 = (movecontact) ;&& enemynear, movetype = H
trigger3 = stateno = 210 && movecontact&&prevstateno!=410


;---------------------------------------------------------------------------
[State 3H]
type = ChangeState
value = 430
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = command = "holdfwd"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 410) || (stateno = 210)  || (stateno = 200) || (stateno = 220)|| (stateno = 420)
trigger2 = (movecontact) ;&& enemynear, movetype = H
trigger3 = stateno = 101

;---------------------------------------------------------------------------
[State 2H]
type = ChangeState
value = 420
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = command != "holdfwd"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 410)|| (stateno = 200)|| (stateno = 210)
trigger2 = (movecontact) ;&& enemynear, movetype = H
trigger3 = stateno = 220 && movecontact&&prevstateno!=420

;---------------------------------------------------------------------------
[State jL]
type = ChangeState
value = 600
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "x"
triggerall = statetype = A
trigger1 = ctrl || stateno = [60,61]
trigger2= stateno = 600 && movecontact || stateno = [600, 630] && movehit
;---------------------------------------------------------------------------
[State jM]
type = ChangeState
value = 610
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "y"
triggerall = statetype = A
trigger1 = ctrl || stateno = [60,61]
trigger2 = stateno = 600 && movecontact || stateno = 630 && movehit

;---------------------------------------------------------------------------
[State jH]
type = ChangeState
value = 630
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "z"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = (stateno = [600,610]) && movecontact
;---------------------------------------------------------------------------

;========================================================
[State R Phoenix Stance]
type = ChangeState
value = 500
triggerall=map(gwing)
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "c" 
triggerall = command!="b"&&command!="EX"
triggerall = statetype != A
trigger1 = var(1)

[State jR Air Stance]
type = ChangeState
value = 550
triggerall=map(awing)
triggerall = roundstate = 2 ;only attack during the round
;triggerall = command != "holdfwd"
;triggerall = command = "holddown"
triggerall = pos y<-30
triggerall = prevstateno != 850
triggerall = command = "c"
triggerall = statetype = A
trigger1 = ctrl || stateno = [60, 61]
trigger2 = (stateno = [600,640]) 
trigger2 = movecontact ;&& enemynear, movetype = H 
trigger3 = stateno = 1350 ;Air blocking
