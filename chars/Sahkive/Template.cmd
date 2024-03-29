; The CMD file.
;
; Two parts: 1. Command definition and  2. State entry
; (state entry is after the commands def section)
;
; 1. Command definition
; ---------------------
; Note: The commands are CASE-SENSITIVE, and so are the command names.
; The eight directions are:
;   B, DB, D, DF, F, UF, U, UB     (all CAPS)
;   corresponding to back, down-back, down, downforward, etc.
; The six buttons are:
;   a, b, c, x, y, z               (all lower case)
;   In default key config, abc are are the bottom, and xyz are on the
;   top row. For 2 button characters, we recommend you use a and b.
;   For 6 button characters, use abc for kicks and xyz for punches.
;
; Each [Command] section defines a command that you can use for
; state entry, as well as in the CNS file.
; The command section should look like:
;
;   [Command]
;   name = some_name
;   command = the_command
;   time = time (optional)
;   buffer.time = time (optional)
;
; - some_name
;   A name to give that command. You'll use this name to refer to
;   that command in the state entry, as well as the CNS. It is case-
;   sensitive (QCB_a is NOT the same as Qcb_a or QCB_A).
;
; - command
;   list of buttons or directions, separated by commas. Each of these
;   buttons or directions is referred to as a "symbol".
;   Directions and buttons can be preceded by special characters:
;   slash (/) - means the key must be held down
;          egs. command = /D       ;hold the down direction
;               command = /DB, a   ;hold down-back while you press a
;   tilde (~) - to detect key releases
;          egs. command = ~a       ;release the a button
;               command = ~D, F, a ;release down, press fwd, then a
;          If you want to detect "charge moves", you can specify
;          the time the key must be held down for (in game-ticks)
;          egs. command = ~30a     ;hold a for at least 30 ticks, then release
;   dollar ($) - Direction-only: detect as 4-way
;          egs. command = $D       ;will detect if D, DB or DF is held
;               command = $B       ;will detect if B, DB or UB is held
;   plus (+) - Buttons only: simultaneous press
;          egs. command = a+b      ;press a and b at the same time
;               command = x+y+z    ;press x, y and z at the same time
;   greater-than (>) - means there must be no other keys pressed or released
;                      between the previous and the current symbol.
;          egs. command = a, >~a   ;press a and release it without having hit
;                                  ;or released any other keys in between
;   You can combine the symbols:
;     eg. command = ~30$D, a+b     ;hold D, DB or DF for 30 ticks, release,
;                                  ;then press a and b together
;
;   Note: Successive direction symbols are always expanded in a manner similar
;         to this example:
;           command = F, F
;         is expanded when MUGEN reads it, to become equivalent to:
;           command = F, >~F, >F
;
;   It is recommended that for most "motion" commads, eg. quarter-circle-fwd,
;   you start off with a "release direction". This makes the command easier
;   to do.
;
; - time (optional)
;   Time allowed to do the command, given in game-ticks. The default
;   value for this is set in the [Defaults] section below. A typical
;   value is 15.
;
; - buffer.time (optional)
;   Time that the command will be buffered for. If the command is done
;   successfully, then it will be valid for this time. The simplest
;   case is to set this to 1. That means that the command is valid
;   only in the same tick it is performed. With a higher value, such
;   as 3 or 4, you can get a "looser" feel to the command. The result
;   is that combos can become easier to do because you can perform
;   the command early. Attacks just as you regain control (eg. from
;   getting up) also become easier to do. The side effect of this is
;   that the command is continuously asserted, so it will seem as if
;   you had performed the move rapidly in succession during the valid
;   time. To understand this, try setting buffer.time to 30 and hit
;   a fast attack, such as KFM's light punch.
;   The default value for this is set in the [Defaults] section below.
;   This parameter does not affect hold-only commands (eg. /F). It
;   will be assumed to be 1 for those commands.
;
; If you have two or more commands with the same name, all of them will
; work. You can use it to allow multiple motions for the same move.
;
; Some common commands examples are given below.
;
; [Command] ;Quarter circle forward + x
; name = "QCF_x"
; command = ~D, DF, F, x
;
; [Command] ;Half circle back + a
; name = "HCB_a"
; command = ~F, DF, D, DB, B, a
;
; [Command] ;Two quarter circles forward + y
; name = "2QCF_y"
; command = ~D, DF, F, D, DF, F, y
;
; [Command] ;Tap b rapidly
; name = "5b"
; command = b, b, b, b, b
; time = 30
;
; [Command] ;Charge back, then forward + z
; name = "charge_B_F_z"
; command = ~60$B, F, z
; time = 10
;
; [Command] ;Charge down, then up + c
; name = "charge_D_U_c"
; command = ~60$D, U, c
; time = 10


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
; Default value for the "time" parameter of a Command. Minimum 1.
command.time = 15

