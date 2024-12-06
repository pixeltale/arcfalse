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
command.time = 15
command.buffer.time = 3

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
trigger2 = (stateno = [200,299]) || (stateno = [400,503]) || stateno = 656 || stateno = 670
trigger2 = movecontact ;&& enemynear, movetype = H
trigger2 = stateno!=421
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = 105 && time > 16
var(1) = 1

;---------------------------------------------------------------------------
;j236X
[State -1, Triple Kung Fu Palm]
type = ChangeState
value = 3000
triggerall = command = "236x"
triggerall = power >= 2000
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = statetype = A
trigger2 = hitdefattr = A, NA, SA
trigger2 = stateno != [3000,3050)
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = 1030 && movecontact = 1 ;&& enemynear, movetype = H
trigger5 = stateno = 1033 && movecontact = 1 ;&& enemynear, movetype = H
;---------------------------------------------------------------------------
;236X
[State -1, Triple Kung Fu Palm]
type = ChangeState
value = 3010
triggerall = var(26)<=0
triggerall = command = "236x"
triggerall = power >= 2000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA
trigger2 = stateno != [3000,3050)
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking

;---------------------------------------------------------------------------
;Super Jump
[State -1, Super Jump]
type = ChangeState
value = 55
triggerall = statetype != A
triggerall = command = "28" || command = "27" || command = "29"
trigger1 = ctrl
trigger2 = Map(JC)

[State -1,DJC]
type = ChangeState
value = 45
triggerall = command = "holdup"
triggerall = stateno != 11 && stateno!=45 && stateno!=46 && stateno!= 4260 && (stateno!=[4000,4099])
triggerall = Map(DJL) > 0
trigger1 = ctrl && stateno!= [40,60] && stateno!= 4260
trigger2 = movecontact ;&& enemynear, movetype = H
trigger2 = hitdefattr = A, NA
trigger3 =  stateno=45 || stateno=46|| stateno=50
trigger3 = vel y>.1

;
;---------------------------------------------------------------------------
;Airdash
[State -1, Forward Airdash]
type = ChangeState
value = 60
triggerall = command = "a66"
triggerall = Map(ADash) > 0
triggerall = pos y<-20
trigger1 = statetype = A 
trigger1 = ctrl
trigger2 = stateno = 703 && power >= 1000 || stateno = 705

;---------------------------------------------------------------------------
;Backward Airdash
[State -1, Backward Airdash]
type = ChangeState
value = 61
triggerall = command = "a44"
triggerall = pos y<-20
triggerall = Map(ADash) > 0
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = 703 && power >= 1000 || stateno = 705

[State -1, j.6EX]
type = ChangeState
value = 1035
triggerall = power>1000
triggerall = statetype = A
triggerall = command = "holdfwd"
triggerall = command = "b"
triggerall = command = "c"
triggerall = fvar(23) = 0
trigger1 = ctrl
trigger2 = var(1)
trigger3 = (stateno = [600,640]) 
trigger3 = movecontact ;&& enemynear, movetype = H
trigger4 = stateno = 904
trigger5 = stateno = 1020 && movecontact = 1 ;&& enemynear, movetype = H
trigger6 = stateno = 1010 && movecontact = 1 ;&& enemynear, movetype = H
trigger7 = stateno = 1205 && movecontact = 1 ;&& enemynear, movetype = H

[State -1, j.6S]
type = ChangeState
value = 1030
triggerall = statetype = A
triggerall = command = "holdfwd"
triggerall = command = "b"
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = 904
trigger4 = (stateno = [600,640]) 
trigger4 = movecontact ;&& enemynear, movetype = H

;--------------------------------------------------------------------------

[State -1, 2EX]
type = ChangeState
value = 1005
triggerall = power>1000
triggerall = command = "b"
triggerall = command = "c"
triggerall = command = "holddown"
triggerall = command != "holdback"
triggerall = fvar(20) = 0
triggerall = stateno != 1020
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = 500 && time > 8 ;Pheonix Dash
trigger4 = stateno = [100,101] ;Runstop

