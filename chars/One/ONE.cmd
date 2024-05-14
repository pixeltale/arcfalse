; The CMD file.
;-| Default Values |-------------------------------------------------------
[Defaults]
command.time = 15
command.buffer.time = 3

[Statedef -1]

;===========================================================================
;===========================================================================
[State -1, Combo condition Reset]
type = VarSet
trigger1 = 1
var(1) = 0

[State -1, Combo condition Check]
type = VarSet
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,299]) || (stateno = [400,499]) || (stateno=643 && animelemtime(6) = [3,6])
trigger2 = movecontact ;&& enemynear, movetype = H
trigger2 = stateno!=421 && stateno!= 453
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = 105
var(1) = 1

;---------------------------------------------------------------------------
[State 3013, j236X: Air Super Dash Slash]
type = ChangeState
value = 3013
triggerall = command = "236X"
triggerall = power >= 2000
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = statetype = A
trigger2 = hitdefattr = A, NA, SA
trigger2 = stateno != [3000,3050)
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = 1053 && movecontact ;&& enemynear, movetype = H

;---------------------------------------------------------------------------
;[State 3010, 623X: Acrid Shoryu]
;type = ChangeState
;value = 3000
;triggerall = command = "623X"
;triggerall = power >= 2000
;trigger1 = statetype != A
;trigger1 = ctrl
;trigger2 = statetype != A
;trigger2 = hitdefattr = SC, NA, SA, HA
;trigger2 = stateno != [3000,3050)
;trigger2 = movecontact ;&& enemynear, movetype = H
;trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
;trigger4 = stateno = 1053 && movecontact ;&& enemynear, movetype = H

;---------------------------------------------------------------------------

[State 3010, 236X: Super Dash Slash]
type = ChangeState
value = 3010
triggerall = command = "236X"
triggerall = power >= 2000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != [3000,3050)
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = 1053 && movecontact ;&& enemynear, movetype = H

;---------------------------------------------------------------------------
[State 3050, 214X: Timestop]
type = ChangeState
value = 3050
triggerall = command = "214X"
triggerall = power >= 4000
triggerall = !var(50)
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != [3000,3050)
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = 1053 && movecontact ;&& enemynear, movetype = H
;===========================================================================

;---------------------------------------------------------------------------

;Super Jump
[State -1, Super Jump]
type = ChangeState
value = 55
triggerall = statetype != A
triggerall = command = "28" || command = "27" || command = "29"
trigger1 = stateno = 100
trigger2 = (stateno = 220 || stateno = 430) && movehit
trigger3 = ctrl

[State 45, DJC]
type = ChangeState
value = 45
triggerall = command = "up" || movecontact && command = "holdup"
triggerall = numexplod(2045)
triggerall = stateno!=45 && stateno!=46 && stateno!= 434 && stateno != [903, 904] && !(stateno = [55, 56] && time < 6)
triggerall = var(45)>0
triggerall = !(stateno = 4001 && vel y < 0)
trigger1 = stateno!= 1055 && stateno !=1052 && ctrl && stateno!=45 && stateno!=46 && stateno!=50 && stateno!=40 && stateno!= 434
trigger2 = stateno!= 1055 && stateno !=1052 && movecontact  && enemynear, movetype = H
trigger2 = stateno!= 1055 && stateno !=1052 && hitdefattr = A, NA
trigger3 = stateno!= 1055 && stateno !=1052 && stateno=45 || stateno=46|| stateno=50 
trigger4 = stateno = 1055 && movehit =1

[State 1034, 2EX: EX Shoryu]
type = ChangeState
value = 1034
triggerall = power>=1000
triggerall = var(39)<=0
triggerall = !var(50)
triggerall = command = "b" && command = "c" || (command = "EX") && teammode != Tag
triggerall = command = "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)

[State 1030, 2S: Shoryu]
type = ChangeState
value = 1030
triggerall = !var(50)
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)

;[State 10301, j2EX: Air EX Shoryu]
;type = ChangeState
;value = 10301
;triggerall = power>=1000
;triggerall = !var(50)
;triggerall = var(3)<=0
;triggerall = command = "b" && command = "c" || (command = "EX") && teammode != Tag
;triggerall = command = "holddown"
;trigger1 = statetype = A
;trigger1 = ctrl
;trigger2 = var(1)
;trigger3 = (stateno = 610)||(stateno = 620)||(stateno = 630)
;trigger3 = movecontact ;&& enemynear, movetype = H

;[State 10300, j2S: Air Shoryu]
;type = ChangeState
;value = 10300
;triggerall = !var(50)
;triggerall = command = "b"
;triggerall = command = "holddown"
;trigger1 = statetype = A
;trigger1 = ctrl
;trigger2 = var(1)
;trigger3 = (stateno = 610)||(stateno = 620)||(stateno = 630) 
;trigger3 = movecontact ;&& enemynear, movetype = H

