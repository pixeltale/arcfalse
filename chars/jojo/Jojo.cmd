;-| Button Remapping |-----------------------------------------------------
; This section lets you remap the player's buttons (to easily change the
; button configuration). The format is:
;   old_button = new_button
; If new_button is left blank, the button cannot be pressed.
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

[Command]
name = "custom_holdfwd" ;Required (do not remove)
command = /$F
time = 1
buffer.time = 0

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
trigger2 = (stateno = [200,299]) || (stateno = [400,499]) || stateno = 656 || stateno = 801
trigger2 = movecontact
trigger2 = stateno!=421
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = 105
var(1) = 1


;Super Jump
[State -1, Super Jump]
type = ChangeState
value = 55
triggerall = statetype != A
triggerall = command = "28" || command = "27" || command = "29"
trigger1 = ctrl

;===========================================================================
;===========================================================================
;===========================================================================
;=============================LVL1-LVL3 SUPERS===============================
;===========================================================================
;===========================================================================
;===========================================================================

;SUPER1: Buster Horizon
[State -1, BH]
type = ChangeState
value = 3000
triggerall = command = "236X"
triggerall = power >= 2000
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = statetype != A
trigger2 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno != [3000,3050)
trigger2 = movecontact
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
;---------------------------------------------------------------------------
;SUPER2: RAGE
[State -1, R]
type = ChangeState
value = 3100
triggerall = command = "214X"
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
;=============================SPECIALS & EX==================================
;===========================================================================
;===========================================================================
;===========================================================================

[State -1, 6S: EX Flurry]
type = ChangeState
value = 2050
triggerall = var(32)<=0 ;Limiter - Only Allowed to use ONCE during a combo
triggerall = power>1000
triggerall = command = "holdfwd"
triggerall = command = "EX"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = (stateno = 1000 || stateno = [1051,1053] || stateno = [2000, 2001] || stateno = 2070 || stateno = 2074) && movecontact

[State -1, 4EX]
type = ChangeState
value = 2090
triggerall=stateno!=2073 && !map(EX4S_LIMITER)
triggerall = command = "b" && command = "c" || command = "EX"
triggerall = command = "holdback"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = (stateno = 1000 || stateno = [1051,1053] || stateno = [2000, 2001] || stateno = 2070 || stateno = 2074) && movecontact

[State -1, 2EX]
type = ChangeState
value = 2080
triggerall=stateno!=2073 && !map(EX2S_LIMITER)
triggerall = command = "b" && command = "c" || command = "EX"
triggerall = command = "holddown"
triggerall = command != "holdback"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = (stateno = 1000 || stateno = [1051,1053] || stateno = [2000, 2001] || stateno = 2070 || stateno = 2074) && movecontact

[State -1, 5S: EX Demontime]
type = ChangeState
value = 1010
triggerall = !map(EX5S_Limiter)
triggerall = power>1000
triggerall = command = "EX"
triggerall = command != "holdback" 
triggerall = command != "holddown" 
triggerall = command != "holdfwd" 
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3 = (stateno = 1000 || stateno = [1051,1053] || stateno = [2000, 2001] || stateno = 2070 || stateno = 2074) && movecontact

[State -1, 6S: Flurry]
type = ChangeState
value = 2001
triggerall=stateno!=222
triggerall = var(33)<=0 ;Limiter - Only Allowed to use ONCE during a combo
triggerall = command = "b"
triggerall = command != "c"
triggerall = command = "holdfwd" && command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)


[State -1, 4S: Primal Rampage]
type = ChangeState
value = 1050
triggerall = command = "b" && command="holdback"
triggerall = command != "c"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
;-------------------------------------------------------------------------

;[State -1, EX 2S: Acid Stomp]
;type = ChangeState
;value = 1011
;triggerall=stateno!=6000
;triggerall=stateno!=6010
;triggerall=stateno!=6011
;triggerall=stateno!=6012
;triggerall=stateno!=6013
;triggerall=stateno!=6014
;triggerall=stateno!=6015
;triggerall=stateno!=6016
;triggerall=numhelper(6002)!=1
;triggerall = var(31)<=0 ;Limiter - Only Allowed to use ONCE during a combo
;triggerall = power>500
;triggerall = command = "b"
;triggerall = command = "c"
;triggerall = command = "holddown"
;triggerall = command != "holdback"
;trigger1 = statetype != A
;trigger1 = stateno != 1064
;trigger1 = stateno != 1050
;trigger1 = ctrl
;trigger2 = var(1)
;trigger3 = movecontact
;trigger3 = stateno = 1010