; Default value for the "buffer.time" parameter of a Command. Minimum 1,
; maximum 30.
command.buffer.time = 3


;-| Super Motions |--------------------------------------------------------
;The following two have the same name, but different motion.
;Either one will be detected by a "command = TripleKFPalm" trigger.
;Time is set to 20 (instead of default of 15) to make the move
;easier to do.
;
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
name = "SmashKFUpper"
command = ~D, DB, B, x;~F, D, DF, F, D, DF, x
time = 10

[Command]
name = "SmashKFUpper"   ;Same name as above
command = ~D, DB, B, y;~F, D, DF, F, D, DF, y
time = 10

[Command]
name = "SmashKFUpper"   ;Same name as above
command = ~D, DB, B, z;~F, D, DF, F, D, DF, y
time = 10
[Command]
name = "throwtech"
command = a
time = 1
buffer.time = 13

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
name = "RDP_z"
command = ~B, D, DB, z

[Command]
name = "RDP_c"
command = ~B, D, DB, c

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
name = "FF_z"
command = F, F, z

[Command]
name = "FF_bc"
command = F, F, b+c
;time = 10
buffer.time = 10

[Command]
name = "FF_a"
command = F, F, a

[Command]
name = "FF_b"
command = F, F, b
;time = 10
buffer.time = 10

;-| Double Tap |-----------------------------------------------------------
[Command]
name = "DU"
command = $D,$U
buffer.time = 8

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
name = "recovery";Required (do not remove)
command = x+y
time = 1

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
name = "b+c"
command = b+c
time = 1


[Command]
name = "a"
command = a
time = 1

[Command]
name = "b"
command = b
time = 1

[Command]
name = "hold_c"
command = /c
time = 1


[Command]
name = "c"
command = c
time = 1
buffer.time = 9

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
name = "x"
command = x
time = 1
buffer.time = 4
[Command]
name = "y"
command = y
time = 1
buffer.time = 6

[Command]
name = "buffer_free_z"
command = z
time = 1
buffer.time = 2

[Command]
name = "z"
command = z
time = 1
buffer.time = 8

[Command]
name = "wheelx"
command = x
time = 1
buffer.time = 10

[Command]
name = "wheely"
command = y
time = 1
buffer.time = 10

[Command]
name = "wheelz"
command = z
time = 1
buffer.time = 10

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
name = "buffdown";Required (do not remove)
command = /$D
time = 1
buffer.time=2

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
trigger2 = (stateno = [200,299]) || (stateno = [400,503]) || stateno = 656 || stateno = 670
trigger2 = movecontact ;&& enemynear, movetype = H
trigger2 = stateno!=421
trigger3 = stateno = 1310 || stateno = 1330 ;From blocking
trigger4 = stateno = 105 && time > 16
var(1) = 1

;Alpha Counter
[State -1, RC Jasta]
type = ChangeState
value = 7000
trigger1 = stateno = [150,153]
triggerall = command = "holdfwd" 
triggerall = command = "pushblock"
triggerall = statetype != A
;trigger1 = movecontact = 1
;trigger1 = hitdefattr = SC, NA, SA, HA
;triggerall = power>=2000
triggerall = var(15)>=500

[State -1, desp refill]
type = changestate
value = 905
triggerall = command = "reset"
triggerall = enemynear, name = "Training"
trigger1 = statetype = S
trigger1 = ctrl
;v = 15
;value = 1000