[State 1027, j6EX: EX Shredder]
type = ChangeState
value = 1027
triggerall = power>=1000 
triggerall = command = "b" && command = "c" || (command = "EX") && teammode != Tag
triggerall = command = "holdfwd"
triggerall = !var(50)
triggerall = statetype = A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = (stateno = [600,650]) && movehit && stateno != [642,643]

[State 1020, j6S: Shredder]
type = ChangeState
value = 1020
triggerall = command = "b"
triggerall = command = "holdfwd"
triggerall = statetype = A
triggerall = !var(50)
trigger3 = var(1)
trigger1 = ctrl
trigger2 = (stateno = [600,650]) && movecontact && stateno != [642,643]

[State 1240, 6EX: EX Dash Slash]
type = ChangeState
value = 1240
triggerall = power>=1000
triggerall = var(36)<=0
triggerall = !var(50)
triggerall = command = "b" && command = "c" || (command = "EX") && teammode != Tag
triggerall = command = "holdfwd"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = 1000 && movecontact ;&& enemynear, movetype = H 

[State 1040, 6S: Dash Slash]
type = ChangeState
value = 1040
triggerall = !var(50)
triggerall = command = "b"
triggerall = command = "holdfwd"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)

[State 1010, 4EX: EX Slashes]
type = ChangeState
value = 1010
triggerall = power >= 1000
triggerall = !var(50)
triggerall = command = "b" && command = "c" || (command = "EX") && teammode != Tag
triggerall = command = "holdback" || command = "back"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = [100,101]

[State 100, 4S: Slashes]
type = ChangeState
value = 1000
triggerall = !var(50)
triggerall = command = "b"
triggerall = command = "holdback"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = [100,101]


[State 12251, jEX: EX Air Flip]
type = ChangeState
value = 12251
triggerall = power>=1000
triggerall = var(38)<=0
trigger1 = statetype = A
triggerall = command = "b" && command = "c" || (command = "EX") && teammode != Tag
trigger1 = ctrl
trigger2 = (stateno = [600,650]) && movecontact = 1 && stateno != [642,643]
trigger4 = stateno = 1057 && movecontact = 1
trigger5 = stateno = 1000 && movecontact


[State 1151, jS: Air Flip]
type = ChangeState
value = 1151
trigger1 = statetype = A
triggerall = command = "b"
trigger1 = ctrl
trigger2 = (stateno = [600,650]) && movecontact && stateno != [642,643]


[State 1250, 5EX: EX Flip]
type = ChangeState
value = 1250
triggerall = var(37)<=0
triggerall = power>=1000
triggerall = command = "b" && command = "c" || (command = "EX") && teammode != Tag
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
;trigger3 = stateno = 1053

[State 1050, 5S: Flip]
type = ChangeState
value = 1050
triggerall = !map(NoJump)
triggerall = command = "b"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = 101
;trigger4 = stateno = 100

;---------------------------------------------------------------------------
[State 904, j66: Forward Airdash]
type 	= ChangeState
value 	= 904
triggerall 	= command != "holdback"
triggerall 	= command = "a66" || teammode != Tag && command = "M66"
trigger1 	= statetype = A
trigger1 	= ctrl
trigger2 	= (stateno = [600,640]) && movehit
triggerall 	= stateno!=904
triggerall 	= var(29)>0
triggerall 	= pos y <= -45

;---------------------------------------------------------------------------
[State 903, j44: Backward Airdash]
type = ChangeState
value = 903
triggerall = command = "a44" || teammode != Tag && command = "M44"
trigger1 = statetype = A
trigger1 = ctrl
;trigger2 = (stateno = [600,640]) 
;trigger2 = movecontact
triggerall = stateno!=903
triggerall = var(29)>0
triggerall = pos y <= -45

;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
[State 105, 44: Backdash]
type = ChangeState
value = 105
triggerall = command = "44" || command = "M44"
trigger1 = statetype != A
trigger1 = ctrl || stateno = 20
trigger2 = stateno = 250 && time > 12
trigger3 = stateno = 111250 && time>17
trigger4 = stateno = 111251 && time>17
triggerall = stateno!=105

[State 100, 66: Forward Run] ;Dash
type = ChangeState
value = 100
triggerall = command = "66" || command = "M66" && command != "back" && command != "holdback"
triggerall = stateno!=100
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 250 && time > 12
trigger3 = stateno = [111250,111251] && time>17
trigger4 = stateno = 251 && movecontact ;5R ~R Hit
trigger5 = stateno = 1010 && movecontact



;===========================================================================
;---------------------------------------------------------------------------

