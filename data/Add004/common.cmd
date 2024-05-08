[Command]
name = "recovery"
command = 
time = 1
buffer.time = 1

[Command]
name = "TagShiftBack"
command = d
time = 1
buffer.time = 1

[Command]
name = "TagShiftFwd"
command = w
time = 1
buffer.time = 1

[Command]
name = "x"
command = x
time = 1
buffer.time = 1

[Command]
name = "y"
command = y
time = 1
buffer.time = 1

[Command]
name = "z"
command = z
time = 1
buffer.time = 1

[Command]
name = "a"
command = a
time = 1
buffer.time = 1

[Command]
name = "b"
command = b
time = 1
buffer.time = 1

[Command]
name = "c"
command = c
time = 1
buffer.time = 1

[Command]
name = "start"
command = s
time = 1
buffer.time = 1

[Command]
name = "d"
command = d
time = 1
buffer.time = 1

[Command]
name = "w"
command = w
time = 1
buffer.time = 1

[Command]
name = "m"
command = m
time = 1
buffer.time = 1

[Command]
name = "menu"
command = m
time = 1
buffer.time = 1

[Command]
name = "holdfwd"
command = /$F
time = 1
buffer.time = 1

[Command]
name = "holdback"
command = /$B
time = 1
buffer.time = 1

[Command]
name = "holdup"
command = /$U
time = 1
buffer.time = 1

[Command]
name = "holddown"
command = /$D
time = 1
buffer.time = 1
 

 

;--- call assist
; 支援ボタン:一人目 / 前のパートナー
; assist:1st partner / shift_fwd
[command]
	name="assist_fwd"
	command=d
	time=2

; 支援ボタン:二人目 / 後のパートナー
; assist:2nd partner / shift_back
[command]
	name="assist_back"
	command=w
	time=2
 

;---
; tagin/tagout
; 交代ボタン:一人目 / 前のパートナー
; tag:1st partner / shift_fwd
[command]
	name="shift_fwd"
	command=/$F,d
	time=1
[command]
	name="shift_back"
	command=/$B,d
	time=1

; 交代ボタン:二人目 / 後のパートナー
; tag:2nd partner / shift_back
[command]
	name="shift_fwd"
	command=/$F,w
	time=1
[command]
	name="shift_back"
	command=/$B,w
	time=1


;---
;---
; スタートボタン
[command]
	name="start"
	command=s
	time=1
 

; 支援ボタン:二人目 / 後のパートナー
; assist:2nd partner / shift_back
[command]
	name="superassist_fwd"
	command=/$D,d
	time=1


; 支援ボタン:二人目 / 後のパートナー
; assist:2nd partner / shift_back
[command]
	name="superassist_back"
	command=/$D,w
	time=1