;RC Jasta
[State -1, RC Jasta]
type = ChangeState
value = 690000
triggerall = command = "c"
triggerall = command = "a"
triggerall = statetype != A 
trigger1 = movecontact = 1 ;&& enemynear, movetype = H
trigger1 = hitdefattr = SC, NA, SA, HA
trigger2 = stateno = 852 && movehit = 1
;triggerall = var(15)>=500
triggerall = power>=2000

;RC Jasta LMH
[State -1, RC Jasta]
type = ChangeState
value = 690000
triggerall = command = "x"
triggerall = command = "y"
triggerall = command = "z"
triggerall = statetype != A
trigger1 = movecontact = 1 && enemynear, movetype = H
trigger1 = hitdefattr = SC, NA, SA, HA
;triggerall = var(15)>=500
triggerall = power>=2000

;RC Jasta Air
[State -1, RC Jasta Air]
type = ChangeState
value = 690001
triggerall = command = "c"
triggerall = command = "a"
triggerall = statetype = A
trigger1 = movecontact = 1 ;&& enemynear, movetype = H
trigger1 = hitdefattr = A, NA, SA, HA
trigger2 = stateno = 1033 && movecontact = 1 ;&& enemynear, movetype = H
;triggerall = var(15)>=500
triggerall = power>=2000
triggerall = stateno !=750

;RC Jasta Air
[State -1, RC Jasta Air]
type = ChangeState
value = 690001
triggerall = command = "x"
triggerall = command = "y"
triggerall = command = "z"
triggerall = statetype = A
trigger1 = movecontact = 1 && enemynear, movetype = H
trigger1 = hitdefattr = A, NA, SA, HA
;triggerall = var(15)>=500
triggerall = power>=2000
triggerall = stateno !=750

;===========================================================================

[State -1, Grab]
type = ChangeState
value = 800
trigger1 = command = "a"
trigger1 = statetype = S
trigger1 = ctrl

[State -1, COMBO BREAKER!]
type = ChangeState
value = 900
triggerall = alive
triggerall = statetype != L
triggerall = var(15)>=1000
triggerall = !enemy,fvar(18)=1
triggerall = command = "c"
triggerall = command = "z"
triggerall = movetype = H
;Average battle
trigger1 = enemy,hitdefattr = SCA, NA, SA, NP, SP
;Wu support
trigger2 = enemynear, numhelper(777)
trigger2 = enemy, hitdefattr != SCA, HA, HP, NT, ST, HT
;---------------------------------------------------------------------------

;[State -1, SuperJump]
;type = ChangeState
;value = 4000
;triggerall = command = "DU"
;trigger1 = statetype != A
;trigger1 = ctrl

[State -1,DJC]
type = ChangeState
value = 45
triggerall = command = "holdup"
triggerall = stateno!=45 && stateno!=46 
;triggerall = var(45)>0
triggerall = var(29)>0
trigger1 = ctrl && stateno!=45 && stateno!=46 && stateno!=50 && stateno!=40 && stateno!= 4260
trigger2 = movecontact ;&& enemynear, movetype = H
trigger2 = hitdefattr = A, NA
trigger3 =  stateno=45 || stateno=46|| stateno=50
trigger3 = vel y>.1

;---------------------------------------------------------------------------
;Aerial Dash
[State -1, Airdash]
type = ChangeState
value =904
triggerall = command = "aFF"
trigger1 = statetype = A
trigger1 = ctrl
;trigger2 = (stateno = [600,640]) 
;trigger2 = movecontact
triggerall = stateno!=904
triggerall = var(29)>0
triggerall = pos y<-10


;Aerial Backdash
[State -1, Air Backdash]
type = ChangeState
value =903
triggerall = command = "aBB"
trigger1 = statetype = A
trigger1 = ctrl
;trigger2 = (stateno = [600,640]) 
;trigger2 = movecontact
triggerall = stateno!=903
triggerall = var(29)>0
triggerall = pos y<-10
;--------------------------------------------------------------------------
;Run Forward
[State -1, Run Fwd]
type = ChangeState
value = 100
triggerall = command = "FF"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 250
triggerall = stateno!=100

