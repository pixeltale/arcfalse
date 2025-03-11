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

; Default value for the "buffer.time" parameter of a Command. Minimum 1,
; maximum 30.
command.buffer.time =1


;-| Super Motions |--------------------------------------------------------
;The following two have the same name, but different motion.
;Either one will be detected by a "command = TripleKFPalm" trigger.
;Time is set to 20 (instead of default of 15) to make the move
;easier to do.
;

[Command]
name = "dash";Required (do not remove)
command = w
time = 1
buffer.time=5
[Command]
name = "holddash";Required (do not remove)
command = /w
time = 1
[Command]
name = "rc"
command = ~a
time = 1
buffer.time=5

[Command]
name = "TripleKFPalm"
command = ~D, DF, F, x
time = 10
[Command]
name = "TripleKFPalm"   ;Same name as above
command = ~D, DF, F, y
time = 10
[Command]
name = "TripleKFPalm"   ;Same name as above
command = ~D, DF, F, z
time = 10
[Command]
name = "TripleKFPalm"
command = ~D, DF, F+x
time = 10
[Command]
name = "TripleKFPalm"   ;Same name as above
command = ~D, DF, F+y
time = 10
[Command]
name = "TripleKFPalm"   ;Same name as above
command = ~D, DF, F+z
time = 10


[Command]
name = "SmashKFUpper"
command = ~D, DB, B, x;~F, D, DF, F, D, DF, x
time = 10
[Command]
name = "SmashKFUpper"   ;Same name as above
command = ~D, DB, B, y;~F, D, DF, F, D, DF, y
time = 10
[Command]
name = "SmashKFUpper"   ;Same name as above
command = ~D, DB, B+z;~F, D, DF, F, D, DF, y
time = 10
[Command]
name = "SmashKFUpper"
command = ~D, DB, B+x;~F, D, DF, F, D, DF, x
time = 10
[Command]
name = "SmashKFUpper"   ;Same name as above
command = ~D, DB, B+y;~F, D, DF, F, D, DF, y
time = 10
[Command]
name = "SmashKFUpper"   ;Same name as above
command = ~D, DB, B+z;~F, D, DF, F, D, DF, y
time = 10

[Command]
name = "DP_a"
command = ~F, D, DF, a

[Command]
name = "DP_b"
command = ~F, D, DF, b

[Command]
name = "DP_c"
command = ~F, D, DF, c

[Command]
name = "DP_KEX"
command = ~F, D, DF, a+b

[Command]
name = "DP_KEX"
command = ~F, D, DF, c+b

[Command]
name = "DP_KEX"
command = ~F, D, DF, a+c

[Command]
name = "DP_x"
command = ~F, D, DF, x

[Command]
name = "DP_y"
command = ~F, D, DF, y

[Command]
name = "DP_z"
command = ~F, D, DF, z

[Command]
name = "DP_xy"
command = ~F, D, DF, x+y
[Command]
name = "DP_xy"
command = ~F, D, DF, z+y
[Command]
name = "DP_xy"
command = ~F, D, DF, x+z

[Command]
name = "DD_x"
command = D,D,x

[Command]
name = "DD_y"
command = D,D,y

[Command]
name = "DD_z"
command = D,D,z


[Command]
name = "QCF_x"
command = ~D, DF, F, x

[Command]
name = "QCF_y"
command = ~D, DF, F, y

[Command]
name = "QCF_z"
command = ~D, DF, F, z

[Command]
name = "QCF_xy"
command = ~D, DF, F, x+y

[Command]
name = "QCB_x"
command = ~D, DB, B, x

[Command]
name = "QCB_y"
command = ~D, DB, B, y

[Command]
name = "QCB_z"
command = ~D, DB, B, z

[Command]
name = "QCB_xy"
command = ~D, DB, B, x+y

[Command]
name = "QCF_a"
command = ~D, DF, F, a

[Command]
name = "QCF_b"
command = ~D, DF, F, b

[Command]
name = "QCF_c"
command = ~D, DF, F, c

[Command]
name = "QCF_KEX"
command = ~D, DF, F, a+b

[Command]
name = "QCF_KEX"
command = ~D, DF, F, b+c

[Command]
name = "QCF_KEX"
command = ~D, DF, F, a+c



[Command]
name = "QCB_a"
command = ~D, DB, B, a