[State -1, 2S]
type = ChangeState
value = 1000
triggerall = command = "b"
triggerall = command = "holddown"
triggerall = command != "holdback"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = 500 && time > 8 ;Pheonix Dash
trigger4 = stateno = [100,101] ;Runstop

[State -1, 6EX]
type = ChangeState
value = 1025
triggerall = power>1000
triggerall = var(52)<=0
triggerall = command = "b"
triggerall = command = "c"
triggerall = command = "holdfwd"
triggerall = fvar(22) = 0
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = 500 && time > 8 ;Pheonix Dash

[State -1, 6S]
type = ChangeState
value = 1020
triggerall = command = "b"
triggerall = command = "holdfwd"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = 500 && time > 8 ;Pheonix Dash

;stomperino
[State -1, 4EX]
type = ChangeState
value = 1206
triggerall = power>1000
triggerall = var(53)<=0
triggerall = fvar(24) = 0
triggerall = command = "b" && command="holdback" && command = "c"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = 500 && time > 8 ;Pheonix Dash
trigger4 = stateno = 101 ;Runstop

[State -1, 4S]
type = ChangeState
value = 1205
triggerall = command = "b" && command="holdback"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = 500 && time > 8 ;Pheonix Dash
trigger4 = stateno = 101 ;Runstop

[State -1, 5EX]
type = ChangeState
value = 1015
triggerall = power>1000
triggerall = var(51)<=0
triggerall = fvar(21) = 0
triggerall = command = "b"
triggerall = command = "c"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = 500 && time > 8 ;Pheonix Dash
trigger4 = stateno = 101 ;Runstop

[State -1, 5S]
type = ChangeState
value = 1010
triggerall = command = "b"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = stateno = 500 && time > 8 ;Pheonix Dash
trigger4 = stateno = 101 ;Runstop

[State -1, j6EX]
type = ChangeState
value = 1656
triggerall = power>1000
triggerall = var(54)<=0
triggerall = command = "c"
triggerall = command = "b"
triggerall = command != "holdfwd"
triggerall = fvar(24) = 0
triggerall = statetype = A
trigger1 = ctrl
trigger2 = (stateno = [600,640]) || stateno = 504
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1350 ;Air blocking

[State -1, j6S]
type = ChangeState
value = 1657
triggerall = command != "holdfwd"
;triggerall = command = "holddown"
triggerall = command = "b"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = (stateno = [600,640]) 
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1350 ;Air blocking

[State -1, jR]
type = ChangeState
value = 850
triggerall = pos y<-30
triggerall = prevstateno != 850
triggerall = command = "c"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = (stateno = [600,640]) 
trigger2 = movecontact ;&& enemynear, movetype = H 
trigger3 = stateno = 1350 ;Air blocking

;--------------------------------------------------------------------------
;Run Fwd
[State -1, Run Fwd]
type = ChangeState
value = 100
triggerall = var(8)<=0
triggerall = command = "66" || command = "M66" 
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 250
triggerall = stateno!=100
trigger3 = stateno = [700,701] && power >= 2000 || stateno = [703,704] && power >= 2000
trigger4 = stateno = 690000

;=======================
;Run Fwd
;=======================
[State -1, Run Fwd]
type = ChangeState
value = 102
triggerall = var(8)>0
triggerall = command = "66" || command = "M66" 
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 250
triggerall = stateno!=100
trigger3 = stateno = [700,701] && power >= 2000 || stateno = [703,704] && power >= 2000

;Run Back
[State -1, Run Back]
type = ChangeState
value = 105
triggerall = command = "44" || command = "M44" 
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 250
triggerall = stateno!=105
trigger3 = stateno = [700,701] && power >= 1000 || stateno = [703,704] && power >= 1000
trigger4 = stateno = 690000


;===========================================================================
;---------------------------------------------------------------------------
;Taunt
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = command = "start"
trigger1 = statetype != A
trigger1 = ctrl