;Backdash
[State -1, Backdash]
type = ChangeState
value = 105
triggerall = command = "BB"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 250
triggerall = stateno!=105


;===========================================================================
;NORMALS BEHOLD!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;===========================================================================

;5L: Standing Light
[State -1, Standing Light]
type = ChangeState
value = 200
triggerall = command = "x"
triggerall = command != "holddown" && var(59) !=4
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = command = "buffer_x"
trigger2 = movecontact =1 ;&& enemynear, movetype = H
trigger2 = stateno = 400 && time>1
trigger2 = movecontact = 1 ;&& enemynear, movetype = H
trigger3 = stateno = 200 && movecontact ;&& enemynear, movetype = H
trigger4 = stateno = 101 
 
;5M: Standing Medium
[State -1, Standing Medium]
type = ChangeState
value =  210
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact ;5L
;trigger3 = stateno = 100 && time > 3
trigger3 = stateno = 400 && movecontact ;2L
trigger4 = stateno = 101  ;runstop

;5H: Standing Heavy
[State -1, Standing Heavy]
type = ChangeState
value =  220
trigger1 = statetype = S
triggerall = command = "z"
triggerall = command != "holddown"
trigger1 = ctrl
trigger2 = (stateno = 200) && movecontact ;5L
trigger3 = (stateno = 210) && movecontact ;5M
trigger4 = (stateno = 410) && movecontact ;2M
trigger5 = (stateno = 420) && movecontact ;2H
;trigger6 = stateno = 100 && time > 3
trigger6 = stateno = 400 && movecontact ;2L
trigger7 = stateno = 101 ;runstop

;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;2L: Crouching Light
[State -1, Crouching Light]
type = ChangeState
value = 400
triggerall = command = "buffer_x"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = stateno = 200 && movecontact ;5L
trigger3 = stateno = 400 && movecontact ;2L
trigger4 = stateno = 101 ;runstop

;---------------------------------------------------------------------------
;2M: Crouching Medium
[State -1, Crouching Medium]
type = ChangeState
value = 410
triggerall = command = "y"
triggerall = command = "buffdown"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 200)  || (stateno = 210) 
trigger2 = (movecontact) ;&& enemynear, movetype = H
trigger3 = stateno = 101 ;runstop

;---------------------------------------------------------------------------
;Crouching Heavy (2H)
[State -1, Crouching Heavy]
type = ChangeState
value = 420
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = command != "holdfwd"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 410)|| (stateno = 200)|| (stateno = 210) || (stateno = 430)
trigger2 = (movecontact) ;&& enemynear, movetype = H
trigger3 = stateno = 101


;---------------------------------------------------------------------------
;3H: Slide!!!
[State -1, 3H]
type = ChangeState
value = 430
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = command = "holdfwd"
trigger1 = statetype = C
trigger1 = ctrl
trigger2 = (stateno = 400) || (stateno = 410) || (stateno = 210)  || (stateno = 200) 
trigger2 = (movecontact) ;&& enemynear, movetype = H
trigger3 = stateno = 101 ;runstop

;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;---------------------------------------------------------------------------

;j.5L: Jumping Light
[State -1, Jumping Light]
type = ChangeState
value = 600
triggerall = command = "buffer_x"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = movecontact && stateno = 600 ;&& enemynear, movetype = H
trigger3 = stateno = 1350 ;Air blocking
;trigger4 = stateno = 904 && time > 3
;---------------------------------------------------------------------------
;j.5M: Jumping Medium
[State -1, Jumping Medium]
type = ChangeState
value = 610
triggerall = command = "y"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 600 || stateno = 601  ;jump_x or jump_a
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1350 ;Air blocking
trigger4 = stateno = 630 && movecontact

;---------------------------------------------------------------------------
;j.5H: Jumping Heavy
[State -1, Jumping Heavy]
type = ChangeState
value = 630
triggerall = command = "z"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = (stateno = [600,610]) 
trigger2 = movecontact ;&& enemynear, movetype = H
trigger3 = stateno = 1350 ;Air blocking

;---------------------------------------------------------------------------
;---------------------------------------------------------------------------
;LOL PARRY IS DEAD!!!!!!!!!!!!!!!!!!!!!!!!!!!
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