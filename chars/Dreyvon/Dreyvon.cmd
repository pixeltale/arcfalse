[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s

;-| Default Values |-------------------------------------------------------
[Defaults]
; Default value for the "time" parameter of a Command. Minimum 1.
command.time = 15
command.buffer.time =1

[Statedef -1]

;===========================================================================
[State -1, Combo condition Reset]
type = null
triggerall = 1
trigger1 = var(1) := 0
trigger2 = var(2) := 0

[State -1, Combo condition Check]
type = VarSet
trigger1 = ctrl
trigger2 = stateno = [200,620]
trigger2 = movecontact
var(1) = 1
[State -1, Combo condition Check]
type = VarSet
trigger1 = stateno = [1000,3000) && MoveContact
var(2) = 1

;Triple Kung Fu Palm (uses one super bar)
[State -1, Triple Kung Fu Palm]
type = ChangeState
value = 3000
triggerall= statetype != A
triggerall = command = "236x"
triggerall = power >= 2000
trigger1 = ctrl || var(1) || var(2)

;Triple Kung Fu Palm (uses one super bar)
[State -1, Triple Kung Fu Palm]
type = ChangeState
value = 3010
triggerall= statetype != A
triggerall = command = "214x"
triggerall = power >= 2000
trigger1 = ctrl || var(1) || var(2)

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
;Aerial Dash
[State -1, Airdash]
type = ChangeState
value = 60
triggerall = command = "a66" || (command = "dash" && teammode !=tag) || (command = "dash" && teammode=tag && partner,stateno=5150)
triggerall = command != "holdback" 
trigger1 = statetype = A
trigger1 = ctrl
triggerall = stateno!=904
triggerall = var(29)>0
triggerall = (pos y<-30 && vel y < 0) || (vel y >=0)
;Aerial Backdash
[State -1, Air Backdash]
type = ChangeState
value = 61
triggerall = command = "a44" || (command = "dash" && teammode !=tag) || (command = "dash" && teammode=tag && partner,stateno=5150)
triggerall = command = "holdback" 
trigger1 = statetype = A
trigger1 = ctrl
triggerall = stateno!=903
triggerall = var(29)>0
triggerall = (pos y<-30 && vel y < 0) || (vel y >=0)

;---------------------------------------------------------------------------
[State -1, EX 6S]
type = ChangeState
value = 1120
triggerall=map(EXLimiter1)=0
triggerall = power>=1000
triggerall = command = "EX"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl || var(1)
;---------------------------------------------------------------------------
[State -1, 6S]
type = ChangeState
value = 1100
triggerall = command = "b"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl || var(1)

;---------------------------------------------------------------------------
[State -1, EX 2S]
type = ChangeState
value = 1310
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = !numexplod(924681) ;this is the new ex limiter
triggerall = power>=1000
triggerall = command = "EX"
triggerall = command = "holddown"
triggerall = command != "holdback"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3=stateno=105

;---------------------------------------------------------------------------
[State -1, EX j2S]
type = ChangeState
value = 1315
triggerall = stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = !numexplod(924681) ;this is the new ex limiter
triggerall = power>=1000
triggerall = command = "EX"
triggerall = command = "holddown"
triggerall = command != "holdback"
triggerall = statetype = A
trigger1 = ctrl
trigger2 =movecontact
trigger2 = hitdefattr = A, NA
;---------------------------------------------------------------------------
[State -1, 2S]
type = ChangeState
value = 1300
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "b"
triggerall = command != "c"
triggerall = command = "holddown"
triggerall = command != "holdback"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3=stateno=105
;trigger3 = stateno = 100

;---------------------------------------------------------------------------
[State -1, j2S]
type = ChangeState
value = 1305
triggerall = stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "b"
triggerall = command != "c"
triggerall = command = "holddown"
triggerall = command != "holdback"
triggerall = statetype = A
trigger1 = ctrl
trigger2 =movecontact
trigger2 = hitdefattr = A, NA
trigger3 = (stateno = 630) && movecontact ;&& enemynear, movetype = H
;---------------------------------------------------------------------------
[State -1, EX 4S]
type = ChangeState
value = 1002
triggerall=map(EXLimiter2)=0
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = power>=1000
triggerall = command = "EX"
triggerall = command = "holdback"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3=stateno=105
;trigger4 = stateno = 100
;---------------------------------------------------------------------------
[State -1, 4S]
type = ChangeState
value = 1000
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "b"
triggerall = command != "c"
triggerall = command = "holdback"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3=stateno=105
;trigger3 = stateno = 100

;---------------------------------------------------------------------------
[State -1, EX 5S]
type = ChangeState
value = 1510
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = !numexplod(924680) ;this is the new ex limiter
triggerall = power>=1000
triggerall = command = "EX"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3=stateno=105
;trigger3 = stateno = 1001 || stateno = 1002 || stateno = 1101|| stateno = 1102
;trigger3 = movecontact ;&& enemynear, movetype = H
;trigger4 = stateno = 100
;---------------------------------------------------------------------------

[State -1, 5S]
type = ChangeState
value = 1500
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "b"
triggerall = command != "c"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3=stateno=105
;trigger3 = stateno = 100

[State -1, J.6R: Ball Throw - Upwards]
type = ChangeState
value = 255
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "c"
triggerall = command != "b"
triggerall = command = "holdback"
triggerall = command != "holddown"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = (stateno = 600) && movecontact ;&& enemynear, movetype = H
trigger3 = (stateno = 610) && movecontact ;&& enemynear, movetype = H
trigger4 = (stateno = 620) && movecontact ;&& enemynear, movetype = H
trigger5 = (stateno = 630) 
trigger5 = movecontact ;&& enemynear, movetype = H 
trigger7 = stateno = 100  
trigger8 = movecontact ;&& enemynear, movetype = H


[State -1, J.2R: Ball Throw - Downwards]
type = ChangeState
value = 254
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "c"
triggerall = command != "b"
triggerall = command = "holddown"
triggerall = command != "holdfwd"
triggerall = command != "holdback"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = (stateno = 600) && movecontact ;&& enemynear, movetype = H
trigger3 = (stateno = 610) && movecontact ;&& enemynear, movetype = H
trigger4 = (stateno = 620) && movecontact ;&& enemynear, movetype = H
trigger5 = (stateno = 630) 
trigger5 = movecontact ;&& enemynear, movetype = H 
trigger7 = stateno = 100  
trigger8 = movecontact ;&& enemynear, movetype = H

[State -1, J.6R: Ball Throw - Forwards]
type = ChangeState
value = 253
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "c"
triggerall = command != "b"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = (stateno = 600) && movecontact ;&& enemynear, movetype = H
trigger3 = (stateno = 610) && movecontact ;&& enemynear, movetype = H
trigger4 = (stateno = 620) && movecontact ;&& enemynear, movetype = H
trigger5 = (stateno = 630) 
trigger5 = movecontact ;&& enemynear, movetype = H 
trigger7 = stateno = 100  
trigger8 = movecontact ;&& enemynear, movetype = H

[State -1, 4R: Ball Throw - Diagonal]
type = ChangeState
value = 252
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "c"
triggerall = command != "b"
triggerall = command = "holdback"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact ;&& enemynear, movetype = H
trigger3 = (stateno = 210) && movecontact ;&& enemynear, movetype = H
trigger4 = (stateno = 211) && movecontact ;&& enemynear, movetype = H
trigger5 = (stateno = 220) 
trigger5 = movecontact ;&& enemynear, movetype = H
trigger6 = (stateno = 1203) 
trigger7 = stateno = 100 
trigger8 = (stateno = [400,499]) 
trigger8 = movecontact ;&& enemynear, movetype = H

[State -1, 6R: Ball Throw - Forwards]
type = ChangeState
value = 251
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "c"
triggerall = command != "b"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact ;&& enemynear, movetype = H
trigger3 = (stateno = 210) && movecontact ;&& enemynear, movetype = H
trigger4 = (stateno = 211) && movecontact ;&& enemynear, movetype = H
trigger5 = (stateno = 220) 
trigger5 = movecontact ;&& enemynear, movetype = H
trigger6 = (stateno = 1203) 
trigger7 = stateno = 100 
trigger8 = (stateno = [400,499]) 
trigger8 = movecontact ;&& enemynear, movetype = H

[State -1, 2R: Ball Throw - Up]
type = ChangeState
value = 1050
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = !numhelper(1052)=1
triggerall = command = "c"
triggerall = command != "b"
triggerall = command = "holddown"
triggerall = command != "holdback"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact ;&& enemynear, movetype = H
trigger3 = (stateno = 210) && movecontact ;&& enemynear, movetype = H
trigger4 = (stateno = 211) && movecontact ;&& enemynear, movetype = H
trigger5 = (stateno = 220) 
trigger5 = movecontact ;&& enemynear, movetype = H
trigger6 = (stateno = 1203) 
trigger7 = stateno = 100 
trigger8 = (stateno = [400,499]) 
trigger8 = movecontact ;&& enemynear, movetype = H
trigger9 = stateno = 1102 && movehit =1 ;&& enemynear, movetype = H

[State -1, 5R: Ball Toss]
type = ChangeState
value = 250
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "c"
triggerall = command != "b"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact ;&& enemynear, movetype = H
trigger3 = (stateno = 210) && movecontact ;&& enemynear, movetype = H
trigger4 = (stateno = 211) && movecontact ;&& enemynear, movetype = H
trigger5 = (stateno = 220) 
trigger5 = movecontact ;&& enemynear, movetype = H
trigger6 = (stateno = 1203) 
trigger7 = stateno = 100 
trigger8 = (stateno = [400,499]) 
trigger8 = movecontact ;&& enemynear, movetype = H

;---------------------------------------------------------------------------
;Forward Dash
[State -1, Run!!]
type = ChangeState
value = 100
triggerall = stateno!=105
triggerall = stateno!=100
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
;Taunt - No Input
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = GameMode != "Training"
triggerall = command = "start"
triggerall = command != "holdback"
triggerall = command != "holdup"
triggerall = command != "holdfwd"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl

;===========================================================================
;Taunt - FWD
[State -1, Taunt]
type = ChangeState
value = 2000
triggerall = GameMode != "Training"
triggerall = command = "start"
triggerall = command != "holdback"
triggerall = command != "holdup"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl

;===========================================================================
;Taunt - Down+FWD
[State -1, Taunt]
type = ChangeState
value = 2001
triggerall = GameMode != "Training"
triggerall = command = "start"
triggerall = command != "holdback"
triggerall = command != "holdup"
triggerall = command = "holdfwd"
triggerall = command = "holddown"
trigger1 = statetype != A
trigger1 = ctrl

;===========================================================================
;Taunt - Down
[State -1, Taunt]
type = ChangeState
value = 2002
triggerall = GameMode != "Training"
triggerall = command = "start"
triggerall = command != "holdback"
triggerall = command != "holdup"
triggerall = command != "holdfwd"
triggerall = command = "holddown"
trigger1 = statetype != A
trigger1 = ctrl

;===========================================================================
;Taunt - Down+Back
[State -1, Taunt]
type = ChangeState
value = 2003
triggerall = GameMode != "Training"
triggerall = command = "start"
triggerall = command = "holdback"
triggerall = command != "holdup"
triggerall = command != "holdfwd"
triggerall = command = "holddown"
trigger1 = statetype != A
trigger1 = ctrl

;===========================================================================
;Taunt - Down+Back
[State -1, Taunt]
type = ChangeState
value = 2004
triggerall = GameMode != "Training"
triggerall = command = "start"
triggerall = command = "holdback"
triggerall = command != "holdup"
triggerall = command != "holdfwd"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl

;---------------------------------------------------------------------------
;6H
[State -1, 6H]
type = ChangeState
value =  221
triggerall = statetype != A
triggerall = command = "z"
triggerall = command != "holddown"
triggerall = command = "holdfwd"
trigger1 = ctrl
trigger2 = stateno=410||stateno=400||stateno=420
trigger2 = prevstateno!=700&&movecontact
trigger3 = stateno=200||stateno=202||stateno=203||stateno=220||stateno=212||stateno=210||stateno=201
trigger3=movecontact

;---------------------------------------------------------------------------
;5L
[State -1, 5L]
type = ChangeState
value = 200
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
trigger1 = command = "x"
trigger3 = command = "x"
trigger4 = command = "x"
triggerall = command != "holddown" && var(59) !=4
;triggerall = stateno !=40
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = command = "buffer_x"
trigger2 = movecontact ;&& enemynear, movetype = H
trigger2 = (stateno = 200)
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = (stateno = 1203) && time > 5
trigger4 = stateno = 100 && time > 11 ;&& command = "bufferedx"  ;|| stateno = 40
 trigger5 = stateno = 400 && movecontact && prevstateno!=200
trigger5 = command = "buffer_x"

;---------------------------------------------------------------------------
;Stand Strong Punch
[State -1, 5M]
type = ChangeState
value = 211
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact ;&& enemynear, movetype = H
trigger3 = (stateno = 210) && movecontact ;&& enemynear, movetype = H
trigger4 = (stateno = 1203) && time > 5
trigger5 = stateno = 100 && time > 11 || stateno = 110 && time > 11  ;|| stateno = 40
trigger6 = (stateno = 410) && movecontact && prevstateno!=211
trigger7 = (stateno = 400) && movecontact && prevstateno!=211

[State -1, 5H]
type = ChangeState
value = 220
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "z"
triggerall = command != "holddown"
;triggerall = stateno !=40
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact ;&& enemynear, movetype = H
trigger3 = (stateno = 210) && movecontact ;&& enemynear, movetype = H
trigger4 = (stateno = 211) && movecontact ;&& enemynear, movetype = H
trigger5 = (stateno = 1203) && time > 5
trigger6 = stateno = 100 && time > 11 || stateno = 110 && time > 11  ;|| stateno = 40
trigger7 =(stateno = [400,499])  && movecontact && time > 5 &&stateno!=420
trigger8 = (stateno = 420) && movecontact && prevstateno!=220

;---------------------------------------------------------------------------
;---------------------------------------------------------------------------

;---------------------------------------------------------------------------
;Crouching Light Punch
[State -1, Crouching Light Punch]
type = ChangeState
value = 400
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "buffer_x"
triggerall = command = "holddown"
triggerall = stateno !=40
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact && prevstateno!=400
trigger3 = stateno = 400 && movecontact ;&& enemynear, movetype = H
trigger4 = (stateno = 1203) && time > 5
trigger5 = stateno = 100 && time > 11 || stateno = 110 && time > 11  ;|| stateno = 40

;---------------------------------------------------------------------------
;Crouching Strong Punch
[State -1, Crouching Strong Punch]
type = ChangeState
value = 410
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "y"
triggerall = command = "holddown"
;triggerall = stateno !=40
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 200)|| (stateno = 210)
trigger2 = (movecontact) ;&& enemynear, movetype = H
trigger3 = (stateno = 1203) && time > 5
trigger4 = stateno = 100 && time > 11 || stateno = 110 && time > 11 ;|| stateno = 40
trigger5 = (stateno = 211) && movecontact && prevstateno!=410