[State -1, J2S]
type = ChangeState
value = 2073
triggerall=stateno!=2070
triggerall = command = "b"
triggerall = command = "holddown"
triggerall = command != "holdback"
triggerall = statetype = A
triggerall = statetype != S
trigger1 = ctrl
trigger2 = var(1)

[State -1, 2S]
type = ChangeState
value = 2070
triggerall=stateno!=2073
triggerall = command = "b"
triggerall = command = "holddown"
triggerall = command != "holdback"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(1)



;-------------------------------------------------------------------------


[State -1, 5S: Upper]
type = ChangeState
value = 1000
triggerall=stateno!=222
triggerall = command = "b"
triggerall = command != "holdback" 
triggerall = command != "holddown" 
triggerall = command != "holdfwd" 
triggerall = command != "c"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3=stateno=2000
trigger3=movecontact

;===========================================================================
;REmixes
;===========================================================================
[State -1, 4R]
type = ChangeState
value = 700
triggerall = stateno != 700
triggerall = command!="holddown" 
triggerall = command!="holdfwd" 
triggerall = command!="holddown" 
triggerall = command="holdback" && command = "c" || command = "holdfwd" && command = "holdc" 
triggerall = command != "b"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)

[State -1, 623 Mist Step (Formerly 6R)]
type = ChangeState
value = 701
triggerall = stateno != 701
triggerall = command!="holddown" 
triggerall = command!="holdback"
triggerall = command!="holddown" 
triggerall = command = "MistStep"
trigger1 = statetype != A
trigger1 = ctrl || stateno = 100
trigger2 = var(1)
trigger3 = stateno=[2000,2001]
trigger3 = movecontact

[State -1, 2R]
type = ChangeState
value = 702
triggerall = stateno != 702
triggerall = command!="holdback"
triggerall = command!="holdfwd" 
triggerall = command="holddown" && command = "c" || command = "holdfwd" && command = "holdc" 
triggerall = command != "b"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)

;============================================================================================


;===========================================================================
;===========================================================================
;===========================================================================
;===============================MOVEMENT==================================
;===========================================================================
;===========================================================================
;===========================================================================

;Forward Dash
[State -1, Run FWD]
type = ChangeState
value = 100
triggerall = command = "66" || teammode != Tag && command = "M66" && command != "holdback"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 1100 || stateno = [10, 11] || stateno = 105 && animelemno(0) > 3 || stateno = 701

;Run Back
[State -1, Run Back]
type = ChangeState
value = 105
triggerall = command = "44" || teammode != Tag && command = "M44"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 1100 || stateno = [10, 11] || stateno = [100, 105] && animelemno(0) > 3

;---------------------------------------------------------------------------


;Air F Dash
[State -1, Run Fwd]
type = ChangeState
value =904
triggerall = stateno!=904
triggerall = var(29)>0
triggerall = pos y<-30
triggerall = command = "66" || teammode != Tag && command = "M66"
trigger1 = statetype = A
trigger1 = ctrl


;---------------------------------------------------------------------------
;Air B Dash
[State -1, Run Fwd]
type = ChangeState
value =903
triggerall = stateno!=903
triggerall = var(29)>0
triggerall = pos y<-30
triggerall = command = "44" || teammode != Tag && command = "M44"
trigger1 = statetype = A
trigger1 = ctrl


;===========================================================================
;===========================================================================
;===========================================================================
;================================STRINGS====================================
;===========================================================================
;===========================================================================
;===========================================================================
;6L
[state -1, Forward L > M]
type = changestate
triggerall = statetype != A
value = 201
triggerall = command = "x"
triggerall = command = "custom_holdfwd" && command != "holdback"
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact 
trigger3 = stateno = 230 && movecontact 
trigger4 = stateno = 233 && movecontact 
trigger5 = stateno = 210 && time > 6

[state -1, Enryu Haibi Follow]
type = changestate
triggerall = command = "y"
triggerall = stateno = 201 && statetype != A
trigger1 = time > 11
value = 202

;===========================================================================
;===========================================================================
;===========================================================================
;================================NORMALS==================================
;===========================================================================
;===========================================================================
;===========================================================================

;5L
[State -1, 5L]
type = ChangeState
value = 200
triggerall = command = "x"
triggerall = command != "holddown" && var(59) !=4
triggerall = statetype != A
trigger1 = ctrl
trigger2 = command = "buffer_x"
trigger2 = movecontact
trigger2 = (stateno = 400) && time>1
trigger2 = movecontact
trigger3 = stateno = 100

