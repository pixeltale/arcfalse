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
;Down Assist
[command]
	name = "assist"
	command = /$D, d
	time = 2
[command]
	name = "assist"
	command = /$D, w
	time = 2

; Call Fwd Assist
[command]
	name = "assist_fwd"
	command = /$F, d
	time = 2
[command]
	name = "assist_fwd"
	command = /$F, w
	time = 2

;Call Back Assist
[command]
	name = "assist_back"
	command = /$B, d
	time = 1
[command]
	name = "assist_back"
	command = /$B, w
	time = 1
 

;---
; tagin/tagout
; ���{�^��:��l�� / �O�̃p�[�g�i�[
; tag:1st partner / shift_fwd
[command]
	name = "shift_fwd"
	command = /$F, d
	time = 1
[command]
	name = "shift_back"
	command = /$B,d
	time = 1

; ���{�^��:��l�� / ��̃p�[�g�i�[
; tag:2nd partner / shift_back
[command]
	name = "shift_fwd"
	command = /$F,w
	time = 1
[command]
	name = "shift_back"
	command = /$B,w
	time = 1


;---
;---
; �X�^�[�g�{�^��
[command]
	name="start"
	command=s
	time=1
 

; �x���{�^��:��l�� / ��̃p�[�g�i�[
; assist:2nd partner / shift_back
[command]
	name="superassist_fwd"
	command=/$D,d
	time=1


; �x���{�^��:��l�� / ��̃p�[�g�i�[
; assist:2nd partner / shift_back
[command]
	name="superassist_back"
	command=/$D,w
	time=1