[Command]
name = "QCB_b"
command = ~D, DB, B, b

[Command]
name = "QCB_c"
command = ~D, DB, B, c

[Command]
name = "QCB_KEX"
command = ~D, DB, B, a+b

[Command]
name = "QCB_KEX"
command = ~D, DB, B, b+c

[Command]
name = "QCB_KEX"
command = ~D, DB, B, a+c

[Command]
name = "reset"
command = ~D,D,c

[Command]
name = "FF_ab"
command = F, F, a+b

[Command]
name = "FF_a"
command = F, F, a

[Command]
name = "FF_b"
command = F, F, b
;-| Double Tap |-----------------------------------------------------------
[Command]
name = "DU"
command = $D,$U
buffer.time = 6
time = 10

[Command]
name = "DD"
command = D,D

[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 10

[Command]
name = "aFF"     ;Required (do not remove)
command = ~F, F
time = 10
buffer.time = 6

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 10

[Command]
name = "aBB"     ;Required (do not remove)
command = ~B, B
time = 10
buffer.time = 6

[Command]
name = "holdupb"
command = $U
time = 1
buffer.time = 5

;-| 2/3 Button Combination |-----------------------------------------------

[Command]
name = "burst"
command = a+x
time = 1
buffer.time = 4
[Command]
name = "burst"
command = x+a
time = 1
buffer.time = 4
[Command]
name = "burst"
command = y+a
time = 1
buffer.time = 4
[Command]
name = "burst"
command = a+y
time = 1
buffer.time = 4
[Command]
name = "burst"
command = z+a
time = 1
buffer.time = 4
[Command]
name = "burst"
command = a+z
time = 1
buffer.time = 4
[Command]
name = "burst"
command = b+a
time = 1
buffer.time = 4
[Command]
name = "burst"
command = a+b
time = 1
buffer.time = 4
[Command]
name = "burst"
command = c+a
time = 1
buffer.time = 4
[Command]
name = "burst"
command = a+c
time = 1
buffer.time = 4
[Command]
name = "burst"
command = d+a
time = 1
buffer.time = 4
[Command]
name = "burst"
command = a+d
time = 1
buffer.time = 4

[Command]
name = "EX"
command = b+c
time = 1
buffer.time = 4
[Command]
name = "EX"
command = c+b
time = 1
buffer.time = 4
[Command]
name = "EX"
command = d
time = 1

[Command]
name = "recovery";Required (do not remove)
command = x+y
time = 1
[Command]
name = "AA";Required (do not remove)
command = x+y
time = 1
[Command]
name = "AA";Required (do not remove)
command = x+z
time = 1
[Command]
name = "AA";Required (do not remove)
command = z+y
time = 1

;-| Dir + Button |---------------------------------------------------------
[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1

;-| Single Button |---------------------------------------------------------


[Command]
name = "hold_x";Required (do not remove)
command = /x
time = 1
[Command]
name = "hold_y";Required (do not remove)
command = /y
time = 1
[Command]
name = "hold_z";Required (do not remove)
command = /z
time = 1
[Command]
name = "hold_a";Required (do not remove)
command = /a
time = 1
[Command]
name = "hold_b";Required (do not remove)
command = /b
time = 1

[Command]
name = "hold_c";Required (do not remove)
command = /c
time = 1


[Command]
name = "CRHK2Buffer"
command = c
time = 1
buffer.time = 22

[Command]
name = "buffer_z" 
command = c
time = 1
buffer.time = 14

[Command]
name = "buffer_c" 
command = c
time = 1
buffer.time = 14

[Command]
name = "pushblock"
command = x+y
time = 1

[Command]
name = "pushblock"
command = y+z
time = 1

[Command]
name = "pushblock"
command = x+z
time = 1

[Command]
name = "a"
command = a
time = 1

[Command]
name = "b"
command = b
time = 1
buffer.time = 5


[Command]
name = "throwtech"
command = a
time = 1
buffer.time = 13
[Command]
name = "c"
command = c
time = 1
buffer.time = 5

[Command]
name = "buffer_x"
command = x
time = 1
buffer.time = 1

[Command]
name = "buffer_a"
command = a
time = 1
buffer.time = 1

[Command]
name = "bufferedx"
command = x
time = 1
buffer.time = 8

[Command]
name = "bufferedfx"
command = x
time = 1
buffer.time = 10

[Command]
name = "bufferedy"
command = y
time = 1
buffer.time = 8

[Command]
name = "bufferedfy"
command = y
time = 1
buffer.time = 10

[Command]
name = "bufferedz"
command = z
time = 1
buffer.time = 8

[Command]
name = "bufferedfz"
command = z
time = 1
buffer.time = 10

[Command]
name = "buffereda"
command = a
time = 1
buffer.time = 8

[Command]
name = "bufferedfa"
command = a
time = 1
buffer.time = 10

[Command]
name = "bufferedfa"
command = b
time = 1
buffer.time = 10

[Command]
name = "bufferedb"
command = b
time = 1
buffer.time = 8

[Command]
name = "x"
command = x
time = 1
buffer.time = 5

[Command]
name = "y"
command = y
time = 1
buffer.time = 5

[Command]
name = "buffer_free_z"
command = z
time = 1
buffer.time = 2

[Command]
name = "z"
command = z
time = 1
buffer.time = 5

[Command]
name = "start"
command = s
time = 1

[Command]
name = "hold_z";Required (do not remove)
command = /z
time = 1


;-| Hold Dir |--------------------------------------------------------------
[Command]
name = "holdfwd";Required (do not remove)
command = /$F
time = 1

[Command]
name = "holdback";Required (do not remove)
command = /$B
time = 1

[Command]
name = "jc" ;Required (do not remove)
command = /$U
time = 1
buffer.time = 1

[Command]
name = "superjump" ;Required (do not remove)
command = /$U
buffer.time = 1

[Command]
name = "holdup" ;Required (do not remove)
command = /$U
time = 1
buffer.time=5

[Command]
name = "holddown";Required (do not remove)
command = /$D
time = 1
buffer.time=5

[Command]
name = "fwd"
command = F
time = 1
buffer.time=1

[Command]
name = "back"
command = B
time = 1
buffer.time=1
[Command]
name = "up"
command = U
time = 1
buffer.time=1
[Command]
name = "down"
command = D
time = 1
buffer.time=1

;---------------------------------------------------------------------------
; 2. State entry
; --------------
; This is where you define what commands bring you to what states.
;
; Each state entry block looks like:
;   [State -1, Label]           ;Change Label to any name you want to use to
;                               ;identify the state with.
;   type = ChangeState          ;Don't change this
;   value = new_state_number
;   trigger1 = command = command_name
;   . . .  (any additional triggers)
;
; - new_state_number is the number of the state to change to
; - command_name is the name of the command (from the section above)
; - Useful triggers to know:
;   - statetype
;       S, C or A : current state-type of player (stand, crouch, air)
;   - ctrl
;       0 or 1 : 1 if player has control. Unless "interrupting" another
;                move, you'll want ctrl = 1
;   - stateno
;       number of state player is in - useful for "move interrupts"
;   - movecontact
;       0 or 1 : 1 if player's last attack touched the opponent
;                useful for "move interrupts"
;
; Note: The order of state entry is important.
;   State entry with a certain command must come before another state
;   entry with a command that is the subset of the first.
;   For example, command "fwd_a" must be listed before "a", and
;   "fwd_ab" should come before both of the others.
;
; For reference on triggers, see CNS documentation.
;
; Just for your information (skip if you're not interested):
; This part is an extension of the CNS. "State -1" is a special state
; that is executed once every game-tick, regardless of what other state
; you are in.


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
trigger2 = stateno = [200,499]
trigger2 = movecontact ;&& enemynear, movetype = H
trigger2 = stateno!=421
trigger3 = stateno = 1330 ;From blocking
trigger4 = stateno = 105 && time > 10
trigger5 = stateno = 1203
var(1) = 1

[State -1, Grab]
type = ChangeState
value = 800
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
trigger1 = command = "a"
trigger1 = statetype != A
trigger1 = ctrl

;Triple Kung Fu Palm (uses one super bar)
[State -1, Triple Kung Fu Palm]
type = ChangeState
value = 3000
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "TripleKFPalm"
triggerall = power >= 2000
triggerall = stateno != 3000
triggerall = stateno != 3001
triggerall = stateno != 3004
triggerall = statetype != A
trigger1 = ctrl
trigger2 = hitdefattr = SC, NA, SA, HA && movecontact
trigger2=movecontact
trigger3 = (stateno = [200,499]) && movecontact ;&& enemynear, movetype = H
trigger4 = stateno = 1303 && enemy,movetype=H


;---------------------------------------------------------------------------
;Triple Kung Fu Palm (uses one super bar)
[State -1, Triple Kung Fu Palm]
type = ChangeState
value = 3010
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "SmashKFUpper"
triggerall = power >= 2000
triggerall = stateno != 3000
triggerall = stateno != 3001
triggerall = stateno != 3004
triggerall = statetype != A
trigger1 = ctrl
trigger2 = hitdefattr = SCA, NA, SA && movecontact
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = 1303 
triggerall = stateno != 3010

;---------------------------------------------------------------------------
;Triple Kung Fu Palm (uses one super bar)
[State -1, Triple Kung Fu Palm]
type = ChangeState
value = 3015
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "SmashKFUpper"
triggerall = power >= 2000
triggerall = stateno != 3000
triggerall = stateno != 3001
triggerall = stateno != 3004
triggerall=stateno!=750
triggerall = statetype = A
trigger1 = ctrl
trigger2 = hitdefattr = SCA, NA, SA && movecontact
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = 1303 
triggerall = stateno != 3010
;===========================================================================

[State -1,DJC]
type = ChangeState
value = 45
triggerall = command = "holdup"
triggerall = stateno != 11 && stateno!=45 && stateno!=46 && stateno!= 4260 && (stateno!=[4000,4099])
;triggerall = var(45)>0
triggerall = var(29)>0
trigger1 = ctrl && stateno!=45 && stateno!=46 && stateno!=50 && stateno!=40 && stateno!= 4260
trigger2 = movecontact ;&& enemynear, movetype = H
trigger2 = hitdefattr = A, NA
trigger3 =  stateno=45 || stateno=46|| stateno=50
trigger3 = vel y>.1

;
;---------------------------------------------------------------------------
;Aerial Dash
[State -1, Airdash]
type = ChangeState
value =904
triggerall = command = "aFF" || (command = "dash" && teammode !=tag) || (command = "dash" && teammode=tag && partner,stateno=5150)
triggerall = command != "holdback" 
trigger1 = statetype = A
trigger1 = ctrl
triggerall = stateno!=904
triggerall = var(29)>0
triggerall = (pos y<-30 && vel y < 0) || (vel y >=0)
;Aerial Backdash
[State -1, Air Backdash]
type = ChangeState
value =903
triggerall = command = "aBB" || (command = "dash" && teammode !=tag) || (command = "dash" && teammode=tag && partner,stateno=5150)
triggerall = command = "holdback" 
trigger1 = statetype = A
trigger1 = ctrl
triggerall = stateno!=903
triggerall = var(29)>0
triggerall = (pos y<-30 && vel y < 0) || (vel y >=0)

;---------------------------------------------------------------------------
[State -1, JC]
type = ChangeState
value = 40
triggerall = command = "holdup"
trigger1 = stateno = 220 && movehit = 1 ;&& enemynear, movetype = H
trigger2 = stateno = 210 && movehit = 1 ;&& enemynear, movetype = H
trigger3 = stateno = 211 && movehit = 1 ;&& enemynear, movetype = H
trigger4 = stateno = 220 && movehit = 1 ;&& enemynear, movetype = H
trigger5 = stateno = 420 && movehit = 1 ;&& enemynear, movetype = H

;---------------------------------------------------------------------------
[State -1, EX 6S]
type = ChangeState
value = 1120
triggerall=map(EXLimiter1)=0
triggerall = roundstate = 2 ;only attack during the round
triggerall = power>=1000
triggerall=stateno!=40
triggerall = command = "EX"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3=stateno=105
;---------------------------------------------------------------------------
[State -1, 6S]
type = ChangeState
value = 1100
triggerall=stateno!=40
triggerall = roundstate = 2 ;only attack during the round
triggerall = command = "b"
triggerall = command != "c"
triggerall = command = "holdfwd"
triggerall = command != "holddown"
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = var(1)
trigger3=stateno=105
;trigger3 = stateno = 100

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
trigger1 = statetype = A
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
trigger1 = statetype != A
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
trigger1 = statetype = A
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
trigger1 = statetype != A
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
trigger1 = statetype != A
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
trigger1 = statetype != A
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
trigger1 = statetype != A
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
trigger1 = statetype = A
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