[state -1, Enryu Haibi Follow]
type = changestate
triggerall = command = "x"
triggerall = stateno = 200 && statetype != A
trigger1 = time > 5
value = 203


;4M
[State -1, 4M]
type = ChangeState
value =  212
triggerall = stateno != 212
triggerall = statetype != A
triggerall = command = "y"
triggerall = command = "holdback" && command != "holddown"
trigger1 = ctrl
trigger2 = var(1)
trigger3=stateno=100
triggerall = stateno != 105
;5M
[State -1,5M]
type = ChangeState
value =  210
triggerall = command = "y"
triggerall = command != "holdback"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact
trigger3 = stateno = 100
trigger4 = (stateno = 203) && movecontact
[state -1, Enryu Haibi Follow]
type = changestate
triggerall = command = "buffer_y"
triggerall = stateno = 210 && statetype != A
trigger1 = time > 22
value = 211

;4H
[State -1, 5H]
type = ChangeState
value =  222
triggerall = statetype != A
triggerall = command = "z"
triggerall = command = "holdback"
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact
trigger3 = (stateno = 210) && movecontact
trigger4 = (stateno = 220) && movecontact
trigger5 = (stateno = 420) && movecontact
trigger6 = (stateno = 2000) && movecontact



;5H
[State -1, 5H]
type = ChangeState
value =  220
triggerall = statetype != A
triggerall = command = "z"
triggerall = command != "holddown"
triggerall = command != "holdback"
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact
trigger3 = (stateno = 210) && movecontact
trigger4 = (stateno = 410) && movecontact
trigger5 = (stateno = 420) && movecontact
trigger6 = stateno = 100
trigger7 = (stateno = 203) && movecontact


;-----------------------------------------------------------------------------------------------------------
;-----------------------------------------------------------------------------------------------------------

;2L
[State -1, 2L]
type = ChangeState
value = 400
triggerall = command = "x"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 200)
trigger2 = movecontact
trigger3 = stateno = 100

;---------------------------------------------------------------------------
;2M
[State -1, 2M]
type = ChangeState
value = 410
triggerall = command = "y"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 200)  || (stateno = 210) 
trigger2 = (movecontact)
trigger3 = stateno = 100
;---------------------------------------------------------------------------
;2H
[State -1, 2H]
type = ChangeState
value = 420
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = command != "holdfwd"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 410)|| (stateno = 200)|| (stateno = 210)|| (stateno = 430)
trigger2 = (movecontact)
trigger3 = stateno = 100


;---------------------------------------------------------------------------
;3H
[State -1, 3H]
type = ChangeState
value = 431
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = command = "holdfwd"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 410) || (stateno = 210)  || (stateno = 200) 
trigger2 = (movecontact)
trigger3 = stateno = 100
triggerall = stateno != 105

;-----------------------------------------------------------------------------------------------------------
;-----------------------------------------------------------------------------------------------------------

;jL
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = command = "x"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 &&movehit
trigger2 = movecontact
trigger3 = stateno = 1350 ;Air blocking
trigger5 = stateno = 610 &&movehit
trigger4 = stateno = 630&&movehit
;---------------------------------------------------------------------------
;jM
[State -1, jM]
type = ChangeState
value = 610
triggerall = command = "y"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 &&movecontact
trigger2 = movecontact
trigger3 = stateno = 1350 ;Air blocking
trigger4 = stateno = 630&&movecontact


;---------------------------------------------------------------------------
;jH
[State -1, jH]
type = ChangeState
value = 630
triggerall = command != "holddown"
triggerall = command = "z"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = (stateno = [600,610]) &&movecontact
trigger2 = movecontact
trigger3 = stateno = 1350 ;Air blocking
;---------------------------------------------------------------------------


;---------------------------------------------------------------------------
;Jumping d+SK
[State -1, Fast Kung Fu Palm]
type = ChangeState
value = 650
triggerall = command = "holddown"
triggerall = command = "z"
trigger1 = statetype = A
trigger1 = ctrl
trigger2 = stateno = [600, 640] && movecontact

[state -1, Enryu Haibi Follow]
type = changestate
triggerall = ifelse(p2dist X> 0, command = "holddown", command = "holddown")
triggerall = ifelse(p2dist X> 0, command = "z", command = "z")
triggerall = stateno = 5004 && statetype != A
trigger1 = movehit
value = 650


;==================================================