;5L
[State -1, 5L]
type = ChangeState
value = 200
triggerall = command = "x"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 101 || stateno = 400 && movecontact
 
;5M
[State -1, 5M]
type = ChangeState
value =  210
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact ;&& enemynear, movetype = H
;trigger3 = stateno = 100 && time > 3
trigger3 = stateno = 400 && movecontact ;&& enemynear, movetype = H
trigger4 = stateno = 101 

;6H
[State -1, 6H]
type = ChangeState
value =  230
trigger1 = statetype = S
triggerall = command = "z"
triggerall = command = "holdfwd"
triggerall = command !="holddown"
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact ;&& enemynear, movetype = H
trigger3 = (stateno = 210) && movecontact ;&& enemynear, movetype = H
trigger4 = (stateno = 410) && movecontact ;&& enemynear, movetype = H
trigger5 = (stateno = 420) && movecontact ;&& enemynear, movetype = H
trigger6 = stateno = 101 
trigger7 = stateno = 400 && movecontact ;&& enemynear, movetype = H

;5H
[State -1, Stand Strong Punch]
type = ChangeState
value =  220
trigger1 = statetype = S
triggerall = command = "z" && stateno != 220
triggerall = command != "holddown"
trigger1 = ctrl
trigger2 = (stateno = [200,420]) && movecontact
trigger7 = (stateno = 101) 



;---------------------------------------------------------------------------
;---------------------------------------------------------------------------


;---------------------------------------------------------------------------
;2L
[State -1, 2L]
type = ChangeState
value = 400
triggerall = command = "buffer_x"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 400 && movecontact ;&& enemynear, movetype = H
trigger4 = stateno = 101

;---------------------------------------------------------------------------
;2M
[State -1, 2M]
type = ChangeState
value = 410
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 200)  || (stateno = 210) 
trigger2 = (movecontact) ;&& enemynear, movetype = H
trigger3 = stateno = 101


;---------------------------------------------------------------------------
;Sweep
[State -1, 3H]
type = ChangeState
value = 430
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = command = "holdfwd"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 410) || (stateno = 210)  || (stateno = 200) || (stateno = 220)
trigger2 = (movecontact) ;&& enemynear, movetype = H
trigger3 = stateno = 101

;---------------------------------------------------------------------------
;2H
[State -1, 2H]
type = ChangeState
value = 420
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = command != "holdfwd"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 410)|| (stateno = 200)|| (stateno = 210)
trigger2 = (movecontact) ;&& enemynear, movetype = H
trigger3 = stateno = 101

;Phoenix Dash
[State -1, Remix]
type = ChangeState
value = 500
triggerall = var(8)<=0
triggerall = stateno !=[1010,1015]
triggerall = stateno !=[1020,1025]
triggerall = stateno !=[1205,1206]
triggerall = stateno !=[1000,1005]
triggerall = stateno != 3001
triggerall = stateno !=502
triggerall = stateno !=503
triggerall = command = "c" 
triggerall = command !="z"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = [200,499] 
trigger2 = movecontact ;&& enemynear, movetype = H
;trigger3 = 1655 && movecontact = 1
;trigger4 = 1656 && movecontact = 1

;Phoenix Dash (Killswitch)
[State -1, Remix]
type = ChangeState
value = 500
triggerall = var(8)>0
triggerall = command = "c" 
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = movetype = A
trigger2 = movecontact
;---------------------------------------------------------------------------

;j.L
[State -1, j.L]
type = ChangeState
value = 600
triggerall = command = "x"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 1350 ;Air blocking
;trigger4 = stateno = 904 && time > 3
;---------------------------------------------------------------------------
;j.M
[State -1, j.M]
type = ChangeState
value = 610
triggerall = command = "y"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 601 ;jump_x or jump_a
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1350 ;Air blocking
trigger4 = stateno = 630 && movecontact

;---------------------------------------------------------------------------
;j.H
[State -1, j.H]
type = ChangeState
value = 630
triggerall = command = "z"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = (stateno = [600,610])
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1350 ;Air blocking