[State 200, 5L: Light Attack]
type = ChangeState
value = 200
triggerall = command = "x"
triggerall = var(50)=0
triggerall = command != "holddown" && var(59) !=4
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = command = "buffer_x"
trigger2 = movecontact ;&& enemynear, movetype = H
trigger2 = (stateno = 400) && time>1
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 101

[State 205, ono5L: Ono Light Attack]
type = ChangeState
value = 205
triggerall = command = "x"
triggerall = var(50)!=0
triggerall = command != "holddown" && var(59) !=4
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 101

[State 210, 4M: Back Medium Attack]
type = ChangeState
value =  210
triggerall = command = "y"
triggerall = command = "holdback"
triggerall = var(50)=0
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact ;&& enemynear, movetype = H
trigger3 = (stateno = 400) && movecontact
trigger6 = stateno = 101

[State 211, 5M: Medium Attack]
type = ChangeState
value =  211
;triggerall = anim = 220
triggerall = command = "buffer_y"
;triggerall = command != "holddown"
triggerall = var(50)=0
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 420) && movecontact ;&& enemynear, movetype = H
trigger3 = (stateno = 210) && movecontact ;&& enemynear, movetype = H
trigger4 = (stateno = 200) && movecontact ;&& enemynear, movetype = H
trigger5 = (stateno = 400) && movecontact ;&& enemynear, movetype = H
trigger6 = (stateno = 405) && movecontact
trigger7 = stateno = 101


[State 220, 5H: Heavy Attack]
type = ChangeState
value =  220
triggerall = command = "z"
triggerall = var(50)=0
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact
trigger3 = (stateno = [210,211]) && movecontact 
trigger4 = (stateno = 400) && movecontact 
trigger5 = (stateno = 410) && movecontact 
trigger6 = (stateno = 420) && movecontact 
trigger7 = stateno = 101

;Charge 5H
;[State 221, Charge 5H]
;type = ChangeState
;value = 221
;triggerall = command = "hold_z"  
;triggerall = stateno !=220 
;triggerall = stateno !=221
;triggerall = command != "holdfwd"
;trigger1 = statetype = S
;trigger1 = ctrl



[State 215, ono5M: Ono Standing Medium]
type = ChangeState
value =  215
triggerall = var(50)!=0
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 205 && movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 101
trigger4 = stateno = 425 && movecontact ;&& enemynear, movetype = H


[State 225, ono5H: Ono Standing Heavy]
type = ChangeState
value = 225
triggerall = var(50)!=0
triggerall = command = "z"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = [200,215]) && movecontact ;&& enemynear, movetype = H
trigger3 = (stateno = [400,425]) && movecontact ;&& enemynear, movetype = H
trigger4 = stateno = 101
trigger5 = (stateno = 440) && movecontact =1 ;&& enemynear, movetype = H

[State 440, 3H: Trip]
type = ChangeState
value = 440
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = command = "holdfwd"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 425)|| (stateno = 215)||(stateno = 200)||(stateno = 210)||(stateno = 211)||(stateno = 220)||(stateno = 420)
trigger2 = (movecontact) ;&& enemynear, movetype = H


;---------------------------------------------------------------------------
[State 450, 2R: Upwards Sword Toss]
type = ChangeState
value = 450
triggerall = !var(50)
triggerall = command = "c"
triggerall = command = "holddown"
triggerall = statetype != A 
trigger1 = ctrl
trigger2 = (stateno =[200,249])|| (stateno =[400,449])
trigger2 = (movecontact) ;&& enemynear, movetype = H

;---------------------------------------------------------------------------
[State 400, 2L: Crouching Light Attack]
type = ChangeState
value = 400
triggerall = command = "buffer_x"
triggerall = command = "holddown"
triggerall = statetype != A 
trigger1 = ctrl
trigger2 = stateno = 200
trigger2 = movecontact ;&& enemynear, movetype = H

;---------------------------------------------------------------------------
[State 420, 2M: Crouching Medium Attack]
type = ChangeState
value = 420
triggerall = var(50)=0
triggerall = command = "buffer_y"
triggerall = command = "holddown"
triggerall = statetype != A 
trigger1 = ctrl
trigger2 = stateno = [400, 410]|| (stateno = [200,211])
trigger2 = movecontact

;---------------------------------------------------------------------------
[State 430, 2H: Crouching Heavy Attack]
type = ChangeState
value = 430
triggerall = var(50)=0
triggerall = stateno !=430
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 410)|| (stateno = 420)|| (stateno = 440) || (stateno = 405)
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = (stateno =[200,250])|| (stateno =[400,449])
trigger3 = movecontact ;&& enemynear, movetype = H

;---------------------------------------------------------------------------
;Ono 2M
[State 425, ono2M: Ono Crouching Medium Attack]
type = ChangeState
value = 425
triggerall = var(50)!=0
triggerall = command = "y"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 410)|| (stateno = 200)|| (stateno = 205)|| (stateno = 210) 
trigger2 = (movecontact) ;&& enemynear, movetype = H