;---------------------------------------------------------------------------
;1H
[State -1, 1H]
type = ChangeState
value = 230
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = command = "holdback"
;triggerall = stateno !=40
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 200)|| (stateno = 210)||(stateno = 211)|| (stateno = 410)
trigger2 = (movecontact) ;&& enemynear, movetype = H
trigger3 = (stateno = 1203) && time > 5
trigger4 = stateno = 100 && time > 11 || stateno = 110 && time > 11  ;|| stateno = 40
trigger5 = (stateno = 220) && movecontact && prevstateno!=420&& prevstateno!=430

;---------------------------------------------------------------------------
;3H
[State -1, 3H]
type = ChangeState
value = 430
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = command = "holdfwd"
;triggerall = stateno !=40
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 200)|| (stateno = 210)||(stateno = 211)|| (stateno = 410)
trigger2 = (movecontact) ;&& enemynear, movetype = H
trigger3 = (stateno = 1203) && time > 5
trigger4 = stateno = 100 && time > 11 || stateno = 110 && time > 11  ;|| stateno = 40
trigger5 = (stateno = 420) && movecontact && prevstateno!=220

;---------------------------------------------------------------------------
;2H
[State -1, 2H]
type = ChangeState
value = 420
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "z"
triggerall = command = "holddown"
;triggerall = stateno !=40
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 200)|| (stateno = 210)||(stateno = 211)|| (stateno = 410)
trigger2 = (movecontact) ;&& enemynear, movetype = H
trigger3 = (stateno = 1203) && time > 5
trigger4 = stateno = 100 && time > 11  || stateno = 110 && time > 11 ;|| stateno = 40
trigger5 = (stateno = 220) && movecontact && prevstateno!=420&& prevstateno!=430