;---------------------------------------------------------------------------
[State 435, ono2H: Ono Crouching Heavy Attack]
type = ChangeState
value = 435
triggerall = var(50)!=0
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = statetype != A 
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 410)|| (stateno = 425)|| (stateno = 440)
trigger2 = (movecontact) ;&& enemynear, movetype = H
trigger3 = (stateno = 210) && movecontact =1 ;&& enemynear, movetype = H
trigger4 = (stateno = 205) && movecontact =1 ;&& enemynear, movetype = H
trigger5 = (stateno = 215) && movecontact =1 ;&& enemynear, movetype = H
trigger6 = (stateno = 230) && movecontact =1 ;&& enemynear, movetype = H
trigger7 = (stateno = 240) && movecontact =1 ;&& enemynear, movetype = H
trigger8 = (stateno = 250) && movecontact =1 ;&& enemynear, movetype = H
trigger9 = (stateno = 221) && movecontact =1 ;&& enemynear, movetype = H
trigger10 = (stateno = 225) && movecontact =1 ;&& enemynear, movetype = H
trigger11 = (stateno = 235) && movecontact =1 ;&& enemynear, movetype = H


[State 250, 5R: Standing Sword Throw]
type = ChangeState
value = 250
triggerall = command = "c" 
triggerall = command != "holddown"
triggerall = !var(50)
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact ;&& enemynear, movetype = H
trigger3 = (stateno = 210) && movecontact ;&& enemynear, movetype = H
trigger4 = (stateno = 205) && movecontact ;&& enemynear, movetype = H
trigger5 = (stateno = 220) && movecontact ;&& enemynear, movetype = H
trigger6 = (stateno = 230) && movecontact ;&& enemynear, movetype = H
trigger7 = (stateno = 240) && movecontact ;&& enemynear, movetype = H
trigger8 = (stateno = 250) && movecontact ;&& enemynear, movetype = H
trigger9 = (stateno = 220) && movecontact ;&& enemynear, movetype = H
trigger10 = (stateno = 221) && movecontact ;&& enemynear, movetype = H
trigger11 = (stateno = 235) && movecontact ;&& enemynear, movetype = H
trigger12 = (stateno = [400,450])&& movecontact ;&& enemynear, movetype = H

;---------------------------------------------------------------------------
[State 610, jL: Jump Light Attack]
type = ChangeState
value = 610
triggerall = command = "x"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1350 ;Air blocking

;---------------------------------------------------------------------------
[State 630, jM: Jump Medium Attack]
type = ChangeState
value = 630
triggerall = var(50)=0
triggerall = command = "y"
triggerall = statetype = A  && stateno != 630
trigger1 = ctrl
trigger2 = stateno = 1350
trigger3 = stateno = [600, 635] 
trigger3 = movecontact 

;---------------------------------------------------------------------------
[State 620, jH: Jump Heavy Attack]
type = ChangeState
value = 620
triggerall = var(50)=0
triggerall = command = "z"
triggerall = command != "holddown"
triggerall = statetype = A && stateno != 620 && stateno != 642
trigger1 = ctrl
trigger2 = stateno = [600, 645] 
trigger2 = movecontact 
trigger3 = stateno = 1350

;---------------------------------------------------------------------------
[State 650, j2H: Jump Down Heavy Attack]
type = ChangeState
value = 650
triggerall = var(50)=0
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = statetype = A && stateno != 650 && stateno != 642
trigger1 = ctrl
trigger2 = stateno = [600, 645]
trigger2 = movecontact
trigger3 = stateno = 1350 ;Air blocking

;---------------------------------------------------------------------------
[State 635, onojM: Ono Jump Medium]
type = ChangeState
value = 635
triggerall = var(50)!=0
triggerall = command = "y"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 1350 ;Air blocking
trigger3 = stateno = 600 || stateno = 610 
trigger3 = movecontact ;&& enemynear, movetype = H

;---------------------------------------------------------------------------
[State 625, onojH: Ono Jump Heavy]
type = ChangeState
value = 625
triggerall = var(50)!=0
triggerall = command = "z"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = (stateno = [610,635]) 
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1350 ;Air blocking


;---------------------------------------------------------------------------
[State 645, onojR: Ono Jump Remix]
type = ChangeState
value = 645
triggerall = var(50)!=0
triggerall = command = "c"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = (stateno = [600,635]) 
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1350 ;Air blocking

;---------------------------------------------------------------------------
[State 640, jR: Jumping Sword Throw]
type = ChangeState
value = 640
triggerall = var(50)=0
triggerall = command = "c"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = (stateno = [600,630]) 
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1350 ;Air blocking