;---------------------------------------------------------------------------
;Jump Light Punch
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "buffer_x"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = movehit && stateno = 600 ;&& enemynear, movetype = H
trigger3 = stateno = 1350 ;Air blocking
trigger4 = stateno = 620 && movehit
trigger5 = stateno = 610 && movehit

;---------------------------------------------------------------------------
;Jump Strong Punch
[State -1, Jump Strong Punch]
type = ChangeState
value = 610
triggerall = stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "y"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 601  ;jump_x or jump_a
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1350 ;Air blocking
;trigger4 = stateno = 904 && time > 2
trigger4 = stateno = 620 && movehit


;---------------------------------------------------------------------------
;J.6H
[State -1, Jump Light Kick]
type = ChangeState
value = 630
triggerall = stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "z"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 1350 ;Air blocking
trigger3 = stateno = 600 || stateno = 610|| stateno = 620 
trigger3 = movecontact ;&& enemynear, movetype = H
;---------------------------------------------------------------------------
;Jump Light Kick
[State -1, Jump Light Kick]
type = ChangeState
value = 620
triggerall = stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "z"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 1350 ;Air blocking
trigger3 = stateno = 600 || stateno = 610 
trigger3 = movecontact ;&& enemynear, movetype = H

;---------------------------------------------------------------------------
[State 100, Forward Dash Cancel]
type = ChangeState
value = 100
triggerall = command = "FF" || (command = "dash"&&teammode!=tag) || (command = "dash"&&teammode=tag && partner,stateno=5150)
triggerall = command != "holdback"
triggerall = movehit
triggerall = statetype != A
triggerall = map(dc)=0
trigger1 = stateno = [1001,1002] || stateno = [1101,1102] || stateno = 1500 || stateno = 1300
[State 100, Back Dash Cancel]
type = ChangeState
value = 105
triggerall = command = "BB" || (command = "dash"&&teammode!=tag) || (command = "dash"&&teammode=tag && partner,stateno=5150)
triggerall = command = "holdback"
triggerall = movehit
triggerall = statetype != A
triggerall = map(dc)=0
trigger1 = stateno = [1001,1002] || stateno = [1101,1102] || stateno = 1500 || stateno = 1300
[State 100, Forward Dash Cancel]
type = ChangeState
value = 904
triggerall = command = "aFF" || (command = "dash"&&teammode!=tag) || (command = "dash"&&teammode=tag && partner,stateno=5150)
triggerall = command != "holdback"
triggerall = movehit
triggerall = statetype = A
triggerall = map(dc)=0
triggerall = map(g2s)=0
trigger1 = stateno = 1305 || stateno = 1301 || stateno = 1304
[State 100, Forward Dash Cancel]
type = ChangeState
value = 903
triggerall = command = "aBB" || (command = "dash"&&teammode!=tag) || (command = "dash"&&teammode=tag && partner,stateno=5150)
triggerall = command = "holdback"
triggerall = movehit
triggerall = statetype = A
triggerall = map(dc)=0
triggerall = map(g2s)=0
trigger1 = stateno = 1305 || stateno = 1301 || stateno = 1304


[State 100, Forward Dash Cancel]
type = ChangeState
value = 100
triggerall = command = "FF" || (command = "dash"&&teammode!=tag) || (command = "dash"&&teammode=tag && partner,stateno=5150)
triggerall = command != "holdback"
triggerall = movehit
triggerall = statetype != A
triggerall = map(ndc)=0
trigger1 = hitdefattr = SCA,NA
[State 100, Back Dash Cancel]
type = ChangeState
value = 105
triggerall = command = "BB" || (command = "dash"&&teammode!=tag) || (command = "dash"&&teammode=tag && partner,stateno=5150)
triggerall = command = "holdback"
triggerall = movehit
triggerall = statetype != A
triggerall = map(ndc)=0
trigger1 = hitdefattr = SCA,NA

[State 100, Forward Dash Cancel]
type = ChangeState
value = 904
triggerall = command = "aFF" || (command = "dash"&&teammode!=tag) || (command = "dash"&&teammode=tag && partner,stateno=5150)
triggerall = command != "holdback"
triggerall = movehit
triggerall = statetype = A
triggerall = map(ndc)=0
trigger1 = hitdefattr = SCA,NA
[State 100, Forward Dash Cancel]
type = ChangeState
value = 903
triggerall = command = "aBB" || (command = "dash"&&teammode!=tag) || (command = "dash"&&teammode=tag && partner,stateno=5150)
triggerall = command = "holdback"
triggerall = movehit
triggerall = statetype = A
triggerall = map(ndc)=0
trigger1 = hitdefattr = SCA,NA


;[State -1, Standing Parry]
;type = HitOverRide
;trigger1 = roundstate = 2 && (statetype != A || stateno = 5120)
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