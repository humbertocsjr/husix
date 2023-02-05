;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:8:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:10:13 ===---
cpu 8086
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:11:13 ===---
bits 16
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:12:13 ===---
org 0x100
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:13:13 ===---
mov word [_os_minstackptr], END
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:14:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _os_start2
ROTULO0:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:1:8 ===---
; MODULO: os
_os:
db 13
db 83,121,115,116,101,109,46,79,83,46,104,99,98
db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:2:9 ===---
_os_trystack:
times 2 db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:3:9 ===---
_os_trycode:
times 2 db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:4:9 ===---
_os_trybase:
times 2 db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:5:9 ===---
_os_tryfatal:
times 2 db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:6:9 ===---
_os_minstackptr:
times 2 db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:8:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:17:9 ===---
_os_stackcheck:
ROTULO1:
FIM_os_stackcheck:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:21:9 ===---
_os_start2:
push bp
mov bp, sp
sub sp, 28
push cs
call _os_stackcheck
; ARG: args TAM: 4 POS: BP--14 
; ARG: realoc TAM: 4 POS: BP--18 
; ARG: ptr TAM: 4 POS: BP--22 
; ARG: tiporealoc TAM: 2 POS: BP--24 
; ARG: desvio TAM: 2 POS: BP--26 
; ARG: soma TAM: 2 POS: BP--28 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:23:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:25:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:26:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:27:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:28:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:29:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:30:10 ===---
; ACAO GRAVACAO - Grava segmento em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:30:19 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _os_codesegment
mov word [bp+-18+2], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:31:10 ===---
; ACAO GRAVACAO - Grava segmento em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:31:16 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _os_codesegment
mov word [bp+-22+2], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:32:10 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:32:19 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _os_realoctable
mov [bp+-18], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:33:9 ===---
ROTULO3:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:33:22 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:33:15 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-18+2]
pop es
mov di, [bp+-18]
es mov ax, [di+0]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:33:25 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
jne ROTULO6
jmp ROTULO7
ROTULO6:
mov ax, 65535
jmp ROTULO8
ROTULO7:
xor ax, ax
ROTULO8:
cmp ax, 0
jne ROTULO4
jmp ROTULO5
ROTULO4:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:34:13 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:34:26 ===---
; ACAO LEITURA - Le ponteiro
es mov ax, [di+0]
mov [bp+-24], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:35:14 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-18]
inc di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:36:14 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-18]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:37:14 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:37:20 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-18+2]
pop es
mov di, [bp+-18]
es mov ax, [di+0]
mov [bp+-22], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:38:14 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-18]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:39:14 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-18]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:40:13 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:40:22 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-18+2]
pop es
mov di, [bp+-18]
es mov ax, [di+0]
mov [bp+-26], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:41:14 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-18]
inc di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:42:14 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-18]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:43:13 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:43:20 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-18+2]
pop es
mov di, [bp+-18]
es mov ax, [di+0]
mov [bp+-28], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:44:14 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-18]
inc di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:45:14 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-18]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:46:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:46:27 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:46:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-24]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:46:30 ===---
mov ax, 3
mov bx, ax
pop ax
cmp ax, bx
je ROTULO11
jmp ROTULO12
ROTULO11:
mov ax, 65535
jmp ROTULO13
ROTULO12:
xor ax, ax
ROTULO13:
cmp ax, 0
jne ROTULO9
jmp ROTULO10
ROTULO9:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:47:17 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:47:33 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:47:36 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-22]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:47:26 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-26]
pop bx
add ax, bx
mov [bp+-26], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:48:17 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:48:23 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-26]
push word [bp+-22+2]
pop es
mov di, [bp+-22]
es mov [di+0], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:49:18 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-22]
inc di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:50:18 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-22]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:51:17 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:51:37 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:51:39 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-28]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:51:23 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _os_codesegment
pop bx
add ax, bx
push word [bp+-22+2]
pop es
mov di, [bp+-22]
es mov [di+0], ax
ROTULO10:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:53:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:53:27 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:53:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-24]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:53:30 ===---
mov ax, 2
mov bx, ax
pop ax
cmp ax, bx
je ROTULO16
jmp ROTULO17
ROTULO16:
mov ax, 65535
jmp ROTULO18
ROTULO17:
xor ax, ax
ROTULO18:
cmp ax, 0
jne ROTULO14
jmp ROTULO15
ROTULO14:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:54:18 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:54:29 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:54:31 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-26]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:54:25 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-22]
pop bx
add ax, bx
mov [bp+-22], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:55:17 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:55:38 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:55:40 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-28]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:55:23 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _os_stacksegment
pop bx
add ax, bx
push word [bp+-22+2]
pop es
mov di, [bp+-22]
es mov [di+0], ax
ROTULO15:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:57:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:57:27 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:57:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-24]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:57:30 ===---
mov ax, 1
mov bx, ax
pop ax
cmp ax, bx
je ROTULO21
jmp ROTULO22
ROTULO21:
mov ax, 65535
jmp ROTULO23
ROTULO22:
xor ax, ax
ROTULO23:
cmp ax, 0
jne ROTULO19
jmp ROTULO20
ROTULO19:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:58:18 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:58:29 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:58:31 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-26]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:58:25 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-22]
pop bx
add ax, bx
mov [bp+-22], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:59:17 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:59:37 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:59:39 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-28]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:59:23 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _os_codesegment
pop bx
add ax, bx
push word [bp+-22+2]
pop es
mov di, [bp+-22]
es mov [di+0], ax
ROTULO20:
jmp ROTULO3
ROTULO5:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:63:10 ===---
; ACAO GRAVACAO - Grava segmento em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:63:17 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _os_codesegment
mov word [bp+-14+2], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:64:10 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-14], 128
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:66:13 ===---
mov al, [0x80]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:67:13 ===---
xor ah, ah
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:68:13 ===---
mov si, ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:69:13 ===---
add si, 0x80
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:70:13 ===---
mov byte [si+1], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:72:11 ===---
cs mov ax, [_os_trycode]
mov [bp+-2], ax
cs mov ax, [_os_trystack]
mov [bp+-4], ax
cs mov ax, [_os_trybase]
mov [bp+-6], ax
mov ax, bp
cs mov [_os_trybase], ax
mov ax, sp
cs mov [_os_trystack], ax
mov ax, ROTULO24
cs mov [_os_trycode], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:73:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:73:26 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-14+2]
pop es
mov di, [bp+-14]
push es
push di
push cs
call _program_main
add sp, 4
jmp ROTULO25
ROTULO24:
mov bx, ax
mov ax, [bp+-10]
push word [bp+-8+2]
pop es
mov di, [bp+-8]
cs mov bp, [_os_trybase]
cs mov sp, [_os_trystack]
push es
pop word [bp+-8+2]
mov [bp+-8], di
mov [bp+-10], ax
mov ax, bx
mov bx, 1
cmp ax, bx
je ROTULO26
jmp ROTULO27
ROTULO26:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:75:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:75:65 ===---
; ACAO CHAMADA - Le linha com erro
mov ax, [bp+-10]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:75:52 ===---
; ACAO CHAMADA - Le nome do arquivo com erro
mov di, [bp+-8]
push cs
pop es
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:75:32 ===---
push cs
pop es
mov di, ROTULO29
jmp ROTULO28
ROTULO29:
db 17
db 68,105,118,105,115,195,163,111,32,112,111,114,32,122,101,114,111
times 1 db 0
ROTULO28:
push es
push di
push cs
call _program_fatalerror
add sp, 10
jmp ROTULO25
ROTULO27:
mov bx, 2
cmp ax, bx
je ROTULO30
jmp ROTULO31
ROTULO30:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:77:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:77:65 ===---
; ACAO CHAMADA - Le linha com erro
mov ax, [bp+-10]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:77:52 ===---
; ACAO CHAMADA - Le nome do arquivo com erro
mov di, [bp+-8]
push cs
pop es
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:77:32 ===---
push cs
pop es
mov di, ROTULO33
jmp ROTULO32
ROTULO33:
db 16
db 69,115,116,111,117,114,111,32,100,101,32,112,105,108,104,97
times 1 db 0
ROTULO32:
push es
push di
push cs
call _program_fatalerror
add sp, 10
jmp ROTULO25
ROTULO31:
mov bx, 3
cmp ax, bx
je ROTULO34
jmp ROTULO35
ROTULO34:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:79:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:79:60 ===---
; ACAO CHAMADA - Le linha com erro
mov ax, [bp+-10]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:79:47 ===---
; ACAO CHAMADA - Le nome do arquivo com erro
mov di, [bp+-8]
push cs
pop es
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:79:32 ===---
push cs
pop es
mov di, ROTULO37
jmp ROTULO36
ROTULO37:
db 12
db 83,101,109,32,109,101,109,195,179,114,105,97
times 1 db 0
ROTULO36:
push es
push di
push cs
call _program_fatalerror
add sp, 10
jmp ROTULO25
ROTULO35:
mov bx, 4
cmp ax, bx
je ROTULO38
jmp ROTULO39
ROTULO38:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:81:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:81:71 ===---
; ACAO CHAMADA - Le linha com erro
mov ax, [bp+-10]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:81:58 ===---
; ACAO CHAMADA - Le nome do arquivo com erro
mov di, [bp+-8]
push cs
pop es
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:81:32 ===---
push cs
pop es
mov di, ROTULO41
jmp ROTULO40
ROTULO41:
db 22
db 86,97,108,111,114,32,102,111,114,97,32,100,111,115,32,108,105,109,105,116,101,115
times 1 db 0
ROTULO40:
push es
push di
push cs
call _program_fatalerror
add sp, 10
jmp ROTULO25
ROTULO39:
mov bx, 5
cmp ax, bx
je ROTULO42
jmp ROTULO43
ROTULO42:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:83:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:83:63 ===---
; ACAO CHAMADA - Le linha com erro
mov ax, [bp+-10]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:83:50 ===---
; ACAO CHAMADA - Le nome do arquivo com erro
mov di, [bp+-8]
push cs
pop es
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:83:32 ===---
push cs
pop es
mov di, ROTULO45
jmp ROTULO44
ROTULO45:
db 15
db 78,195,163,111,32,101,110,99,111,110,116,114,97,100,111
times 1 db 0
ROTULO44:
push es
push di
push cs
call _program_fatalerror
add sp, 10
jmp ROTULO25
ROTULO43:
mov bx, 6
cmp ax, bx
je ROTULO46
jmp ROTULO47
ROTULO46:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:85:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:85:63 ===---
; ACAO CHAMADA - Le linha com erro
mov ax, [bp+-10]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:85:50 ===---
; ACAO CHAMADA - Le nome do arquivo com erro
mov di, [bp+-8]
push cs
pop es
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:85:32 ===---
push cs
pop es
mov di, ROTULO49
jmp ROTULO48
ROTULO49:
db 15
db 73,116,101,109,32,106,195,161,32,101,120,105,115,116,101
times 1 db 0
ROTULO48:
push es
push di
push cs
call _program_fatalerror
add sp, 10
jmp ROTULO25
ROTULO47:
mov bx, 7
cmp ax, bx
je ROTULO50
jmp ROTULO51
ROTULO50:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:87:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:87:65 ===---
; ACAO CHAMADA - Le linha com erro
mov ax, [bp+-10]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:87:52 ===---
; ACAO CHAMADA - Le nome do arquivo com erro
mov di, [bp+-8]
push cs
pop es
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:87:32 ===---
push cs
pop es
mov di, ROTULO53
jmp ROTULO52
ROTULO53:
db 17
db 78,195,163,111,32,105,109,112,108,101,109,101,110,116,97,100,111
times 1 db 0
ROTULO52:
push es
push di
push cs
call _program_fatalerror
add sp, 10
jmp ROTULO25
ROTULO51:
mov bx, 8
cmp ax, bx
je ROTULO54
jmp ROTULO55
ROTULO54:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:89:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:89:67 ===---
; ACAO CHAMADA - Le linha com erro
mov ax, [bp+-10]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:89:54 ===---
; ACAO CHAMADA - Le nome do arquivo com erro
mov di, [bp+-8]
push cs
pop es
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:89:32 ===---
push cs
pop es
mov di, ROTULO57
jmp ROTULO56
ROTULO57:
db 18
db 70,97,108,104,97,32,100,101,115,99,111,110,104,101,99,105,100,97
times 1 db 0
ROTULO56:
push es
push di
push cs
call _program_fatalerror
add sp, 10
jmp ROTULO25
ROTULO55:
mov bx, 9
cmp ax, bx
je ROTULO58
jmp ROTULO59
ROTULO58:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:91:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:91:70 ===---
; ACAO CHAMADA - Le linha com erro
mov ax, [bp+-10]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:91:57 ===---
; ACAO CHAMADA - Le nome do arquivo com erro
mov di, [bp+-8]
push cs
pop es
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:91:32 ===---
push cs
pop es
mov di, ROTULO61
jmp ROTULO60
ROTULO61:
db 21
db 69,115,116,111,117,114,111,32,100,97,32,67,97,112,97,99,105,100,97,100,101
times 1 db 0
ROTULO60:
push es
push di
push cs
call _program_fatalerror
add sp, 10
jmp ROTULO25
ROTULO59:
mov bx, 10
cmp ax, bx
je ROTULO62
jmp ROTULO63
ROTULO62:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:93:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:93:61 ===---
; ACAO CHAMADA - Le linha com erro
mov ax, [bp+-10]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:93:48 ===---
; ACAO CHAMADA - Le nome do arquivo com erro
mov di, [bp+-8]
push cs
pop es
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:93:32 ===---
push cs
pop es
mov di, ROTULO65
jmp ROTULO64
ROTULO65:
db 12
db 83,101,109,32,114,101,115,112,111,115,116,97
times 1 db 0
ROTULO64:
push es
push di
push cs
call _program_fatalerror
add sp, 10
jmp ROTULO25
ROTULO63:
mov bx, 11
cmp ax, bx
je ROTULO66
jmp ROTULO67
ROTULO66:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:95:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:95:72 ===---
; ACAO CHAMADA - Le linha com erro
mov ax, [bp+-10]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:95:59 ===---
; ACAO CHAMADA - Le nome do arquivo com erro
mov di, [bp+-8]
push cs
pop es
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:95:32 ===---
push cs
pop es
mov di, ROTULO69
jmp ROTULO68
ROTULO69:
db 23
db 69,115,116,111,117,114,111,32,100,111,32,116,101,109,112,111,32,108,105,109,105,116,101
times 1 db 0
ROTULO68:
push es
push di
push cs
call _program_fatalerror
add sp, 10
jmp ROTULO25
ROTULO67:
mov bx, 12
cmp ax, bx
je ROTULO70
jmp ROTULO71
ROTULO70:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:97:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:97:63 ===---
; ACAO CHAMADA - Le linha com erro
mov ax, [bp+-10]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:97:50 ===---
; ACAO CHAMADA - Le nome do arquivo com erro
mov di, [bp+-8]
push cs
pop es
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:97:32 ===---
push cs
pop es
mov di, ROTULO73
jmp ROTULO72
ROTULO73:
db 15
db 86,97,108,111,114,32,105,110,118,195,161,108,105,100,111
times 1 db 0
ROTULO72:
push es
push di
push cs
call _program_fatalerror
add sp, 10
jmp ROTULO25
ROTULO71:
mov bx, 13
cmp ax, bx
je ROTULO74
jmp ROTULO75
ROTULO74:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:99:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:99:62 ===---
; ACAO CHAMADA - Le linha com erro
mov ax, [bp+-10]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:99:49 ===---
; ACAO CHAMADA - Le nome do arquivo com erro
mov di, [bp+-8]
push cs
pop es
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:99:32 ===---
push cs
pop es
mov di, ROTULO77
jmp ROTULO76
ROTULO77:
db 13
db 65,99,101,115,115,111,32,110,101,103,97,100,111
times 1 db 0
ROTULO76:
push es
push di
push cs
call _program_fatalerror
add sp, 10
jmp ROTULO25
ROTULO75:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:101:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:101:76 ===---
; ACAO CHAMADA - Le linha com erro
mov ax, [bp+-10]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:101:63 ===---
; ACAO CHAMADA - Le nome do arquivo com erro
mov di, [bp+-8]
push cs
pop es
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:101:32 ===---
push cs
pop es
mov di, ROTULO81
jmp ROTULO80
ROTULO81:
db 28
db 79,99,111,114,114,101,117,32,117,109,32,101,114,114,111,32,110,195,163,111,32,116,114,97,116,97,100,111
times 1 db 0
ROTULO80:
push es
push di
push cs
call _program_fatalerror
add sp, 10
jmp ROTULO25
ROTULO79:
cs jmp word [_os_tryfatal]
ROTULO25:
mov ax, [bp+-6]
cs mov [_os_trybase], ax
mov ax, [bp+-4]
cs mov [_os_trystack], ax
mov ax, [bp+-2]
cs mov [_os_trycode], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:104:9 ===---
ROTULO82:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:104:15 ===---
mov ax, 1
cmp ax, 0
jne ROTULO83
jmp ROTULO84
ROTULO83:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:105:17 ===---
hlt
jmp ROTULO82
ROTULO84:
ROTULO2:
mov sp, bp
pop bp
FIM_os_start2:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:109:21 ===---
_os_codesegment:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:110:13 ===---
mov ax, cs
ROTULO85:
FIM_os_codesegment:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:113:21 ===---
_os_stacksegment:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:114:13 ===---
mov ax, ss
ROTULO86:
FIM_os_stacksegment:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:117:21 ===---
_os_realoctable:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.OS.hcb:118:13 ===---
mov ax, REALOC_TABLE
ROTULO87:
FIM_os_realoctable:
retf
; MODULO FIM: os
;     ---=== husix.hcb:17:8 ===---
; MODULO: program
_program:
db 9
db 104,117,115,105,120,46,104,99,98
db 0
;     ---=== husix.hcb:19:9 ===---
_program_writedot:
;     ---=== husix.hcb:20:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:20:23 ===---
push cs
pop es
mov di, ROTULO90
jmp ROTULO89
ROTULO90:
db 2
db 32,46
times 1 db 0
ROTULO89:
push es
push di
push cs
call _console_write
add sp, 4
ROTULO88:
FIM_program_writedot:
retf
;     ---=== husix.hcb:23:16 ===---
_program_main:
push bp
mov bp, sp
sub sp, 34
push cs
call _os_stackcheck
; ARG: args TAM: 4 POS: BP+6 
; ARG: ptr TAM: 4 POS: BP--14 
; ARG: ver TAM: 4 POS: BP--18 
; ARG: root TAM: 4 POS: BP--22 
; ARG: file TAM: 4 POS: BP--26 
; ARG: s TAM: 4 POS: BP--30 
; ARG: blocktmp TAM: 4 POS: BP--34 
;     ---=== husix.hcb:23:21 ===---
;     ---=== husix.hcb:24:13 ===---
;     ---=== husix.hcb:25:13 ===---
;     ---=== husix.hcb:78:13 ===---
;     ---=== husix.hcb:80:13 ===---
;     ---=== husix.hcb:81:13 ===---
;     ---=== husix.hcb:82:13 ===---
;     ---=== husix.hcb:26:9 ===---
; ACAO STRUCTURE - Aloca estrutura na pilha
sub sp, 10
push ss
pop es
mov di, sp
push es
pop word [bp+-18+2]
mov [bp+-18], di
;     ---=== husix.hcb:27:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:27:33 ===---
; ACAO LEITURA - Le ponteiro
push es
push di
push cs
call _husixversion_getversion
add sp, 4
;     ---=== husix.hcb:28:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _console_initialize
;     ---=== husix.hcb:29:9 ===---
;     ---=== husix.hcb:29:12 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _console_cantextonly
cmp ax, 0
jne ROTULO92
jmp ROTULO93
ROTULO92:
;     ---=== husix.hcb:30:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:30:92 ===---
xor ax, ax
push ax
;     ---=== husix.hcb:30:79 ===---
push cs
pop es
mov di, ROTULO95
jmp ROTULO94
ROTULO95:
db 9
db 104,117,115,105,120,46,104,99,98
times 1 db 0
ROTULO94:
push es
push di
;     ---=== husix.hcb:30:24 ===---
push cs
pop es
mov di, ROTULO97
jmp ROTULO96
ROTULO97:
db 51
db 77,111,100,111,32,100,101,32,86,105,100,101,111,32,110,97,111,32,100,101,116,101,99,116,97,100,111,44,32,82,101,113,117,101,114,32,67,71,65,32,111,117,32,115,117,112,101,114,105,111,114
times 1 db 0
ROTULO96:
push es
push di
push cs
call _program_fatalerror
add sp, 10
ROTULO93:
;     ---=== husix.hcb:32:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _console_mode80x25x4
;     ---=== husix.hcb:33:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:33:27 ===---
push cs
pop es
mov di, ROTULO99
jmp ROTULO98
ROTULO99:
db 22
db 72,85,83,73,88,32,79,112,101,114,97,116,105,110,103,32,83,121,115,116,101,109
times 1 db 0
ROTULO98:
push es
push di
push cs
call _console_writeline
add sp, 4
;     ---=== husix.hcb:34:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:34:23 ===---
push cs
pop es
mov di, ROTULO101
jmp ROTULO100
ROTULO101:
db 8
db 75,101,114,110,101,108,32,118
times 1 db 0
ROTULO100:
push es
push di
push cs
call _console_write
add sp, 4
;     ---=== husix.hcb:35:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:35:29 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 0
push word [bp+-18+2]
pop es
mov di, [bp+-18]
es mov ax, [di+0]
push ax
push cs
call _console_writeuint16
add sp, 2
;     ---=== husix.hcb:36:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:36:23 ===---
push cs
pop es
mov di, ROTULO103
jmp ROTULO102
ROTULO103:
db 1
db 46
times 1 db 0
ROTULO102:
push es
push di
push cs
call _console_write
add sp, 4
;     ---=== husix.hcb:37:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:37:29 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 2
push word [bp+-18+2]
pop es
mov di, [bp+-18]
es mov ax, [di+2]
push ax
push cs
call _console_writeuint16
add sp, 2
;     ---=== husix.hcb:38:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:38:23 ===---
push cs
pop es
mov di, ROTULO105
jmp ROTULO104
ROTULO105:
db 2
db 32,82
times 1 db 0
ROTULO104:
push es
push di
push cs
call _console_write
add sp, 4
;     ---=== husix.hcb:39:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:39:29 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 4
push word [bp+-18+2]
pop es
mov di, [bp+-18]
es mov ax, [di+4]
push ax
push cs
call _console_writeuint16
add sp, 2
;     ---=== husix.hcb:40:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:40:23 ===---
push cs
pop es
mov di, ROTULO107
jmp ROTULO106
ROTULO107:
db 3
db 32,45,32
times 1 db 0
ROTULO106:
push es
push di
push cs
call _console_write
add sp, 4
;     ---=== husix.hcb:41:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:41:27 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - Ponteiro Byte - Desvio 6
push word [bp+-18+2]
pop es
mov di, [bp+-18]
es push word [di+6+2]
es push word [di+6]
pop di
pop es
push es
push di
push cs
call _console_writeline
add sp, 4
;     ---=== husix.hcb:42:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:42:23 ===---
push cs
pop es
mov di, ROTULO109
jmp ROTULO108
ROTULO109:
db 12
db 73,110,105,116,105,97,108,105,122,105,110,103
times 1 db 0
ROTULO108:
push es
push di
push cs
call _console_write
add sp, 4
;     ---=== husix.hcb:43:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _multithreading_preinitialize
;     ---=== husix.hcb:44:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _program_writedot
;     ---=== husix.hcb:45:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _globalmemory_initialize
;     ---=== husix.hcb:46:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _program_writedot
;     ---=== husix.hcb:47:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _memory_initialize
;     ---=== husix.hcb:48:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _program_writedot
;     ---=== husix.hcb:49:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _multithreading_initialize
;     ---=== husix.hcb:50:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _program_writedot
;     ---=== husix.hcb:51:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _systemtimer_initialize
;     ---=== husix.hcb:52:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _program_writedot
;     ---=== husix.hcb:53:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _multithreading_resume
;     ---=== husix.hcb:54:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _program_writedot
;     ---=== husix.hcb:55:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _disk_initialize
;     ---=== husix.hcb:56:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _program_writedot
;     ---=== husix.hcb:57:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _filesystem_initialize
;     ---=== husix.hcb:58:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _program_writedot
;     ---=== husix.hcb:59:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:59:27 ===---
push cs
pop es
mov di, ROTULO111
jmp ROTULO110
ROTULO111:
db 7
db 32,91,32,79,75,32,93
times 1 db 0
ROTULO110:
push es
push di
push cs
call _console_writeline
add sp, 4
;     ---=== husix.hcb:61:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _configdefault_initialize
;     ---=== husix.hcb:62:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:62:26 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
push cs
call _config_parseargs
add sp, 4
;     ---=== husix.hcb:64:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:64:23 ===---
push cs
pop es
mov di, ROTULO113
jmp ROTULO112
ROTULO113:
db 10
db 77,111,117,110,116,105,110,103,32,91
times 1 db 0
ROTULO112:
push es
push di
push cs
call _console_write
add sp, 4
;     ---=== husix.hcb:65:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:65:23 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_config_rootdisk+2]
pop es
cs mov di, [_config_rootdisk]
push es
push di
push cs
call _console_write
add sp, 4
;     ---=== husix.hcb:66:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:66:23 ===---
push cs
pop es
mov di, ROTULO115
jmp ROTULO114
ROTULO115:
db 1
db 93
times 1 db 0
ROTULO114:
push es
push di
push cs
call _console_write
add sp, 4
;     ---=== husix.hcb:67:9 ===---
;     ---=== husix.hcb:67:40 ===---
;     ---=== husix.hcb:67:12 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:67:23 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_config_rootdisk+2]
pop es
cs mov di, [_config_rootdisk]
push es
push di
push cs
call _disk_exist
add sp, 4
push ax
;     ---=== husix.hcb:67:43 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO118
jmp ROTULO119
ROTULO118:
mov ax, 65535
jmp ROTULO120
ROTULO119:
xor ax, ax
ROTULO120:
cmp ax, 0
jne ROTULO116
jmp ROTULO117
ROTULO116:
;     ---=== husix.hcb:68:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:68:63 ===---
xor ax, ax
push ax
;     ---=== husix.hcb:68:46 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_config_rootdisk+2]
pop es
cs mov di, [_config_rootdisk]
push es
push di
;     ---=== husix.hcb:68:24 ===---
push cs
pop es
mov di, ROTULO122
jmp ROTULO121
ROTULO122:
db 18
db 91,32,68,73,83,75,32,78,79,84,32,70,79,85,78,68,32,93
times 1 db 0
ROTULO121:
push es
push di
push cs
call _program_fatalerror
add sp, 10
ROTULO117:
;     ---=== husix.hcb:70:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _program_writedot
;     ---=== husix.hcb:71:11 ===---
cs mov ax, [_os_trycode]
mov [bp+-2], ax
cs mov ax, [_os_trystack]
mov [bp+-4], ax
cs mov ax, [_os_trybase]
mov [bp+-6], ax
mov ax, bp
cs mov [_os_trybase], ax
mov ax, sp
cs mov [_os_trystack], ax
mov ax, ROTULO123
cs mov [_os_trycode], ax
;     ---=== husix.hcb:72:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:72:70 ===---
push cs
pop es
mov di, ROTULO126
jmp ROTULO125
ROTULO126:
db 1
db 47
times 1 db 0
ROTULO125:
push es
push di
;     ---=== husix.hcb:72:47 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_config_rootfilesystem+2]
pop es
cs mov di, [_config_rootfilesystem]
push es
push di
;     ---=== husix.hcb:72:30 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_config_rootdisk+2]
pop es
cs mov di, [_config_rootdisk]
push es
push di
push cs
call _filesystem_mount
add sp, 12
jmp ROTULO124
ROTULO123:
mov bx, ax
mov ax, [bp+-10]
push word [bp+-8+2]
pop es
mov di, [bp+-8]
cs mov bp, [_os_trybase]
cs mov sp, [_os_trystack]
push es
pop word [bp+-8+2]
mov [bp+-8], di
mov [bp+-10], ax
mov ax, bx
;     ---=== husix.hcb:74:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:74:66 ===---
xor ax, ax
push ax
;     ---=== husix.hcb:74:49 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_config_rootdisk+2]
pop es
cs mov di, [_config_rootdisk]
push es
push di
;     ---=== husix.hcb:74:24 ===---
push cs
pop es
mov di, ROTULO130
jmp ROTULO129
ROTULO130:
db 21
db 91,32,68,73,83,75,32,78,79,84,32,70,79,82,77,65,84,69,68,32,93
times 1 db 0
ROTULO129:
push es
push di
push cs
call _program_fatalerror
add sp, 10
jmp ROTULO124
ROTULO128:
cs jmp word [_os_tryfatal]
ROTULO124:
mov ax, [bp+-6]
cs mov [_os_trybase], ax
mov ax, [bp+-4]
cs mov [_os_trystack], ax
mov ax, [bp+-2]
cs mov [_os_trycode], ax
;     ---=== husix.hcb:76:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _program_writedot
;     ---=== husix.hcb:77:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:77:27 ===---
push cs
pop es
mov di, ROTULO132
jmp ROTULO131
ROTULO132:
db 7
db 32,91,32,79,75,32,93
times 1 db 0
ROTULO131:
push es
push di
push cs
call _console_writeline
add sp, 4
;     ---=== husix.hcb:79:9 ===---
; ACAO STRUCTURE - Aloca estrutura na pilha
sub sp, 51
push ss
pop es
mov di, sp
push es
pop word [bp+-22+2]
mov [bp+-22], di
;     ---=== husix.hcb:83:9 ===---
; ACAO STRUCTURE - Aloca estrutura na pilha
sub sp, 52
push ss
pop es
mov di, sp
push es
pop word [bp+-30+2]
mov [bp+-30], di
;     ---=== husix.hcb:84:9 ===---
; ACAO STRUCTURE - Aloca estrutura na pilha
sub sp, 47
push ss
pop es
mov di, sp
push es
pop word [bp+-26+2]
mov [bp+-26], di
;     ---=== husix.hcb:85:9 ===---
; ACAO STRUCTURE - Aloca estrutura na pilha
sub sp, 129
push ss
pop es
mov di, sp
push es
pop word [bp+-34+2]
mov [bp+-34], di
es mov byte [di+0], 128
es mov byte [di+1], 0
;     ---=== husix.hcb:86:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:86:28 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-22+2]
pop es
mov di, [bp+-22]
push es
push di
push cs
call _filesystem_getroot
add sp, 4
;     ---=== husix.hcb:87:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:87:41 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-26+2]
pop es
mov di, [bp+-26]
push es
push di
;     ---=== husix.hcb:87:38 ===---
mov ax, 2
push ax
;     ---=== husix.hcb:87:32 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-22+2]
pop es
mov di, [bp+-22]
push es
push di
push cs
call _filesystem_getfileinfo
add sp, 10
;     ---=== husix.hcb:88:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:88:27 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - Ponteiro Byte - Desvio 35
push word [bp+-26+2]
pop es
mov di, [bp+-26]
es push word [di+35+2]
es push word [di+35]
pop di
pop es
push es
push di
push cs
call _console_writeline
add sp, 4
;     ---=== husix.hcb:89:9 ===---
; ACAO CHAMADA - Chama indiretamente usando Invoke
;     ---=== husix.hcb:89:26 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-30+2]
pop es
mov di, [bp+-30]
push es
push di
;     ---=== husix.hcb:89:9 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-26+2]
pop es
mov di, [bp+-26]
push es
push di
es call far [di+43]
add sp, 8
;     ---=== husix.hcb:90:9 ===---
ROTULO133:
;     ---=== husix.hcb:90:15 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:90:30 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-34+2]
pop es
mov di, [bp+-34]
push es
push di
;     ---=== husix.hcb:90:27 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-30+2]
pop es
mov di, [bp+-30]
push es
push di
push cs
call _stream_read
add sp, 8
cmp ax, 0
jne ROTULO134
jmp ROTULO135
ROTULO134:
;     ---=== husix.hcb:91:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:91:27 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-34+2]
pop es
mov di, [bp+-34]
push es
push di
push cs
call _console_write
add sp, 4
jmp ROTULO133
ROTULO135:
;     ---=== husix.hcb:93:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:93:27 ===---
push cs
pop es
mov di, ROTULO137
jmp ROTULO136
ROTULO137:
db 5
db 91,69,79,70,93
times 1 db 0
ROTULO136:
push es
push di
push cs
call _console_writeline
add sp, 4
;     ---=== husix.hcb:95:9 ===---
ROTULO138:
;     ---=== husix.hcb:95:15 ===---
mov ax, 1
cmp ax, 0
jne ROTULO139
jmp ROTULO140
ROTULO139:
;     ---=== husix.hcb:96:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:96:31 ===---
mov ax, 13
xor ah, ah
push ax
push cs
call _console_writechar
add sp, 2
;     ---=== husix.hcb:97:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:97:33 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_clock_minute]
push ax
push cs
call _console_writeuint16
add sp, 2
;     ---=== husix.hcb:98:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:98:27 ===---
push cs
pop es
mov di, ROTULO142
jmp ROTULO141
ROTULO142:
db 1
db 58
times 1 db 0
ROTULO141:
push es
push di
push cs
call _console_write
add sp, 4
;     ---=== husix.hcb:99:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:99:33 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_clock_second]
push ax
push cs
call _console_writeuint16
add sp, 2
;     ---=== husix.hcb:100:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:100:26 ===---
mov ax, 1000
push ax
push cs
call _thread_sleep
add sp, 2
jmp ROTULO138
ROTULO140:
ROTULO91:
mov sp, bp
pop bp
FIM_program_main:
retf
;     ---=== husix.hcb:104:16 ===---
_program_fatalerror:
push bp
mov bp, sp
; ARG: msg TAM: 4 POS: BP+6 
; ARG: file TAM: 4 POS: BP+10 
; ARG: line TAM: 2 POS: BP+14 
;     ---=== husix.hcb:104:27 ===---
;     ---=== husix.hcb:104:42 ===---
;     ---=== husix.hcb:104:58 ===---
;     ---=== husix.hcb:105:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _console_mode80x25x4
;     ---=== husix.hcb:106:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:106:27 ===---
push cs
pop es
mov di, ROTULO145
jmp ROTULO144
ROTULO145:
db 12
db 70,65,84,65,76,32,69,82,82,79,82,58
times 1 db 0
ROTULO144:
push es
push di
push cs
call _console_writeline
add sp, 4
;     ---=== husix.hcb:107:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:107:23 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+10+2]
pop es
mov di, [bp+10]
push es
push di
push cs
call _console_write
add sp, 4
;     ---=== husix.hcb:108:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:108:23 ===---
push cs
pop es
mov di, ROTULO147
jmp ROTULO146
ROTULO147:
db 1
db 58
times 1 db 0
ROTULO146:
push es
push di
push cs
call _console_write
add sp, 4
;     ---=== husix.hcb:109:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:109:29 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+14]
push ax
push cs
call _console_writeuint16
add sp, 2
;     ---=== husix.hcb:110:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:110:27 ===---
push cs
pop es
mov di, ROTULO149
jmp ROTULO148
ROTULO149:
db 1
db 58
times 1 db 0
ROTULO148:
push es
push di
push cs
call _console_writeline
add sp, 4
;     ---=== husix.hcb:111:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:111:27 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
push cs
call _console_writeline
add sp, 4
;     ---=== husix.hcb:112:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:112:27 ===---
push cs
pop es
mov di, ROTULO151
jmp ROTULO150
ROTULO151:
db 0
times 1 db 0
ROTULO150:
push es
push di
push cs
call _console_writeline
add sp, 4
;     ---=== husix.hcb:113:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:113:27 ===---
push cs
pop es
mov di, ROTULO153
jmp ROTULO152
ROTULO153:
db 15
db 60,83,89,83,84,69,77,32,72,65,76,84,69,68,62
times 1 db 0
ROTULO152:
push es
push di
push cs
call _console_writeline
add sp, 4
;     ---=== husix.hcb:114:9 ===---
ROTULO154:
;     ---=== husix.hcb:114:15 ===---
mov ax, 1
cmp ax, 0
jne ROTULO155
jmp ROTULO156
ROTULO155:
;     ---=== husix.hcb:115:17 ===---
cli
;     ---=== husix.hcb:116:17 ===---
hlt
jmp ROTULO154
ROTULO156:
ROTULO143:
mov sp, bp
pop bp
FIM_program_fatalerror:
retf
; MODULO FIM: program
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:4:8 ===---
; MODULO: console
_console:
db 21
db 83,121,115,116,101,109,46,73,79,46,67,111,110,115,111,108,101,46,104,99,98
db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:5:9 ===---
_console_supportlevel:
times 2 db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:7:21 ===---
_console_canvga:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:8:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:8:29 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:8:16 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_console_supportlevel]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:8:32 ===---
mov ax, 3
mov bx, ax
pop ax
cmp ax, bx
jae ROTULO158
jmp ROTULO159
ROTULO158:
mov ax, 65535
jmp ROTULO160
ROTULO159:
xor ax, ax
ROTULO160:
jmp ROTULO157
ROTULO157:
FIM_console_canvga:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:11:21 ===---
_console_canega:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:12:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:12:29 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:12:16 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_console_supportlevel]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:12:32 ===---
mov ax, 2
mov bx, ax
pop ax
cmp ax, bx
jae ROTULO162
jmp ROTULO163
ROTULO162:
mov ax, 65535
jmp ROTULO164
ROTULO163:
xor ax, ax
ROTULO164:
jmp ROTULO161
ROTULO161:
FIM_console_canega:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:15:21 ===---
_console_cancga:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:16:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:16:29 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:16:16 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_console_supportlevel]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:16:32 ===---
mov ax, 1
mov bx, ax
pop ax
cmp ax, bx
jae ROTULO166
jmp ROTULO167
ROTULO166:
mov ax, 65535
jmp ROTULO168
ROTULO167:
xor ax, ax
ROTULO168:
jmp ROTULO165
ROTULO165:
FIM_console_cancga:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:19:21 ===---
_console_canmga:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:20:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:20:29 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:20:16 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_console_supportlevel]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:20:32 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
jae ROTULO170
jmp ROTULO171
ROTULO170:
mov ax, 65535
jmp ROTULO172
ROTULO171:
xor ax, ax
ROTULO172:
jmp ROTULO169
ROTULO169:
FIM_console_canmga:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:23:21 ===---
_console_cantextonly:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:24:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:24:29 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:24:16 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_console_supportlevel]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:24:32 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO174
jmp ROTULO175
ROTULO174:
mov ax, 65535
jmp ROTULO176
ROTULO175:
xor ax, ax
ROTULO176:
jmp ROTULO173
ROTULO173:
FIM_console_cantextonly:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:28:16 ===---
_console_initialize:
push bp
mov bp, sp
sub sp, 2
push cs
call _os_stackcheck
; ARG: teste TAM: 2 POS: BP--2 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:29:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:30:9 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_console_supportlevel], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:31:9 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-2], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:32:13 ===---
xor bx, bx
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:33:13 ===---
mov ax, 0x1a00
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:34:13 ===---
int 0x10
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:35:13 ===---
mov [bp-2], bx
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:36:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:36:25 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:36:19 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:36:13 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:36:22 ===---
mov ax, 7
mov bx, ax
pop ax
cmp ax, bx
je ROTULO183
jmp ROTULO184
ROTULO183:
mov ax, 65535
jmp ROTULO185
ROTULO184:
xor ax, ax
ROTULO185:
cmp ax, 0
jne ROTULO180
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:36:39 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:36:33 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:36:42 ===---
mov ax, 8
mov bx, ax
pop ax
cmp ax, bx
je ROTULO186
jmp ROTULO187
ROTULO186:
mov ax, 65535
jmp ROTULO188
ROTULO187:
xor ax, ax
ROTULO188:
cmp ax, 0
je ROTULO181
ROTULO180:
mov ax, 65535
jmp ROTULO182
ROTULO181:
xor ax, ax
ROTULO182:
cmp ax, 0
jne ROTULO178
jmp ROTULO179
ROTULO178:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:37:13 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_console_supportlevel], 3
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:38:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:38:18 ===---
xor ax, ax
jmp ROTULO177
ROTULO179:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:41:13 ===---
mov ax, 0x1200
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:42:13 ===---
mov bl, 0x10
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:43:13 ===---
int 0x10
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:44:13 ===---
mov [bp-2], bx
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:45:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:45:18 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:45:12 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:45:21 ===---
mov ax, 16
mov bx, ax
pop ax
cmp ax, bx
jne ROTULO191
jmp ROTULO192
ROTULO191:
mov ax, 65535
jmp ROTULO193
ROTULO192:
xor ax, ax
ROTULO193:
cmp ax, 0
jne ROTULO189
jmp ROTULO190
ROTULO189:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:46:13 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_console_supportlevel], 2
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:47:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:47:18 ===---
xor ax, ax
jmp ROTULO177
ROTULO190:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:50:13 ===---
mov ax, 0xf00
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:51:13 ===---
int 0x10
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:52:13 ===---
xor ah, ah
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:53:13 ===---
mov [bp-2], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:55:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:55:18 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:55:12 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:55:21 ===---
mov ax, 3
mov bx, ax
pop ax
cmp ax, bx
je ROTULO196
jmp ROTULO197
ROTULO196:
mov ax, 65535
jmp ROTULO198
ROTULO197:
xor ax, ax
ROTULO198:
cmp ax, 0
jne ROTULO194
jmp ROTULO195
ROTULO194:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:56:13 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_console_supportlevel], 1
jmp ROTULO199
ROTULO195:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:58:13 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_console_supportlevel], 0
ROTULO199:
ROTULO177:
mov sp, bp
pop bp
FIM_console_initialize:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:62:16 ===---
_console_mode80x25x4:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:63:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:63:25 ===---
mov ax, 3
xor ah, ah
push ax
push cs
call _io_setvideomode
add sp, 2
ROTULO200:
FIM_console_mode80x25x4:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:66:21 ===---
_console_readchar:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:67:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:67:16 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _io_consolereadchar
jmp ROTULO201
ROTULO201:
FIM_console_readchar:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:70:16 ===---
_console_readline:
push bp
mov bp, sp
sub sp, 6
push cs
call _os_stackcheck
; ARG: txt TAM: 4 POS: BP+6 
; ARG: len TAM: 2 POS: BP--2 
; ARG: c TAM: 2 POS: BP--4 
; ARG: pos TAM: 2 POS: BP--6 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:70:25 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:71:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:72:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:73:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:74:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:74:15 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
xor ax, ax
es mov al, [di+0]
mov [bp+-2], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:75:10 ===---
; ACAO INC - Incrementa variavel
inc word [bp+6]
inc di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:76:9 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-4], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:77:9 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-6], 1
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:78:9 ===---
ROTULO203:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:78:15 ===---
mov ax, 1
cmp ax, 0
jne ROTULO204
jmp ROTULO205
ROTULO204:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:79:13 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:79:17 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _io_consolereadchar
mov [bp+-4], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:80:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:80:18 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:80:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:80:21 ===---
mov ax, 13
mov bx, ax
pop ax
cmp ax, bx
je ROTULO208
jmp ROTULO209
ROTULO208:
mov ax, 65535
jmp ROTULO210
ROTULO209:
xor ax, ax
ROTULO210:
cmp ax, 0
jne ROTULO206
jmp ROTULO207
ROTULO206:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:80:34 ===---
jmp done
ROTULO207:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:81:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:81:18 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:81:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:81:21 ===---
mov ax, 10
mov bx, ax
pop ax
cmp ax, bx
je ROTULO213
jmp ROTULO214
ROTULO213:
mov ax, 65535
jmp ROTULO215
ROTULO214:
xor ax, ax
ROTULO215:
cmp ax, 0
jne ROTULO211
jmp ROTULO212
ROTULO211:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:81:34 ===---
jmp done
ROTULO212:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:82:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:82:18 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:82:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:82:21 ===---
mov ax, 9
mov bx, ax
pop ax
cmp ax, bx
je ROTULO218
jmp ROTULO219
ROTULO218:
mov ax, 65535
jmp ROTULO220
ROTULO219:
xor ax, ax
ROTULO220:
cmp ax, 0
jne ROTULO216
jmp ROTULO217
ROTULO216:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:83:17 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:83:24 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:83:20 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-6]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:83:26 ===---
mov ax, 1
mov bx, ax
pop ax
cmp ax, bx
ja ROTULO223
jmp ROTULO224
ROTULO223:
mov ax, 65535
jmp ROTULO225
ROTULO224:
xor ax, ax
ROTULO225:
cmp ax, 0
jne ROTULO221
jmp ROTULO222
ROTULO221:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:84:21 ===---
; ACAO DEC - Decrementa variavel
dec word [bp+-6]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:85:22 ===---
; ACAO DEC - Decrementa variavel
dec word [bp+6]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:86:21 ===---
; ACAO GRAVACAO - Gravacao de numero em ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov byte [di+0], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:87:21 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:87:39 ===---
mov ax, 9
xor ah, ah
push ax
push cs
call _console_writechar
add sp, 2
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:88:21 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:88:39 ===---
mov ax, 32
xor ah, ah
push ax
push cs
call _console_writechar
add sp, 2
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:89:21 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:89:39 ===---
mov ax, 9
xor ah, ah
push ax
push cs
call _console_writechar
add sp, 2
ROTULO222:
jmp ROTULO226
ROTULO217:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:92:17 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:92:24 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:92:20 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-6]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:92:26 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
mov bx, ax
pop ax
cmp ax, bx
jb ROTULO229
jmp ROTULO230
ROTULO229:
mov ax, 65535
jmp ROTULO231
ROTULO230:
xor ax, ax
ROTULO231:
cmp ax, 0
jne ROTULO227
jmp ROTULO228
ROTULO227:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:93:21 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:93:39 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
xor ah, ah
push ax
push cs
call _console_writechar
add sp, 2
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:94:21 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:94:27 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov [di+0], al
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:95:21 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-6]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:96:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+6]
inc di
ROTULO228:
ROTULO226:
jmp ROTULO203
ROTULO205:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:100:9 ===---
done:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:101:9 ===---
; ACAO GRAVACAO - Gravacao de numero em ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov byte [di+0], 0
ROTULO202:
mov sp, bp
pop bp
FIM_console_readline:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:104:16 ===---
_console_writechar:
push bp
mov bp, sp
; ARG: c TAM: 2 POS: BP+6 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:104:26 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:105:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:105:29 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
xor ah, ah
push ax
push cs
call _io_consolewritechar
add sp, 2
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:106:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:106:14 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:106:12 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:106:17 ===---
mov ax, 10
mov bx, ax
pop ax
cmp ax, bx
je ROTULO235
jmp ROTULO236
ROTULO235:
mov ax, 65535
jmp ROTULO237
ROTULO236:
xor ax, ax
ROTULO237:
cmp ax, 0
jne ROTULO233
jmp ROTULO234
ROTULO233:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:106:25 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:106:45 ===---
mov ax, 13
xor ah, ah
push ax
push cs
call _io_consolewritechar
add sp, 2
ROTULO234:
ROTULO232:
mov sp, bp
pop bp
FIM_console_writechar:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:109:16 ===---
_console_write:
push bp
mov bp, sp
sub sp, 4
push cs
call _os_stackcheck
; ARG: txt TAM: 4 POS: BP+6 
; ARG: len TAM: 2 POS: BP--2 
; ARG: i TAM: 2 POS: BP--4 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:109:22 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:110:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:111:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:112:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:112:15 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
xor ax, ax
es mov al, [di+0]
mov [bp+-2], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:113:10 ===---
; ACAO INC - Incrementa variavel
inc word [bp+6]
inc di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:114:9 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-4], 1
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:115:9 ===---
ROTULO239:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:115:25 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:115:20 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:115:16 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:115:22 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
ja ROTULO245
jmp ROTULO246
ROTULO245:
mov ax, 65535
jmp ROTULO247
ROTULO246:
xor ax, ax
ROTULO247:
cmp ax, 0
je ROTULO243
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:115:36 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:115:34 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:115:39 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO248
jmp ROTULO249
ROTULO248:
mov ax, 65535
jmp ROTULO250
ROTULO249:
xor ax, ax
ROTULO250:
cmp ax, 0
je ROTULO243
ROTULO242:
mov ax, 65535
jmp ROTULO244
ROTULO243:
xor ax, ax
ROTULO244:
cmp ax, 0
jne ROTULO240
jmp ROTULO241
ROTULO240:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:116:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:116:23 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:116:47 ===---
; ACAO LEITURA - Le ponteiro
push es
push di
push cs
call _utf8_convertchartocp437
add sp, 4
xor ah, ah
push ax
push cs
call _console_writechar
add sp, 2
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:117:14 ===---
; ACAO INC - Incrementa variavel
inc word [bp+6]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:118:13 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-4]
jmp ROTULO239
ROTULO241:
ROTULO238:
mov sp, bp
pop bp
FIM_console_write:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:122:16 ===---
_console_writeline:
push bp
mov bp, sp
; ARG: txt TAM: 4 POS: BP+6 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:122:26 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:123:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:123:15 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
push cs
call _console_write
add sp, 4
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:124:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:124:19 ===---
mov ax, 13
xor ah, ah
push ax
push cs
call _console_writechar
add sp, 2
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:125:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:125:19 ===---
mov ax, 10
xor ah, ah
push ax
push cs
call _console_writechar
add sp, 2
ROTULO251:
mov sp, bp
pop bp
FIM_console_writeline:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:128:16 ===---
_console_writeuint16:
push bp
mov bp, sp
sub sp, 4
push cs
call _os_stackcheck
; ARG: nro TAM: 2 POS: BP+6 
; ARG: tmp TAM: 2 POS: BP--2 
; ARG: prox TAM: 2 POS: BP--4 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:128:28 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:129:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:130:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:131:13 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:131:23 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:131:19 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:131:27 ===---
mov ax, 10
cmp ax, 0
jne ROTULO253
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:131:27 ===---
mov ax, _console
mov [bp+-8], ax
mov ax, 131
mov [bp+-10], ax
mov ax, 1
cs jmp word [_os_trycode]
ROTULO253:
mov bx, ax
pop ax
xor dx, dx
div bx
mov ax, dx
mov [bp+-2], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:132:13 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:132:24 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:132:20 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:132:26 ===---
mov ax, 10
cmp ax, 0
jne ROTULO254
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:132:26 ===---
mov ax, _console
mov [bp+-8], ax
mov ax, 132
mov [bp+-10], ax
mov ax, 1
cs jmp word [_os_trycode]
ROTULO254:
mov bx, ax
pop ax
xor dx, dx
div bx
mov [bp+-4], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:133:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:133:17 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:133:12 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:133:19 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
ja ROTULO257
jmp ROTULO258
ROTULO257:
mov ax, 65535
jmp ROTULO259
ROTULO258:
xor ax, ax
ROTULO259:
cmp ax, 0
jne ROTULO255
jmp ROTULO256
ROTULO255:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:133:26 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:133:38 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
push ax
push cs
call _console_writeuint16
add sp, 2
ROTULO256:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:134:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:134:22 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:134:24 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:134:19 ===---
mov ax, 48
pop bx
add ax, bx
xor ah, ah
push ax
push cs
call _console_writechar
add sp, 2
ROTULO252:
mov sp, bp
pop bp
FIM_console_writeuint16:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:137:16 ===---
_console_writeint16:
push bp
mov bp, sp
; ARG: nro TAM: 2 POS: BP+6 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:137:27 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:138:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:138:16 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:138:12 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:138:18 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
jl ROTULO263
jmp ROTULO264
ROTULO263:
mov ax, 65535
jmp ROTULO265
ROTULO264:
xor ax, ax
ROTULO265:
cmp ax, 0
jne ROTULO261
jmp ROTULO262
ROTULO261:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:139:17 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:139:23 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:139:24 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:139:23 ===---
xor ax, ax
pop bx
sub ax, bx
mov [bp+6], ax
ROTULO262:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:141:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:141:21 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
push ax
push cs
call _console_writeuint16
add sp, 2
ROTULO260:
mov sp, bp
pop bp
FIM_console_writeint16:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:144:16 ===---
_console_writeuint8:
push bp
mov bp, sp
; ARG: nro TAM: 2 POS: BP+6 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:144:27 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:145:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:145:21 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
push ax
push cs
call _console_writeuint16
add sp, 2
ROTULO266:
mov sp, bp
pop bp
FIM_console_writeuint8:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:148:16 ===---
_console_writeint8:
push bp
mov bp, sp
; ARG: nro TAM: 2 POS: BP+6 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:148:26 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:149:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:149:20 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
push ax
push cs
call _console_writeint16
add sp, 2
ROTULO267:
mov sp, bp
pop bp
FIM_console_writeint8:
retf
; MODULO FIM: console
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:3:8 ===---
; MODULO: io
_io:
db 13
db 83,121,115,116,101,109,46,73,79,46,104,99,98
db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:4:16 ===---
_io_outputbyte:
push bp
mov bp, sp
; ARG: port TAM: 2 POS: BP+6 
; ARG: value TAM: 2 POS: BP+8 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:4:27 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:4:43 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:5:13 ===---
mov dx, [bp+6]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:6:13 ===---
mov ax, [bp+8]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:7:13 ===---
out dx, al
ROTULO268:
mov sp, bp
pop bp
FIM_io_outputbyte:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:10:16 ===---
_io_outputword:
push bp
mov bp, sp
; ARG: port TAM: 2 POS: BP+6 
; ARG: value TAM: 2 POS: BP+8 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:10:27 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:10:43 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:11:13 ===---
mov dx, [bp+6]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:12:13 ===---
mov ax, [bp+8]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:13:13 ===---
out dx, ax
ROTULO269:
mov sp, bp
pop bp
FIM_io_outputword:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:16:21 ===---
_io_inputbyte:
push bp
mov bp, sp
; ARG: port TAM: 2 POS: BP+6 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:16:31 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:17:13 ===---
mov dx, [bp+6]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:18:13 ===---
xor ax, ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:19:13 ===---
in al, dx
ROTULO270:
mov sp, bp
pop bp
FIM_io_inputbyte:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:22:21 ===---
_io_inputword:
push bp
mov bp, sp
; ARG: port TAM: 2 POS: BP+6 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:22:31 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:23:13 ===---
mov dx, [bp+6]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:24:13 ===---
in ax, dx
ROTULO271:
mov sp, bp
pop bp
FIM_io_inputword:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:27:16 ===---
_io_registerhandler:
push bp
mov bp, sp
sub sp, 4
push cs
call _os_stackcheck
; ARG: interrupt TAM: 2 POS: BP+6 
; ARG: handler TAM: 4 POS: BP+8 
; ARG: ptr TAM: 4 POS: BP--4 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:27:32 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:27:52 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:28:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:29:13 ===---
pushf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:30:13 ===---
cli
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:31:10 ===---
; ACAO GRAVACAO - Grava segmento em variavel
mov word [bp+-4+2], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:32:10 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:32:26 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:32:28 ===---
mov ax, 4
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:32:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
pop bx
mul bx
mov [bp+-4], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:33:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:33:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+8]
push word [bp+-4+2]
pop es
mov di, [bp+-4]
es mov [di+0], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:34:10 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-4]
inc di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:35:10 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-4]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:36:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:36:16 ===---
; ACAO LEITURA - Le segmento em variavel
mov ax, [bp+8+2]
push word [bp+-4+2]
pop es
mov di, [bp+-4]
es mov [di+0], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:37:13 ===---
popf
ROTULO272:
mov sp, bp
pop bp
FIM_io_registerhandler:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:40:21 ===---
_io_gethandler:
push bp
mov bp, sp
sub sp, 8
push cs
call _os_stackcheck
; ARG: interrupt TAM: 2 POS: BP+6 
; ARG: ptr TAM: 4 POS: BP--4 
; ARG: ret TAM: 4 POS: BP--8 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:40:32 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:41:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:42:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:43:10 ===---
; ACAO GRAVACAO - Grava segmento em variavel
mov word [bp+-4+2], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:44:10 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:44:26 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:44:28 ===---
mov ax, 4
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:44:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
pop bx
mul bx
mov [bp+-4], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:45:10 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:45:16 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-4+2]
pop es
mov di, [bp+-4]
es mov ax, [di+0]
mov [bp+-8], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:46:10 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-4]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:47:10 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-4]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:48:10 ===---
; ACAO GRAVACAO - Grava segmento em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:48:16 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-4+2]
pop es
mov di, [bp+-4]
es mov ax, [di+0]
mov word [bp+-8+2], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:49:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:49:16 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-8+2]
pop es
mov di, [bp+-8]
jmp ROTULO273
ROTULO273:
mov sp, bp
pop bp
FIM_io_gethandler:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:52:21 ===---
_io_consoleavail:
ROTULO274:
FIM_io_consoleavail:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:56:21 ===---
_io_consolereadchar:
ROTULO275:
FIM_io_consolereadchar:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:60:16 ===---
_io_consolewritechar:
push bp
mov bp, sp
; ARG: c TAM: 2 POS: BP+6 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:60:33 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:61:13 ===---
mov ax, [bp+6]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:62:13 ===---
mov ah, 0xe
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:63:13 ===---
int 0x10
ROTULO276:
mov sp, bp
pop bp
FIM_io_consolewritechar:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:66:16 ===---
_io_setvideomode:
push bp
mov bp, sp
; ARG: mode TAM: 2 POS: BP+6 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:66:29 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:67:13 ===---
mov ax, [bp+6]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:68:13 ===---
int 0x10
ROTULO277:
mov sp, bp
pop bp
FIM_io_setvideomode:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:71:16 ===---
_io_disableinterrupts:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:72:13 ===---
cli
ROTULO278:
FIM_io_disableinterrupts:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:75:16 ===---
_io_enableinterrupts:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:76:13 ===---
sti
ROTULO279:
FIM_io_enableinterrupts:
retf
; MODULO FIM: io
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:1:8 ===---
; MODULO: utf8
_utf8:
db 15
db 83,121,115,116,101,109,46,84,101,120,116,46,104,99,98
db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:3:21 ===---
_utf8_charsize:
push bp
mov bp, sp
; ARG: c TAM: 4 POS: BP+6 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:3:30 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:4:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:4:14 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:4:12 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:4:16 ===---
mov ax, 128
mov bx, ax
pop ax
cmp ax, bx
jb ROTULO283
jmp ROTULO284
ROTULO283:
mov ax, 65535
jmp ROTULO285
ROTULO284:
xor ax, ax
ROTULO285:
cmp ax, 0
jne ROTULO281
jmp ROTULO282
ROTULO281:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:4:25 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:4:32 ===---
mov ax, 1
jmp ROTULO280
ROTULO282:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:5:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:5:22 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:5:14 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:5:12 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:5:17 ===---
mov ax, 194
mov bx, ax
pop ax
cmp ax, bx
jae ROTULO291
jmp ROTULO292
ROTULO291:
mov ax, 65535
jmp ROTULO293
ROTULO292:
xor ax, ax
ROTULO293:
cmp ax, 0
je ROTULO289
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:5:32 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:5:30 ===---
; ACAO LEITURA - Le ponteiro
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:5:35 ===---
mov ax, 223
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO294
jmp ROTULO295
ROTULO294:
mov ax, 65535
jmp ROTULO296
ROTULO295:
xor ax, ax
ROTULO296:
cmp ax, 0
je ROTULO289
ROTULO288:
mov ax, 65535
jmp ROTULO290
ROTULO289:
xor ax, ax
ROTULO290:
cmp ax, 0
jne ROTULO286
jmp ROTULO287
ROTULO286:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:5:45 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:5:52 ===---
mov ax, 2
jmp ROTULO280
ROTULO287:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:6:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:6:22 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:6:14 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:6:12 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:6:17 ===---
mov ax, 224
mov bx, ax
pop ax
cmp ax, bx
jae ROTULO302
jmp ROTULO303
ROTULO302:
mov ax, 65535
jmp ROTULO304
ROTULO303:
xor ax, ax
ROTULO304:
cmp ax, 0
je ROTULO300
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:6:32 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:6:30 ===---
; ACAO LEITURA - Le ponteiro
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:6:35 ===---
mov ax, 239
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO305
jmp ROTULO306
ROTULO305:
mov ax, 65535
jmp ROTULO307
ROTULO306:
xor ax, ax
ROTULO307:
cmp ax, 0
je ROTULO300
ROTULO299:
mov ax, 65535
jmp ROTULO301
ROTULO300:
xor ax, ax
ROTULO301:
cmp ax, 0
jne ROTULO297
jmp ROTULO298
ROTULO297:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:6:45 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:6:52 ===---
mov ax, 3
jmp ROTULO280
ROTULO298:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:7:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:7:22 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:7:14 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:7:12 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:7:17 ===---
mov ax, 240
mov bx, ax
pop ax
cmp ax, bx
jae ROTULO313
jmp ROTULO314
ROTULO313:
mov ax, 65535
jmp ROTULO315
ROTULO314:
xor ax, ax
ROTULO315:
cmp ax, 0
je ROTULO311
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:7:32 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:7:30 ===---
; ACAO LEITURA - Le ponteiro
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:7:35 ===---
mov ax, 255
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO316
jmp ROTULO317
ROTULO316:
mov ax, 65535
jmp ROTULO318
ROTULO317:
xor ax, ax
ROTULO318:
cmp ax, 0
je ROTULO311
ROTULO310:
mov ax, 65535
jmp ROTULO312
ROTULO311:
xor ax, ax
ROTULO312:
cmp ax, 0
jne ROTULO308
jmp ROTULO309
ROTULO308:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:7:45 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:7:52 ===---
mov ax, 4
jmp ROTULO280
ROTULO309:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:8:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:8:16 ===---
mov ax, 1
jmp ROTULO280
ROTULO280:
mov sp, bp
pop bp
FIM_utf8_charsize:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:11:21 ===---
_utf8_convertchartocp437:
push bp
mov bp, sp
; ARG: c TAM: 4 POS: BP+6 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:11:40 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:12:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:12:14 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:12:12 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:12:16 ===---
mov ax, 128
mov bx, ax
pop ax
cmp ax, bx
jb ROTULO322
jmp ROTULO323
ROTULO322:
mov ax, 65535
jmp ROTULO324
ROTULO323:
xor ax, ax
ROTULO324:
cmp ax, 0
jne ROTULO320
jmp ROTULO321
ROTULO320:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:12:25 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:12:32 ===---
; ACAO LEITURA - Le ponteiro
xor ax, ax
es mov al, [di+0]
jmp ROTULO319
ROTULO321:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:13:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:13:14 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:13:12 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:13:17 ===---
mov ax, 195
mov bx, ax
pop ax
cmp ax, bx
je ROTULO327
jmp ROTULO328
ROTULO327:
mov ax, 65535
jmp ROTULO329
ROTULO328:
xor ax, ax
ROTULO329:
cmp ax, 0
jne ROTULO325
jmp ROTULO326
ROTULO325:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:14:14 ===---
; ACAO INC - Incrementa variavel
inc word [bp+6]
inc di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:15:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:15:18 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:15:16 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:15:21 ===---
mov ax, 135
mov bx, ax
pop ax
cmp ax, bx
je ROTULO332
jmp ROTULO333
ROTULO332:
mov ax, 65535
jmp ROTULO334
ROTULO333:
xor ax, ax
ROTULO334:
cmp ax, 0
jne ROTULO330
jmp ROTULO331
ROTULO330:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:15:31 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:15:38 ===---
mov ax, 128
jmp ROTULO319
ROTULO331:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:16:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:16:18 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:16:16 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:16:21 ===---
mov ax, 167
mov bx, ax
pop ax
cmp ax, bx
je ROTULO337
jmp ROTULO338
ROTULO337:
mov ax, 65535
jmp ROTULO339
ROTULO338:
xor ax, ax
ROTULO339:
cmp ax, 0
jne ROTULO335
jmp ROTULO336
ROTULO335:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:16:31 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:16:38 ===---
mov ax, 135
jmp ROTULO319
ROTULO336:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:17:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:17:18 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:17:16 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:17:21 ===---
mov ax, 131
mov bx, ax
pop ax
cmp ax, bx
je ROTULO342
jmp ROTULO343
ROTULO342:
mov ax, 65535
jmp ROTULO344
ROTULO343:
xor ax, ax
ROTULO344:
cmp ax, 0
jne ROTULO340
jmp ROTULO341
ROTULO340:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:17:31 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:17:38 ===---
mov ax, 65
jmp ROTULO319
ROTULO341:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:18:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:18:18 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:18:16 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:18:21 ===---
mov ax, 163
mov bx, ax
pop ax
cmp ax, bx
je ROTULO347
jmp ROTULO348
ROTULO347:
mov ax, 65535
jmp ROTULO349
ROTULO348:
xor ax, ax
ROTULO349:
cmp ax, 0
jne ROTULO345
jmp ROTULO346
ROTULO345:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:18:31 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:18:38 ===---
mov ax, 97
jmp ROTULO319
ROTULO346:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:19:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:19:18 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:19:16 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:19:21 ===---
mov ax, 147
mov bx, ax
pop ax
cmp ax, bx
je ROTULO352
jmp ROTULO353
ROTULO352:
mov ax, 65535
jmp ROTULO354
ROTULO353:
xor ax, ax
ROTULO354:
cmp ax, 0
jne ROTULO350
jmp ROTULO351
ROTULO350:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:19:31 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:19:38 ===---
mov ax, 79
jmp ROTULO319
ROTULO351:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:20:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:20:18 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:20:16 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:20:21 ===---
mov ax, 179
mov bx, ax
pop ax
cmp ax, bx
je ROTULO357
jmp ROTULO358
ROTULO357:
mov ax, 65535
jmp ROTULO359
ROTULO358:
xor ax, ax
ROTULO359:
cmp ax, 0
jne ROTULO355
jmp ROTULO356
ROTULO355:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:20:31 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:20:38 ===---
mov ax, 162
jmp ROTULO319
ROTULO356:
ROTULO326:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:22:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:22:14 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:22:12 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:22:17 ===---
mov ax, 226
mov bx, ax
pop ax
cmp ax, bx
je ROTULO362
jmp ROTULO363
ROTULO362:
mov ax, 65535
jmp ROTULO364
ROTULO363:
xor ax, ax
ROTULO364:
cmp ax, 0
jne ROTULO360
jmp ROTULO361
ROTULO360:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:23:14 ===---
; ACAO INC - Incrementa variavel
inc word [bp+6]
inc di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:24:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:24:18 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:24:16 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:24:21 ===---
mov ax, 152
mov bx, ax
pop ax
cmp ax, bx
je ROTULO367
jmp ROTULO368
ROTULO367:
mov ax, 65535
jmp ROTULO369
ROTULO368:
xor ax, ax
ROTULO369:
cmp ax, 0
jne ROTULO365
jmp ROTULO366
ROTULO365:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:25:18 ===---
; ACAO INC - Incrementa variavel
inc word [bp+6]
inc di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:26:17 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:26:22 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:26:20 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:26:25 ===---
mov ax, 186
mov bx, ax
pop ax
cmp ax, bx
je ROTULO372
jmp ROTULO373
ROTULO372:
mov ax, 65535
jmp ROTULO374
ROTULO373:
xor ax, ax
ROTULO374:
cmp ax, 0
jne ROTULO370
jmp ROTULO371
ROTULO370:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:26:35 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:26:42 ===---
mov ax, 1
jmp ROTULO319
ROTULO371:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:27:17 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:27:22 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:27:20 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:27:25 ===---
mov ax, 187
mov bx, ax
pop ax
cmp ax, bx
je ROTULO377
jmp ROTULO378
ROTULO377:
mov ax, 65535
jmp ROTULO379
ROTULO378:
xor ax, ax
ROTULO379:
cmp ax, 0
jne ROTULO375
jmp ROTULO376
ROTULO375:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:27:35 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:27:42 ===---
mov ax, 2
jmp ROTULO319
ROTULO376:
ROTULO366:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:29:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:29:18 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:29:16 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:29:21 ===---
mov ax, 153
mov bx, ax
pop ax
cmp ax, bx
je ROTULO382
jmp ROTULO383
ROTULO382:
mov ax, 65535
jmp ROTULO384
ROTULO383:
xor ax, ax
ROTULO384:
cmp ax, 0
jne ROTULO380
jmp ROTULO381
ROTULO380:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:30:18 ===---
; ACAO INC - Incrementa variavel
inc word [bp+6]
inc di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:31:17 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:31:22 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:31:20 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:31:25 ===---
mov ax, 165
mov bx, ax
pop ax
cmp ax, bx
je ROTULO387
jmp ROTULO388
ROTULO387:
mov ax, 65535
jmp ROTULO389
ROTULO388:
xor ax, ax
ROTULO389:
cmp ax, 0
jne ROTULO385
jmp ROTULO386
ROTULO385:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:31:35 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:31:42 ===---
mov ax, 3
jmp ROTULO319
ROTULO386:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:32:17 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:32:22 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:32:20 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:32:25 ===---
mov ax, 166
mov bx, ax
pop ax
cmp ax, bx
je ROTULO392
jmp ROTULO393
ROTULO392:
mov ax, 65535
jmp ROTULO394
ROTULO393:
xor ax, ax
ROTULO394:
cmp ax, 0
jne ROTULO390
jmp ROTULO391
ROTULO390:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:32:35 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:32:42 ===---
mov ax, 4
jmp ROTULO319
ROTULO391:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:33:17 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:33:22 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:33:20 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:33:25 ===---
mov ax, 163
mov bx, ax
pop ax
cmp ax, bx
je ROTULO397
jmp ROTULO398
ROTULO397:
mov ax, 65535
jmp ROTULO399
ROTULO398:
xor ax, ax
ROTULO399:
cmp ax, 0
jne ROTULO395
jmp ROTULO396
ROTULO395:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:33:35 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:33:42 ===---
mov ax, 5
jmp ROTULO319
ROTULO396:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:34:17 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:34:22 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:34:20 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:34:25 ===---
mov ax, 160
mov bx, ax
pop ax
cmp ax, bx
je ROTULO402
jmp ROTULO403
ROTULO402:
mov ax, 65535
jmp ROTULO404
ROTULO403:
xor ax, ax
ROTULO404:
cmp ax, 0
jne ROTULO400
jmp ROTULO401
ROTULO400:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:34:35 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:34:42 ===---
mov ax, 6
jmp ROTULO319
ROTULO401:
ROTULO381:
ROTULO361:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:37:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:37:16 ===---
mov ax, 63
jmp ROTULO319
ROTULO319:
mov sp, bp
pop bp
FIM_utf8_convertchartocp437:
retf
; MODULO FIM: utf8
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/Version.hcb:11:8 ===---
; MODULO: husixversion
_husixversion:
db 11
db 86,101,114,115,105,111,110,46,104,99,98
db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/Version.hcb:12:16 ===---
_husixversion_getversion:
push bp
mov bp, sp
; ARG: ver TAM: 4 POS: BP+6 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/Version.hcb:12:27 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/Version.hcb:14:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/Version.hcb:14:23 ===---
mov ax, 2023
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov [di+0], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/Version.hcb:15:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/Version.hcb:15:26 ===---
mov ax, 2
es mov [di+2], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/Version.hcb:16:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/Version.hcb:16:25 ===---
mov ax, 3515
es mov [di+4], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/Version.hcb:17:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/Version.hcb:17:23 ===---
push cs
pop es
mov di, ROTULO407
jmp ROTULO406
ROTULO407:
db 4
db 65,108,102,97
times 1 db 0
ROTULO406:
push es
push di
push word [bp+6+2]
pop es
mov di, [bp+6]
es pop word [di+6]
es pop word [di+6+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
ROTULO405:
mov sp, bp
pop bp
FIM_husixversion_getversion:
retf
; MODULO FIM: husixversion
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:58:8 ===---
; MODULO: multithreading
_multithreading:
db 20
db 83,121,115,116,101,109,46,84,104,114,101,97,100,105,110,103,46,104,99,98
db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:59:9 ===---
_multithreading_active:
times 2 db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:60:9 ===---
_multithreading_list:
times 4 db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:61:24 ===---
_multithreading_current:
times 4 db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:62:16 ===---
_multithreading_kernelthread:
times 30 db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:63:9 ===---
_multithreading_inuse:
times 8 db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:101:9 ===---
_multithreading_int81temp:
times 4 db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:65:16 ===---
_multithreading_preinitialize:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:67:9 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_multithreading_active], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:68:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:68:27 ===---
mov ax, 1
cs push word [_multithreading_kernelthread+2]
pop es
cs mov di, [_multithreading_kernelthread]
es mov [di+0], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
ROTULO408:
FIM_multithreading_preinitialize:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:71:16 ===---
_multithreading_initialize:
push bp
mov bp, sp
sub sp, 10
push cs
call _os_stackcheck
; ARG: i TAM: 2 POS: BP--2 
; ARG: ptr TAM: 4 POS: BP--6 
; ARG: t TAM: 4 POS: BP--10 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:73:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:74:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:75:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:72:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:72:16 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:72:44 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:72:46 ===---
mov ax, 128
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:72:29 ===---
; ACAO CHAMADA - Calcula tamanho de item
mov ax, 26
pop bx
mul bx
push ax
push cs
call _memory_alloc
add sp, 2
push es
cs pop word [_multithreading_list+2]
cs mov [_multithreading_list], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:76:22 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:76:22 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-2], 1
ROTULO410:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:76:22 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:76:22 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:76:22 ===---
mov ax, 128
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO413
jmp ROTULO414
ROTULO413:
mov ax, 65535
jmp ROTULO415
ROTULO414:
xor ax, ax
ROTULO415:
cmp ax, 0
jne ROTULO411
jmp ROTULO412
ROTULO411:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:77:13 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:77:19 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:77:24 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
push cs
call _multithreading_item
add sp, 2
push es
pop word [bp+-6+2]
mov [bp+-6], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:78:13 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:78:17 ===---
; ACAO LEITURA - Le ponteiro
push es
pop word [bp+-10+2]
mov [bp+-10], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:79:13 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:79:20 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
es mov [di+0], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:80:13 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:80:24 ===---
xor ax, ax
es mov [di+2], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:81:13 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:81:27 ===---
mov ax, 1
es mov [di+4], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:82:13 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:82:26 ===---
xor ax, ax
es mov [di+6], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:83:13 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:83:22 ===---
; ACAO LEITURA - Le ponteiro
push es
push di
es pop word [di+18]
es pop word [di+18+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:84:13 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:84:26 ===---
; ACAO LEITURA - Le ponteiro
push es
push di
es pop word [di+22]
es pop word [di+22+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:85:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:85:18 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:85:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:85:21 ===---
mov ax, 1
mov bx, ax
pop ax
cmp ax, bx
je ROTULO418
jmp ROTULO419
ROTULO418:
mov ax, 65535
jmp ROTULO420
ROTULO419:
xor ax, ax
ROTULO420:
cmp ax, 0
jne ROTULO416
jmp ROTULO417
ROTULO416:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:86:18 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO GRAVACAO - Grava segmento em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:86:34 ===---
; ACAO LEITURA - Le segmento em variavel
mov ax, [bp+-6+2]
cs mov [_multithreading_kernelthread+2], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:87:18 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:87:34 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-6]
cs mov [_multithreading_kernelthread], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:88:18 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO GRAVACAO - Grava segmento em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:88:29 ===---
; ACAO LEITURA - Le segmento em variavel
mov ax, [bp+-6+2]
cs mov [_multithreading_current+2], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:89:18 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:89:29 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-6]
cs mov [_multithreading_current], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:90:17 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:90:32 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-6+2]
pop es
mov di, [bp+-6]
push es
push di
cs push word [_multithreading_current+2]
pop es
cs mov di, [_multithreading_current]
es pop word [di+18]
es pop word [di+18+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:91:17 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:91:36 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-6+2]
pop es
mov di, [bp+-6]
push es
push di
cs push word [_multithreading_current+2]
pop es
cs mov di, [_multithreading_current]
es pop word [di+22]
es pop word [di+22+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
ROTULO417:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:76:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-2]
jmp ROTULO410
ROTULO412:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:94:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:94:37 ===---
mov ax, 1
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:94:30 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_multithreading_inuse+2]
pop es
cs mov di, [_multithreading_inuse]
push es
push di
push cs
call _semaphore_initialize
add sp, 6
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:95:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:95:31 ===---
mov ax, 1
cs push word [_multithreading_kernelthread+2]
pop es
cs mov di, [_multithreading_kernelthread]
es mov [di+2], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:96:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:96:34 ===---
xor ax, ax
es mov [di+4], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:97:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:97:34 ===---
push cs
pop es
mov di, _multithreading_int81
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:97:28 ===---
mov ax, 129
xor ah, ah
push ax
push cs
call _io_registerhandler
add sp, 6
ROTULO409:
mov sp, bp
pop bp
FIM_multithreading_initialize:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:103:9 ===---
_multithreading_int81:
push di
push es
push si
push ds
push dx
push cx
push bx
push ax
push bp
mov ax, sp
push ax
push ss
push ss
pop ds
push bp
mov bp, sp
; ARG: ss TAM: 2 POS: BP+2 
; ARG: sp TAM: 2 POS: BP+4 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:103:15 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:103:29 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:106:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:106:26 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:106:13 ===---
; ACAO STRUCTURE - Leitura de Desvio de Ponteiro
cs push word [_multithreading_current+2]
pop es
cs mov di, [_multithreading_current]
es mov ax, [di+18]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:106:29 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO424
jmp ROTULO425
ROTULO424:
mov ax, 65535
jmp ROTULO426
ROTULO425:
xor ax, ax
ROTULO426:
cmp ax, 0
jne ROTULO422
jmp ROTULO423
ROTULO422:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:106:36 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:106:51 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_multithreading_kernelthread+2]
pop es
cs mov di, [_multithreading_kernelthread]
push es
push di
cs push word [_multithreading_current+2]
pop es
cs mov di, [_multithreading_current]
es pop word [di+18]
es pop word [di+18+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
ROTULO423:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:107:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:107:32 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+2]
cs push word [_multithreading_current+2]
pop es
cs mov di, [_multithreading_current]
es mov [di+14], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:108:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:108:32 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+4]
es mov [di+16], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:109:9 ===---
find_next:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:110:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:110:21 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - Ponteiro Byte - Desvio 18
cs push word [_multithreading_current+2]
pop es
cs mov di, [_multithreading_current]
es push word [di+18+2]
es push word [di+18]
pop di
pop es
push es
cs pop word [_multithreading_int81temp+2]
cs mov [_multithreading_int81temp], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:111:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:111:19 ===---
; ACAO LEITURA - Le ponteiro
push es
cs pop word [_multithreading_current+2]
cs mov [_multithreading_current], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:112:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:112:14 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 14
es mov ax, [di+14]
mov [bp+2], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:113:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:113:14 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 16
es mov ax, [di+16]
mov [bp+4], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:114:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:114:12 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 4
es mov ax, [di+4]
cmp ax, 0
jne ROTULO427
jmp ROTULO428
ROTULO427:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:114:40 ===---
jmp find_next
ROTULO428:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:115:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:115:12 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 6
cs push word [_multithreading_current+2]
pop es
cs mov di, [_multithreading_current]
es mov ax, [di+6]
cmp ax, 0
jne ROTULO429
jmp ROTULO430
ROTULO429:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:116:13 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:116:32 ===---
xor ax, ax
es mov [di+6], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:117:13 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:117:25 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - Ponteiro Byte - Desvio 10
es push word [di+10+2]
es push word [di+10]
pop di
pop es
push es
cs pop word [_multithreading_int81temp+2]
cs mov [_multithreading_int81temp], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:118:17 ===---
mov ax, [bp+2]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:119:17 ===---
mov bx, [bp+4]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:120:17 ===---
cli
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:121:17 ===---
mov ss, ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:122:17 ===---
mov sp, ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:123:17 ===---
sti
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:124:17 ===---
push cs
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:125:17 ===---
mov ax, _thread_endthread
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:126:17 ===---
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:127:17 ===---
pushf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:128:17 ===---
cs push word [_multithreading_int81temp+2]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:129:17 ===---
cs push word [_multithreading_int81temp]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:130:17 ===---
mov ax, ss
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:131:17 ===---
mov es, ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:132:17 ===---
mov ds, ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:133:17 ===---
jmp FIM_multithreading_int81
ROTULO430:
ROTULO421:
mov sp, bp
pop bp
pop ax
pop bx
mov ss, ax
mov sp, bx
pop bp
pop ax
pop bx
pop cx
pop dx
pop ds
pop si
pop es
pop di
FIM_multithreading_int81:
iret
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:138:21 ===---
_multithreading_requestnew:
push bp
mov bp, sp
sub sp, 10
push cs
call _os_stackcheck
; ARG: ptr TAM: 4 POS: BP--4 
; ARG: t TAM: 4 POS: BP--8 
; ARG: i TAM: 2 POS: BP--10 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:139:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:140:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:141:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:142:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:142:27 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_multithreading_inuse+2]
pop es
cs mov di, [_multithreading_inuse]
push es
push di
push cs
call _semaphore_waitone
add sp, 4
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:143:22 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:143:22 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-10], 1
ROTULO432:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:143:22 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:143:22 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-10]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:143:22 ===---
mov ax, 128
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO435
jmp ROTULO436
ROTULO435:
mov ax, 65535
jmp ROTULO437
ROTULO436:
xor ax, ax
ROTULO437:
cmp ax, 0
jne ROTULO433
jmp ROTULO434
ROTULO433:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:144:13 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:144:17 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:144:22 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-10]
push ax
push cs
call _multithreading_item
add sp, 2
push es
pop word [bp+-8+2]
mov [bp+-8], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:145:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:145:25 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:145:16 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 2
es mov ax, [di+2]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:145:28 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO440
jmp ROTULO441
ROTULO440:
mov ax, 65535
jmp ROTULO442
ROTULO441:
xor ax, ax
ROTULO442:
cmp ax, 0
jne ROTULO438
jmp ROTULO439
ROTULO438:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:146:17 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:146:28 ===---
mov ax, 1
es mov [di+2], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:147:17 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:147:31 ===---
mov ax, 1
es mov [di+4], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:148:17 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:148:31 ===---
xor ax, ax
es mov [di+8], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:149:17 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:149:35 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_multithreading_inuse+2]
pop es
cs mov di, [_multithreading_inuse]
push es
push di
push cs
call _semaphore_release
add sp, 4
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:150:17 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:150:24 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-8+2]
pop es
mov di, [bp+-8]
jmp ROTULO431
ROTULO439:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:143:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-10]
jmp ROTULO432
ROTULO434:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:153:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:153:27 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_multithreading_inuse+2]
pop es
cs mov di, [_multithreading_inuse]
push es
push di
push cs
call _semaphore_release
add sp, 4
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:154:15 ===---
mov ax, _multithreading
mov [bp+-8], ax
mov ax, 154
mov [bp+-10], ax
mov ax, 9
cs jmp word [_os_trycode]
ROTULO431:
mov sp, bp
pop bp
FIM_multithreading_requestnew:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:158:21 ===---
_multithreading_item:
push bp
mov bp, sp
sub sp, 4
push cs
call _os_stackcheck
; ARG: i TAM: 2 POS: BP+6 
; ARG: ptr TAM: 4 POS: BP--4 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:158:26 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:159:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:160:9 ===---
; ACAO DEC - Decrementa variavel
dec word [bp+6]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:161:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:161:14 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:161:12 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:161:17 ===---
mov ax, 128
mov bx, ax
pop ax
cmp ax, bx
jae ROTULO446
jmp ROTULO447
ROTULO446:
mov ax, 65535
jmp ROTULO448
ROTULO447:
xor ax, ax
ROTULO448:
cmp ax, 0
jne ROTULO444
jmp ROTULO445
ROTULO444:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:161:32 ===---
mov ax, _multithreading
mov [bp+-8], ax
mov ax, 161
mov [bp+-10], ax
mov ax, 5
cs jmp word [_os_trycode]
ROTULO445:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:162:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:162:15 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_multithreading_list+2]
pop es
cs mov di, [_multithreading_list]
push es
pop word [bp+-4+2]
mov [bp+-4], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:163:10 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:163:21 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:163:26 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:163:28 ===---
; ACAO CHAMADA - Calcula tamanho de item
mov ax, 26
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:163:24 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
pop bx
mul bx
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:163:17 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
pop bx
add ax, bx
mov [bp+-4], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:164:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:164:16 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-4+2]
pop es
mov di, [bp+-4]
jmp ROTULO443
ROTULO443:
mov sp, bp
pop bp
FIM_multithreading_item:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:168:21 ===---
_multithreading_count:
push bp
mov bp, sp
sub sp, 12
push cs
call _os_stackcheck
; ARG: ptr TAM: 4 POS: BP--4 
; ARG: t TAM: 4 POS: BP--8 
; ARG: i TAM: 2 POS: BP--10 
; ARG: ret TAM: 2 POS: BP--12 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:169:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:170:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:171:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:172:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:173:9 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-12], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:174:22 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:174:22 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-10], 1
ROTULO450:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:174:22 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:174:22 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-10]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:174:22 ===---
mov ax, 128
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO453
jmp ROTULO454
ROTULO453:
mov ax, 65535
jmp ROTULO455
ROTULO454:
xor ax, ax
ROTULO455:
cmp ax, 0
jne ROTULO451
jmp ROTULO452
ROTULO451:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:175:13 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:175:19 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:175:24 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-10]
push ax
push cs
call _multithreading_item
add sp, 2
push es
pop word [bp+-4+2]
mov [bp+-4], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:176:14 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO GRAVACAO - Grava segmento em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:176:19 ===---
; ACAO LEITURA - Le segmento em variavel
mov ax, [bp+-4+2]
mov word [bp+-8+2], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:177:14 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:177:19 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
mov [bp+-8], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:178:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:178:25 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:178:16 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 2
push word [bp+-8+2]
pop es
mov di, [bp+-8]
es mov ax, [di+2]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:178:28 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
jne ROTULO458
jmp ROTULO459
ROTULO458:
mov ax, 65535
jmp ROTULO460
ROTULO459:
xor ax, ax
ROTULO460:
cmp ax, 0
jne ROTULO456
jmp ROTULO457
ROTULO456:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:178:35 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-12]
ROTULO457:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:174:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-10]
jmp ROTULO450
ROTULO452:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:180:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:180:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-12]
jmp ROTULO449
ROTULO449:
mov sp, bp
pop bp
FIM_multithreading_count:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:184:16 ===---
_multithreading_startthread:
push bp
mov bp, sp
sub sp, 10
push cs
call _os_stackcheck
; ARG: t TAM: 4 POS: BP+6 
; ARG: status TAM: 2 POS: BP--2 
; ARG: ptrp TAM: 4 POS: BP--6 
; ARG: ptrn TAM: 4 POS: BP--10 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:184:28 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:185:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:186:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:187:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:188:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:188:18 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _multithreading_isactive
mov [bp+-2], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:189:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:189:12 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
cmp ax, 0
jne ROTULO462
jmp ROTULO463
ROTULO462:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:189:24 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _multithreading_suspend
ROTULO463:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:190:10 ===---
; ACAO GRAVACAO - Grava segmento em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:190:18 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO LEITURA - Le segmento em variavel
mov ax, [bp+6+2]
mov word [bp+-10+2], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:191:10 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:191:18 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
mov [bp+-10], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:192:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:192:16 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - Ponteiro Byte - Desvio 22
cs push word [_multithreading_current+2]
pop es
cs mov di, [_multithreading_current]
es push word [di+22+2]
es push word [di+22]
pop di
pop es
push es
pop word [bp+-6+2]
mov [bp+-6], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:193:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:193:24 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-10+2]
pop es
mov di, [bp+-10]
push es
push di
cs push word [_multithreading_current+2]
pop es
cs mov di, [_multithreading_current]
es pop word [di+18]
es pop word [di+18+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:194:10 ===---
; ACAO GRAVACAO - Grava segmento em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:194:18 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO LEITURA - Le segmento em variavel
cs mov ax, [_multithreading_current+2]
mov word [bp+-10+2], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:195:10 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:195:18 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO LEITURA - Le variavel
cs mov ax, [_multithreading_current]
mov [bp+-10], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:196:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:196:22 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-6+2]
pop es
mov di, [bp+-6]
push es
push di
push word [bp+6+2]
pop es
mov di, [bp+6]
es pop word [di+22]
es pop word [di+22+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:197:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:197:18 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-10+2]
pop es
mov di, [bp+-10]
push es
push di
push word [bp+6+2]
pop es
mov di, [bp+6]
es pop word [di+18]
es pop word [di+18+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:198:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:198:12 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
cmp ax, 0
jne ROTULO464
jmp ROTULO465
ROTULO464:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:198:24 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _multithreading_resume
ROTULO465:
ROTULO461:
mov sp, bp
pop bp
FIM_multithreading_startthread:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:202:21 ===---
_multithreading_isactive:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:203:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:203:16 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_multithreading_active]
jmp ROTULO466
ROTULO466:
FIM_multithreading_isactive:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:207:16 ===---
_multithreading_suspend:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:208:9 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_multithreading_active], 0
ROTULO467:
FIM_multithreading_suspend:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:212:16 ===---
_multithreading_resume:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:213:9 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_multithreading_active], 1
ROTULO468:
FIM_multithreading_resume:
retf
; MODULO FIM: multithreading
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:16:8 ===---
; MODULO: list
_list:
db 22
db 83,121,115,116,101,109,46,67,111,108,108,101,99,116,105,111,110,115,46,104,99,98
db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:17:16 ===---
_list_initialize:
push bp
mov bp, sp
sub sp, 4
push cs
call _os_stackcheck
; ARG: l TAM: 4 POS: BP+6 
; ARG: itemsize TAM: 2 POS: BP+10 
; ARG: ptr TAM: 4 POS: BP--4 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:17:27 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:17:38 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:18:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:19:10 ===---
; ACAO GRAVACAO - Grava segmento em variavel
mov word [bp+-4+2], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:20:10 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-4], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:21:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:21:22 ===---
xor ax, ax
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov [di+0], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:22:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:22:22 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
es mov [di+8], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:23:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:23:24 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-4+2]
pop es
mov di, [bp+-4]
push es
push di
push word [bp+6+2]
pop es
mov di, [bp+6]
es pop word [di+4]
es pop word [di+4+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:24:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:24:20 ===---
xor ax, ax
es mov [di+10], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:25:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:25:19 ===---
xor ax, ax
es mov [di+2], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
ROTULO469:
mov sp, bp
pop bp
FIM_list_initialize:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:28:14 ===---
_list_allocblock:
push bp
mov bp, sp
sub sp, 14
push cs
call _os_stackcheck
; ARG: l TAM: 4 POS: BP+6 
; ARG: capacity TAM: 2 POS: BP--2 
; ARG: ptr TAM: 4 POS: BP--6 
; ARG: ptrzero TAM: 4 POS: BP--10 
; ARG: block TAM: 4 POS: BP--14 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:28:25 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:29:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:30:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:31:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:32:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:33:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:33:23 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:33:12 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 8
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+8]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:33:26 ===---
mov ax, 64
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO473
jmp ROTULO474
ROTULO473:
mov ax, 65535
jmp ROTULO475
ROTULO474:
xor ax, ax
ROTULO475:
cmp ax, 0
jne ROTULO471
jmp ROTULO472
ROTULO471:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:33:34 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-2], 15
ROTULO472:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:34:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:34:23 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:34:12 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 8
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+8]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:34:26 ===---
mov ax, 128
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO478
jmp ROTULO479
ROTULO478:
mov ax, 65535
jmp ROTULO480
ROTULO479:
xor ax, ax
ROTULO480:
cmp ax, 0
jne ROTULO476
jmp ROTULO477
ROTULO476:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:34:35 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-2], 7
ROTULO477:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:35:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:35:23 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:35:12 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 8
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+8]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:35:26 ===---
mov ax, 512
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO483
jmp ROTULO484
ROTULO483:
mov ax, 65535
jmp ROTULO485
ROTULO484:
xor ax, ax
ROTULO485:
cmp ax, 0
jne ROTULO481
jmp ROTULO482
ROTULO481:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:35:35 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-2], 3
ROTULO482:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:36:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:36:23 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:36:12 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 8
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+8]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:36:25 ===---
mov ax, 512
mov bx, ax
pop ax
cmp ax, bx
ja ROTULO488
jmp ROTULO489
ROTULO488:
mov ax, 65535
jmp ROTULO490
ROTULO489:
xor ax, ax
ROTULO490:
cmp ax, 0
jne ROTULO486
jmp ROTULO487
ROTULO486:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:36:34 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-2], 1
ROTULO487:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:37:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:37:15 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:37:74 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:37:88 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:37:90 ===---
mov ax, 2
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:37:77 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 0
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+0]
pop bx
mul bx
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:37:46 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:37:60 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:37:62 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 8
es mov ax, [di+8]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:37:49 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 0
es mov ax, [di+0]
pop bx
mul bx
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:37:28 ===---
; ACAO CHAMADA - Calcula tamanho de item
mov ax, 6
pop bx
add ax, bx
pop bx
add ax, bx
push ax
push cs
call _memory_alloc
add sp, 2
push es
pop word [bp+-6+2]
mov [bp+-6], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:38:10 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:38:19 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-6]
mov [bp+-14], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:39:10 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO GRAVACAO - Grava segmento em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:39:19 ===---
; ACAO LEITURA - Le segmento em variavel
mov ax, [bp+-6+2]
mov word [bp+-14+2], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:40:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:40:31 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push word [bp+-14+2]
pop es
mov di, [bp+-14]
es mov [di+4], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:41:10 ===---
; ACAO GRAVACAO - Grava segmento em variavel
mov word [bp+-10+2], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:42:10 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-10], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:43:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:43:27 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-10+2]
pop es
mov di, [bp+-10]
push es
push di
push word [bp+-14+2]
pop es
mov di, [bp+-14]
es pop word [di+0]
es pop word [di+0+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:44:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:44:16 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-6+2]
pop es
mov di, [bp+-6]
jmp ROTULO470
ROTULO470:
mov sp, bp
pop bp
FIM_list_allocblock:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:47:9 ===---
_list_setid:
push bp
mov bp, sp
sub sp, 4
push cs
call _os_stackcheck
; ARG: l TAM: 4 POS: BP+6 
; ARG: block TAM: 4 POS: BP+10 
; ARG: pos TAM: 2 POS: BP+14 
; ARG: id TAM: 2 POS: BP+16 
; ARG: ptr TAM: 4 POS: BP--4 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:47:15 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:47:26 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:47:46 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:47:61 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:48:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:49:10 ===---
; ACAO GRAVACAO - Grava segmento em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:49:17 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
mov word [bp+-4+2], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:50:10 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:50:43 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:50:56 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:50:70 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:50:72 ===---
mov ax, 2
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:50:59 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 8
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+8]
pop bx
add ax, bx
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:50:51 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:50:53 ===---
mov ax, 1
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:50:47 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+14]
pop bx
sub ax, bx
pop bx
mul bx
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:50:23 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:50:25 ===---
; ACAO CHAMADA - Calcula tamanho de item
mov ax, 6
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:50:17 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO LEITURA - Le segmento em variavel
mov ax, [bp+10+2]
pop bx
add ax, bx
pop bx
add ax, bx
mov [bp+-4], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:51:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:51:15 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+16]
push word [bp+-4+2]
pop es
mov di, [bp+-4]
es mov [di+0], ax
ROTULO491:
mov sp, bp
pop bp
FIM_list_setid:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:54:14 ===---
_list_getid:
push bp
mov bp, sp
sub sp, 4
push cs
call _os_stackcheck
; ARG: l TAM: 4 POS: BP+6 
; ARG: block TAM: 4 POS: BP+10 
; ARG: pos TAM: 2 POS: BP+14 
; ARG: ptr TAM: 4 POS: BP--4 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:54:20 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:54:31 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:54:51 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:55:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:56:10 ===---
; ACAO GRAVACAO - Grava segmento em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:56:17 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
mov word [bp+-4+2], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:57:10 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:57:43 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:57:56 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:57:70 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:57:72 ===---
mov ax, 2
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:57:59 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 8
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+8]
pop bx
add ax, bx
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:57:51 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:57:53 ===---
mov ax, 1
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:57:47 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+14]
pop bx
sub ax, bx
pop bx
mul bx
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:57:23 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:57:25 ===---
; ACAO CHAMADA - Calcula tamanho de item
mov ax, 6
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:57:17 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO LEITURA - Le segmento em variavel
mov ax, [bp+10+2]
pop bx
add ax, bx
pop bx
add ax, bx
mov [bp+-4], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:58:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:58:16 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-4+2]
pop es
mov di, [bp+-4]
es mov ax, [di+0]
jmp ROTULO492
ROTULO492:
mov sp, bp
pop bp
FIM_list_getid:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:61:14 ===---
_list_getptr:
push bp
mov bp, sp
sub sp, 4
push cs
call _os_stackcheck
; ARG: l TAM: 4 POS: BP+6 
; ARG: block TAM: 4 POS: BP+10 
; ARG: pos TAM: 2 POS: BP+14 
; ARG: ptr TAM: 4 POS: BP--4 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:61:21 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:61:32 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:61:52 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:62:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:63:10 ===---
; ACAO GRAVACAO - Grava segmento em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:63:17 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
mov word [bp+-4+2], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:64:10 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:64:76 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:64:78 ===---
mov ax, 2
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:64:43 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:64:56 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:64:70 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:64:72 ===---
mov ax, 2
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:64:59 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 8
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+8]
pop bx
add ax, bx
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:64:51 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:64:53 ===---
mov ax, 1
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:64:47 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+14]
pop bx
sub ax, bx
pop bx
mul bx
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:64:23 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:64:25 ===---
; ACAO CHAMADA - Calcula tamanho de item
mov ax, 6
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:64:17 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO LEITURA - Le segmento em variavel
mov ax, [bp+10+2]
pop bx
add ax, bx
pop bx
add ax, bx
pop bx
add ax, bx
mov [bp+-4], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:65:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:65:16 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-4+2]
pop es
mov di, [bp+-4]
jmp ROTULO493
ROTULO493:
mov sp, bp
pop bp
FIM_list_getptr:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:68:21 ===---
_list_count:
push bp
mov bp, sp
; ARG: l TAM: 4 POS: BP+6 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:68:27 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:69:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:69:16 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 2
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+2]
jmp ROTULO494
ROTULO494:
mov sp, bp
pop bp
FIM_list_count:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:72:21 ===---
_list_item:
push bp
mov bp, sp
sub sp, 10
push cs
call _os_stackcheck
; ARG: l TAM: 4 POS: BP+6 
; ARG: id TAM: 2 POS: BP+10 
; ARG: ptr TAM: 4 POS: BP--4 
; ARG: block TAM: 4 POS: BP--8 
; ARG: i TAM: 2 POS: BP--10 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:72:26 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:72:37 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:73:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:74:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:75:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:76:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:76:15 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:76:12 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:76:18 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO498
jmp ROTULO499
ROTULO498:
mov ax, 65535
jmp ROTULO500
ROTULO499:
xor ax, ax
ROTULO500:
cmp ax, 0
jne ROTULO496
jmp ROTULO497
ROTULO496:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:76:31 ===---
mov ax, _list
mov [bp+-8], ax
mov ax, 76
mov [bp+-10], ax
mov ax, 5
cs jmp word [_os_trycode]
ROTULO497:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:77:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:77:15 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:77:12 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:77:17 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 2
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+2]
mov bx, ax
pop ax
cmp ax, bx
ja ROTULO503
jmp ROTULO504
ROTULO503:
mov ax, 65535
jmp ROTULO505
ROTULO504:
xor ax, ax
ROTULO505:
cmp ax, 0
jne ROTULO501
jmp ROTULO502
ROTULO501:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:77:36 ===---
mov ax, _list
mov [bp+-8], ax
mov ax, 77
mov [bp+-10], ax
mov ax, 5
cs jmp word [_os_trycode]
ROTULO502:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:78:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:78:15 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - Ponteiro Byte - Desvio 4
push word [bp+6+2]
pop es
mov di, [bp+6]
es push word [di+4+2]
es push word [di+4]
pop di
pop es
push es
pop word [bp+-4+2]
mov [bp+-4], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:79:9 ===---
list_find_in_block_item:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:80:10 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:80:19 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
mov [bp+-8], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:81:10 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO GRAVACAO - Grava segmento em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:81:19 ===---
; ACAO LEITURA - Le segmento em variavel
mov ax, [bp+-4+2]
mov word [bp+-8+2], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:82:28 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:82:28 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-10], 1
ROTULO506:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:82:28 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:82:28 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-10]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:82:22 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 4
push word [bp+-8+2]
pop es
mov di, [bp+-8]
es mov ax, [di+4]
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO509
jmp ROTULO510
ROTULO509:
mov ax, 65535
jmp ROTULO511
ROTULO510:
xor ax, ax
ROTULO511:
cmp ax, 0
jne ROTULO507
jmp ROTULO508
ROTULO507:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:83:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:83:35 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:83:16 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:83:32 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-10]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:83:25 ===---
; ACAO LEITURA - Le ponteiro
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:83:22 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
push cs
call _list_getid
add sp, 10
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:83:38 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
mov bx, ax
pop ax
cmp ax, bx
je ROTULO514
jmp ROTULO515
ROTULO514:
mov ax, 65535
jmp ROTULO516
ROTULO515:
xor ax, ax
ROTULO516:
cmp ax, 0
jne ROTULO512
jmp ROTULO513
ROTULO512:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:84:17 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:84:24 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:84:41 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-10]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:84:34 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-8+2]
pop es
mov di, [bp+-8]
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:84:31 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
push cs
call _list_getptr
add sp, 10
jmp ROTULO495
ROTULO513:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:82:28 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-10]
jmp ROTULO506
ROTULO508:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:87:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:87:15 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - Ponteiro Byte - Desvio 0
push word [bp+-8+2]
pop es
mov di, [bp+-8]
es push word [di+0+2]
es push word [di+0]
pop di
pop es
push es
pop word [bp+-4+2]
mov [bp+-4], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:88:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:88:17 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:88:13 ===---
; ACAO LEITURA - Le segmento em variavel
mov ax, [bp+-4+2]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:88:20 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO519
jmp ROTULO520
ROTULO519:
mov ax, 65535
jmp ROTULO521
ROTULO520:
xor ax, ax
ROTULO521:
cmp ax, 0
jne ROTULO517
jmp ROTULO518
ROTULO517:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:89:13 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:89:19 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:89:30 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
push cs
call _list_allocblock
add sp, 4
push es
pop word [bp+-4+2]
mov [bp+-4], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:90:13 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:90:31 ===---
; ACAO LEITURA - Le ponteiro
push es
push di
push word [bp+-8+2]
pop es
mov di, [bp+-8]
es pop word [di+0]
es pop word [di+0+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
ROTULO518:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:92:14 ===---
jmp list_find_in_block_item
ROTULO495:
mov sp, bp
pop bp
FIM_list_item:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:95:21 ===---
_list_insert:
push bp
mov bp, sp
; ARG: l TAM: 4 POS: BP+6 
; ARG: id TAM: 2 POS: BP+10 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:95:28 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:95:39 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:96:15 ===---
mov ax, _list
mov [bp+-8], ax
mov ax, 96
mov [bp+-10], ax
mov ax, 7
cs jmp word [_os_trycode]
ROTULO522:
mov sp, bp
pop bp
FIM_list_insert:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:99:16 ===---
_list_removeat:
push bp
mov bp, sp
; ARG: l TAM: 4 POS: BP+6 
; ARG: id TAM: 2 POS: BP+10 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:99:25 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:99:36 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:100:15 ===---
mov ax, _list
mov [bp+-8], ax
mov ax, 100
mov [bp+-10], ax
mov ax, 7
cs jmp word [_os_trycode]
ROTULO523:
mov sp, bp
pop bp
FIM_list_removeat:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:103:16 ===---
_list_remove:
push bp
mov bp, sp
; ARG: l TAM: 4 POS: BP+6 
; ARG: item TAM: 4 POS: BP+10 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:103:23 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:103:34 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:104:15 ===---
mov ax, _list
mov [bp+-8], ax
mov ax, 104
mov [bp+-10], ax
mov ax, 7
cs jmp word [_os_trycode]
ROTULO524:
mov sp, bp
pop bp
FIM_list_remove:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:107:21 ===---
_list_add:
push bp
mov bp, sp
sub sp, 10
push cs
call _os_stackcheck
; ARG: l TAM: 4 POS: BP+6 
; ARG: ptr TAM: 4 POS: BP--4 
; ARG: block TAM: 4 POS: BP--8 
; ARG: i TAM: 2 POS: BP--10 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:107:25 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:108:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:109:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:110:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:111:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:111:23 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:111:12 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 0
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+0]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:111:26 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO528
jmp ROTULO529
ROTULO528:
mov ax, 65535
jmp ROTULO530
ROTULO529:
xor ax, ax
ROTULO530:
cmp ax, 0
jne ROTULO526
jmp ROTULO527
ROTULO526:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:112:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:112:27 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:112:16 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 8
es mov ax, [di+8]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:112:29 ===---
mov ax, 64
mov bx, ax
pop ax
cmp ax, bx
jb ROTULO533
jmp ROTULO534
ROTULO533:
mov ax, 65535
jmp ROTULO535
ROTULO534:
xor ax, ax
ROTULO535:
cmp ax, 0
jne ROTULO531
jmp ROTULO532
ROTULO531:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:112:37 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:112:50 ===---
mov ax, 5
es mov [di+0], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
ROTULO532:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:113:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:113:27 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:113:16 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 8
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+8]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:113:29 ===---
mov ax, 128
mov bx, ax
pop ax
cmp ax, bx
jb ROTULO538
jmp ROTULO539
ROTULO538:
mov ax, 65535
jmp ROTULO540
ROTULO539:
xor ax, ax
ROTULO540:
cmp ax, 0
jne ROTULO536
jmp ROTULO537
ROTULO536:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:113:38 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:113:51 ===---
mov ax, 4
es mov [di+0], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
ROTULO537:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:114:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:114:27 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:114:16 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 8
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+8]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:114:30 ===---
mov ax, 128
mov bx, ax
pop ax
cmp ax, bx
jae ROTULO543
jmp ROTULO544
ROTULO543:
mov ax, 65535
jmp ROTULO545
ROTULO544:
xor ax, ax
ROTULO545:
cmp ax, 0
jne ROTULO541
jmp ROTULO542
ROTULO541:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:114:39 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:114:52 ===---
mov ax, 1
es mov [di+0], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
ROTULO542:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:115:13 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:115:19 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:115:30 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
push cs
call _list_allocblock
add sp, 4
push es
pop word [bp+-4+2]
mov [bp+-4], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:116:14 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:116:23 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
mov [bp+-8], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:117:14 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO GRAVACAO - Grava segmento em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:117:23 ===---
; ACAO LEITURA - Le segmento em variavel
mov ax, [bp+-4+2]
mov word [bp+-8+2], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:118:13 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:118:28 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-4+2]
pop es
mov di, [bp+-4]
push es
push di
push word [bp+6+2]
pop es
mov di, [bp+6]
es pop word [di+4]
es pop word [di+4+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:119:13 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:119:23 ===---
mov ax, 1
es mov [di+2], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:120:13 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:120:24 ===---
mov ax, 1
es mov [di+10], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:121:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:121:32 ===---
mov ax, 1
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:121:29 ===---
mov ax, 1
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:121:22 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-8+2]
pop es
mov di, [bp+-8]
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:121:19 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
push cs
call _list_setid
add sp, 12
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:122:32 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:122:32 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-10], 2
ROTULO546:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:122:32 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:122:32 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-10]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:122:26 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 4
push word [bp+-8+2]
pop es
mov di, [bp+-8]
es mov ax, [di+4]
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO549
jmp ROTULO550
ROTULO549:
mov ax, 65535
jmp ROTULO551
ROTULO550:
xor ax, ax
ROTULO551:
cmp ax, 0
jne ROTULO547
jmp ROTULO548
ROTULO547:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:123:17 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:123:36 ===---
xor ax, ax
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:123:33 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-10]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:123:26 ===---
; ACAO LEITURA - Le ponteiro
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:123:23 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
push cs
call _list_setid
add sp, 12
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:122:32 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-10]
jmp ROTULO546
ROTULO548:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:125:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:125:20 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:125:37 ===---
mov ax, 1
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:125:30 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-8+2]
pop es
mov di, [bp+-8]
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:125:27 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
push cs
call _list_getptr
add sp, 10
jmp ROTULO525
jmp ROTULO552
ROTULO527:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:127:13 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:127:19 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - Ponteiro Byte - Desvio 4
push word [bp+6+2]
pop es
mov di, [bp+6]
es push word [di+4+2]
es push word [di+4]
pop di
pop es
push es
pop word [bp+-4+2]
mov [bp+-4], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:128:13 ===---
list_find_in_block_add:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:129:14 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:129:23 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
mov [bp+-8], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:130:14 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO GRAVACAO - Grava segmento em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:130:23 ===---
; ACAO LEITURA - Le segmento em variavel
mov ax, [bp+-4+2]
mov word [bp+-8+2], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:131:32 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:131:32 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-10], 1
ROTULO553:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:131:32 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:131:32 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-10]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:131:26 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 4
push word [bp+-8+2]
pop es
mov di, [bp+-8]
es mov ax, [di+4]
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO556
jmp ROTULO557
ROTULO556:
mov ax, 65535
jmp ROTULO558
ROTULO557:
xor ax, ax
ROTULO558:
cmp ax, 0
jne ROTULO554
jmp ROTULO555
ROTULO554:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:132:17 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:132:39 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:132:20 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:132:36 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-10]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:132:29 ===---
; ACAO LEITURA - Le ponteiro
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:132:26 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
push cs
call _list_getid
add sp, 10
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:132:42 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO561
jmp ROTULO562
ROTULO561:
mov ax, 65535
jmp ROTULO563
ROTULO562:
xor ax, ax
ROTULO563:
cmp ax, 0
jne ROTULO559
jmp ROTULO560
ROTULO559:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:133:21 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:133:41 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:133:43 ===---
mov ax, 1
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:133:32 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 10
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+10]
pop bx
add ax, bx
es mov [di+10], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:134:21 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:134:40 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 10
es mov ax, [di+10]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:134:37 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-10]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:134:30 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-8+2]
pop es
mov di, [bp+-8]
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:134:27 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
push cs
call _list_setid
add sp, 12
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:135:21 ===---
; ACAO STRUCTURE - Incremento de ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
es inc word [di+2]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:136:21 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:136:28 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:136:45 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-10]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:136:38 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-8+2]
pop es
mov di, [bp+-8]
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:136:35 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
push cs
call _list_getptr
add sp, 10
jmp ROTULO525
ROTULO560:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:131:32 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-10]
jmp ROTULO553
ROTULO555:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:139:13 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:139:19 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - Ponteiro Byte - Desvio 0
push word [bp+-8+2]
pop es
mov di, [bp+-8]
es push word [di+0+2]
es push word [di+0]
pop di
pop es
push es
pop word [bp+-4+2]
mov [bp+-4], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:140:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:140:21 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:140:17 ===---
; ACAO LEITURA - Le segmento em variavel
mov ax, [bp+-4+2]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:140:24 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO566
jmp ROTULO567
ROTULO566:
mov ax, 65535
jmp ROTULO568
ROTULO567:
xor ax, ax
ROTULO568:
cmp ax, 0
jne ROTULO564
jmp ROTULO565
ROTULO564:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:141:17 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:141:23 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:141:34 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
push cs
call _list_allocblock
add sp, 4
push es
pop word [bp+-4+2]
mov [bp+-4], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:142:17 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:142:35 ===---
; ACAO LEITURA - Le ponteiro
push es
push di
push word [bp+-8+2]
pop es
mov di, [bp+-8]
es pop word [di+0]
es pop word [di+0+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
ROTULO565:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:144:18 ===---
jmp list_find_in_block_add
ROTULO552:
ROTULO525:
mov sp, bp
pop bp
FIM_list_add:
retf
; MODULO FIM: list
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:106:8 ===---
; MODULO: memory
_memory:
db 17
db 83,121,115,116,101,109,46,77,101,109,111,114,121,46,104,99,98
db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:107:9 ===---
_memory_firstblockptr:
times 4 db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:108:9 ===---
_memory_inuse:
times 8 db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:110:16 ===---
_memory_initialize:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:111:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:111:25 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:111:76 ===---
mov ax, 1
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:111:47 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_multithreading_kernelthread+2]
pop es
cs mov di, [_multithreading_kernelthread]
push es
push di
push cs
call _globalmemory_allockib
add sp, 6
push es
cs pop word [_memory_firstblockptr+2]
cs mov [_memory_firstblockptr], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:112:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:112:37 ===---
mov ax, 1
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:112:30 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_memory_inuse+2]
pop es
cs mov di, [_memory_inuse]
push es
push di
push cs
call _semaphore_initialize
add sp, 6
ROTULO569:
FIM_memory_initialize:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:115:21 ===---
_memory_alloc:
push bp
mov bp, sp
sub sp, 20
push cs
call _os_stackcheck
; ARG: size TAM: 2 POS: BP+6 
; ARG: blocks TAM: 2 POS: BP--2 
; ARG: i TAM: 2 POS: BP--4 
; ARG: first TAM: 2 POS: BP--6 
; ARG: searching TAM: 2 POS: BP--8 
; ARG: ptr TAM: 4 POS: BP--12 
; ARG: block TAM: 4 POS: BP--16 
; ARG: len TAM: 2 POS: BP--18 
; ARG: kibs TAM: 2 POS: BP--20 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:115:27 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:116:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:117:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:118:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:119:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:120:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:121:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:122:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:123:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:124:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:124:23 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:124:18 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:124:25 ===---
mov ax, 64
cmp ax, 0
jne ROTULO571
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:124:25 ===---
mov ax, _memory
mov [bp+-8], ax
mov ax, 124
mov [bp+-10], ax
mov ax, 1
cs jmp word [_os_trycode]
ROTULO571:
mov bx, ax
pop ax
xor dx, dx
div bx
mov [bp+-2], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:125:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:125:17 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:125:12 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:125:21 ===---
mov ax, 64
cmp ax, 0
jne ROTULO574
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:125:21 ===---
mov ax, _memory
mov [bp+-8], ax
mov ax, 125
mov [bp+-10], ax
mov ax, 1
cs jmp word [_os_trycode]
ROTULO574:
mov bx, ax
pop ax
xor dx, dx
div bx
mov ax, dx
cmp ax, 0
jne ROTULO572
jmp ROTULO573
ROTULO572:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:125:29 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-2]
ROTULO573:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:126:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:126:19 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:126:12 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:126:21 ===---
mov ax, 10
mov bx, ax
pop ax
cmp ax, bx
ja ROTULO577
jmp ROTULO578
ROTULO577:
mov ax, 65535
jmp ROTULO579
ROTULO578:
xor ax, ax
ROTULO579:
cmp ax, 0
jne ROTULO575
jmp ROTULO576
ROTULO575:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:127:13 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:127:34 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:127:36 ===---
mov ax, 16
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:127:26 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:127:21 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:127:28 ===---
mov ax, 1024
cmp ax, 0
jne ROTULO580
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:127:28 ===---
mov ax, _memory
mov [bp+-8], ax
mov ax, 127
mov [bp+-10], ax
mov ax, 1
cs jmp word [_os_trycode]
ROTULO580:
mov bx, ax
pop ax
xor dx, dx
div bx
pop bx
add ax, bx
mov [bp+-20], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:128:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:128:21 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:128:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:128:25 ===---
mov ax, 1024
cmp ax, 0
jne ROTULO583
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:128:25 ===---
mov ax, _memory
mov [bp+-8], ax
mov ax, 128
mov [bp+-10], ax
mov ax, 1
cs jmp word [_os_trycode]
ROTULO583:
mov bx, ax
pop ax
xor dx, dx
div bx
mov ax, dx
cmp ax, 0
jne ROTULO581
jmp ROTULO582
ROTULO581:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:128:35 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-20]
ROTULO582:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:129:13 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:129:19 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:129:70 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-20]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:129:41 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_multithreading_kernelthread+2]
pop es
cs mov di, [_multithreading_kernelthread]
push es
push di
push cs
call _globalmemory_allockib
add sp, 6
push es
pop word [bp+-12+2]
mov [bp+-12], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:130:13 ===---
; ACAO GRAVACAO - Gravacao de numero em ponteiro
es mov byte [di+0], 1
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:131:14 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-12], 16
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:132:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:132:20 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-12+2]
pop es
mov di, [bp+-12]
jmp ROTULO570
ROTULO576:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:134:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:134:27 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_memory_inuse+2]
pop es
cs mov di, [_memory_inuse]
push es
push di
push cs
call _semaphore_waitone
add sp, 4
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:135:9 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-8], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:136:9 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-18], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:137:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:137:17 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_memory_firstblockptr+2]
pop es
cs mov di, [_memory_firstblockptr]
push es
pop word [bp+-16+2]
mov [bp+-16], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:138:9 ===---
ROTULO584:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:138:15 ===---
mov ax, 1
cmp ax, 0
jne ROTULO585
jmp ROTULO586
ROTULO585:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:139:14 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-16], 4
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:140:26 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:140:26 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-4], 1
ROTULO587:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:140:26 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:140:26 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:140:26 ===---
mov ax, 15
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO590
jmp ROTULO591
ROTULO590:
mov ax, 65535
jmp ROTULO592
ROTULO591:
xor ax, ax
ROTULO592:
cmp ax, 0
jne ROTULO588
jmp ROTULO589
ROTULO588:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:141:17 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:141:20 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-8]
cmp ax, 0
jne ROTULO593
jmp ROTULO594
ROTULO593:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:142:21 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:142:30 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:142:24 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-16+2]
pop es
mov di, [bp+-16]
es mov ax, [di+0]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:142:33 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO597
jmp ROTULO598
ROTULO597:
mov ax, 65535
jmp ROTULO599
ROTULO598:
xor ax, ax
ROTULO599:
cmp ax, 0
jne ROTULO595
jmp ROTULO596
ROTULO595:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:143:25 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-18]
jmp ROTULO600
ROTULO596:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:145:25 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-8], 0
ROTULO600:
jmp ROTULO601
ROTULO594:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:148:21 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:148:30 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:148:24 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-16+2]
pop es
mov di, [bp+-16]
es mov ax, [di+0]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:148:33 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO604
jmp ROTULO605
ROTULO604:
mov ax, 65535
jmp ROTULO606
ROTULO605:
xor ax, ax
ROTULO606:
cmp ax, 0
jne ROTULO602
jmp ROTULO603
ROTULO602:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:149:25 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-18], 1
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:150:25 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:150:35 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:150:37 ===---
mov ax, 1
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:150:33 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
pop bx
sub ax, bx
mov [bp+-6], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:151:25 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-8], 1
ROTULO603:
ROTULO601:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:154:17 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:154:24 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:154:20 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-18]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:154:27 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
mov bx, ax
pop ax
cmp ax, bx
jae ROTULO609
jmp ROTULO610
ROTULO609:
mov ax, 65535
jmp ROTULO611
ROTULO610:
xor ax, ax
ROTULO611:
cmp ax, 0
jne ROTULO607
jmp ROTULO608
ROTULO607:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:155:22 ===---
; ACAO GRAVACAO - Grava segmento em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:155:29 ===---
; ACAO LEITURA - Le segmento em variavel
mov ax, [bp+-16+2]
mov word [bp+-12+2], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:156:22 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:156:30 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:156:32 ===---
mov ax, 64
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:156:28 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
pop bx
mul bx
mov [bp+-12], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:157:21 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:157:45 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:157:47 ===---
mov ax, 64
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:157:38 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
pop bx
mul bx
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:157:35 ===---
xor ax, ax
xor ah, ah
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:157:30 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-12+2]
pop es
mov di, [bp+-12]
push es
push di
push cs
call _memory_setbytes
add sp, 8
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:158:22 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:158:32 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:158:41 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:158:43 ===---
mov ax, 2
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:158:35 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-6]
pop bx
mul bx
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:158:30 ===---
mov ax, 4
pop bx
add ax, bx
mov [bp+-16], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:159:34 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:159:34 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-4], 1
ROTULO612:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:159:34 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:159:34 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:159:34 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO615
jmp ROTULO616
ROTULO615:
mov ax, 65535
jmp ROTULO617
ROTULO616:
xor ax, ax
ROTULO617:
cmp ax, 0
jne ROTULO613
jmp ROTULO614
ROTULO613:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:160:25 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:160:30 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:160:28 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:160:33 ===---
mov ax, 1
mov bx, ax
pop ax
cmp ax, bx
je ROTULO620
jmp ROTULO621
ROTULO620:
mov ax, 65535
jmp ROTULO622
ROTULO621:
xor ax, ax
ROTULO622:
cmp ax, 0
jne ROTULO618
jmp ROTULO619
ROTULO618:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:161:29 ===---
; ACAO GRAVACAO - Gravacao de numero em ponteiro
push word [bp+-16+2]
pop es
mov di, [bp+-16]
es mov word [di+0], 1
jmp ROTULO623
ROTULO619:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:163:29 ===---
; ACAO GRAVACAO - Gravacao de numero em ponteiro
push word [bp+-16+2]
pop es
mov di, [bp+-16]
es mov word [di+0], 2
ROTULO623:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:165:26 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-16]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:166:26 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-16]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:159:34 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-4]
jmp ROTULO612
ROTULO614:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:168:21 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:168:39 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_memory_inuse+2]
pop es
cs mov di, [_memory_inuse]
push es
push di
push cs
call _semaphore_release
add sp, 4
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:169:21 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:169:28 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-12+2]
pop es
mov di, [bp+-12]
jmp ROTULO570
ROTULO608:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:171:18 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-16]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:172:18 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-16]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:140:26 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-4]
jmp ROTULO587
ROTULO589:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:174:14 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-16], 2
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:175:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:175:22 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:175:16 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-16+2]
pop es
mov di, [bp+-16]
es mov ax, [di+0]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:175:25 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO626
jmp ROTULO627
ROTULO626:
mov ax, 65535
jmp ROTULO628
ROTULO627:
xor ax, ax
ROTULO628:
cmp ax, 0
jne ROTULO624
jmp ROTULO625
ROTULO624:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:176:17 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:176:23 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:176:74 ===---
mov ax, 1
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:176:45 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_multithreading_kernelthread+2]
pop es
cs mov di, [_multithreading_kernelthread]
push es
push di
push cs
call _globalmemory_allockib
add sp, 6
push es
pop word [bp+-12+2]
mov [bp+-12], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:177:17 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:177:26 ===---
; ACAO LEITURA - Le segmento em variavel
mov ax, [bp+-12+2]
push word [bp+-16+2]
pop es
mov di, [bp+-16]
es mov [di+0], ax
jmp ROTULO629
ROTULO625:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:179:18 ===---
; ACAO GRAVACAO - Grava segmento em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:179:26 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-16+2]
pop es
mov di, [bp+-16]
es mov ax, [di+0]
mov word [bp+-16+2], ax
ROTULO629:
jmp ROTULO584
ROTULO586:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:182:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:182:27 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_memory_inuse+2]
pop es
cs mov di, [_memory_inuse]
push es
push di
push cs
call _semaphore_release
add sp, 4
ROTULO570:
mov sp, bp
pop bp
FIM_memory_alloc:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:186:16 ===---
_memory_setbytes:
push bp
mov bp, sp
; ARG: ptr TAM: 4 POS: BP+6 
; ARG: value TAM: 2 POS: BP+10 
; ARG: len TAM: 2 POS: BP+12 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:186:25 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:186:46 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:186:62 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:187:13 ===---
cld
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:188:13 ===---
mov ax, [bp+8]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:189:13 ===---
mov es, ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:190:13 ===---
mov di, [bp+6]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:191:13 ===---
mov ax, [bp+10]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:192:13 ===---
mov cx, [bp+12]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:193:13 ===---
rep stosb
ROTULO630:
mov sp, bp
pop bp
FIM_memory_setbytes:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:196:16 ===---
_memory_setwords:
push bp
mov bp, sp
; ARG: ptr TAM: 4 POS: BP+6 
; ARG: value TAM: 2 POS: BP+10 
; ARG: len TAM: 2 POS: BP+12 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:196:25 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:196:46 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:196:62 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:197:13 ===---
cld
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:198:13 ===---
mov ax, [bp+8]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:199:13 ===---
mov es, ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:200:13 ===---
mov di, [bp+6]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:201:13 ===---
mov ax, [bp+10]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:202:13 ===---
mov cx, [bp+12]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:203:13 ===---
rep stosw
ROTULO631:
mov sp, bp
pop bp
FIM_memory_setwords:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:206:16 ===---
_memory_copy:
push bp
mov bp, sp
; ARG: dest TAM: 4 POS: BP+6 
; ARG: orig TAM: 4 POS: BP+10 
; ARG: len TAM: 2 POS: BP+14 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:206:21 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:206:43 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:206:65 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:207:13 ===---
cld
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:208:13 ===---
push ds
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:209:13 ===---
push si
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:210:13 ===---
mov ax, [bp+8]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:211:13 ===---
mov es, ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:212:13 ===---
mov di, [bp+6]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:213:13 ===---
mov ax, [bp+12]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:214:13 ===---
mov ds, ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:215:13 ===---
mov si, [bp+10]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:216:13 ===---
mov cx, [bp+14]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:217:13 ===---
rep movsb
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:218:13 ===---
pop si
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:219:13 ===---
pop ds
ROTULO632:
mov sp, bp
pop bp
FIM_memory_copy:
retf
; MODULO FIM: memory
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:5:8 ===---
; MODULO: globalmemory
_globalmemory:
db 17
db 83,121,115,116,101,109,46,77,101,109,111,114,121,46,104,99,98
db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:6:9 ===---
_globalmemory_memorysizekib:
times 2 db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:7:9 ===---
_globalmemory_mapptr:
times 4 db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:8:9 ===---
_globalmemory_inuse:
times 8 db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:10:16 ===---
_globalmemory_initialize:
push bp
mov bp, sp
sub sp, 4
push cs
call _os_stackcheck
; ARG: freekib TAM: 2 POS: BP--2 
; ARG: i TAM: 2 POS: BP--4 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:11:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:12:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:13:13 ===---
xor ax, ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:14:13 ===---
int 0x12
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:15:13 ===---
cs mov [_globalmemory_memorysizekib], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:17:10 ===---
; ACAO GRAVACAO - Grava segmento em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:17:36 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:17:38 ===---
mov ax, 4096
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:17:19 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _os_codesegment
pop bx
add ax, bx
cs mov [_globalmemory_mapptr+2], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:18:10 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_globalmemory_mapptr], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:19:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:19:35 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:19:37 ===---
mov ax, 2
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:19:28 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:19:21 ===---
; ACAO LEITURA - Le segmento em variavel
cs mov ax, [_globalmemory_mapptr+2]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:19:32 ===---
mov ax, 6
mov cx, ax
pop ax
shr ax, cl
pop bx
add ax, bx
mov [bp+-2], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:20:22 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:20:22 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-4], 1
ROTULO634:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:20:22 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:20:22 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:20:22 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_globalmemory_memorysizekib]
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO637
jmp ROTULO638
ROTULO637:
mov ax, 65535
jmp ROTULO639
ROTULO638:
xor ax, ax
ROTULO639:
cmp ax, 0
jne ROTULO635
jmp ROTULO636
ROTULO635:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:21:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:21:18 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:21:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:21:20 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
mov bx, ax
pop ax
cmp ax, bx
jb ROTULO642
jmp ROTULO643
ROTULO642:
mov ax, 65535
jmp ROTULO644
ROTULO643:
xor ax, ax
ROTULO644:
cmp ax, 0
jne ROTULO640
jmp ROTULO641
ROTULO640:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:21:33 ===---
; ACAO GRAVACAO - Gravacao de numero em ponteiro
cs push word [_globalmemory_mapptr+2]
pop es
cs mov di, [_globalmemory_mapptr]
es mov byte [di+0], 129
jmp ROTULO645
ROTULO641:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:21:51 ===---
; ACAO GRAVACAO - Gravacao de numero em ponteiro
cs push word [_globalmemory_mapptr+2]
pop es
cs mov di, [_globalmemory_mapptr]
es mov byte [di+0], 0
ROTULO645:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:22:14 ===---
; ACAO INC - Incrementa variavel
cs inc word [_globalmemory_mapptr]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:20:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-4]
jmp ROTULO634
ROTULO636:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:24:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:24:37 ===---
mov ax, 1
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:24:30 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_globalmemory_inuse+2]
pop es
cs mov di, [_globalmemory_inuse]
push es
push di
push cs
call _semaphore_initialize
add sp, 6
ROTULO633:
mov sp, bp
pop bp
FIM_globalmemory_initialize:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:27:21 ===---
_globalmemory_allockib:
push bp
mov bp, sp
sub sp, 12
push cs
call _os_stackcheck
; ARG: t TAM: 4 POS: BP+6 
; ARG: sizekib TAM: 2 POS: BP+10 
; ARG: ptr TAM: 4 POS: BP--4 
; ARG: i TAM: 2 POS: BP--6 
; ARG: first TAM: 2 POS: BP--8 
; ARG: len TAM: 2 POS: BP--10 
; ARG: searching TAM: 2 POS: BP--12 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:27:30 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:27:43 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:28:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:29:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:30:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:31:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:32:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:33:10 ===---
; ACAO GRAVACAO - Grava segmento em variavel
mov word [bp+-4+2], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:34:10 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-4], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:35:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:35:17 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:35:12 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 0
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+0]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:35:19 ===---
mov ax, 127
mov bx, ax
pop ax
cmp ax, bx
ja ROTULO649
jmp ROTULO650
ROTULO649:
mov ax, 65535
jmp ROTULO651
ROTULO650:
xor ax, ax
ROTULO651:
cmp ax, 0
jne ROTULO647
jmp ROTULO648
ROTULO647:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:35:34 ===---
mov ax, _globalmemory
mov [bp+-8], ax
mov ax, 35
mov [bp+-10], ax
mov ax, 4
cs jmp word [_os_trycode]
ROTULO648:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:36:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:36:20 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:36:12 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:36:22 ===---
mov ax, 64
mov bx, ax
pop ax
cmp ax, bx
ja ROTULO654
jmp ROTULO655
ROTULO654:
mov ax, 65535
jmp ROTULO656
ROTULO655:
xor ax, ax
ROTULO656:
cmp ax, 0
jne ROTULO652
jmp ROTULO653
ROTULO652:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:36:36 ===---
mov ax, _globalmemory
mov [bp+-8], ax
mov ax, 36
mov [bp+-10], ax
mov ax, 12
cs jmp word [_os_trycode]
ROTULO653:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:37:9 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-12], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:38:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:38:27 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_globalmemory_inuse+2]
pop es
cs mov di, [_globalmemory_inuse]
push es
push di
push cs
call _semaphore_waitone
add sp, 4
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:39:10 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_globalmemory_mapptr], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:40:9 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-10], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:41:22 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:41:22 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-6], 1
ROTULO657:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:41:22 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:41:22 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-6]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:41:22 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_globalmemory_memorysizekib]
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO660
jmp ROTULO661
ROTULO660:
mov ax, 65535
jmp ROTULO662
ROTULO661:
xor ax, ax
ROTULO662:
cmp ax, 0
jne ROTULO658
jmp ROTULO659
ROTULO658:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:42:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:42:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-12]
cmp ax, 0
jne ROTULO663
jmp ROTULO664
ROTULO663:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:43:17 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:43:27 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:43:20 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_globalmemory_mapptr+2]
pop es
cs mov di, [_globalmemory_mapptr]
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:43:30 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO667
jmp ROTULO668
ROTULO667:
mov ax, 65535
jmp ROTULO669
ROTULO668:
xor ax, ax
ROTULO669:
cmp ax, 0
jne ROTULO665
jmp ROTULO666
ROTULO665:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:44:21 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-10]
jmp ROTULO670
ROTULO666:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:46:21 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-12], 0
ROTULO670:
jmp ROTULO671
ROTULO664:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:49:17 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:49:27 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:49:20 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_globalmemory_mapptr+2]
pop es
cs mov di, [_globalmemory_mapptr]
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:49:30 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO674
jmp ROTULO675
ROTULO674:
mov ax, 65535
jmp ROTULO676
ROTULO675:
xor ax, ax
ROTULO676:
cmp ax, 0
jne ROTULO672
jmp ROTULO673
ROTULO672:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:50:21 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-10], 1
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:51:21 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:51:31 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:51:33 ===---
mov ax, 1
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:51:29 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-6]
pop bx
sub ax, bx
mov [bp+-8], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:52:21 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-12], 1
ROTULO673:
ROTULO671:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:55:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:55:20 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:55:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-10]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:55:23 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
mov bx, ax
pop ax
cmp ax, bx
jae ROTULO679
jmp ROTULO680
ROTULO679:
mov ax, 65535
jmp ROTULO681
ROTULO680:
xor ax, ax
ROTULO681:
cmp ax, 0
jne ROTULO677
jmp ROTULO678
ROTULO677:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:56:18 ===---
; ACAO GRAVACAO - Grava segmento em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:56:30 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:56:24 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-8]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:56:34 ===---
mov ax, 6
mov cx, ax
pop ax
shl ax, cl
mov word [bp+-4+2], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:57:17 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:57:58 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:57:60 ===---
mov ax, 1
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:57:47 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:57:49 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:57:42 ===---
mov ax, 1024
pop bx
mul bx
pop bx
sub ax, bx
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:57:38 ===---
xor ax, ax
xor ah, ah
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:57:33 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-4+2]
pop es
mov di, [bp+-4]
push es
push di
push cs
call _memory_setbytes
add sp, 8
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:58:18 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:58:27 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-8]
cs mov [_globalmemory_mapptr], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:59:30 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:59:30 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-6], 1
ROTULO682:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:59:30 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:59:30 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-6]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:59:30 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO685
jmp ROTULO686
ROTULO685:
mov ax, 65535
jmp ROTULO687
ROTULO686:
xor ax, ax
ROTULO687:
cmp ax, 0
jne ROTULO683
jmp ROTULO684
ROTULO683:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:60:21 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:60:26 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:60:24 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-6]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:60:29 ===---
mov ax, 1
mov bx, ax
pop ax
cmp ax, bx
je ROTULO690
jmp ROTULO691
ROTULO690:
mov ax, 65535
jmp ROTULO692
ROTULO691:
xor ax, ax
ROTULO692:
cmp ax, 0
jne ROTULO688
jmp ROTULO689
ROTULO688:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:61:25 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:61:39 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:61:34 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 0
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+0]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:61:42 ===---
mov ax, 128
mov bx, ax
pop ax
or ax, bx
cs push word [_globalmemory_mapptr+2]
pop es
cs mov di, [_globalmemory_mapptr]
es mov [di+0], al
jmp ROTULO696
ROTULO689:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:63:25 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:63:34 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 0
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+0]
cs push word [_globalmemory_mapptr+2]
pop es
cs mov di, [_globalmemory_mapptr]
es mov [di+0], al
ROTULO696:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:65:22 ===---
; ACAO INC - Incrementa variavel
cs inc word [_globalmemory_mapptr]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:59:30 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-6]
jmp ROTULO682
ROTULO684:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:67:17 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:67:35 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_globalmemory_inuse+2]
pop es
cs mov di, [_globalmemory_inuse]
push es
push di
push cs
call _semaphore_release
add sp, 4
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:68:17 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:68:24 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-4+2]
pop es
mov di, [bp+-4]
jmp ROTULO646
ROTULO678:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:70:14 ===---
; ACAO INC - Incrementa variavel
cs inc word [_globalmemory_mapptr]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:41:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-6]
jmp ROTULO657
ROTULO659:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:72:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:72:27 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_globalmemory_inuse+2]
pop es
cs mov di, [_globalmemory_inuse]
push es
push di
push cs
call _semaphore_release
add sp, 4
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:73:15 ===---
mov ax, _globalmemory
mov [bp+-8], ax
mov ax, 73
mov [bp+-10], ax
mov ax, 3
cs jmp word [_os_trycode]
ROTULO646:
mov sp, bp
pop bp
FIM_globalmemory_allockib:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:76:21 ===---
_globalmemory_getavailkib:
push bp
mov bp, sp
sub sp, 4
push cs
call _os_stackcheck
; ARG: ret TAM: 2 POS: BP--2 
; ARG: i TAM: 2 POS: BP--4 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:77:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:78:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:79:9 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-2], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:80:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:80:27 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_globalmemory_inuse+2]
pop es
cs mov di, [_globalmemory_inuse]
push es
push di
push cs
call _semaphore_waitone
add sp, 4
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:81:10 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_globalmemory_mapptr], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:82:22 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:82:22 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-4], 0
ROTULO698:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:82:22 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:82:22 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:82:22 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_globalmemory_memorysizekib]
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO701
jmp ROTULO702
ROTULO701:
mov ax, 65535
jmp ROTULO703
ROTULO702:
xor ax, ax
ROTULO703:
cmp ax, 0
jne ROTULO699
jmp ROTULO700
ROTULO699:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:83:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:83:23 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:83:16 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_globalmemory_mapptr+2]
pop es
cs mov di, [_globalmemory_mapptr]
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:83:26 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO706
jmp ROTULO707
ROTULO706:
mov ax, 65535
jmp ROTULO708
ROTULO707:
xor ax, ax
ROTULO708:
cmp ax, 0
jne ROTULO704
jmp ROTULO705
ROTULO704:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:83:33 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-2]
ROTULO705:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:84:14 ===---
; ACAO INC - Incrementa variavel
cs inc word [_globalmemory_mapptr]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:82:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-4]
jmp ROTULO698
ROTULO700:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:86:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:86:27 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_globalmemory_inuse+2]
pop es
cs mov di, [_globalmemory_inuse]
push es
push di
push cs
call _semaphore_release
add sp, 4
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:87:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:87:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
jmp ROTULO697
ROTULO697:
mov sp, bp
pop bp
FIM_globalmemory_getavailkib:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:90:21 ===---
_globalmemory_getusedkib:
push bp
mov bp, sp
sub sp, 4
push cs
call _os_stackcheck
; ARG: ret TAM: 2 POS: BP--2 
; ARG: i TAM: 2 POS: BP--4 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:91:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:92:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:93:9 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-2], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:94:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:94:27 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_globalmemory_inuse+2]
pop es
cs mov di, [_globalmemory_inuse]
push es
push di
push cs
call _semaphore_waitone
add sp, 4
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:95:10 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_globalmemory_mapptr], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:96:22 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:96:22 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-4], 0
ROTULO710:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:96:22 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:96:22 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:96:22 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_globalmemory_memorysizekib]
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO713
jmp ROTULO714
ROTULO713:
mov ax, 65535
jmp ROTULO715
ROTULO714:
xor ax, ax
ROTULO715:
cmp ax, 0
jne ROTULO711
jmp ROTULO712
ROTULO711:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:97:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:97:23 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:97:16 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_globalmemory_mapptr+2]
pop es
cs mov di, [_globalmemory_mapptr]
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:97:26 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
jne ROTULO718
jmp ROTULO719
ROTULO718:
mov ax, 65535
jmp ROTULO720
ROTULO719:
xor ax, ax
ROTULO720:
cmp ax, 0
jne ROTULO716
jmp ROTULO717
ROTULO716:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:97:33 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-2]
ROTULO717:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:98:14 ===---
; ACAO INC - Incrementa variavel
cs inc word [_globalmemory_mapptr]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:96:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-4]
jmp ROTULO710
ROTULO712:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:100:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:100:27 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_globalmemory_inuse+2]
pop es
cs mov di, [_globalmemory_inuse]
push es
push di
push cs
call _semaphore_release
add sp, 4
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:101:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:101:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
jmp ROTULO709
ROTULO709:
mov sp, bp
pop bp
FIM_globalmemory_getusedkib:
retf
; MODULO FIM: globalmemory
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:25:8 ===---
; MODULO: semaphore
_semaphore:
db 20
db 83,121,115,116,101,109,46,84,104,114,101,97,100,105,110,103,46,104,99,98
db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:27:16 ===---
_semaphore_initialize:
push bp
mov bp, sp
; ARG: s TAM: 4 POS: BP+6 
; ARG: limit TAM: 2 POS: BP+10 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:27:27 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:27:43 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:28:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:28:19 ===---
xor ax, ax
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov [di+0], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:29:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:29:19 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
es mov [di+2], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
ROTULO721:
mov sp, bp
pop bp
FIM_semaphore_initialize:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:33:16 ===---
_semaphore_waitone:
push bp
mov bp, sp
; ARG: s TAM: 4 POS: BP+6 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:33:24 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:34:9 ===---
waiting:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:35:9 ===---
ROTULO723:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:35:23 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:35:15 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 0
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+0]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:35:26 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 2
es mov ax, [di+2]
mov bx, ax
pop ax
cmp ax, bx
jae ROTULO726
jmp ROTULO727
ROTULO726:
mov ax, 65535
jmp ROTULO728
ROTULO727:
xor ax, ax
ROTULO728:
cmp ax, 0
jne ROTULO724
jmp ROTULO725
ROTULO724:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:36:13 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _thread_yield
jmp ROTULO723
ROTULO725:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:38:13 ===---
pushf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:39:13 ===---
cli
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:40:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:40:20 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:40:12 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 0
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+0]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:40:23 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 2
es mov ax, [di+2]
mov bx, ax
pop ax
cmp ax, bx
jae ROTULO731
jmp ROTULO732
ROTULO731:
mov ax, 65535
jmp ROTULO733
ROTULO732:
xor ax, ax
ROTULO733:
cmp ax, 0
jne ROTULO729
jmp ROTULO730
ROTULO729:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:41:17 ===---
popf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:42:18 ===---
jmp waiting
ROTULO730:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:44:9 ===---
; ACAO STRUCTURE - Incremento de ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
es inc word [di+0]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:45:13 ===---
popf
ROTULO722:
mov sp, bp
pop bp
FIM_semaphore_waitone:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:49:16 ===---
_semaphore_release:
push bp
mov bp, sp
; ARG: s TAM: 4 POS: BP+6 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:49:24 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:50:13 ===---
pushf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:51:13 ===---
cli
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:52:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:52:20 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:52:12 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 0
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+0]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:52:22 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
ja ROTULO737
jmp ROTULO738
ROTULO737:
mov ax, 65535
jmp ROTULO739
ROTULO738:
xor ax, ax
ROTULO739:
cmp ax, 0
jne ROTULO735
jmp ROTULO736
ROTULO735:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:52:29 ===---
; ACAO STRUCTURE - Decremento de Ponteiro
es dec word [di+0]
ROTULO736:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:53:13 ===---
popf
ROTULO734:
mov sp, bp
pop bp
FIM_semaphore_release:
retf
; MODULO FIM: semaphore
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:217:8 ===---
; MODULO: thread
_thread:
db 20
db 83,121,115,116,101,109,46,84,104,114,101,97,100,105,110,103,46,104,99,98
db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:219:21 ===---
_thread_requestnew:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:220:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:220:16 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _multithreading_requestnew
jmp ROTULO740
ROTULO740:
FIM_thread_requestnew:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:224:16 ===---
_thread_start:
push bp
mov bp, sp
sub sp, 8
push cs
call _os_stackcheck
; ARG: t TAM: 4 POS: BP+6 
; ARG: stacksizekib TAM: 2 POS: BP+10 
; ARG: action TAM: 4 POS: BP+12 
; ARG: stack TAM: 4 POS: BP--4 
; ARG: ptr TAM: 4 POS: BP--8 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:224:22 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:224:35 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:224:59 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:225:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:226:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:227:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:227:23 ===---
xor ax, ax
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov [di+4], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:228:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:228:17 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:228:42 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:228:39 ===---
; ACAO LEITURA - Le ponteiro
push es
push di
push cs
call _globalmemory_allockib
add sp, 6
push es
pop word [bp+-4+2]
mov [bp+-4], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:229:10 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:229:40 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:229:42 ===---
mov ax, 2
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:229:32 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:229:34 ===---
mov ax, 1024
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:229:19 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
pop bx
mul bx
pop bx
sub ax, bx
mov [bp+-4], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:230:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:230:27 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov [di+16], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:231:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:231:27 ===---
; ACAO LEITURA - Le segmento em variavel
mov ax, [bp+-4+2]
es mov [di+14], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:232:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:232:22 ===---
mov ax, 1
es mov [di+6], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:233:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:233:20 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+12+2]
pop es
mov di, [bp+12]
push es
push di
push word [bp+6+2]
pop es
mov di, [bp+6]
es pop word [di+10]
es pop word [di+10+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:234:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:234:36 ===---
; ACAO LEITURA - Le ponteiro
push es
push di
push cs
call _multithreading_startthread
add sp, 4
ROTULO741:
mov sp, bp
pop bp
FIM_thread_start:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:238:9 ===---
_thread_endthread:
push bp
mov bp, sp
sub sp, 4
push cs
call _os_stackcheck
; ARG: t TAM: 4 POS: BP--4 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:239:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:240:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:240:13 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _thread_current
push es
pop word [bp+-4+2]
mov [bp+-4], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:241:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:241:20 ===---
xor ax, ax
es mov [di+2], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:242:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:242:23 ===---
mov ax, 1
es mov [di+4], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:243:9 ===---
ROTULO743:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:243:15 ===---
mov ax, 1
cmp ax, 0
jne ROTULO744
jmp ROTULO745
ROTULO744:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:243:17 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _thread_yield
jmp ROTULO743
ROTULO745:
ROTULO742:
mov sp, bp
pop bp
FIM_thread_endthread:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:247:16 ===---
_thread_abort:
push bp
mov bp, sp
; ARG: t TAM: 4 POS: BP+6 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:247:22 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:248:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:248:23 ===---
mov ax, 1
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov [di+4], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:249:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:249:20 ===---
xor ax, ax
es mov [di+2], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
ROTULO746:
mov sp, bp
pop bp
FIM_thread_abort:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:253:21 ===---
_thread_current:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:254:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:254:16 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_multithreading_current+2]
pop es
cs mov di, [_multithreading_current]
jmp ROTULO747
ROTULO747:
FIM_thread_current:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:258:16 ===---
_thread_yield:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:259:13 ===---
sti
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:260:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:260:38 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:260:12 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _multithreading_isactive
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:260:41 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO751
jmp ROTULO752
ROTULO751:
mov ax, 65535
jmp ROTULO753
ROTULO752:
xor ax, ax
ROTULO753:
cmp ax, 0
jne ROTULO749
jmp ROTULO750
ROTULO749:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:260:48 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:260:53 ===---
xor ax, ax
jmp ROTULO748
ROTULO750:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:261:13 ===---
int 0x81
ROTULO748:
FIM_thread_yield:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:265:16 ===---
_thread_sleep:
push bp
mov bp, sp
sub sp, 4
push cs
call _os_stackcheck
; ARG: miliseconds TAM: 2 POS: BP+6 
; ARG: oldmili TAM: 2 POS: BP--2 
; ARG: diff TAM: 2 POS: BP--4 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:265:22 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:266:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:267:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:268:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:268:19 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_clock_timermiliseconds]
mov [bp+-2], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:269:9 ===---
ROTULO755:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:269:15 ===---
mov ax, 1
cmp ax, 0
jne ROTULO756
jmp ROTULO757
ROTULO756:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:270:13 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:270:43 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:270:45 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:270:20 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_clock_timermiliseconds]
pop bx
sub ax, bx
mov [bp+-4], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:271:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:271:21 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:271:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:271:24 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
mov bx, ax
pop ax
cmp ax, bx
jae ROTULO760
jmp ROTULO761
ROTULO760:
mov ax, 65535
jmp ROTULO762
ROTULO761:
xor ax, ax
ROTULO762:
cmp ax, 0
jne ROTULO758
jmp ROTULO759
ROTULO758:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:271:41 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:271:46 ===---
xor ax, ax
jmp ROTULO754
ROTULO759:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:272:13 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _thread_yield
jmp ROTULO755
ROTULO757:
ROTULO754:
mov sp, bp
pop bp
FIM_thread_sleep:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:277:16 ===---
_thread_sleepseconds:
push bp
mov bp, sp
sub sp, 4
push cs
call _os_stackcheck
; ARG: seconds TAM: 2 POS: BP+6 
; ARG: oldsec TAM: 2 POS: BP--2 
; ARG: diff TAM: 2 POS: BP--4 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:277:29 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:278:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:279:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:280:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:280:18 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_clock_timerseconds]
mov [bp+-2], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:281:9 ===---
ROTULO764:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:281:15 ===---
mov ax, 1
cmp ax, 0
jne ROTULO765
jmp ROTULO766
ROTULO765:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:282:13 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:282:39 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:282:41 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:282:20 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_clock_timerseconds]
pop bx
sub ax, bx
mov [bp+-4], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:283:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:283:21 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:283:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:283:24 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
mov bx, ax
pop ax
cmp ax, bx
jae ROTULO769
jmp ROTULO770
ROTULO769:
mov ax, 65535
jmp ROTULO771
ROTULO770:
xor ax, ax
ROTULO771:
cmp ax, 0
jne ROTULO767
jmp ROTULO768
ROTULO767:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:283:37 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:283:42 ===---
xor ax, ax
jmp ROTULO763
ROTULO768:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:284:13 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _thread_yield
jmp ROTULO764
ROTULO766:
ROTULO763:
mov sp, bp
pop bp
FIM_thread_sleepseconds:
retf
; MODULO FIM: thread
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:6:8 ===---
; MODULO: clock
_clock:
db 16
db 83,121,115,116,101,109,46,84,105,109,101,114,46,104,99,98
db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:7:16 ===---
_clock_timermiliseconds:
times 2 db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:8:16 ===---
_clock_timerseconds:
times 2 db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:9:16 ===---
_clock_milisecond:
times 2 db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:10:16 ===---
_clock_second:
times 2 db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:11:16 ===---
_clock_minute:
times 2 db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:12:16 ===---
_clock_hour:
times 2 db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:13:16 ===---
_clock_day:
times 2 db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:14:16 ===---
_clock_month:
times 2 db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:15:16 ===---
_clock_year:
times 2 db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:17:16 ===---
_clock_initialize:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:18:9 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_clock_year], 2023
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:19:9 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_clock_month], 1
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:20:9 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_clock_day], 1
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:21:9 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_clock_hour], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:22:9 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_clock_minute], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:23:9 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_clock_second], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:24:9 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_clock_milisecond], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:25:9 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_clock_timerseconds], 0
ROTULO772:
FIM_clock_initialize:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:28:16 ===---
_clock_autoajust:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:29:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:29:17 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:29:12 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_clock_hour]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:29:19 ===---
mov ax, 24
mov bx, ax
pop ax
cmp ax, bx
jb ROTULO776
jmp ROTULO777
ROTULO776:
mov ax, 65535
jmp ROTULO778
ROTULO777:
xor ax, ax
ROTULO778:
cmp ax, 0
jne ROTULO774
jmp ROTULO775
ROTULO774:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:29:32 ===---
jmp end_ajust
ROTULO775:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:30:9 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_clock_hour], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:31:9 ===---
; ACAO INC - Incrementa variavel
cs inc word [_clock_day]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:32:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:32:16 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:32:12 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_clock_day]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:32:18 ===---
mov ax, 28
mov bx, ax
pop ax
cmp ax, bx
jb ROTULO781
jmp ROTULO782
ROTULO781:
mov ax, 65535
jmp ROTULO783
ROTULO782:
xor ax, ax
ROTULO783:
cmp ax, 0
jne ROTULO779
jmp ROTULO780
ROTULO779:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:32:31 ===---
jmp end_ajust
ROTULO780:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:33:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:33:16 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:33:12 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_clock_day]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:33:19 ===---
mov ax, 32
mov bx, ax
pop ax
cmp ax, bx
jae ROTULO786
jmp ROTULO787
ROTULO786:
mov ax, 65535
jmp ROTULO788
ROTULO787:
xor ax, ax
ROTULO788:
cmp ax, 0
jne ROTULO784
jmp ROTULO785
ROTULO784:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:33:32 ===---
jmp calc_month
ROTULO785:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:34:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:34:18 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:34:12 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_clock_month]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:34:21 ===---
mov ax, 2
mov bx, ax
pop ax
cmp ax, bx
je ROTULO791
jmp ROTULO792
ROTULO791:
mov ax, 65535
jmp ROTULO793
ROTULO792:
xor ax, ax
ROTULO793:
cmp ax, 0
jne ROTULO789
jmp ROTULO790
ROTULO789:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:34:33 ===---
jmp calc_month
ROTULO790:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:35:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:35:16 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:35:12 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_clock_day]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:35:18 ===---
mov ax, 30
mov bx, ax
pop ax
cmp ax, bx
jb ROTULO796
jmp ROTULO797
ROTULO796:
mov ax, 65535
jmp ROTULO798
ROTULO797:
xor ax, ax
ROTULO798:
cmp ax, 0
jne ROTULO794
jmp ROTULO795
ROTULO794:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:35:31 ===---
jmp end_ajust
ROTULO795:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:36:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:36:18 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:36:12 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_clock_month]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:36:21 ===---
mov ax, 4
mov bx, ax
pop ax
cmp ax, bx
je ROTULO801
jmp ROTULO802
ROTULO801:
mov ax, 65535
jmp ROTULO803
ROTULO802:
xor ax, ax
ROTULO803:
cmp ax, 0
jne ROTULO799
jmp ROTULO800
ROTULO799:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:36:33 ===---
jmp calc_month
ROTULO800:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:37:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:37:18 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:37:12 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_clock_month]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:37:21 ===---
mov ax, 6
mov bx, ax
pop ax
cmp ax, bx
je ROTULO806
jmp ROTULO807
ROTULO806:
mov ax, 65535
jmp ROTULO808
ROTULO807:
xor ax, ax
ROTULO808:
cmp ax, 0
jne ROTULO804
jmp ROTULO805
ROTULO804:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:37:33 ===---
jmp calc_month
ROTULO805:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:38:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:38:18 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:38:12 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_clock_month]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:38:21 ===---
mov ax, 9
mov bx, ax
pop ax
cmp ax, bx
je ROTULO811
jmp ROTULO812
ROTULO811:
mov ax, 65535
jmp ROTULO813
ROTULO812:
xor ax, ax
ROTULO813:
cmp ax, 0
jne ROTULO809
jmp ROTULO810
ROTULO809:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:38:33 ===---
jmp calc_month
ROTULO810:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:39:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:39:18 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:39:12 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_clock_month]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:39:21 ===---
mov ax, 11
mov bx, ax
pop ax
cmp ax, bx
je ROTULO816
jmp ROTULO817
ROTULO816:
mov ax, 65535
jmp ROTULO818
ROTULO817:
xor ax, ax
ROTULO818:
cmp ax, 0
jne ROTULO814
jmp ROTULO815
ROTULO814:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:39:34 ===---
jmp calc_month
ROTULO815:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:40:14 ===---
jmp end_ajust
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:41:9 ===---
calc_month:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:42:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:42:25 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:42:19 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:42:13 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_clock_month]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:42:21 ===---
mov ax, 13
mov bx, ax
pop ax
cmp ax, bx
ja ROTULO824
jmp ROTULO825
ROTULO824:
mov ax, 65535
jmp ROTULO826
ROTULO825:
xor ax, ax
ROTULO826:
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:42:35 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:42:29 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_clock_month]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:42:38 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO827
jmp ROTULO828
ROTULO827:
mov ax, 65535
jmp ROTULO829
ROTULO828:
xor ax, ax
ROTULO829:
mov bx, ax
pop ax
or ax, bx
cmp ax, 0
jne ROTULO819
jmp ROTULO820
ROTULO819:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:43:13 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_clock_month], 1
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:44:13 ===---
; ACAO INC - Incrementa variavel
cs inc word [_clock_year]
ROTULO820:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:46:9 ===---
end_ajust:
ROTULO773:
FIM_clock_autoajust:
retf
; MODULO FIM: clock
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:50:8 ===---
; MODULO: systemtimer
_systemtimer:
db 16
db 83,121,115,116,101,109,46,84,105,109,101,114,46,104,99,98
db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:51:9 ===---
_systemtimer_biosint8cs:
times 2 db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:52:9 ===---
_systemtimer_biosint8ip:
times 2 db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:53:16 ===---
_systemtimer_ticklow:
times 2 db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:54:16 ===---
_systemtimer_tickhigh:
times 2 db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:55:16 ===---
_systemtimer_defaultflags:
times 2 db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:57:16 ===---
_systemtimer_initialize:
push bp
mov bp, sp
sub sp, 4
push cs
call _os_stackcheck
; ARG: ptr TAM: 4 POS: BP--4 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:58:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:59:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:59:15 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:59:29 ===---
mov ax, 8
xor ah, ah
push ax
push cs
call _io_gethandler
add sp, 2
push es
pop word [bp+-4+2]
mov [bp+-4], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:60:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:60:23 ===---
; ACAO LEITURA - Le segmento em variavel
mov ax, [bp+-4+2]
cs mov [_systemtimer_biosint8cs], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:61:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:61:23 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
cs mov [_systemtimer_biosint8ip], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:62:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:62:31 ===---
push cs
pop es
mov di, _systemtimer_inttick
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:62:28 ===---
mov ax, 8
xor ah, ah
push ax
push cs
call _io_registerhandler
add sp, 6
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:63:13 ===---
sti
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:64:13 ===---
pushf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:65:13 ===---
cs pop word [_systemtimer_defaultflags]
ROTULO830:
mov sp, bp
pop bp
FIM_systemtimer_initialize:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:69:9 ===---
_systemtimer_inttick:
push di
push es
push si
push ds
push dx
push cx
push bx
push ax
push bp
mov ax, sp
push ax
push ss
push ss
pop ds
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:70:13 ===---
cs add word [_systemtimer_ticklow], 1
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:71:13 ===---
cs adc word [_systemtimer_tickhigh], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:73:13 ===---
pushf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:74:13 ===---
push cs
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:75:13 ===---
mov ax, .return
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:76:13 ===---
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:77:13 ===---
cs push word [_systemtimer_biosint8cs]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:78:13 ===---
cs push word [_systemtimer_biosint8ip]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:79:13 ===---
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:80:13 ===---
.return:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:82:13 ===---
cs add word [_clock_milisecond], 55
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:83:13 ===---
cs add word [_clock_timermiliseconds], 55
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:84:13 ===---
cs cmp word [_clock_milisecond], 990
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:85:13 ===---
jb .end_clock
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:86:13 ===---
cs mov word [_clock_milisecond], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:87:13 ===---
cs add word [_clock_timermiliseconds], 10
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:88:13 ===---
cs inc word [_clock_second]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:89:13 ===---
cs inc word [_clock_timerseconds]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:90:13 ===---
cs cmp word [_clock_second], 60
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:91:13 ===---
jb .end_clock
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:92:13 ===---
cs mov word [_clock_second], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:93:13 ===---
cs inc word [_clock_minute]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:94:13 ===---
cs cmp word [_clock_minute], 60
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:95:13 ===---
jb .end_clock
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:96:13 ===---
cs mov word [_clock_minute], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:97:13 ===---
cs inc word [_clock_hour]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:98:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _clock_autoajust
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:99:13 ===---
.end_clock:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:101:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _thread_yield
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:102:13 ===---
mov ax, 0x20
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:103:13 ===---
out 0x20, al
ROTULO831:
pop ax
pop bx
mov ss, ax
mov sp, bx
pop bp
pop ax
pop bx
pop cx
pop dx
pop ds
pop si
pop es
pop di
FIM_systemtimer_inttick:
iret
; MODULO FIM: systemtimer
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:41:8 ===---
; MODULO: disk
_disk:
db 18
db 83,121,115,116,101,109,46,73,79,46,68,105,115,107,46,104,99,98
db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:42:9 ===---
_disk_disks:
times 16 db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:44:16 ===---
_disk_initialize:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:45:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:45:32 ===---
; ACAO CHAMADA - Calcula tamanho de item
mov ax, 71
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:45:25 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_disk_disks+2]
pop es
cs mov di, [_disk_disks]
push es
push di
push cs
call _list_initialize
add sp, 6
ROTULO832:
FIM_disk_initialize:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:48:21 ===---
_disk_registernew:
push bp
mov bp, sp
sub sp, 8
push cs
call _os_stackcheck
; ARG: name TAM: 4 POS: BP+6 
; ARG: internalid TAM: 2 POS: BP+10 
; ARG: cylinders TAM: 2 POS: BP+12 
; ARG: heads TAM: 2 POS: BP+14 
; ARG: sectors TAM: 2 POS: BP+16 
; ARG: blocksize TAM: 2 POS: BP+18 
; ARG: info TAM: 4 POS: BP--4 
; ARG: ptr TAM: 4 POS: BP--8 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:48:33 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:48:49 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:48:71 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:48:92 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:48:109 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:48:128 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:49:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:50:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:51:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:51:15 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:51:24 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_disk_disks+2]
pop es
cs mov di, [_disk_disks]
push es
push di
push cs
call _list_add
add sp, 4
push es
pop word [bp+-8+2]
mov [bp+-8], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:52:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:52:16 ===---
; ACAO LEITURA - Le ponteiro
push es
pop word [bp+-4+2]
mov [bp+-4], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:53:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:53:21 ===---
; ACAO LEITURA - Le ponteiro
push es
push di
es pop word [di+33]
es pop word [di+33+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:54:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:54:27 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
es mov [di+37], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:55:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:55:26 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+12]
es mov [di+39], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:56:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:56:22 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+14]
es mov [di+41], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:57:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:57:24 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+16]
es mov [di+43], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:58:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:58:26 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+18]
es mov [di+45], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:59:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:59:26 ===---
push cs
pop es
mov di, _disk_genericreadblock
push es
push di
push word [bp+-4+2]
pop es
mov di, [bp+-4]
es pop word [di+47]
es pop word [di+47+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:60:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:60:27 ===---
push cs
pop es
mov di, _disk_genericwriteblock
push es
push di
push word [bp+-4+2]
pop es
mov di, [bp+-4]
es pop word [di+51]
es pop word [di+51+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:61:9 ===---
; ACAO GRAVACAO - Gravacao de numero em ponteiro
push word [bp+-8+2]
pop es
mov di, [bp+-8]
es mov byte [di+0], 32
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:62:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:62:32 ===---
push cs
pop es
mov di, ROTULO835
jmp ROTULO834
ROTULO835:
db 0
times 1 db 0
ROTULO834:
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:62:21 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - Ponteiro Byte - Desvio 33
push word [bp+-4+2]
pop es
mov di, [bp+-4]
es push word [di+33+2]
es push word [di+33]
pop di
pop es
push es
push di
push cs
call _string_copy
add sp, 8
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:63:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:63:32 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:63:21 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - Ponteiro Byte - Desvio 33
push word [bp+-4+2]
pop es
mov di, [bp+-4]
es push word [di+33+2]
es push word [di+33]
pop di
pop es
push es
push di
push cs
call _string_copy
add sp, 8
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:64:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:64:16 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-4+2]
pop es
mov di, [bp+-4]
jmp ROTULO833
ROTULO833:
mov sp, bp
pop bp
FIM_disk_registernew:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:67:16 ===---
_disk_converttochs:
push bp
mov bp, sp
sub sp, 2
push cs
call _os_stackcheck
; ARG: out TAM: 4 POS: BP+6 
; ARG: d TAM: 4 POS: BP+10 
; ARG: addresslow TAM: 2 POS: BP+14 
; ARG: addresshigh TAM: 2 POS: BP+16 
; ARG: sectors TAM: 2 POS: BP--2 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:67:29 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:67:48 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:67:63 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:67:85 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:68:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:69:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:69:24 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:69:12 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+16]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:69:27 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
jne ROTULO839
jmp ROTULO840
ROTULO839:
mov ax, 65535
jmp ROTULO841
ROTULO840:
xor ax, ax
ROTULO841:
cmp ax, 0
jne ROTULO837
jmp ROTULO838
ROTULO837:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:69:40 ===---
mov ax, _disk
mov [bp+-8], ax
mov ax, 69
mov [bp+-10], ax
mov ax, 4
cs jmp word [_os_trycode]
ROTULO838:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:70:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:70:29 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:70:31 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 41
push word [bp+10+2]
pop es
mov di, [bp+10]
es mov ax, [di+41]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:70:19 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 43
es mov ax, [di+43]
pop bx
mul bx
mov [bp+-2], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:71:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:71:35 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:71:24 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+14]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:71:37 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
cmp ax, 0
jne ROTULO842
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:71:37 ===---
mov ax, _disk
mov [bp+-8], ax
mov ax, 71
mov [bp+-10], ax
mov ax, 1
cs jmp word [_os_trycode]
ROTULO842:
mov bx, ax
pop ax
xor dx, dx
div bx
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov [di+0], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:72:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:72:45 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:72:32 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:72:21 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+14]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:72:36 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
cmp ax, 0
jne ROTULO843
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:72:36 ===---
mov ax, _disk
mov [bp+-8], ax
mov ax, 72
mov [bp+-10], ax
mov ax, 1
cs jmp word [_os_trycode]
ROTULO843:
mov bx, ax
pop ax
xor dx, dx
div bx
mov ax, dx
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:72:47 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 43
push word [bp+10+2]
pop es
mov di, [bp+10]
es mov ax, [di+43]
cmp ax, 0
jne ROTULO844
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:72:47 ===---
mov ax, _disk
mov [bp+-8], ax
mov ax, 72
mov [bp+-10], ax
mov ax, 1
cs jmp word [_os_trycode]
ROTULO844:
mov bx, ax
pop ax
xor dx, dx
div bx
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov [di+2], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:73:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:73:63 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:73:65 ===---
mov ax, 1
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:73:48 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:73:35 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:73:24 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+14]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:73:39 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
cmp ax, 0
jne ROTULO845
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:73:39 ===---
mov ax, _disk
mov [bp+-8], ax
mov ax, 73
mov [bp+-10], ax
mov ax, 1
cs jmp word [_os_trycode]
ROTULO845:
mov bx, ax
pop ax
xor dx, dx
div bx
mov ax, dx
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:73:52 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 43
push word [bp+10+2]
pop es
mov di, [bp+10]
es mov ax, [di+43]
cmp ax, 0
jne ROTULO846
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:73:52 ===---
mov ax, _disk
mov [bp+-8], ax
mov ax, 73
mov [bp+-10], ax
mov ax, 1
cs jmp word [_os_trycode]
ROTULO846:
mov bx, ax
pop ax
xor dx, dx
div bx
mov ax, dx
pop bx
add ax, bx
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov [di+4], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
ROTULO836:
mov sp, bp
pop bp
FIM_disk_converttochs:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:76:9 ===---
_disk_genericreadblock:
push bp
mov bp, sp
; ARG: info TAM: 4 POS: BP+6 
; ARG: data TAM: 4 POS: BP+10 
; ARG: addresslow TAM: 2 POS: BP+14 
; ARG: addresshigh TAM: 2 POS: BP+16 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:76:26 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:76:44 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:76:66 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:76:88 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:77:15 ===---
mov ax, _disk
mov [bp+-8], ax
mov ax, 77
mov [bp+-10], ax
mov ax, 7
cs jmp word [_os_trycode]
ROTULO847:
mov sp, bp
pop bp
FIM_disk_genericreadblock:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:80:9 ===---
_disk_genericwriteblock:
push bp
mov bp, sp
; ARG: info TAM: 4 POS: BP+6 
; ARG: data TAM: 4 POS: BP+10 
; ARG: addresslow TAM: 2 POS: BP+14 
; ARG: addresshigh TAM: 2 POS: BP+16 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:80:27 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:80:45 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:80:67 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:80:89 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:81:15 ===---
mov ax, _disk
mov [bp+-8], ax
mov ax, 81
mov [bp+-10], ax
mov ax, 7
cs jmp word [_os_trycode]
ROTULO848:
mov sp, bp
pop bp
FIM_disk_genericwriteblock:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:84:14 ===---
_disk_exist:
push bp
mov bp, sp
sub sp, 6
push cs
call _os_stackcheck
; ARG: name TAM: 4 POS: BP+6 
; ARG: i TAM: 2 POS: BP--2 
; ARG: d TAM: 4 POS: BP--6 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:84:20 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:85:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:87:17 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:86:38 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:86:38 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-2], 1
ROTULO850:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:86:38 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:86:38 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:86:22 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:86:33 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_disk_disks+2]
pop es
cs mov di, [_disk_disks]
push es
push di
push cs
call _list_count
add sp, 4
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO853
jmp ROTULO854
ROTULO853:
mov ax, 65535
jmp ROTULO855
ROTULO854:
xor ax, ax
ROTULO855:
cmp ax, 0
jne ROTULO851
jmp ROTULO852
ROTULO851:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:88:13 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:88:17 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:88:34 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:88:27 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_disk_disks+2]
pop es
cs mov di, [_disk_disks]
push es
push di
push cs
call _list_item
add sp, 6
push es
pop word [bp+-6+2]
mov [bp+-6], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:89:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:89:16 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:89:38 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:89:30 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - Ponteiro Byte - Desvio 33
push word [bp+-6+2]
pop es
mov di, [bp+-6]
es push word [di+33+2]
es push word [di+33]
pop di
pop es
push es
push di
push cs
call _string_equals
add sp, 8
cmp ax, 0
jne ROTULO856
jmp ROTULO857
ROTULO856:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:90:17 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:90:24 ===---
mov ax, 65535
jmp ROTULO849
ROTULO857:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:86:38 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-2]
jmp ROTULO850
ROTULO852:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:93:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:93:16 ===---
xor ax, ax
jmp ROTULO849
ROTULO849:
mov sp, bp
pop bp
FIM_disk_exist:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:96:14 ===---
_disk_item:
push bp
mov bp, sp
sub sp, 6
push cs
call _os_stackcheck
; ARG: name TAM: 4 POS: BP+6 
; ARG: i TAM: 2 POS: BP--2 
; ARG: d TAM: 4 POS: BP--6 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:96:19 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:97:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:99:17 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:98:38 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:98:38 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-2], 1
ROTULO859:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:98:38 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:98:38 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:98:22 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:98:33 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_disk_disks+2]
pop es
cs mov di, [_disk_disks]
push es
push di
push cs
call _list_count
add sp, 4
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO862
jmp ROTULO863
ROTULO862:
mov ax, 65535
jmp ROTULO864
ROTULO863:
xor ax, ax
ROTULO864:
cmp ax, 0
jne ROTULO860
jmp ROTULO861
ROTULO860:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:100:13 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:100:17 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:100:34 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:100:27 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_disk_disks+2]
pop es
cs mov di, [_disk_disks]
push es
push di
push cs
call _list_item
add sp, 6
push es
pop word [bp+-6+2]
mov [bp+-6], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:101:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:101:16 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:101:38 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:101:30 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - Ponteiro Byte - Desvio 33
push word [bp+-6+2]
pop es
mov di, [bp+-6]
es push word [di+33+2]
es push word [di+33]
pop di
pop es
push es
push di
push cs
call _string_equals
add sp, 8
cmp ax, 0
jne ROTULO865
jmp ROTULO866
ROTULO865:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:101:49 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:101:56 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-6+2]
pop es
mov di, [bp+-6]
jmp ROTULO858
ROTULO866:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:98:38 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-2]
jmp ROTULO859
ROTULO861:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:103:15 ===---
mov ax, _disk
mov [bp+-8], ax
mov ax, 103
mov [bp+-10], ax
mov ax, 5
cs jmp word [_os_trycode]
ROTULO858:
mov sp, bp
pop bp
FIM_disk_item:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:106:14 ===---
_disk_count:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:107:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:107:16 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:107:27 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_disk_disks+2]
pop es
cs mov di, [_disk_disks]
push es
push di
push cs
call _list_count
add sp, 4
jmp ROTULO867
ROTULO867:
FIM_disk_count:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:110:14 ===---
_disk_getblocksize:
push bp
mov bp, sp
sub sp, 6
push cs
call _os_stackcheck
; ARG: name TAM: 4 POS: BP+6 
; ARG: i TAM: 2 POS: BP--2 
; ARG: d TAM: 4 POS: BP--6 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:110:27 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:111:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:113:17 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:112:38 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:112:38 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-2], 1
ROTULO869:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:112:38 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:112:38 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:112:22 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:112:33 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_disk_disks+2]
pop es
cs mov di, [_disk_disks]
push es
push di
push cs
call _list_count
add sp, 4
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO872
jmp ROTULO873
ROTULO872:
mov ax, 65535
jmp ROTULO874
ROTULO873:
xor ax, ax
ROTULO874:
cmp ax, 0
jne ROTULO870
jmp ROTULO871
ROTULO870:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:114:13 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:114:17 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:114:34 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:114:27 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_disk_disks+2]
pop es
cs mov di, [_disk_disks]
push es
push di
push cs
call _list_item
add sp, 6
push es
pop word [bp+-6+2]
mov [bp+-6], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:115:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:115:16 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:115:38 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:115:30 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - Ponteiro Byte - Desvio 33
push word [bp+-6+2]
pop es
mov di, [bp+-6]
es push word [di+33+2]
es push word [di+33]
pop di
pop es
push es
push di
push cs
call _string_equals
add sp, 8
cmp ax, 0
jne ROTULO875
jmp ROTULO876
ROTULO875:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:115:49 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:115:56 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 45
push word [bp+-6+2]
pop es
mov di, [bp+-6]
es mov ax, [di+45]
jmp ROTULO868
ROTULO876:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:112:38 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-2]
jmp ROTULO869
ROTULO871:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:117:15 ===---
mov ax, _disk
mov [bp+-8], ax
mov ax, 117
mov [bp+-10], ax
mov ax, 5
cs jmp word [_os_trycode]
ROTULO868:
mov sp, bp
pop bp
FIM_disk_getblocksize:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:120:9 ===---
_disk_readblock:
push bp
mov bp, sp
; ARG: d TAM: 4 POS: BP+6 
; ARG: data TAM: 4 POS: BP+10 
; ARG: addresslow TAM: 2 POS: BP+14 
; ARG: addresshigh TAM: 2 POS: BP+16 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:120:19 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:120:34 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:120:56 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:120:78 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:121:9 ===---
; ACAO CHAMADA - Chama indiretamente usando Invoke
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:121:46 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+16]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:121:34 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+14]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:121:28 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+10+2]
pop es
mov di, [bp+10]
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:121:9 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
es call far [di+47]
add sp, 12
ROTULO877:
mov sp, bp
pop bp
FIM_disk_readblock:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:124:9 ===---
_disk_readblockbyname:
push bp
mov bp, sp
sub sp, 6
push cs
call _os_stackcheck
; ARG: name TAM: 4 POS: BP+6 
; ARG: data TAM: 4 POS: BP+10 
; ARG: addresslow TAM: 2 POS: BP+14 
; ARG: addresshigh TAM: 2 POS: BP+16 
; ARG: i TAM: 2 POS: BP--2 
; ARG: d TAM: 4 POS: BP--6 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:124:25 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:124:41 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:124:63 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:124:85 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:125:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:127:17 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:126:38 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:126:38 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-2], 1
ROTULO879:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:126:38 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:126:38 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:126:22 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:126:33 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_disk_disks+2]
pop es
cs mov di, [_disk_disks]
push es
push di
push cs
call _list_count
add sp, 4
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO882
jmp ROTULO883
ROTULO882:
mov ax, 65535
jmp ROTULO884
ROTULO883:
xor ax, ax
ROTULO884:
cmp ax, 0
jne ROTULO880
jmp ROTULO881
ROTULO880:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:128:13 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:128:17 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:128:34 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:128:27 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_disk_disks+2]
pop es
cs mov di, [_disk_disks]
push es
push di
push cs
call _list_item
add sp, 6
push es
pop word [bp+-6+2]
mov [bp+-6], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:129:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:129:16 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:129:38 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:129:30 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - Ponteiro Byte - Desvio 33
push word [bp+-6+2]
pop es
mov di, [bp+-6]
es push word [di+33+2]
es push word [di+33]
pop di
pop es
push es
push di
push cs
call _string_equals
add sp, 8
cmp ax, 0
jne ROTULO885
jmp ROTULO886
ROTULO885:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:130:17 ===---
; ACAO CHAMADA - Chama indiretamente usando Invoke
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:130:54 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+16]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:130:42 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+14]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:130:36 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+10+2]
pop es
mov di, [bp+10]
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:130:17 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-6+2]
pop es
mov di, [bp+-6]
push es
push di
es call far [di+47]
add sp, 12
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:131:17 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:131:22 ===---
xor ax, ax
jmp ROTULO878
ROTULO886:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:126:38 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-2]
jmp ROTULO879
ROTULO881:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:134:15 ===---
mov ax, _disk
mov [bp+-8], ax
mov ax, 134
mov [bp+-10], ax
mov ax, 5
cs jmp word [_os_trycode]
ROTULO878:
mov sp, bp
pop bp
FIM_disk_readblockbyname:
retf
; MODULO FIM: disk
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:167:8 ===---
; MODULO: string
_string:
db 10
db 83,121,115,116,101,109,46,104,99,98
db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:168:21 ===---
_string_length:
push bp
mov bp, sp
sub sp, 2
push cs
call _os_stackcheck
; ARG: text TAM: 4 POS: BP+6 
; ARG: i TAM: 2 POS: BP--2 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:168:28 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:169:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:170:13 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-2], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:172:14 ===---
; ACAO INC - Incrementa variavel
inc word [bp+6]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:173:9 ===---
ROTULO888:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:173:20 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:173:15 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:173:22 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
ja ROTULO891
jmp ROTULO892
ROTULO891:
mov ax, 65535
jmp ROTULO893
ROTULO892:
xor ax, ax
ROTULO893:
cmp ax, 0
jne ROTULO889
jmp ROTULO890
ROTULO889:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:174:17 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-2]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:175:18 ===---
; ACAO INC - Incrementa variavel
inc word [bp+6]
inc di
jmp ROTULO888
ROTULO890:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:177:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:177:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
jmp ROTULO887
ROTULO887:
mov sp, bp
pop bp
FIM_string_length:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:180:21 ===---
_string_equals:
push bp
mov bp, sp
; ARG: txt1 TAM: 4 POS: BP+6 
; ARG: txt2 TAM: 4 POS: BP+10 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:180:28 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:180:50 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:181:10 ===---
; ACAO INC - Incrementa variavel
inc word [bp+6]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:182:10 ===---
; ACAO INC - Incrementa variavel
inc word [bp+10]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:183:9 ===---
ROTULO895:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:183:20 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:183:15 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:183:23 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+10+2]
pop es
mov di, [bp+10]
xor ax, ax
es mov al, [di+0]
mov bx, ax
pop ax
cmp ax, bx
je ROTULO898
jmp ROTULO899
ROTULO898:
mov ax, 65535
jmp ROTULO900
ROTULO899:
xor ax, ax
ROTULO900:
cmp ax, 0
jne ROTULO896
jmp ROTULO897
ROTULO896:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:184:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:184:21 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:184:16 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:184:24 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO903
jmp ROTULO904
ROTULO903:
mov ax, 65535
jmp ROTULO905
ROTULO904:
xor ax, ax
ROTULO905:
cmp ax, 0
jne ROTULO901
jmp ROTULO902
ROTULO901:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:184:31 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:184:38 ===---
mov ax, 1
jmp ROTULO894
ROTULO902:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:185:14 ===---
; ACAO INC - Incrementa variavel
inc word [bp+6]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:186:14 ===---
; ACAO INC - Incrementa variavel
inc word [bp+10]
jmp ROTULO895
ROTULO897:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:188:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:188:16 ===---
xor ax, ax
jmp ROTULO894
ROTULO894:
mov sp, bp
pop bp
FIM_string_equals:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:191:21 ===---
_string_concat:
push bp
mov bp, sp
sub sp, 10
push cs
call _os_stackcheck
; ARG: dest TAM: 4 POS: BP+6 
; ARG: orig TAM: 4 POS: BP+10 
; ARG: dest_len TAM: 2 POS: BP--2 
; ARG: dest_capacity TAM: 2 POS: BP--4 
; ARG: len TAM: 2 POS: BP--6 
; ARG: i TAM: 2 POS: BP--8 
; ARG: tmp TAM: 2 POS: BP--10 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:191:28 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:191:50 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:192:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:193:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:194:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:195:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:196:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:197:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:197:20 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:197:34 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
push cs
call _string_length
add sp, 4
mov [bp+-2], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:198:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:198:25 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
xor ax, ax
es mov al, [di+0]
mov [bp+-4], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:199:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:199:35 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:199:37 ===---
mov ax, 1
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:199:15 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:199:29 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+10+2]
pop es
mov di, [bp+10]
push es
push di
push cs
call _string_length
add sp, 4
pop bx
add ax, bx
mov [bp+-6], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:200:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:200:34 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:200:29 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:200:31 ===---
mov ax, 1
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:200:17 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:200:20 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:200:13 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-6]
pop bx
add ax, bx
pop bx
add ax, bx
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:200:37 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
mov bx, ax
pop ax
cmp ax, bx
ja ROTULO909
jmp ROTULO910
ROTULO909:
mov ax, 65535
jmp ROTULO911
ROTULO910:
xor ax, ax
ROTULO911:
cmp ax, 0
jne ROTULO907
jmp ROTULO908
ROTULO907:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:200:62 ===---
mov ax, _string
mov [bp+-8], ax
mov ax, 200
mov [bp+-10], ax
mov ax, 9
cs jmp word [_os_trycode]
ROTULO908:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:201:10 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:201:27 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:201:29 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:201:23 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:201:25 ===---
mov ax, 1
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:201:18 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
pop bx
add ax, bx
pop bx
add ax, bx
mov [bp+6], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:202:10 ===---
; ACAO INC - Incrementa variavel
inc word [bp+10]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:203:22 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:203:22 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-8], 1
ROTULO912:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:203:22 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:203:22 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-8]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:203:22 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-6]
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO915
jmp ROTULO916
ROTULO915:
mov ax, 65535
jmp ROTULO917
ROTULO916:
xor ax, ax
ROTULO917:
cmp ax, 0
jne ROTULO913
jmp ROTULO914
ROTULO913:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:204:13 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:204:19 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+10+2]
pop es
mov di, [bp+10]
xor ax, ax
es mov al, [di+0]
mov [bp+-10], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:205:13 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:205:20 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-10]
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov [di+0], al
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:206:14 ===---
; ACAO INC - Incrementa variavel
inc word [bp+6]
inc di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:207:14 ===---
; ACAO INC - Incrementa variavel
inc word [bp+10]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:203:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-8]
jmp ROTULO912
ROTULO914:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:209:9 ===---
; ACAO GRAVACAO - Gravacao de numero em ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov byte [di+0], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:210:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:210:16 ===---
mov ax, 1
jmp ROTULO906
ROTULO906:
mov sp, bp
pop bp
FIM_string_concat:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:213:21 ===---
_string_copy:
push bp
mov bp, sp
sub sp, 8
push cs
call _os_stackcheck
; ARG: dest TAM: 4 POS: BP+6 
; ARG: orig TAM: 4 POS: BP+10 
; ARG: dest_capacity TAM: 2 POS: BP--2 
; ARG: orig_len TAM: 2 POS: BP--4 
; ARG: i TAM: 2 POS: BP--6 
; ARG: tmp TAM: 2 POS: BP--8 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:213:26 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:213:48 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:214:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:215:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:216:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:217:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:218:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:218:25 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
xor ax, ax
es mov al, [di+0]
mov [bp+-2], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:219:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:219:40 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:219:42 ===---
mov ax, 1
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:219:20 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:219:34 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+10+2]
pop es
mov di, [bp+10]
push es
push di
push cs
call _string_length
add sp, 4
pop bx
add ax, bx
mov [bp+-4], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:220:10 ===---
; ACAO INC - Incrementa variavel
inc word [bp+6]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:221:10 ===---
; ACAO INC - Incrementa variavel
inc word [bp+10]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:222:9 ===---
; ACAO GRAVACAO - Gravacao de numero em ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov byte [di+0], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:223:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:223:26 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:223:12 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:223:38 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:223:40 ===---
mov ax, 1
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:223:29 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
pop bx
add ax, bx
mov bx, ax
pop ax
cmp ax, bx
jb ROTULO921
jmp ROTULO922
ROTULO921:
mov ax, 65535
jmp ROTULO923
ROTULO922:
xor ax, ax
ROTULO923:
cmp ax, 0
jne ROTULO919
jmp ROTULO920
ROTULO919:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:223:54 ===---
mov ax, _string
mov [bp+-8], ax
mov ax, 223
mov [bp+-10], ax
mov ax, 9
cs jmp word [_os_trycode]
ROTULO920:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:224:22 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:224:22 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-6], 1
ROTULO924:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:224:22 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:224:22 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-6]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:224:22 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO927
jmp ROTULO928
ROTULO927:
mov ax, 65535
jmp ROTULO929
ROTULO928:
xor ax, ax
ROTULO929:
cmp ax, 0
jne ROTULO925
jmp ROTULO926
ROTULO925:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:225:13 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:225:19 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+10+2]
pop es
mov di, [bp+10]
xor ax, ax
es mov al, [di+0]
mov [bp+-8], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:226:13 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:226:20 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-8]
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov [di+0], al
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:227:14 ===---
; ACAO INC - Incrementa variavel
inc word [bp+10]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:228:14 ===---
; ACAO INC - Incrementa variavel
inc word [bp+6]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:224:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-6]
jmp ROTULO924
ROTULO926:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:230:9 ===---
; ACAO GRAVACAO - Gravacao de numero em ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov byte [di+0], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:231:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:231:16 ===---
mov ax, 1
jmp ROTULO918
ROTULO918:
mov sp, bp
pop bp
FIM_string_copy:
retf
; MODULO FIM: string
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:32:8 ===---
; MODULO: filesystem
_filesystem:
db 24
db 83,121,115,116,101,109,46,73,79,46,70,105,108,101,83,121,115,116,101,109,46,104,99,98
db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:33:9 ===---
_filesystem_fslist:
times 16 db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:34:9 ===---
_filesystem_mountlist:
times 16 db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:35:9 ===---
_filesystem_root:
times 149 db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:36:9 ===---
_filesystem_rootismounted:
times 2 db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:38:16 ===---
_filesystem_initialize:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:39:9 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_filesystem_rootismounted], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:40:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:40:33 ===---
; ACAO CHAMADA - Calcula tamanho de item
mov ax, 45
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:40:25 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_filesystem_fslist+2]
pop es
cs mov di, [_filesystem_fslist]
push es
push di
push cs
call _list_initialize
add sp, 6
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:41:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:41:36 ===---
; ACAO CHAMADA - Calcula tamanho de item
mov ax, 145
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:41:25 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_filesystem_mountlist+2]
pop es
cs mov di, [_filesystem_mountlist]
push es
push di
push cs
call _list_initialize
add sp, 6
ROTULO930:
FIM_filesystem_initialize:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:44:16 ===---
_filesystem_getroot:
push bp
mov bp, sp
; ARG: output TAM: 4 POS: BP+6 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:44:24 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:45:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:45:26 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:45:12 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_filesystem_rootismounted]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:45:29 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO934
jmp ROTULO935
ROTULO934:
mov ax, 65535
jmp ROTULO936
ROTULO935:
xor ax, ax
ROTULO936:
cmp ax, 0
jne ROTULO932
jmp ROTULO933
ROTULO932:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:45:42 ===---
mov ax, _filesystem
mov [bp+-8], ax
mov ax, 45
mov [bp+-10], ax
mov ax, 5
cs jmp word [_os_trycode]
ROTULO933:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:46:9 ===---
; ACAO CHAMADA - Chama indiretamente usando Invoke
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:46:29 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:46:9 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_filesystem_root+2]
pop es
cs mov di, [_filesystem_root]
push es
push di
es call far [di+141]
add sp, 8
ROTULO931:
mov sp, bp
pop bp
FIM_filesystem_getroot:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:49:21 ===---
_filesystem_getdirectoryinfo:
push bp
mov bp, sp
; ARG: parent TAM: 4 POS: BP+6 
; ARG: position TAM: 2 POS: BP+10 
; ARG: output TAM: 4 POS: BP+12 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:49:38 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:49:63 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:49:83 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:50:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:50:16 ===---
; ACAO CHAMADA - Chama indiretamente usando Invoke
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:50:57 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+12+2]
pop es
mov di, [bp+12]
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:50:47 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:50:16 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
es call far [di+47]
add sp, 10
jmp ROTULO937
ROTULO937:
mov sp, bp
pop bp
FIM_filesystem_getdirectoryinfo:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:53:21 ===---
_filesystem_getfileinfo:
push bp
mov bp, sp
; ARG: parent TAM: 4 POS: BP+6 
; ARG: position TAM: 2 POS: BP+10 
; ARG: output TAM: 4 POS: BP+12 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:53:33 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:53:58 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:53:78 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:54:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:54:16 ===---
; ACAO CHAMADA - Chama indiretamente usando Invoke
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:54:52 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+12+2]
pop es
mov di, [bp+12]
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:54:42 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:54:16 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
es call far [di+43]
add sp, 10
jmp ROTULO938
ROTULO938:
mov sp, bp
pop bp
FIM_filesystem_getfileinfo:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:57:14 ===---
_filesystem_exist:
push bp
mov bp, sp
sub sp, 6
push cs
call _os_stackcheck
; ARG: name TAM: 4 POS: BP+6 
; ARG: i TAM: 2 POS: BP--2 
; ARG: fs TAM: 4 POS: BP--6 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:57:20 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:58:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:60:17 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:59:39 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:59:39 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-2], 1
ROTULO940:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:59:39 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:59:39 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:59:22 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:59:33 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_filesystem_fslist+2]
pop es
cs mov di, [_filesystem_fslist]
push es
push di
push cs
call _list_count
add sp, 4
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO943
jmp ROTULO944
ROTULO943:
mov ax, 65535
jmp ROTULO945
ROTULO944:
xor ax, ax
ROTULO945:
cmp ax, 0
jne ROTULO941
jmp ROTULO942
ROTULO941:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:61:13 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:61:18 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:61:36 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:61:28 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_filesystem_fslist+2]
pop es
cs mov di, [_filesystem_fslist]
push es
push di
push cs
call _list_item
add sp, 6
push es
pop word [bp+-6+2]
mov [bp+-6], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:62:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:62:16 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:62:39 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:62:30 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - Ponteiro Byte - Desvio 33
push word [bp+-6+2]
pop es
mov di, [bp+-6]
es push word [di+33+2]
es push word [di+33]
pop di
pop es
push es
push di
push cs
call _string_equals
add sp, 8
cmp ax, 0
jne ROTULO946
jmp ROTULO947
ROTULO946:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:63:17 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:63:24 ===---
mov ax, 65535
jmp ROTULO939
ROTULO947:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:59:39 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-2]
jmp ROTULO940
ROTULO942:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:66:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:66:16 ===---
xor ax, ax
jmp ROTULO939
ROTULO939:
mov sp, bp
pop bp
FIM_filesystem_exist:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:69:14 ===---
_filesystem_item:
push bp
mov bp, sp
sub sp, 6
push cs
call _os_stackcheck
; ARG: name TAM: 4 POS: BP+6 
; ARG: i TAM: 2 POS: BP--2 
; ARG: fs TAM: 4 POS: BP--6 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:69:19 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:70:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:72:17 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:71:39 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:71:39 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-2], 1
ROTULO949:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:71:39 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:71:39 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:71:22 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:71:33 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_filesystem_fslist+2]
pop es
cs mov di, [_filesystem_fslist]
push es
push di
push cs
call _list_count
add sp, 4
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO952
jmp ROTULO953
ROTULO952:
mov ax, 65535
jmp ROTULO954
ROTULO953:
xor ax, ax
ROTULO954:
cmp ax, 0
jne ROTULO950
jmp ROTULO951
ROTULO950:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:73:13 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:73:18 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:73:36 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:73:28 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_filesystem_fslist+2]
pop es
cs mov di, [_filesystem_fslist]
push es
push di
push cs
call _list_item
add sp, 6
push es
pop word [bp+-6+2]
mov [bp+-6], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:74:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:74:16 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:74:39 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:74:30 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - Ponteiro Byte - Desvio 33
push word [bp+-6+2]
pop es
mov di, [bp+-6]
es push word [di+33+2]
es push word [di+33]
pop di
pop es
push es
push di
push cs
call _string_equals
add sp, 8
cmp ax, 0
jne ROTULO955
jmp ROTULO956
ROTULO955:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:74:50 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:74:57 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-6+2]
pop es
mov di, [bp+-6]
jmp ROTULO948
ROTULO956:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:71:39 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-2]
jmp ROTULO949
ROTULO951:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:76:15 ===---
mov ax, _filesystem
mov [bp+-8], ax
mov ax, 76
mov [bp+-10], ax
mov ax, 5
cs jmp word [_os_trycode]
ROTULO948:
mov sp, bp
pop bp
FIM_filesystem_item:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:79:14 ===---
_filesystem_count:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:80:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:80:16 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:80:27 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_filesystem_fslist+2]
pop es
cs mov di, [_filesystem_fslist]
push es
push di
push cs
call _list_count
add sp, 4
jmp ROTULO957
ROTULO957:
FIM_filesystem_count:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:83:21 ===---
_filesystem_registernew:
push bp
mov bp, sp
sub sp, 8
push cs
call _os_stackcheck
; ARG: name TAM: 4 POS: BP+6 
; ARG: ret TAM: 4 POS: BP--4 
; ARG: ptr TAM: 4 POS: BP--8 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:83:33 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:84:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:85:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:86:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:86:15 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:86:24 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_filesystem_fslist+2]
pop es
cs mov di, [_filesystem_fslist]
push es
push di
push cs
call _list_add
add sp, 4
push es
pop word [bp+-8+2]
mov [bp+-8], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:87:10 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO GRAVACAO - Grava segmento em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:87:17 ===---
; ACAO LEITURA - Le segmento em variavel
mov ax, [bp+-8+2]
mov word [bp+-4+2], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:88:10 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:88:17 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-8]
mov [bp+-4], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:89:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:89:20 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-4+2]
pop es
mov di, [bp+-4]
push es
push di
es pop word [di+33]
es pop word [di+33+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:90:9 ===---
; ACAO GRAVACAO - Gravacao de numero em ponteiro
push word [bp+-8+2]
pop es
mov di, [bp+-8]
es mov byte [di+0], 32
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:91:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:91:31 ===---
push cs
pop es
mov di, ROTULO960
jmp ROTULO959
ROTULO960:
db 0
times 1 db 0
ROTULO959:
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:91:21 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - Ponteiro Byte - Desvio 33
push word [bp+-4+2]
pop es
mov di, [bp+-4]
es push word [di+33+2]
es push word [di+33]
pop di
pop es
push es
push di
push cs
call _string_copy
add sp, 8
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:92:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:92:31 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:92:21 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - Ponteiro Byte - Desvio 33
push word [bp+-4+2]
pop es
mov di, [bp+-4]
es push word [di+33+2]
es push word [di+33]
pop di
pop es
push es
push di
push cs
call _string_copy
add sp, 8
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:93:10 ===---
; ACAO GRAVACAO - Grava segmento em variavel
mov word [bp+-8+2], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:94:10 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-8], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:95:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:95:21 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-8+2]
pop es
mov di, [bp+-8]
push es
push di
push word [bp+-4+2]
pop es
mov di, [bp+-4]
es pop word [di+37]
es pop word [di+37+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:96:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:96:27 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-8+2]
pop es
mov di, [bp+-8]
push es
push di
push word [bp+-4+2]
pop es
mov di, [bp+-4]
es pop word [di+41]
es pop word [di+41+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:97:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:97:16 ===---
; ACAO LEITURA - Le ponteiro
jmp ROTULO958
ROTULO958:
mov sp, bp
pop bp
FIM_filesystem_registernew:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:100:16 ===---
_filesystem_mount:
push bp
mov bp, sp
sub sp, 16
push cs
call _os_stackcheck
; ARG: diskname TAM: 4 POS: BP+6 
; ARG: fsname TAM: 4 POS: BP+10 
; ARG: mountpoint TAM: 4 POS: BP+14 
; ARG: d TAM: 4 POS: BP--4 
; ARG: fs TAM: 4 POS: BP--8 
; ARG: mount TAM: 4 POS: BP--12 
; ARG: txt TAM: 4 POS: BP--16 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:100:22 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:100:42 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:100:60 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:101:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:102:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:103:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:104:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:105:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:105:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:105:23 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
push cs
call _disk_item
add sp, 4
push es
pop word [bp+-4+2]
mov [bp+-4], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:106:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:106:14 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:106:19 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+10+2]
pop es
mov di, [bp+10]
push es
push di
push cs
call _filesystem_item
add sp, 4
push es
pop word [bp+-8+2]
mov [bp+-8], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:107:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:107:28 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:107:13 ===---
; ACAO STRUCTURE - Leitura de Segmento de Ponteiro
es mov ax, [di+43]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:107:31 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO964
jmp ROTULO965
ROTULO964:
mov ax, 65535
jmp ROTULO966
ROTULO965:
xor ax, ax
ROTULO966:
cmp ax, 0
jne ROTULO962
jmp ROTULO963
ROTULO962:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:107:44 ===---
mov ax, _filesystem
mov [bp+-8], ax
mov ax, 107
mov [bp+-10], ax
mov ax, 7
cs jmp word [_os_trycode]
ROTULO963:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:108:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:108:22 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:108:13 ===---
; ACAO STRUCTURE - Leitura de Segmento de Ponteiro
push word [bp+-8+2]
pop es
mov di, [bp+-8]
es mov ax, [di+39]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:108:25 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO969
jmp ROTULO970
ROTULO969:
mov ax, 65535
jmp ROTULO971
ROTULO970:
xor ax, ax
ROTULO971:
cmp ax, 0
jne ROTULO967
jmp ROTULO968
ROTULO967:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:108:38 ===---
mov ax, _filesystem
mov [bp+-8], ax
mov ax, 108
mov [bp+-10], ax
mov ax, 7
cs jmp word [_os_trycode]
ROTULO968:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:109:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:109:37 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:109:12 ===---
; ACAO CHAMADA - Chama indiretamente usando Invoke
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:109:34 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-4+2]
pop es
mov di, [bp+-4]
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:109:12 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-8+2]
pop es
mov di, [bp+-8]
push es
push di
es call far [di+41]
add sp, 8
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:109:40 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO974
jmp ROTULO975
ROTULO974:
mov ax, 65535
jmp ROTULO976
ROTULO975:
xor ax, ax
ROTULO976:
cmp ax, 0
jne ROTULO972
jmp ROTULO973
ROTULO972:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:109:53 ===---
mov ax, _filesystem
mov [bp+-8], ax
mov ax, 109
mov [bp+-10], ax
mov ax, 12
cs jmp word [_os_trycode]
ROTULO973:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:110:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:110:12 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:110:38 ===---
push cs
pop es
mov di, ROTULO980
jmp ROTULO979
ROTULO980:
db 1
db 47
times 1 db 0
ROTULO979:
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:110:26 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+14+2]
pop es
mov di, [bp+14]
push es
push di
push cs
call _string_equals
add sp, 8
cmp ax, 0
jne ROTULO977
jmp ROTULO978
ROTULO977:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:111:13 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_filesystem_rootismounted], 65535
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:112:13 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:112:21 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_filesystem_root+2]
pop es
cs mov di, [_filesystem_root]
push es
pop word [bp+-12+2]
mov [bp+-12], di
jmp ROTULO981
ROTULO978:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:114:13 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:114:21 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:114:30 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_filesystem_mountlist+2]
pop es
cs mov di, [_filesystem_mountlist]
push es
push di
push cs
call _list_add
add sp, 4
push es
pop word [bp+-12+2]
mov [bp+-12], di
ROTULO981:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:116:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:116:28 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-12+2]
pop es
mov di, [bp+-12]
push es
push di
es pop word [di+97]
es pop word [di+97+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:117:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:117:15 ===---
; ACAO LEITURA - Le ponteiro
push es
pop word [bp+-16+2]
mov [bp+-16], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:118:9 ===---
; ACAO GRAVACAO - Gravacao de numero em ponteiro
es mov byte [di+0], 96
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:119:10 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-16]
inc di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:120:9 ===---
; ACAO GRAVACAO - Gravacao de numero em ponteiro
push word [bp+-16+2]
pop es
mov di, [bp+-16]
es mov byte [di+0], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:121:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:121:39 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+14+2]
pop es
mov di, [bp+14]
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:121:21 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - Ponteiro Byte - Desvio 97
push word [bp+-12+2]
pop es
mov di, [bp+-12]
es push word [di+97+2]
es push word [di+97]
pop di
pop es
push es
push di
push cs
call _string_copy
add sp, 8
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:122:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:122:28 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-8+2]
pop es
mov di, [bp+-8]
push es
push di
push word [bp+-12+2]
pop es
mov di, [bp+-12]
es pop word [di+101]
es pop word [di+101+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:123:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:123:26 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-4+2]
pop es
mov di, [bp+-4]
push es
push di
push word [bp+-12+2]
pop es
mov di, [bp+-12]
es pop word [di+105]
es pop word [di+105+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:124:9 ===---
; ACAO CHAMADA - Chama indiretamente usando Invoke
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:124:25 ===---
; ACAO LEITURA - Le ponteiro
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:124:9 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-8+2]
pop es
mov di, [bp+-8]
push es
push di
es call far [di+37]
add sp, 8
ROTULO961:
mov sp, bp
pop bp
FIM_filesystem_mount:
retf
; MODULO FIM: filesystem
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/ConfigDefault.hcb:8:8 ===---
; MODULO: configdefault
_configdefault:
db 17
db 67,111,110,102,105,103,68,101,102,97,117,108,116,46,104,99,98
db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/ConfigDefault.hcb:10:16 ===---
_configdefault_initialize:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/ConfigDefault.hcb:11:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _biosdisk_initialize
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/ConfigDefault.hcb:12:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _minixfs_initialize
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/ConfigDefault.hcb:13:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/ConfigDefault.hcb:13:44 ===---
push cs
pop es
mov di, ROTULO984
jmp ROTULO983
ROTULO984:
db 7
db 77,105,110,105,120,70,83
times 1 db 0
ROTULO983:
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/ConfigDefault.hcb:13:21 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_config_rootfilesystem+2]
pop es
cs mov di, [_config_rootfilesystem]
push es
push di
push cs
call _string_copy
add sp, 8
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/ConfigDefault.hcb:14:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/ConfigDefault.hcb:14:38 ===---
push cs
pop es
mov di, ROTULO986
jmp ROTULO985
ROTULO986:
db 11
db 66,73,79,83,68,105,115,107,48,48,48
times 1 db 0
ROTULO985:
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/ConfigDefault.hcb:14:21 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_config_rootdisk+2]
pop es
cs mov di, [_config_rootdisk]
push es
push di
push cs
call _string_copy
add sp, 8
ROTULO982:
FIM_configdefault_initialize:
retf
; MODULO FIM: configdefault
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:6:8 ===---
; MODULO: biosdisk
_biosdisk:
db 12
db 66,73,79,83,68,105,115,107,46,104,99,98
db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:7:17 ===---
_biosdisk_floppya:
times 4 db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:8:17 ===---
_biosdisk_floppyb:
times 4 db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:9:9 ===---
_biosdisk_buffer:
times 516 db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:10:9 ===---
_biosdisk_inuse:
times 8 db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:12:16 ===---
_biosdisk_initialize:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:13:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:13:37 ===---
mov ax, 1
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:13:30 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_biosdisk_inuse+2]
pop es
cs mov di, [_biosdisk_inuse]
push es
push di
push cs
call _semaphore_initialize
add sp, 6
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:14:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:14:20 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:14:65 ===---
mov ax, 512
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:14:62 ===---
mov ax, 9
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:14:59 ===---
mov ax, 2
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:14:55 ===---
mov ax, 40
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:14:52 ===---
xor ax, ax
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:14:37 ===---
push cs
pop es
mov di, ROTULO989
jmp ROTULO988
ROTULO989:
db 11
db 66,73,79,83,68,105,115,107,48,48,48
times 1 db 0
ROTULO988:
push es
push di
push cs
call _disk_registernew
add sp, 14
push es
cs pop word [_biosdisk_floppya+2]
cs mov [_biosdisk_floppya], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:15:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:15:29 ===---
push cs
pop es
mov di, _biosdisk_readblock
push es
push di
cs push word [_biosdisk_floppya+2]
pop es
cs mov di, [_biosdisk_floppya]
es pop word [di+47]
es pop word [di+47+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:16:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:16:30 ===---
push cs
pop es
mov di, _biosdisk_writeblock
push es
push di
cs push word [_biosdisk_floppya+2]
pop es
cs mov di, [_biosdisk_floppya]
es pop word [di+51]
es pop word [di+51+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:17:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:17:20 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:17:65 ===---
mov ax, 512
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:17:62 ===---
mov ax, 9
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:17:59 ===---
mov ax, 2
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:17:55 ===---
mov ax, 40
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:17:52 ===---
mov ax, 1
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:17:37 ===---
push cs
pop es
mov di, ROTULO991
jmp ROTULO990
ROTULO991:
db 11
db 66,73,79,83,68,105,115,107,48,48,49
times 1 db 0
ROTULO990:
push es
push di
push cs
call _disk_registernew
add sp, 14
push es
cs pop word [_biosdisk_floppyb+2]
cs mov [_biosdisk_floppyb], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:18:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:18:29 ===---
push cs
pop es
mov di, _biosdisk_readblock
push es
push di
cs push word [_biosdisk_floppyb+2]
pop es
cs mov di, [_biosdisk_floppyb]
es pop word [di+47]
es pop word [di+47+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:19:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:19:30 ===---
push cs
pop es
mov di, _biosdisk_writeblock
push es
push di
cs push word [_biosdisk_floppyb+2]
pop es
cs mov di, [_biosdisk_floppyb]
es pop word [di+51]
es pop word [di+51+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
ROTULO987:
FIM_biosdisk_initialize:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:22:14 ===---
_biosdisk_callbios:
push bp
mov bp, sp
; ARG: ax TAM: 2 POS: BP+6 
; ARG: bx TAM: 2 POS: BP+8 
; ARG: cx TAM: 2 POS: BP+10 
; ARG: dx TAM: 2 POS: BP+12 
; ARG: es TAM: 2 POS: BP+14 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:22:23 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:22:37 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:22:51 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:22:65 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:22:79 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:23:13 ===---
push bp
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:24:13 ===---
mov ax, [bp+6]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:25:13 ===---
mov bx, [bp+8]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:26:13 ===---
mov cx, [bp+10]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:27:13 ===---
mov dx, [bp+12]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:28:13 ===---
push word [bp+14]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:29:13 ===---
pop es
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:30:13 ===---
int 0x13
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:31:13 ===---
jnc .ok
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:32:13 ===---
neg ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:33:13 ===---
.ok:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:34:13 ===---
pop bp
ROTULO992:
mov sp, bp
pop bp
FIM_biosdisk_callbios:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:37:9 ===---
_biosdisk_updatesize:
push bp
mov bp, sp
sub sp, 6
push cs
call _os_stackcheck
; ARG: disk TAM: 4 POS: BP+6 
; ARG: ptr TAM: 4 POS: BP--4 
; ARG: value TAM: 2 POS: BP--6 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:37:20 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:38:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:39:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:40:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:40:28 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:40:12 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 37
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+37]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:40:31 ===---
mov ax, 1
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO996
jmp ROTULO997
ROTULO996:
mov ax, 65535
jmp ROTULO998
ROTULO997:
xor ax, ax
ROTULO998:
cmp ax, 0
jne ROTULO994
jmp ROTULO995
ROTULO994:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:42:14 ===---
; ACAO GRAVACAO - Grava segmento em variavel
mov word [bp+-4+2], 64
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:43:14 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-4], 144
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:44:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:44:32 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:44:16 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 37
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+37]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:44:35 ===---
mov ax, 1
mov bx, ax
pop ax
cmp ax, bx
je ROTULO1001
jmp ROTULO1002
ROTULO1001:
mov ax, 65535
jmp ROTULO1003
ROTULO1002:
xor ax, ax
ROTULO1003:
cmp ax, 0
jne ROTULO999
jmp ROTULO1000
ROTULO999:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:44:43 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-4]
ROTULO1000:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:45:13 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:45:25 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:45:21 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-4+2]
pop es
mov di, [bp+-4]
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:45:29 ===---
mov ax, 7
mov bx, ax
pop ax
and ax, bx
mov [bp+-6], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:46:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:46:69 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:46:49 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:46:29 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:46:23 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:46:17 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-6]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:46:26 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO1018
jmp ROTULO1019
ROTULO1018:
mov ax, 65535
jmp ROTULO1020
ROTULO1019:
xor ax, ax
ROTULO1020:
cmp ax, 0
jne ROTULO1015
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:46:43 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:46:37 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-6]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:46:46 ===---
mov ax, 4
mov bx, ax
pop ax
cmp ax, bx
je ROTULO1021
jmp ROTULO1022
ROTULO1021:
mov ax, 65535
jmp ROTULO1023
ROTULO1022:
xor ax, ax
ROTULO1023:
cmp ax, 0
je ROTULO1016
ROTULO1015:
mov ax, 65535
jmp ROTULO1017
ROTULO1016:
xor ax, ax
ROTULO1017:
cmp ax, 0
jne ROTULO1012
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:46:63 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:46:57 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-6]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:46:66 ===---
mov ax, 1
mov bx, ax
pop ax
cmp ax, bx
je ROTULO1024
jmp ROTULO1025
ROTULO1024:
mov ax, 65535
jmp ROTULO1026
ROTULO1025:
xor ax, ax
ROTULO1026:
cmp ax, 0
je ROTULO1013
ROTULO1012:
mov ax, 65535
jmp ROTULO1014
ROTULO1013:
xor ax, ax
ROTULO1014:
cmp ax, 0
jne ROTULO1009
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:46:83 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:46:77 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-6]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:46:86 ===---
mov ax, 3
mov bx, ax
pop ax
cmp ax, bx
je ROTULO1027
jmp ROTULO1028
ROTULO1027:
mov ax, 65535
jmp ROTULO1029
ROTULO1028:
xor ax, ax
ROTULO1029:
cmp ax, 0
je ROTULO1010
ROTULO1009:
mov ax, 65535
jmp ROTULO1011
ROTULO1010:
xor ax, ax
ROTULO1011:
cmp ax, 0
jne ROTULO1007
jmp ROTULO1008
ROTULO1007:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:47:17 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:47:34 ===---
mov ax, 40
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov [di+39], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:48:17 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:48:32 ===---
mov ax, 9
es mov [di+43], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
ROTULO1008:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:50:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:50:29 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:50:23 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:50:17 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-6]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:50:26 ===---
mov ax, 2
mov bx, ax
pop ax
cmp ax, bx
je ROTULO1035
jmp ROTULO1036
ROTULO1035:
mov ax, 65535
jmp ROTULO1037
ROTULO1036:
xor ax, ax
ROTULO1037:
cmp ax, 0
jne ROTULO1032
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:50:43 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:50:37 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-6]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:50:46 ===---
mov ax, 5
mov bx, ax
pop ax
cmp ax, bx
je ROTULO1038
jmp ROTULO1039
ROTULO1038:
mov ax, 65535
jmp ROTULO1040
ROTULO1039:
xor ax, ax
ROTULO1040:
cmp ax, 0
je ROTULO1033
ROTULO1032:
mov ax, 65535
jmp ROTULO1034
ROTULO1033:
xor ax, ax
ROTULO1034:
cmp ax, 0
jne ROTULO1030
jmp ROTULO1031
ROTULO1030:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:51:17 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:51:34 ===---
mov ax, 80
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov [di+39], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:52:17 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:52:32 ===---
mov ax, 15
es mov [di+43], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
ROTULO1031:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:54:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:54:23 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:54:17 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-6]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:54:26 ===---
mov ax, 7
mov bx, ax
pop ax
cmp ax, bx
je ROTULO1043
jmp ROTULO1044
ROTULO1043:
mov ax, 65535
jmp ROTULO1045
ROTULO1044:
xor ax, ax
ROTULO1045:
cmp ax, 0
jne ROTULO1041
jmp ROTULO1042
ROTULO1041:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:55:17 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:55:34 ===---
mov ax, 80
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov [di+39], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:56:17 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:56:32 ===---
mov ax, 18
es mov [di+43], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
ROTULO1042:
ROTULO995:
ROTULO993:
mov sp, bp
pop bp
FIM_biosdisk_updatesize:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:61:9 ===---
_biosdisk_readblock:
push bp
mov bp, sp
sub sp, 8
push cs
call _os_stackcheck
; ARG: disk TAM: 4 POS: BP+6 
; ARG: block TAM: 4 POS: BP+10 
; ARG: positionlow TAM: 2 POS: BP+14 
; ARG: positionhigh TAM: 2 POS: BP+16 
; ARG: chs TAM: 4 POS: BP--4 
; ARG: ret TAM: 2 POS: BP--6 
; ARG: i TAM: 2 POS: BP--8 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:61:19 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:61:37 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:61:60 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:61:83 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:62:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:66:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:68:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:63:9 ===---
; ACAO STRUCTURE - Aloca estrutura na pilha
sub sp, 6
push ss
pop es
mov di, sp
push es
pop word [bp+-4+2]
mov [bp+-4], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:64:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:64:20 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
push cs
call _biosdisk_updatesize
add sp, 4
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:65:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:65:51 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+16]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:65:38 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+14]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:65:32 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:65:27 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-4+2]
pop es
mov di, [bp+-4]
push es
push di
push cs
call _disk_converttochs
add sp, 12
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:67:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:67:27 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_biosdisk_inuse+2]
pop es
cs mov di, [_biosdisk_inuse]
push es
push di
push cs
call _semaphore_waitone
add sp, 4
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:69:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:69:15 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:69:16 ===---
mov ax, 1
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:69:15 ===---
xor ax, ax
pop bx
sub ax, bx
mov [bp+-6], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:70:9 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-8], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:71:9 ===---
ROTULO1047:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:71:24 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:71:18 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:71:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-8]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:71:21 ===---
mov ax, 3
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO1053
jmp ROTULO1054
ROTULO1053:
mov ax, 65535
jmp ROTULO1055
ROTULO1054:
xor ax, ax
ROTULO1055:
cmp ax, 0
je ROTULO1051
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:71:36 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:71:32 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-6]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:71:38 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
jl ROTULO1056
jmp ROTULO1057
ROTULO1056:
mov ax, 65535
jmp ROTULO1058
ROTULO1057:
xor ax, ax
ROTULO1058:
cmp ax, 0
je ROTULO1051
ROTULO1050:
mov ax, 65535
jmp ROTULO1052
ROTULO1051:
xor ax, ax
ROTULO1052:
cmp ax, 0
jne ROTULO1048
jmp ROTULO1049
ROTULO1048:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:72:13 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _thread_yield
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:73:13 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _multithreading_suspend
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:74:13 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:74:19 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:74:118 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO LEITURA - Le segmento em variavel
cs mov ax, [_biosdisk_buffer+2]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:74:98 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:74:100 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 37
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+37]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:74:91 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:74:82 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 2
push word [bp+-4+2]
pop es
mov di, [bp+-4]
es mov ax, [di+2]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:74:95 ===---
mov ax, 8
mov cx, ax
pop ax
shl ax, cl
pop bx
add ax, bx
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:74:65 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:74:68 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 4
es mov ax, [di+4]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:74:58 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:74:45 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 0
es mov ax, [di+0]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:74:62 ===---
mov ax, 8
mov cx, ax
pop ax
shl ax, cl
pop bx
add ax, bx
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:74:36 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO LEITURA - Le variavel
cs mov ax, [_biosdisk_buffer]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:74:28 ===---
mov ax, 513
push ax
push cs
call _biosdisk_callbios
add sp, 10
mov [bp+-6], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:75:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:75:20 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:75:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-6]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:75:22 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
jl ROTULO1061
jmp ROTULO1062
ROTULO1061:
mov ax, 65535
jmp ROTULO1063
ROTULO1062:
xor ax, ax
ROTULO1063:
cmp ax, 0
jne ROTULO1059
jmp ROTULO1060
ROTULO1059:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:75:29 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:75:62 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO LEITURA - Le segmento em variavel
cs mov ax, [_biosdisk_buffer+2]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:75:44 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 37
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+37]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:75:42 ===---
xor ax, ax
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:75:40 ===---
xor ax, ax
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:75:38 ===---
xor ax, ax
push ax
push cs
call _biosdisk_callbios
add sp, 10
ROTULO1060:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:76:13 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _multithreading_resume
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:77:13 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _thread_yield
jmp ROTULO1047
ROTULO1049:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:79:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:79:27 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_biosdisk_inuse+2]
pop es
cs mov di, [_biosdisk_inuse]
push es
push di
push cs
call _semaphore_release
add sp, 4
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:80:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:80:16 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:80:12 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-6]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:80:19 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:80:20 ===---
mov ax, 3
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:80:19 ===---
xor ax, ax
pop bx
sub ax, bx
mov bx, ax
pop ax
cmp ax, bx
je ROTULO1066
jmp ROTULO1067
ROTULO1066:
mov ax, 65535
jmp ROTULO1068
ROTULO1067:
xor ax, ax
ROTULO1068:
cmp ax, 0
jne ROTULO1064
jmp ROTULO1065
ROTULO1064:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:80:33 ===---
mov ax, _biosdisk
mov [bp+-8], ax
mov ax, 80
mov [bp+-10], ax
mov ax, 13
cs jmp word [_os_trycode]
ROTULO1065:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:81:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:81:16 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:81:12 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-6]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:81:18 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
jl ROTULO1071
jmp ROTULO1072
ROTULO1071:
mov ax, 65535
jmp ROTULO1073
ROTULO1072:
xor ax, ax
ROTULO1073:
cmp ax, 0
jne ROTULO1069
jmp ROTULO1070
ROTULO1069:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:81:31 ===---
mov ax, _biosdisk
mov [bp+-8], ax
mov ax, 81
mov [bp+-10], ax
mov ax, 12
cs jmp word [_os_trycode]
ROTULO1070:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:82:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:82:36 ===---
mov ax, 512
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:82:28 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_biosdisk_buffer+2]
pop es
cs mov di, [_biosdisk_buffer]
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:82:21 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+10+2]
pop es
mov di, [bp+10]
push es
push di
push cs
call _memory_copy
add sp, 10
ROTULO1046:
mov sp, bp
pop bp
FIM_biosdisk_readblock:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:85:9 ===---
_biosdisk_writeblock:
push bp
mov bp, sp
sub sp, 8
push cs
call _os_stackcheck
; ARG: disk TAM: 4 POS: BP+6 
; ARG: block TAM: 4 POS: BP+10 
; ARG: positionlow TAM: 2 POS: BP+14 
; ARG: positionhigh TAM: 2 POS: BP+16 
; ARG: chs TAM: 4 POS: BP--4 
; ARG: ret TAM: 2 POS: BP--6 
; ARG: i TAM: 2 POS: BP--8 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:85:20 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:85:38 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:85:61 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:85:84 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:86:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:90:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:92:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:87:9 ===---
; ACAO STRUCTURE - Aloca estrutura na pilha
sub sp, 6
push ss
pop es
mov di, sp
push es
pop word [bp+-4+2]
mov [bp+-4], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:88:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:88:20 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
push cs
call _biosdisk_updatesize
add sp, 4
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:89:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:89:51 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+16]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:89:38 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+14]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:89:32 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:89:27 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-4+2]
pop es
mov di, [bp+-4]
push es
push di
push cs
call _disk_converttochs
add sp, 12
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:91:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:91:27 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_biosdisk_inuse+2]
pop es
cs mov di, [_biosdisk_inuse]
push es
push di
push cs
call _semaphore_waitone
add sp, 4
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:93:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:93:15 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:93:16 ===---
mov ax, 1
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:93:15 ===---
xor ax, ax
pop bx
sub ax, bx
mov [bp+-6], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:94:9 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-8], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:95:9 ===---
ROTULO1075:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:95:24 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:95:18 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:95:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-8]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:95:21 ===---
mov ax, 3
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO1081
jmp ROTULO1082
ROTULO1081:
mov ax, 65535
jmp ROTULO1083
ROTULO1082:
xor ax, ax
ROTULO1083:
cmp ax, 0
je ROTULO1079
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:95:36 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:95:32 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-6]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:95:38 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
jl ROTULO1084
jmp ROTULO1085
ROTULO1084:
mov ax, 65535
jmp ROTULO1086
ROTULO1085:
xor ax, ax
ROTULO1086:
cmp ax, 0
je ROTULO1079
ROTULO1078:
mov ax, 65535
jmp ROTULO1080
ROTULO1079:
xor ax, ax
ROTULO1080:
cmp ax, 0
jne ROTULO1076
jmp ROTULO1077
ROTULO1076:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:96:13 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _thread_yield
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:97:13 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _multithreading_suspend
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:98:13 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:98:19 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:98:118 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO LEITURA - Le segmento em variavel
cs mov ax, [_biosdisk_buffer+2]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:98:98 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:98:100 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 37
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+37]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:98:91 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:98:82 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 2
push word [bp+-4+2]
pop es
mov di, [bp+-4]
es mov ax, [di+2]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:98:95 ===---
mov ax, 8
mov cx, ax
pop ax
shl ax, cl
pop bx
add ax, bx
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:98:65 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:98:68 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 4
es mov ax, [di+4]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:98:58 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:98:45 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 0
es mov ax, [di+0]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:98:62 ===---
mov ax, 8
mov cx, ax
pop ax
shl ax, cl
pop bx
add ax, bx
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:98:36 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO LEITURA - Le variavel
cs mov ax, [_biosdisk_buffer]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:98:28 ===---
mov ax, 769
push ax
push cs
call _biosdisk_callbios
add sp, 10
mov [bp+-6], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:99:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:99:20 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:99:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-6]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:99:22 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
jl ROTULO1089
jmp ROTULO1090
ROTULO1089:
mov ax, 65535
jmp ROTULO1091
ROTULO1090:
xor ax, ax
ROTULO1091:
cmp ax, 0
jne ROTULO1087
jmp ROTULO1088
ROTULO1087:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:99:29 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:99:62 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO LEITURA - Le segmento em variavel
cs mov ax, [_biosdisk_buffer+2]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:99:44 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 37
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+37]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:99:42 ===---
xor ax, ax
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:99:40 ===---
xor ax, ax
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:99:38 ===---
xor ax, ax
push ax
push cs
call _biosdisk_callbios
add sp, 10
ROTULO1088:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:100:13 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _multithreading_resume
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:101:13 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _thread_yield
jmp ROTULO1075
ROTULO1077:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:103:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:103:27 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_biosdisk_inuse+2]
pop es
cs mov di, [_biosdisk_inuse]
push es
push di
push cs
call _semaphore_release
add sp, 4
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:104:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:104:16 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:104:12 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-6]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:104:19 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:104:20 ===---
mov ax, 3
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:104:19 ===---
xor ax, ax
pop bx
sub ax, bx
mov bx, ax
pop ax
cmp ax, bx
je ROTULO1094
jmp ROTULO1095
ROTULO1094:
mov ax, 65535
jmp ROTULO1096
ROTULO1095:
xor ax, ax
ROTULO1096:
cmp ax, 0
jne ROTULO1092
jmp ROTULO1093
ROTULO1092:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:104:33 ===---
mov ax, _biosdisk
mov [bp+-8], ax
mov ax, 104
mov [bp+-10], ax
mov ax, 13
cs jmp word [_os_trycode]
ROTULO1093:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:105:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:105:16 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:105:12 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-6]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:105:18 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
jl ROTULO1099
jmp ROTULO1100
ROTULO1099:
mov ax, 65535
jmp ROTULO1101
ROTULO1100:
xor ax, ax
ROTULO1101:
cmp ax, 0
jne ROTULO1097
jmp ROTULO1098
ROTULO1097:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:105:31 ===---
mov ax, _biosdisk
mov [bp+-8], ax
mov ax, 105
mov [bp+-10], ax
mov ax, 12
cs jmp word [_os_trycode]
ROTULO1098:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:106:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:106:36 ===---
mov ax, 512
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:106:28 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_biosdisk_buffer+2]
pop es
cs mov di, [_biosdisk_buffer]
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:106:21 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+10+2]
pop es
mov di, [bp+10]
push es
push di
push cs
call _memory_copy
add sp, 10
ROTULO1074:
mov sp, bp
pop bp
FIM_biosdisk_writeblock:
retf
; MODULO FIM: biosdisk
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:44:8 ===---
; MODULO: minixfs
_minixfs:
db 11
db 77,105,110,105,120,70,83,46,104,99,98
db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:45:9 ===---
_minixfs_inuse:
times 8 db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:46:16 ===---
_minixfs_initialize:
push bp
mov bp, sp
sub sp, 4
push cs
call _os_stackcheck
; ARG: fs TAM: 4 POS: BP--4 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:47:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:48:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:48:14 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:48:37 ===---
push cs
pop es
mov di, ROTULO1104
jmp ROTULO1103
ROTULO1104:
db 7
db 77,105,110,105,120,70,83
times 1 db 0
ROTULO1103:
push es
push di
push cs
call _filesystem_registernew
add sp, 4
push es
pop word [bp+-4+2]
mov [bp+-4], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:49:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:49:20 ===---
push cs
pop es
mov di, _minixfs_mount
push es
push di
push word [bp+-4+2]
pop es
mov di, [bp+-4]
es pop word [di+37]
es pop word [di+37+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:50:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:50:26 ===---
push cs
pop es
mov di, _minixfs_ismountable
push es
push di
push word [bp+-4+2]
pop es
mov di, [bp+-4]
es pop word [di+41]
es pop word [di+41+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:51:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:51:37 ===---
mov ax, 1
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:51:30 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_minixfs_inuse+2]
pop es
cs mov di, [_minixfs_inuse]
push es
push di
push cs
call _semaphore_initialize
add sp, 6
ROTULO1102:
mov sp, bp
pop bp
FIM_minixfs_initialize:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:54:9 ===---
_minixfs_readblock:
push bp
mov bp, sp
; ARG: d TAM: 4 POS: BP+6 
; ARG: block TAM: 4 POS: BP+10 
; ARG: address TAM: 2 POS: BP+14 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:54:19 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:54:34 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:54:57 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:55:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:55:20 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:55:12 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+14]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:55:24 ===---
mov ax, 32768
mov bx, ax
pop ax
and ax, bx
cmp ax, 0
jne ROTULO1106
jmp ROTULO1107
ROTULO1106:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:55:42 ===---
mov ax, _minixfs
mov [bp+-8], ax
mov ax, 55
mov [bp+-10], ax
mov ax, 4
cs jmp word [_os_trycode]
ROTULO1107:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:56:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:56:49 ===---
xor ax, ax
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:56:42 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:56:34 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+14]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:56:46 ===---
mov ax, 1
mov cx, ax
pop ax
shl ax, cl
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:56:27 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+10+2]
pop es
mov di, [bp+10]
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:56:24 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
push cs
call _disk_readblock
add sp, 12
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:57:10 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:57:25 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:57:27 ===---
mov ax, 512
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:57:19 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
pop bx
add ax, bx
mov [bp+10], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:58:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:58:55 ===---
xor ax, ax
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:58:50 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:58:52 ===---
mov ax, 1
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:58:43 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:58:35 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+14]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:58:47 ===---
mov ax, 1
mov cx, ax
pop ax
shl ax, cl
pop bx
add ax, bx
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:58:27 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+10+2]
pop es
mov di, [bp+10]
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:58:24 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
push cs
call _disk_readblock
add sp, 12
ROTULO1105:
mov sp, bp
pop bp
FIM_minixfs_readblock:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:61:14 ===---
_minixfs_ismountable:
push bp
mov bp, sp
sub sp, 8
push cs
call _os_stackcheck
; ARG: fs TAM: 4 POS: BP+6 
; ARG: d TAM: 4 POS: BP+10 
; ARG: buffer TAM: 4 POS: BP--4 
; ARG: index TAM: 4 POS: BP--8 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:61:26 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:61:44 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:62:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:63:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:64:9 ===---
; ACAO STRUCTURE - Aloca estrutura na pilha
sub sp, 1024
push ss
pop es
mov di, sp
push es
pop word [bp+-4+2]
mov [bp+-4], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:65:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:65:17 ===---
; ACAO LEITURA - Le ponteiro
push es
pop word [bp+-8+2]
mov [bp+-8], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:66:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:66:24 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:66:12 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 45
push word [bp+10+2]
pop es
mov di, [bp+10]
es mov ax, [di+45]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:66:27 ===---
mov ax, 512
mov bx, ax
pop ax
cmp ax, bx
jne ROTULO1114
jmp ROTULO1115
ROTULO1114:
mov ax, 65535
jmp ROTULO1116
ROTULO1115:
xor ax, ax
ROTULO1116:
cmp ax, 0
jne ROTULO1112
jmp ROTULO1113
ROTULO1112:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:66:36 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:66:43 ===---
xor ax, ax
jmp ROTULO1111
ROTULO1113:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:67:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:67:30 ===---
mov ax, 1
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:67:22 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-4+2]
pop es
mov di, [bp+-4]
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:67:19 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+10+2]
pop es
mov di, [bp+10]
push es
push di
push cs
call _minixfs_readblock
add sp, 10
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:68:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:68:28 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:68:12 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 16
push word [bp+-8+2]
pop es
mov di, [bp+-8]
es mov ax, [di+16]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:68:31 ===---
mov ax, 5007
mov bx, ax
pop ax
cmp ax, bx
jne ROTULO1119
jmp ROTULO1120
ROTULO1119:
mov ax, 65535
jmp ROTULO1121
ROTULO1120:
xor ax, ax
ROTULO1121:
cmp ax, 0
jne ROTULO1117
jmp ROTULO1118
ROTULO1117:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:68:41 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:68:48 ===---
xor ax, ax
jmp ROTULO1111
ROTULO1118:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:69:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:69:25 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:69:12 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 2
push word [bp+-8+2]
pop es
mov di, [bp+-8]
es mov ax, [di+2]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:69:28 ===---
mov ax, 32768
mov bx, ax
pop ax
cmp ax, bx
jae ROTULO1124
jmp ROTULO1125
ROTULO1124:
mov ax, 65535
jmp ROTULO1126
ROTULO1125:
xor ax, ax
ROTULO1126:
cmp ax, 0
jne ROTULO1122
jmp ROTULO1123
ROTULO1122:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:69:40 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:69:47 ===---
xor ax, ax
jmp ROTULO1111
ROTULO1123:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:70:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:70:16 ===---
mov ax, 1
jmp ROTULO1111
ROTULO1111:
mov sp, bp
pop bp
FIM_minixfs_ismountable:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:73:9 ===---
_minixfs_mount:
push bp
mov bp, sp
sub sp, 12
push cs
call _os_stackcheck
; ARG: fs TAM: 4 POS: BP+6 
; ARG: mfs TAM: 4 POS: BP+10 
; ARG: buffer TAM: 4 POS: BP--4 
; ARG: ptr TAM: 4 POS: BP--8 
; ARG: index TAM: 4 POS: BP--12 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:73:15 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:73:33 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:74:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:75:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:76:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:77:9 ===---
; ACAO STRUCTURE - Aloca estrutura na pilha
sub sp, 1024
push ss
pop es
mov di, sp
push es
pop word [bp+-4+2]
mov [bp+-4], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:78:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:78:15 ===---
; ACAO LEITURA - Le ponteiro
push es
pop word [bp+-8+2]
mov [bp+-8], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:79:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:79:17 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-4+2]
pop es
mov di, [bp+-4]
push es
pop word [bp+-12+2]
mov [bp+-12], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:80:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:80:42 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:80:12 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:80:28 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - Ponteiro Byte - Desvio 105
push word [bp+10+2]
pop es
mov di, [bp+10]
es push word [di+105+2]
es push word [di+105]
pop di
pop es
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:80:24 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
push cs
call _minixfs_ismountable
add sp, 8
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:80:45 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO1130
jmp ROTULO1131
ROTULO1130:
mov ax, 65535
jmp ROTULO1132
ROTULO1131:
xor ax, ax
ROTULO1132:
cmp ax, 0
jne ROTULO1128
jmp ROTULO1129
ROTULO1128:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:80:58 ===---
mov ax, _minixfs
mov [bp+-8], ax
mov ax, 80
mov [bp+-10], ax
mov ax, 14
cs jmp word [_os_trycode]
ROTULO1129:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:81:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:81:38 ===---
mov ax, 1
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:81:33 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-8+2]
pop es
mov di, [bp+-8]
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:81:19 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - Ponteiro Byte - Desvio 105
push word [bp+10+2]
pop es
mov di, [bp+10]
es push word [di+105+2]
es push word [di+105]
pop di
pop es
push es
push di
push cs
call _minixfs_readblock
add sp, 10
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:82:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:82:20 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:82:33 ===---
; ACAO CHAMADA - Calcula tamanho de item
mov ax, 20
push ax
push cs
call _memory_alloc
add sp, 2
push es
push di
push word [bp+10+2]
pop es
mov di, [bp+10]
es pop word [di+125]
es pop word [di+125+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:83:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:83:20 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:83:71 ===---
mov ax, 1
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:83:42 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_multithreading_kernelthread+2]
pop es
cs mov di, [_multithreading_kernelthread]
push es
push di
push cs
call _globalmemory_allockib
add sp, 6
push es
push di
push word [bp+10+2]
pop es
mov di, [bp+10]
es pop word [di+129]
es pop word [di+129+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:84:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:84:20 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:84:71 ===---
mov ax, 1
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:84:42 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_multithreading_kernelthread+2]
pop es
cs mov di, [_multithreading_kernelthread]
push es
push di
push cs
call _globalmemory_allockib
add sp, 6
push es
push di
push word [bp+10+2]
pop es
mov di, [bp+10]
es pop word [di+133]
es pop word [di+133+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:85:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:85:20 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:85:33 ===---
; ACAO CHAMADA - Calcula tamanho de item
mov ax, 4
push ax
push cs
call _memory_alloc
add sp, 2
push es
push di
push word [bp+10+2]
pop es
mov di, [bp+10]
es pop word [di+137]
es pop word [di+137+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:86:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:86:40 ===---
mov ax, 1
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:86:30 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - Ponteiro Byte - Desvio 137
es push word [di+137+2]
es push word [di+137]
pop di
pop es
push es
push di
push cs
call _semaphore_initialize
add sp, 6
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:87:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:87:22 ===---
mov ax, 32
push word [bp+10+2]
pop es
mov di, [bp+10]
es mov [di+109], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:88:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:88:22 ===---
xor ax, ax
es mov [di+111], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:89:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:89:22 ===---
xor ax, ax
es mov [di+113], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:90:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:90:38 ===---
; ACAO CHAMADA - Calcula tamanho de item
mov ax, 20
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:90:31 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-12+2]
pop es
mov di, [bp+-12]
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:90:21 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - Ponteiro Byte - Desvio 125
push word [bp+10+2]
pop es
mov di, [bp+10]
es push word [di+125+2]
es push word [di+125]
pop di
pop es
push es
push di
push cs
call _memory_copy
add sp, 10
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:91:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:91:23 ===---
push cs
pop es
mov di, _minixfs_getroot
push es
push di
push word [bp+10+2]
pop es
mov di, [bp+10]
es pop word [di+141]
es pop word [di+141+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
ROTULO1127:
mov sp, bp
pop bp
FIM_minixfs_mount:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:94:9 ===---
_minixfs_getroot:
push bp
mov bp, sp
; ARG: mfs TAM: 4 POS: BP+6 
; ARG: dir TAM: 4 POS: BP+10 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:94:17 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:94:43 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:95:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:95:34 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+10+2]
pop es
mov di, [bp+10]
push es
push di
push cs
call _directoryinfo_initialize
add sp, 4
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:96:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:96:31 ===---
push cs
pop es
mov di, ROTULO1135
jmp ROTULO1134
ROTULO1135:
db 0
times 1 db 0
ROTULO1134:
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:96:21 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - Ponteiro Byte - Desvio 35
push word [bp+10+2]
pop es
mov di, [bp+10]
es push word [di+35+2]
es push word [di+35]
pop di
pop es
push es
push di
push cs
call _string_copy
add sp, 8
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:97:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:97:18 ===---
mov ax, 1
push word [bp+10+2]
pop es
mov di, [bp+10]
es mov [di+33], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:98:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:98:33 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
push word [bp+10+2]
pop es
mov di, [bp+10]
es pop word [di+39]
es pop word [di+39+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:99:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:99:32 ===---
push cs
pop es
mov di, _minixfs_getdirectoryinfo
push es
push di
push word [bp+10+2]
pop es
mov di, [bp+10]
es pop word [di+47]
es pop word [di+47+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:100:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:100:27 ===---
push cs
pop es
mov di, _minixfs_getfileinfo
push es
push di
push word [bp+10+2]
pop es
mov di, [bp+10]
es pop word [di+43]
es pop word [di+43+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
ROTULO1133:
mov sp, bp
pop bp
FIM_minixfs_getroot:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:103:9 ===---
_minixfs_loaditemmapblock:
push bp
mov bp, sp
sub sp, 4
push cs
call _os_stackcheck
; ARG: mfs TAM: 4 POS: BP+6 
; ARG: block TAM: 4 POS: BP+10 
; ARG: pos TAM: 2 POS: BP+14 
; ARG: index TAM: 4 POS: BP--4 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:103:26 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:103:52 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:103:72 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:104:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:105:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:105:17 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - Ponteiro Byte - Desvio 125
push word [bp+6+2]
pop es
mov di, [bp+6]
es push word [di+125+2]
es push word [di+125]
pop di
pop es
push es
pop word [bp+-4+2]
mov [bp+-4], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:106:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:106:46 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:106:48 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 6
es mov ax, [di+6]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:106:23 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:106:25 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 4
es mov ax, [di+4]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:106:19 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:106:21 ===---
mov ax, 2
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:106:15 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+14]
pop bx
add ax, bx
pop bx
add ax, bx
pop bx
add ax, bx
mov [bp+14], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:107:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:107:23 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:107:12 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 111
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+111]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:107:26 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+14]
mov bx, ax
pop ax
cmp ax, bx
jne ROTULO1139
jmp ROTULO1140
ROTULO1139:
mov ax, 65535
jmp ROTULO1141
ROTULO1140:
xor ax, ax
ROTULO1141:
cmp ax, 0
jne ROTULO1137
jmp ROTULO1138
ROTULO1137:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:108:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:108:47 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+14]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:108:37 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - Ponteiro Byte - Desvio 129
es push word [di+129+2]
es push word [di+129]
pop di
pop es
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:108:23 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - Ponteiro Byte - Desvio 105
push word [bp+6+2]
pop es
mov di, [bp+6]
es push word [di+105+2]
es push word [di+105]
pop di
pop es
push es
push di
push cs
call _minixfs_readblock
add sp, 10
ROTULO1138:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:110:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:110:38 ===---
mov ax, 1024
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:110:28 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - Ponteiro Byte - Desvio 129
push word [bp+6+2]
pop es
mov di, [bp+6]
es push word [di+129+2]
es push word [di+129]
pop di
pop es
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:110:21 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+10+2]
pop es
mov di, [bp+10]
push es
push di
push cs
call _memory_copy
add sp, 10
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:111:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:111:22 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+14]
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov [di+111], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
ROTULO1136:
mov sp, bp
pop bp
FIM_minixfs_loaditemmapblock:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:114:9 ===---
_minixfs_loaditem:
push bp
mov bp, sp
sub sp, 4
push cs
call _os_stackcheck
; ARG: mfs TAM: 4 POS: BP+6 
; ARG: id TAM: 2 POS: BP+10 
; ARG: item TAM: 4 POS: BP+12 
; ARG: block TAM: 4 POS: BP--4 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:114:18 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:114:44 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:114:58 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:115:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:116:9 ===---
; ACAO DEC - Decrementa variavel
dec word [bp+10]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:117:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:117:27 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - Ponteiro Byte - Desvio 137
push word [bp+6+2]
pop es
mov di, [bp+6]
es push word [di+137+2]
es push word [di+137]
pop di
pop es
push es
push di
push cs
call _semaphore_waitone
add sp, 4
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:118:9 ===---
; ACAO STRUCTURE - Aloca estrutura na pilha
sub sp, 1024
push ss
pop es
mov di, sp
push es
pop word [bp+-4+2]
mov [bp+-4], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:119:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:119:41 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:119:38 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:119:43 ===---
mov ax, 32
cmp ax, 0
jne ROTULO1143
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:119:43 ===---
mov ax, _minixfs
mov [bp+-8], ax
mov ax, 119
mov [bp+-10], ax
mov ax, 1
cs jmp word [_os_trycode]
ROTULO1143:
mov bx, ax
pop ax
xor dx, dx
div bx
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:119:31 ===---
; ACAO LEITURA - Le ponteiro
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:119:26 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
push cs
call _minixfs_loaditemmapblock
add sp, 10
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:120:10 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:120:25 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:120:40 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:120:42 ===---
mov ax, 32
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:120:32 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:120:29 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:120:36 ===---
mov ax, 32
cmp ax, 0
jne ROTULO1144
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:120:36 ===---
mov ax, _minixfs
mov [bp+-8], ax
mov ax, 120
mov [bp+-10], ax
mov ax, 1
cs jmp word [_os_trycode]
ROTULO1144:
mov bx, ax
pop ax
xor dx, dx
div bx
mov ax, dx
pop bx
mul bx
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:120:19 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
pop bx
add ax, bx
mov [bp+-4], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:121:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:121:27 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - Ponteiro Byte - Desvio 137
push word [bp+6+2]
pop es
mov di, [bp+6]
es push word [di+137+2]
es push word [di+137]
pop di
pop es
push es
push di
push cs
call _semaphore_release
add sp, 4
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:122:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:122:34 ===---
; ACAO CHAMADA - Calcula tamanho de item
mov ax, 32
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:122:27 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-4+2]
pop es
mov di, [bp+-4]
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:122:21 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+12+2]
pop es
mov di, [bp+12]
push es
push di
push cs
call _memory_copy
add sp, 10
ROTULO1142:
mov sp, bp
pop bp
FIM_minixfs_loaditem:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:125:9 ===---
_minixfs_readblockfromitem:
push bp
mov bp, sp
sub sp, 6
push cs
call _os_stackcheck
; ARG: mfs TAM: 4 POS: BP+6 
; ARG: item TAM: 4 POS: BP+10 
; ARG: block TAM: 4 POS: BP+14 
; ARG: pos TAM: 2 POS: BP+18 
; ARG: ptr TAM: 4 POS: BP--4 
; ARG: blocknum TAM: 2 POS: BP--6 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:125:27 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:125:53 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:125:74 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:125:94 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:126:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:127:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:128:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:128:16 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:128:12 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+18]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:128:18 ===---
mov ax, 7
mov bx, ax
pop ax
cmp ax, bx
jb ROTULO1148
jmp ROTULO1149
ROTULO1148:
mov ax, 65535
jmp ROTULO1150
ROTULO1149:
xor ax, ax
ROTULO1150:
cmp ax, 0
jne ROTULO1146
jmp ROTULO1147
ROTULO1146:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:129:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:129:20 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:129:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+18]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:129:23 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO1153
jmp ROTULO1154
ROTULO1153:
mov ax, 65535
jmp ROTULO1155
ROTULO1154:
xor ax, ax
ROTULO1155:
cmp ax, 0
jne ROTULO1151
jmp ROTULO1152
ROTULO1151:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:129:30 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:129:41 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 14
push word [bp+10+2]
pop es
mov di, [bp+10]
es mov ax, [di+14]
mov [bp+-6], ax
ROTULO1152:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:130:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:130:20 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:130:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+18]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:130:23 ===---
mov ax, 1
mov bx, ax
pop ax
cmp ax, bx
je ROTULO1158
jmp ROTULO1159
ROTULO1158:
mov ax, 65535
jmp ROTULO1160
ROTULO1159:
xor ax, ax
ROTULO1160:
cmp ax, 0
jne ROTULO1156
jmp ROTULO1157
ROTULO1156:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:130:30 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:130:41 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 16
push word [bp+10+2]
pop es
mov di, [bp+10]
es mov ax, [di+16]
mov [bp+-6], ax
ROTULO1157:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:131:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:131:20 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:131:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+18]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:131:23 ===---
mov ax, 2
mov bx, ax
pop ax
cmp ax, bx
je ROTULO1163
jmp ROTULO1164
ROTULO1163:
mov ax, 65535
jmp ROTULO1165
ROTULO1164:
xor ax, ax
ROTULO1165:
cmp ax, 0
jne ROTULO1161
jmp ROTULO1162
ROTULO1161:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:131:30 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:131:41 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 18
push word [bp+10+2]
pop es
mov di, [bp+10]
es mov ax, [di+18]
mov [bp+-6], ax
ROTULO1162:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:132:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:132:20 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:132:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+18]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:132:23 ===---
mov ax, 3
mov bx, ax
pop ax
cmp ax, bx
je ROTULO1168
jmp ROTULO1169
ROTULO1168:
mov ax, 65535
jmp ROTULO1170
ROTULO1169:
xor ax, ax
ROTULO1170:
cmp ax, 0
jne ROTULO1166
jmp ROTULO1167
ROTULO1166:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:132:30 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:132:41 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 20
push word [bp+10+2]
pop es
mov di, [bp+10]
es mov ax, [di+20]
mov [bp+-6], ax
ROTULO1167:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:133:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:133:20 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:133:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+18]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:133:23 ===---
mov ax, 4
mov bx, ax
pop ax
cmp ax, bx
je ROTULO1173
jmp ROTULO1174
ROTULO1173:
mov ax, 65535
jmp ROTULO1175
ROTULO1174:
xor ax, ax
ROTULO1175:
cmp ax, 0
jne ROTULO1171
jmp ROTULO1172
ROTULO1171:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:133:30 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:133:41 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 22
push word [bp+10+2]
pop es
mov di, [bp+10]
es mov ax, [di+22]
mov [bp+-6], ax
ROTULO1172:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:134:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:134:20 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:134:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+18]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:134:23 ===---
mov ax, 5
mov bx, ax
pop ax
cmp ax, bx
je ROTULO1178
jmp ROTULO1179
ROTULO1178:
mov ax, 65535
jmp ROTULO1180
ROTULO1179:
xor ax, ax
ROTULO1180:
cmp ax, 0
jne ROTULO1176
jmp ROTULO1177
ROTULO1176:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:134:30 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:134:41 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 24
push word [bp+10+2]
pop es
mov di, [bp+10]
es mov ax, [di+24]
mov [bp+-6], ax
ROTULO1177:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:135:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:135:20 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:135:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+18]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:135:23 ===---
mov ax, 6
mov bx, ax
pop ax
cmp ax, bx
je ROTULO1183
jmp ROTULO1184
ROTULO1183:
mov ax, 65535
jmp ROTULO1185
ROTULO1184:
xor ax, ax
ROTULO1185:
cmp ax, 0
jne ROTULO1181
jmp ROTULO1182
ROTULO1181:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:135:30 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:135:41 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 26
push word [bp+10+2]
pop es
mov di, [bp+10]
es mov ax, [di+26]
mov [bp+-6], ax
ROTULO1182:
jmp ROTULO1186
ROTULO1147:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:137:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:137:20 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:137:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+18]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:137:25 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:137:27 ===---
mov ax, 512
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:137:23 ===---
mov ax, 7
pop bx
add ax, bx
mov bx, ax
pop ax
cmp ax, bx
jb ROTULO1189
jmp ROTULO1190
ROTULO1189:
mov ax, 65535
jmp ROTULO1191
ROTULO1190:
xor ax, ax
ROTULO1191:
cmp ax, 0
jne ROTULO1187
jmp ROTULO1188
ROTULO1187:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:138:17 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:138:48 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 28
push word [bp+10+2]
pop es
mov di, [bp+10]
es mov ax, [di+28]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:138:41 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+14+2]
pop es
mov di, [bp+14]
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:138:27 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - Ponteiro Byte - Desvio 105
push word [bp+6+2]
pop es
mov di, [bp+6]
es push word [di+105+2]
es push word [di+105]
pop di
pop es
push es
push di
push cs
call _minixfs_readblock
add sp, 10
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:139:17 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:139:27 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:139:29 ===---
mov ax, 7
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:139:23 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+18]
pop bx
sub ax, bx
mov [bp+18], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:140:17 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:140:23 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+14+2]
pop es
mov di, [bp+14]
push es
pop word [bp+-4+2]
mov [bp+-4], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:141:18 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:141:29 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:141:36 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:141:32 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+18]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:141:40 ===---
mov ax, 1
mov cx, ax
pop ax
shl ax, cl
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:141:25 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
pop bx
add ax, bx
mov [bp+-4], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:142:17 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:142:28 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-4+2]
pop es
mov di, [bp+-4]
es mov ax, [di+0]
mov [bp+-6], ax
jmp ROTULO1192
ROTULO1188:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:144:23 ===---
mov ax, _minixfs
mov [bp+-8], ax
mov ax, 144
mov [bp+-10], ax
mov ax, 7
cs jmp word [_os_trycode]
ROTULO1192:
ROTULO1186:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:147:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:147:21 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:147:12 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-6]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:147:24 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO1195
jmp ROTULO1196
ROTULO1195:
mov ax, 65535
jmp ROTULO1197
ROTULO1196:
xor ax, ax
ROTULO1197:
cmp ax, 0
jne ROTULO1193
jmp ROTULO1194
ROTULO1193:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:147:37 ===---
mov ax, _minixfs
mov [bp+-8], ax
mov ax, 147
mov [bp+-10], ax
mov ax, 5
cs jmp word [_os_trycode]
ROTULO1194:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:148:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:148:40 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-6]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:148:33 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+14+2]
pop es
mov di, [bp+14]
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:148:19 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - Ponteiro Byte - Desvio 105
push word [bp+6+2]
pop es
mov di, [bp+6]
es push word [di+105+2]
es push word [di+105]
pop di
pop es
push es
push di
push cs
call _minixfs_readblock
add sp, 10
ROTULO1145:
mov sp, bp
pop bp
FIM_minixfs_readblockfromitem:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:151:14 ===---
_minixfs_getsubitem:
push bp
mov bp, sp
sub sp, 30
push cs
call _os_stackcheck
; ARG: parent TAM: 4 POS: BP+6 
; ARG: pos TAM: 2 POS: BP+10 
; ARG: outputitem TAM: 4 POS: BP+12 
; ARG: outputref TAM: 4 POS: BP+16 
; ARG: parentitem TAM: 4 POS: BP--14 
; ARG: block TAM: 4 POS: BP--18 
; ARG: tmp TAM: 4 POS: BP--22 
; ARG: ptr TAM: 4 POS: BP--26 
; ARG: mfs TAM: 4 POS: BP--30 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:151:25 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:151:50 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:151:65 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:151:92 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:152:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:153:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:154:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:155:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:156:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:157:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:157:15 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - Ponteiro Byte - Desvio 39
push word [bp+6+2]
pop es
mov di, [bp+6]
es push word [di+39+2]
es push word [di+39]
pop di
pop es
push es
pop word [bp+-30+2]
mov [bp+-30], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:158:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:158:27 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_minixfs_inuse+2]
pop es
cs mov di, [_minixfs_inuse]
push es
push di
push cs
call _semaphore_waitone
add sp, 4
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:159:11 ===---
cs mov ax, [_os_trycode]
mov [bp+-2], ax
cs mov ax, [_os_trystack]
mov [bp+-4], ax
cs mov ax, [_os_trybase]
mov [bp+-6], ax
mov ax, bp
cs mov [_os_trybase], ax
mov ax, sp
cs mov [_os_trystack], ax
mov ax, ROTULO1199
cs mov [_os_trycode], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:160:13 ===---
; ACAO STRUCTURE - Aloca estrutura na pilha
sub sp, 32
push ss
pop es
mov di, sp
push es
pop word [bp+-14+2]
mov [bp+-14], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:161:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:161:38 ===---
; ACAO LEITURA - Le ponteiro
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:161:27 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 33
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+33]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:161:22 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-30+2]
pop es
mov di, [bp+-30]
push es
push di
push cs
call _minixfs_loaditem
add sp, 10
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:162:13 ===---
; ACAO STRUCTURE - Aloca estrutura na pilha
sub sp, 1024
push ss
pop es
mov di, sp
push es
pop word [bp+-18+2]
mov [bp+-18], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:163:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:163:59 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:163:55 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:163:61 ===---
mov ax, 32
cmp ax, 0
jne ROTULO1201
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:163:61 ===---
mov ax, _minixfs
mov [bp+-8], ax
mov ax, 163
mov [bp+-10], ax
mov ax, 1
cs jmp word [_os_trycode]
ROTULO1201:
mov bx, ax
pop ax
xor dx, dx
div bx
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:163:48 ===---
; ACAO LEITURA - Le ponteiro
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:163:36 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-14+2]
pop es
mov di, [bp+-14]
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:163:31 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-30+2]
pop es
mov di, [bp+-30]
push es
push di
push cs
call _minixfs_readblockfromitem
add sp, 14
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:164:13 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:164:19 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-18+2]
pop es
mov di, [bp+-18]
push es
pop word [bp+-22+2]
mov [bp+-22], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:165:14 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:165:25 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:165:41 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:165:43 ===---
; ACAO CHAMADA - Calcula tamanho de item
mov ax, 32
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:165:33 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:165:29 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:165:37 ===---
mov ax, 32
cmp ax, 0
jne ROTULO1202
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:165:37 ===---
mov ax, _minixfs
mov [bp+-8], ax
mov ax, 165
mov [bp+-10], ax
mov ax, 1
cs jmp word [_os_trycode]
ROTULO1202:
mov bx, ax
pop ax
xor dx, dx
div bx
mov ax, dx
pop bx
mul bx
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:165:21 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO LEITURA - Le variavel
mov ax, [bp+-22]
pop bx
add ax, bx
mov [bp+-22], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:166:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:166:41 ===---
; ACAO CHAMADA - Calcula tamanho de item
mov ax, 32
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:166:36 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-22+2]
pop es
mov di, [bp+-22]
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:166:25 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+16+2]
pop es
mov di, [bp+16]
push es
push di
push cs
call _memory_copy
add sp, 10
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:167:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:167:41 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+12+2]
pop es
mov di, [bp+12]
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:167:27 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 0
push word [bp+16+2]
pop es
mov di, [bp+16]
es mov ax, [di+0]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:167:22 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-30+2]
pop es
mov di, [bp+-30]
push es
push di
push cs
call _minixfs_loaditem
add sp, 10
jmp ROTULO1200
ROTULO1199:
mov bx, ax
mov ax, [bp+-10]
push word [bp+-8+2]
pop es
mov di, [bp+-8]
cs mov bp, [_os_trybase]
cs mov sp, [_os_trystack]
push es
pop word [bp+-8+2]
mov [bp+-8], di
mov [bp+-10], ax
mov ax, bx
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:169:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:169:31 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_minixfs_inuse+2]
pop es
cs mov di, [_minixfs_inuse]
push es
push di
push cs
call _semaphore_release
add sp, 4
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:170:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:170:20 ===---
xor ax, ax
jmp ROTULO1198
jmp ROTULO1200
ROTULO1204:
cs jmp word [_os_tryfatal]
ROTULO1200:
mov ax, [bp+-6]
cs mov [_os_trybase], ax
mov ax, [bp+-4]
cs mov [_os_trystack], ax
mov ax, [bp+-2]
cs mov [_os_trycode], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:172:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:172:27 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_minixfs_inuse+2]
pop es
cs mov di, [_minixfs_inuse]
push es
push di
push cs
call _semaphore_release
add sp, 4
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:173:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:173:16 ===---
mov ax, 65535
jmp ROTULO1198
ROTULO1198:
mov sp, bp
pop bp
FIM_minixfs_getsubitem:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:176:14 ===---
_minixfs_getdirectoryinfo:
push bp
mov bp, sp
sub sp, 20
push cs
call _os_stackcheck
; ARG: parent TAM: 4 POS: BP+6 
; ARG: pos TAM: 2 POS: BP+10 
; ARG: output TAM: 4 POS: BP+12 
; ARG: i TAM: 2 POS: BP--2 
; ARG: item TAM: 4 POS: BP--6 
; ARG: ref TAM: 4 POS: BP--10 
; ARG: counter TAM: 2 POS: BP--12 
; ARG: ptr1 TAM: 4 POS: BP--16 
; ARG: ptr2 TAM: 4 POS: BP--20 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:176:31 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:176:56 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:176:71 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:177:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:178:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:179:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:180:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:181:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:182:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:183:9 ===---
; ACAO STRUCTURE - Aloca estrutura na pilha
sub sp, 32
push ss
pop es
mov di, sp
push es
pop word [bp+-6+2]
mov [bp+-6], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:184:9 ===---
; ACAO STRUCTURE - Aloca estrutura na pilha
sub sp, 32
push ss
pop es
mov di, sp
push es
pop word [bp+-10+2]
mov [bp+-10], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:185:9 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-12], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:186:22 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:186:22 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-2], 2
ROTULO1206:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:186:22 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:186:22 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:186:22 ===---
mov ax, 512
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO1209
jmp ROTULO1210
ROTULO1209:
mov ax, 65535
jmp ROTULO1211
ROTULO1210:
xor ax, ax
ROTULO1211:
cmp ax, 0
jne ROTULO1207
jmp ROTULO1208
ROTULO1207:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:187:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:187:49 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:187:16 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:187:44 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-10+2]
pop es
mov di, [bp+-10]
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:187:38 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-6+2]
pop es
mov di, [bp+-6]
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:187:35 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:187:27 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
push cs
call _minixfs_getsubitem
add sp, 14
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:187:52 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO1214
jmp ROTULO1215
ROTULO1214:
mov ax, 65535
jmp ROTULO1216
ROTULO1215:
xor ax, ax
ROTULO1216:
cmp ax, 0
jne ROTULO1212
jmp ROTULO1213
ROTULO1212:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:187:59 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:187:66 ===---
xor ax, ax
jmp ROTULO1205
ROTULO1213:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:188:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:188:33 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:188:16 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 0
push word [bp+-6+2]
pop es
mov di, [bp+-6]
es mov ax, [di+0]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:188:37 ===---
mov ax, 16384
mov bx, ax
pop ax
and ax, bx
cmp ax, 0
jne ROTULO1217
jmp ROTULO1218
ROTULO1217:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:189:17 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-12]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:190:17 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:190:28 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:190:20 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-12]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:190:31 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
mov bx, ax
pop ax
cmp ax, bx
je ROTULO1224
jmp ROTULO1225
ROTULO1224:
mov ax, 65535
jmp ROTULO1226
ROTULO1225:
xor ax, ax
ROTULO1226:
cmp ax, 0
jne ROTULO1222
jmp ROTULO1223
ROTULO1222:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:191:21 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:191:46 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+12+2]
pop es
mov di, [bp+12]
push es
push di
push cs
call _directoryinfo_initialize
add sp, 4
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:192:21 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:192:33 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 0
push word [bp+-10+2]
pop es
mov di, [bp+-10]
es mov ax, [di+0]
push word [bp+12+2]
pop es
mov di, [bp+12]
es mov [di+33], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:193:21 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:193:48 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - Ponteiro Byte - Desvio 39
push word [bp+6+2]
pop es
mov di, [bp+6]
es push word [di+39+2]
es push word [di+39]
pop di
pop es
push es
push di
push word [bp+12+2]
pop es
mov di, [bp+12]
es pop word [di+39]
es pop word [di+39+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:194:21 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:194:47 ===---
push cs
pop es
mov di, _minixfs_getdirectoryinfo
push es
push di
push word [bp+12+2]
pop es
mov di, [bp+12]
es pop word [di+47]
es pop word [di+47+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:195:21 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:195:42 ===---
push cs
pop es
mov di, _minixfs_getfileinfo
push es
push di
push word [bp+12+2]
pop es
mov di, [bp+12]
es pop word [di+43]
es pop word [di+43+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:196:21 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:196:28 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - Ponteiro Byte - Desvio 35
es push word [di+35+2]
es push word [di+35]
pop di
pop es
push es
pop word [bp+-16+2]
mov [bp+-16], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:197:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-16]
inc di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:198:21 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:198:28 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-10+2]
pop es
mov di, [bp+-10]
push es
pop word [bp+-20+2]
mov [bp+-20], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:199:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-20]
inc di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:200:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-20]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:201:21 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:201:45 ===---
mov ax, 30
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:201:39 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-20+2]
pop es
mov di, [bp+-20]
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:201:33 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-16+2]
pop es
mov di, [bp+-16]
push es
push di
push cs
call _memory_copy
add sp, 10
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:202:22 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:202:35 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:202:37 ===---
mov ax, 30
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:202:30 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-16]
pop bx
add ax, bx
mov [bp+-16], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:203:21 ===---
; ACAO GRAVACAO - Gravacao de numero em ponteiro
push word [bp+-16+2]
pop es
mov di, [bp+-16]
es mov byte [di+0], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:204:21 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:204:28 ===---
mov ax, 1
jmp ROTULO1205
ROTULO1223:
ROTULO1218:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:186:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-2]
jmp ROTULO1206
ROTULO1208:
ROTULO1205:
mov sp, bp
pop bp
FIM_minixfs_getdirectoryinfo:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:210:14 ===---
_minixfs_getfileinfo:
push bp
mov bp, sp
sub sp, 20
push cs
call _os_stackcheck
; ARG: parent TAM: 4 POS: BP+6 
; ARG: pos TAM: 2 POS: BP+10 
; ARG: output TAM: 4 POS: BP+12 
; ARG: i TAM: 2 POS: BP--2 
; ARG: item TAM: 4 POS: BP--6 
; ARG: ref TAM: 4 POS: BP--10 
; ARG: counter TAM: 2 POS: BP--12 
; ARG: ptr1 TAM: 4 POS: BP--16 
; ARG: ptr2 TAM: 4 POS: BP--20 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:210:26 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:210:51 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:210:66 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:211:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:212:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:213:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:214:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:215:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:216:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:217:9 ===---
; ACAO STRUCTURE - Aloca estrutura na pilha
sub sp, 32
push ss
pop es
mov di, sp
push es
pop word [bp+-6+2]
mov [bp+-6], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:218:9 ===---
; ACAO STRUCTURE - Aloca estrutura na pilha
sub sp, 32
push ss
pop es
mov di, sp
push es
pop word [bp+-10+2]
mov [bp+-10], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:219:9 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-12], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:220:22 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:220:22 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-2], 2
ROTULO1228:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:220:22 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:220:22 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:220:22 ===---
mov ax, 512
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO1231
jmp ROTULO1232
ROTULO1231:
mov ax, 65535
jmp ROTULO1233
ROTULO1232:
xor ax, ax
ROTULO1233:
cmp ax, 0
jne ROTULO1229
jmp ROTULO1230
ROTULO1229:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:221:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:221:49 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:221:16 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:221:44 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-10+2]
pop es
mov di, [bp+-10]
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:221:38 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-6+2]
pop es
mov di, [bp+-6]
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:221:35 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:221:27 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
push cs
call _minixfs_getsubitem
add sp, 14
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:221:52 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO1236
jmp ROTULO1237
ROTULO1236:
mov ax, 65535
jmp ROTULO1238
ROTULO1237:
xor ax, ax
ROTULO1238:
cmp ax, 0
jne ROTULO1234
jmp ROTULO1235
ROTULO1234:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:221:59 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:221:66 ===---
xor ax, ax
jmp ROTULO1227
ROTULO1235:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:222:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:222:33 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:222:16 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 0
push word [bp+-6+2]
pop es
mov di, [bp+-6]
es mov ax, [di+0]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:222:37 ===---
mov ax, 32768
mov bx, ax
pop ax
and ax, bx
cmp ax, 0
jne ROTULO1239
jmp ROTULO1240
ROTULO1239:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:223:17 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-12]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:224:17 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:224:28 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:224:20 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-12]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:224:31 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
mov bx, ax
pop ax
cmp ax, bx
je ROTULO1246
jmp ROTULO1247
ROTULO1246:
mov ax, 65535
jmp ROTULO1248
ROTULO1247:
xor ax, ax
ROTULO1248:
cmp ax, 0
jne ROTULO1244
jmp ROTULO1245
ROTULO1244:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:225:21 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:225:41 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+12+2]
pop es
mov di, [bp+12]
push es
push di
push cs
call _fileinfo_initialize
add sp, 4
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:226:21 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:226:33 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 0
push word [bp+-10+2]
pop es
mov di, [bp+-10]
es mov ax, [di+0]
push word [bp+12+2]
pop es
mov di, [bp+12]
es mov [di+33], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:227:21 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:227:35 ===---
push cs
pop es
mov di, _minixfs_open
push es
push di
push word [bp+12+2]
pop es
mov di, [bp+12]
es pop word [di+43]
es pop word [di+43+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:228:21 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:228:48 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - Ponteiro Byte - Desvio 39
push word [bp+6+2]
pop es
mov di, [bp+6]
es push word [di+39+2]
es push word [di+39]
pop di
pop es
push es
push di
push word [bp+12+2]
pop es
mov di, [bp+12]
es pop word [di+39]
es pop word [di+39+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:229:21 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:229:28 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - Ponteiro Byte - Desvio 35
es push word [di+35+2]
es push word [di+35]
pop di
pop es
push es
pop word [bp+-16+2]
mov [bp+-16], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:230:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-16]
inc di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:231:21 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:231:28 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-10+2]
pop es
mov di, [bp+-10]
push es
pop word [bp+-20+2]
mov [bp+-20], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:232:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-20]
inc di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:233:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-20]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:234:21 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:234:45 ===---
mov ax, 30
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:234:39 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-20+2]
pop es
mov di, [bp+-20]
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:234:33 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-16+2]
pop es
mov di, [bp+-16]
push es
push di
push cs
call _memory_copy
add sp, 10
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:235:22 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:235:35 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:235:37 ===---
mov ax, 30
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:235:30 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-16]
pop bx
add ax, bx
mov [bp+-16], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:236:21 ===---
; ACAO GRAVACAO - Gravacao de numero em ponteiro
push word [bp+-16+2]
pop es
mov di, [bp+-16]
es mov byte [di+0], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:237:21 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:237:28 ===---
mov ax, 1
jmp ROTULO1227
ROTULO1245:
ROTULO1240:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:220:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-2]
jmp ROTULO1228
ROTULO1230:
ROTULO1227:
mov sp, bp
pop bp
FIM_minixfs_getfileinfo:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:243:9 ===---
_minixfs_readblockfromstream:
push bp
mov bp, sp
sub sp, 14
push cs
call _os_stackcheck
; ARG: s TAM: 4 POS: BP+6 
; ARG: blocknum TAM: 2 POS: BP+10 
; ARG: item TAM: 4 POS: BP--14 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:243:29 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:243:42 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:244:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:245:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:245:16 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - Ponteiro Byte - Desvio 44
push word [bp+6+2]
pop es
mov di, [bp+6]
es push word [di+44+2]
es push word [di+44]
pop di
pop es
push es
pop word [bp+-14+2]
mov [bp+-14], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:246:11 ===---
cs mov ax, [_os_trycode]
mov [bp+-2], ax
cs mov ax, [_os_trystack]
mov [bp+-4], ax
cs mov ax, [_os_trybase]
mov [bp+-6], ax
mov ax, bp
cs mov [_os_trybase], ax
mov ax, sp
cs mov [_os_trystack], ax
mov ax, ROTULO1250
cs mov [_os_trycode], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:247:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:247:78 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:247:68 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - Ponteiro Byte - Desvio 38
push word [bp+6+2]
pop es
mov di, [bp+6]
es push word [di+38+2]
es push word [di+38]
pop di
pop es
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:247:52 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - Ponteiro Byte - Desvio 44
push word [bp+6+2]
pop es
mov di, [bp+6]
es push word [di+44+2]
es push word [di+44]
pop di
pop es
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:247:31 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - Ponteiro Byte - Desvio 34
push word [bp+6+2]
pop es
mov di, [bp+6]
es push word [di+34+2]
es push word [di+34]
pop di
pop es
push es
push di
push cs
call _minixfs_readblockfromitem
add sp, 14
jmp ROTULO1251
ROTULO1250:
mov bx, ax
mov ax, [bp+-10]
push word [bp+-8+2]
pop es
mov di, [bp+-8]
cs mov bp, [_os_trybase]
cs mov sp, [_os_trystack]
push es
pop word [bp+-8+2]
mov [bp+-8], di
mov [bp+-10], ax
mov ax, bx
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:249:13 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:249:26 ===---
xor ax, ax
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov [di+48], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:250:13 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:250:28 ===---
xor ax, ax
es mov [di+42], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:251:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:251:19 ===---
xor ax, ax
jmp ROTULO1249
jmp ROTULO1251
ROTULO1253:
cs jmp word [_os_tryfatal]
ROTULO1251:
mov ax, [bp+-6]
cs mov [_os_trybase], ax
mov ax, [bp+-4]
cs mov [_os_trystack], ax
mov ax, [bp+-2]
cs mov [_os_trycode], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:253:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:253:33 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:253:27 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:253:13 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 6
push word [bp+-14+2]
pop es
mov di, [bp+-14]
es mov ax, [di+6]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:253:30 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO1259
jmp ROTULO1260
ROTULO1259:
mov ax, 65535
jmp ROTULO1261
ROTULO1260:
xor ax, ax
ROTULO1261:
cmp ax, 0
je ROTULO1257
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:253:64 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:253:56 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:253:43 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 4
es mov ax, [di+4]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:253:58 ===---
mov ax, 1024
cmp ax, 0
jne ROTULO1265
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:253:58 ===---
mov ax, _minixfs
mov [bp+-8], ax
mov ax, 253
mov [bp+-10], ax
mov ax, 1
cs jmp word [_os_trycode]
ROTULO1265:
mov bx, ax
pop ax
xor dx, dx
div bx
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:253:67 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO1262
jmp ROTULO1263
ROTULO1262:
mov ax, 65535
jmp ROTULO1264
ROTULO1263:
xor ax, ax
ROTULO1264:
cmp ax, 0
je ROTULO1257
ROTULO1256:
mov ax, 65535
jmp ROTULO1258
ROTULO1257:
xor ax, ax
ROTULO1258:
cmp ax, 0
jne ROTULO1254
jmp ROTULO1255
ROTULO1254:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:254:13 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:254:28 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 4
es mov ax, [di+4]
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov [di+42], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
jmp ROTULO1266
ROTULO1255:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:256:13 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:256:28 ===---
mov ax, 1024
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov [di+42], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
ROTULO1266:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:258:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:258:22 ===---
xor ax, ax
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov [di+48], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:259:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:259:26 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
es mov [di+50], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
ROTULO1249:
mov sp, bp
pop bp
FIM_minixfs_readblockfromstream:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:262:9 ===---
_minixfs_open:
push bp
mov bp, sp
sub sp, 4
push cs
call _os_stackcheck
; ARG: file TAM: 4 POS: BP+6 
; ARG: s TAM: 4 POS: BP+10 
; ARG: item TAM: 4 POS: BP--4 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:262:14 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:262:32 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:270:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:263:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:263:27 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+10+2]
pop es
mov di, [bp+10]
push es
push di
push cs
call _stream_initialize
add sp, 4
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:264:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:264:16 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 33
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+33]
push word [bp+10+2]
pop es
mov di, [bp+10]
es mov [di+0], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:265:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:265:31 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - Ponteiro Byte - Desvio 39
push word [bp+6+2]
pop es
mov di, [bp+6]
es push word [di+39+2]
es push word [di+39]
pop di
pop es
push es
push di
push word [bp+10+2]
pop es
mov di, [bp+10]
es pop word [di+34]
es pop word [di+34+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:266:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:266:21 ===---
push cs
pop es
mov di, _minixfs_readraw
push es
push di
push word [bp+10+2]
pop es
mov di, [bp+10]
es pop word [di+2]
es pop word [di+2+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:267:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:267:20 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:267:60 ===---
mov ax, 1
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:267:42 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _thread_current
push es
push di
push cs
call _globalmemory_allockib
add sp, 6
push es
push di
push word [bp+10+2]
pop es
mov di, [bp+10]
es pop word [di+38]
es pop word [di+38+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:268:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:268:26 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:268:39 ===---
; ACAO CHAMADA - Calcula tamanho de item
mov ax, 32
push ax
push cs
call _memory_alloc
add sp, 2
push es
push di
push word [bp+10+2]
pop es
mov di, [bp+10]
es pop word [di+44]
es pop word [di+44+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:269:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:269:51 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - Ponteiro Byte - Desvio 44
es push word [di+44+2]
es push word [di+44]
pop di
pop es
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:269:42 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 33
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+33]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:269:18 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - Ponteiro Byte - Desvio 39
es push word [di+39+2]
es push word [di+39]
pop di
pop es
push es
push di
push cs
call _minixfs_loaditem
add sp, 10
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:271:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:271:16 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - Ponteiro Byte - Desvio 44
push word [bp+10+2]
pop es
mov di, [bp+10]
es push word [di+44+2]
es push word [di+44]
pop di
pop es
push es
pop word [bp+-4+2]
mov [bp+-4], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:272:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:272:23 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:272:12 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 14
es mov ax, [di+14]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:272:26 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
jne ROTULO1270
jmp ROTULO1271
ROTULO1270:
mov ax, 65535
jmp ROTULO1272
ROTULO1271:
xor ax, ax
ROTULO1272:
cmp ax, 0
jne ROTULO1268
jmp ROTULO1269
ROTULO1268:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:273:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:273:36 ===---
xor ax, ax
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:273:33 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+10+2]
pop es
mov di, [bp+10]
push es
push di
push cs
call _minixfs_readblockfromstream
add sp, 6
ROTULO1269:
ROTULO1267:
mov sp, bp
pop bp
FIM_minixfs_open:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:277:14 ===---
_minixfs_readraw:
push bp
mov bp, sp
sub sp, 10
push cs
call _os_stackcheck
; ARG: s TAM: 4 POS: BP+6 
; ARG: data TAM: 4 POS: BP+10 
; ARG: len TAM: 2 POS: BP+14 
; ARG: tmp TAM: 4 POS: BP--4 
; ARG: i TAM: 2 POS: BP--6 
; ARG: value TAM: 2 POS: BP--8 
; ARG: ret TAM: 2 POS: BP--10 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:277:22 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:277:35 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:277:57 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:278:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:279:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:280:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:281:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:282:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:282:15 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - Ponteiro Byte - Desvio 38
push word [bp+6+2]
pop es
mov di, [bp+6]
es push word [di+38+2]
es push word [di+38]
pop di
pop es
push es
pop word [bp+-4+2]
mov [bp+-4], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:283:10 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:283:26 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:283:28 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 48
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+48]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:283:17 ===---
; ACAO STRUCTURE - Leitura de Desvio de Ponteiro
es mov ax, [di+38]
pop bx
add ax, bx
mov [bp+-4], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:284:9 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-10], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:285:22 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:285:22 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-6], 1
ROTULO1274:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:285:22 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:285:22 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-6]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:285:22 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+14]
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO1277
jmp ROTULO1278
ROTULO1277:
mov ax, 65535
jmp ROTULO1279
ROTULO1278:
xor ax, ax
ROTULO1279:
cmp ax, 0
jne ROTULO1275
jmp ROTULO1276
ROTULO1275:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:286:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:286:27 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:286:16 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 48
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+48]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:286:30 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 42
es mov ax, [di+42]
mov bx, ax
pop ax
cmp ax, bx
jae ROTULO1282
jmp ROTULO1283
ROTULO1282:
mov ax, 65535
jmp ROTULO1284
ROTULO1283:
xor ax, ax
ROTULO1284:
cmp ax, 0
jne ROTULO1280
jmp ROTULO1281
ROTULO1280:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:287:17 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:287:33 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:287:20 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 42
es mov ax, [di+42]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:287:35 ===---
mov ax, 1024
mov bx, ax
pop ax
cmp ax, bx
jb ROTULO1287
jmp ROTULO1288
ROTULO1287:
mov ax, 65535
jmp ROTULO1289
ROTULO1288:
xor ax, ax
ROTULO1289:
cmp ax, 0
jne ROTULO1285
jmp ROTULO1286
ROTULO1285:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:287:45 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:287:52 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-10]
jmp ROTULO1273
ROTULO1286:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:288:17 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:288:55 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:288:57 ===---
mov ax, 1
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:288:40 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 50
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+50]
pop bx
add ax, bx
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:288:37 ===---
; ACAO LEITURA - Le ponteiro
push es
push di
push cs
call _minixfs_readblockfromstream
add sp, 6
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:289:17 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:289:33 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:289:20 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 42
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+42]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:289:36 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO1292
jmp ROTULO1293
ROTULO1292:
mov ax, 65535
jmp ROTULO1294
ROTULO1293:
xor ax, ax
ROTULO1294:
cmp ax, 0
jne ROTULO1290
jmp ROTULO1291
ROTULO1290:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:289:43 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:289:50 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-10]
jmp ROTULO1273
ROTULO1291:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:290:18 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:290:34 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:290:36 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 48
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+48]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:290:25 ===---
; ACAO STRUCTURE - Leitura de Desvio de Ponteiro
es mov ax, [di+38]
pop bx
add ax, bx
mov [bp+-4], ax
ROTULO1281:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:292:13 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:292:21 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-4+2]
pop es
mov di, [bp+-4]
xor ax, ax
es mov al, [di+0]
mov [bp+-8], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:293:13 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:293:20 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-8]
push word [bp+10+2]
pop es
mov di, [bp+10]
es mov [di+0], al
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:294:14 ===---
; ACAO INC - Incrementa variavel
inc word [bp+10]
inc di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:295:14 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-4]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:296:13 ===---
; ACAO STRUCTURE - Incremento de ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
es inc word [di+48]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:297:13 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-10]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:285:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-6]
jmp ROTULO1274
ROTULO1276:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:299:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:299:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-10]
jmp ROTULO1273
ROTULO1273:
mov sp, bp
pop bp
FIM_minixfs_readraw:
retf
; MODULO FIM: minixfs
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.File.hcb:36:8 ===---
; MODULO: directoryinfo
_directoryinfo:
db 18
db 83,121,115,116,101,109,46,73,79,46,70,105,108,101,46,104,99,98
db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.File.hcb:37:16 ===---
_directoryinfo_initialize:
push bp
mov bp, sp
sub sp, 4
push cs
call _os_stackcheck
; ARG: dir TAM: 4 POS: BP+6 
; ARG: ptr TAM: 4 POS: BP--4 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.File.hcb:37:27 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.File.hcb:39:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.File.hcb:38:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.File.hcb:38:20 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
es pop word [di+35]
es pop word [di+35+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.File.hcb:40:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.File.hcb:40:15 ===---
; ACAO LEITURA - Le ponteiro
push es
pop word [bp+-4+2]
mov [bp+-4], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.File.hcb:41:9 ===---
; ACAO GRAVACAO - Gravacao de numero em ponteiro
es mov byte [di+0], 32
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.File.hcb:42:10 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-4]
inc di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.File.hcb:43:9 ===---
; ACAO GRAVACAO - Gravacao de numero em ponteiro
push word [bp+-4+2]
pop es
mov di, [bp+-4]
es mov byte [di+0], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.File.hcb:44:10 ===---
; ACAO GRAVACAO - Grava segmento em variavel
mov word [bp+-4+2], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.File.hcb:45:10 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-4], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.File.hcb:46:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.File.hcb:46:33 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-4+2]
pop es
mov di, [bp+-4]
push es
push di
push word [bp+6+2]
pop es
mov di, [bp+6]
es pop word [di+39]
es pop word [di+39+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.File.hcb:47:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.File.hcb:47:27 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-4+2]
pop es
mov di, [bp+-4]
push es
push di
push word [bp+6+2]
pop es
mov di, [bp+6]
es pop word [di+43]
es pop word [di+43+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.File.hcb:48:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.File.hcb:48:32 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-4+2]
pop es
mov di, [bp+-4]
push es
push di
push word [bp+6+2]
pop es
mov di, [bp+6]
es pop word [di+47]
es pop word [di+47+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
ROTULO1295:
mov sp, bp
pop bp
FIM_directoryinfo_initialize:
retf
; MODULO FIM: directoryinfo
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.File.hcb:20:8 ===---
; MODULO: fileinfo
_fileinfo:
db 18
db 83,121,115,116,101,109,46,73,79,46,70,105,108,101,46,104,99,98
db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.File.hcb:21:16 ===---
_fileinfo_initialize:
push bp
mov bp, sp
sub sp, 4
push cs
call _os_stackcheck
; ARG: dir TAM: 4 POS: BP+6 
; ARG: ptr TAM: 4 POS: BP--4 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.File.hcb:21:27 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.File.hcb:23:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.File.hcb:22:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.File.hcb:22:20 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
es pop word [di+35]
es pop word [di+35+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.File.hcb:25:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.File.hcb:25:15 ===---
; ACAO LEITURA - Le ponteiro
push es
pop word [bp+-4+2]
mov [bp+-4], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.File.hcb:26:9 ===---
; ACAO GRAVACAO - Gravacao de numero em ponteiro
es mov byte [di+0], 32
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.File.hcb:27:10 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-4]
inc di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.File.hcb:28:9 ===---
; ACAO GRAVACAO - Gravacao de numero em ponteiro
push word [bp+-4+2]
pop es
mov di, [bp+-4]
es mov byte [di+0], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.File.hcb:29:10 ===---
; ACAO GRAVACAO - Grava segmento em variavel
mov word [bp+-4+2], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.File.hcb:30:10 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-4], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.File.hcb:31:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.File.hcb:31:33 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-4+2]
pop es
mov di, [bp+-4]
push es
push di
push word [bp+6+2]
pop es
mov di, [bp+6]
es pop word [di+39]
es pop word [di+39+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.File.hcb:32:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.File.hcb:32:20 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-4+2]
pop es
mov di, [bp+-4]
push es
push di
push word [bp+6+2]
pop es
mov di, [bp+6]
es pop word [di+43]
es pop word [di+43+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
ROTULO1296:
mov sp, bp
pop bp
FIM_fileinfo_initialize:
retf
; MODULO FIM: fileinfo
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:21:8 ===---
; MODULO: stream
_stream:
db 20
db 83,121,115,116,101,109,46,73,79,46,83,116,114,101,97,109,46,104,99,98
db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:22:16 ===---
_stream_initialize:
push bp
mov bp, sp
sub sp, 4
push cs
call _os_stackcheck
; ARG: s TAM: 4 POS: BP+6 
; ARG: ptr TAM: 4 POS: BP--4 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:22:27 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:23:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:24:10 ===---
; ACAO GRAVACAO - Grava segmento em variavel
mov word [bp+-4+2], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:25:10 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-4], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:26:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:26:16 ===---
xor ax, ax
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov [di+0], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:27:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:27:18 ===---
push cs
pop es
mov di, _stream_genericread
push es
push di
push word [bp+6+2]
pop es
mov di, [bp+6]
es pop word [di+6]
es pop word [di+6+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:28:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:28:21 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-4+2]
pop es
mov di, [bp+-4]
push es
push di
push word [bp+6+2]
pop es
mov di, [bp+6]
es pop word [di+2]
es pop word [di+2+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:29:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:29:19 ===---
push cs
pop es
mov di, _stream_genericwrite
push es
push di
push word [bp+6+2]
pop es
mov di, [bp+6]
es pop word [di+14]
es pop word [di+14+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:30:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:30:22 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-4+2]
pop es
mov di, [bp+-4]
push es
push di
push word [bp+6+2]
pop es
mov di, [bp+6]
es pop word [di+10]
es pop word [di+10+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:31:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:31:19 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-4+2]
pop es
mov di, [bp+-4]
push es
push di
push word [bp+6+2]
pop es
mov di, [bp+6]
es pop word [di+18]
es pop word [di+18+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:32:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:32:25 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-4+2]
pop es
mov di, [bp+-4]
push es
push di
push word [bp+6+2]
pop es
mov di, [bp+6]
es pop word [di+22]
es pop word [di+22+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:33:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:33:23 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-4+2]
pop es
mov di, [bp+-4]
push es
push di
push word [bp+6+2]
pop es
mov di, [bp+6]
es pop word [di+26]
es pop word [di+26+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:34:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:34:21 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-4+2]
pop es
mov di, [bp+-4]
push es
push di
push word [bp+6+2]
pop es
mov di, [bp+6]
es pop word [di+30]
es pop word [di+30+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:35:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:35:20 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-4+2]
pop es
mov di, [bp+-4]
push es
push di
push word [bp+6+2]
pop es
mov di, [bp+6]
es pop word [di+38]
es pop word [di+38+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:36:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:36:26 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-4+2]
pop es
mov di, [bp+-4]
push es
push di
push word [bp+6+2]
pop es
mov di, [bp+6]
es pop word [di+44]
es pop word [di+44+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:37:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:37:26 ===---
xor ax, ax
es mov [di+50], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:38:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:38:22 ===---
xor ax, ax
es mov [di+48], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:39:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:39:24 ===---
xor ax, ax
es mov [di+42], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
ROTULO1297:
mov sp, bp
pop bp
FIM_stream_initialize:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:42:14 ===---
_stream_genericread:
push bp
mov bp, sp
sub sp, 2
push cs
call _os_stackcheck
; ARG: s TAM: 4 POS: BP+6 
; ARG: text TAM: 4 POS: BP+10 
; ARG: len TAM: 2 POS: BP--2 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:42:26 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:42:39 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:43:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:44:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:44:15 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+10+2]
pop es
mov di, [bp+10]
xor ax, ax
es mov al, [di+0]
mov [bp+-2], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:45:10 ===---
; ACAO INC - Incrementa variavel
inc word [bp+10]
inc di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:46:9 ===---
; ACAO GRAVACAO - Gravacao de numero em ponteiro
push word [bp+10+2]
pop es
mov di, [bp+10]
es mov byte [di+0], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:47:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:47:16 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:47:33 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:47:27 ===---
; ACAO LEITURA - Le ponteiro
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:47:24 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
push cs
call _stream_readraw
add sp, 10
jmp ROTULO1298
ROTULO1298:
mov sp, bp
pop bp
FIM_stream_genericread:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:50:14 ===---
_stream_genericwrite:
push bp
mov bp, sp
sub sp, 2
push cs
call _os_stackcheck
; ARG: s TAM: 4 POS: BP+6 
; ARG: text TAM: 4 POS: BP+10 
; ARG: len TAM: 2 POS: BP--2 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:50:27 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:50:40 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:51:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:52:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:52:15 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:52:29 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+10+2]
pop es
mov di, [bp+10]
push es
push di
push cs
call _string_length
add sp, 4
mov [bp+-2], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:53:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:53:16 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:53:12 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:53:18 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+10+2]
pop es
mov di, [bp+10]
xor ax, ax
es mov al, [di+0]
mov bx, ax
pop ax
cmp ax, bx
ja ROTULO1302
jmp ROTULO1303
ROTULO1302:
mov ax, 65535
jmp ROTULO1304
ROTULO1303:
xor ax, ax
ROTULO1304:
cmp ax, 0
jne ROTULO1300
jmp ROTULO1301
ROTULO1300:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:53:34 ===---
mov ax, _stream
mov [bp+-8], ax
mov ax, 53
mov [bp+-10], ax
mov ax, 4
cs jmp word [_os_trycode]
ROTULO1301:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:54:10 ===---
; ACAO INC - Incrementa variavel
inc word [bp+10]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:55:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:55:16 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:55:34 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:55:28 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+10+2]
pop es
mov di, [bp+10]
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:55:25 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
push cs
call _stream_writeraw
add sp, 10
jmp ROTULO1299
ROTULO1299:
mov sp, bp
pop bp
FIM_stream_genericwrite:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:59:21 ===---
_stream_readraw:
push bp
mov bp, sp
; ARG: s TAM: 4 POS: BP+6 
; ARG: data TAM: 4 POS: BP+10 
; ARG: len TAM: 2 POS: BP+14 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:59:29 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:59:42 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:59:64 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:60:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:60:23 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:60:13 ===---
; ACAO STRUCTURE - Leitura de Segmento de Ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+4]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:60:26 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO1308
jmp ROTULO1309
ROTULO1308:
mov ax, 65535
jmp ROTULO1310
ROTULO1309:
xor ax, ax
ROTULO1310:
cmp ax, 0
jne ROTULO1306
jmp ROTULO1307
ROTULO1306:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:60:39 ===---
mov ax, _stream
mov [bp+-8], ax
mov ax, 60
mov [bp+-10], ax
mov ax, 7
cs jmp word [_os_trycode]
ROTULO1307:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:61:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:61:16 ===---
; ACAO CHAMADA - Chama indiretamente usando Invoke
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:61:39 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+14]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:61:33 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+10+2]
pop es
mov di, [bp+10]
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:61:16 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
es call far [di+2]
add sp, 10
jmp ROTULO1305
ROTULO1305:
mov sp, bp
pop bp
FIM_stream_readraw:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:64:21 ===---
_stream_read:
push bp
mov bp, sp
; ARG: s TAM: 4 POS: BP+6 
; ARG: data TAM: 4 POS: BP+10 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:64:26 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:64:39 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:65:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:65:20 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:65:13 ===---
; ACAO STRUCTURE - Leitura de Segmento de Ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+8]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:65:23 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO1314
jmp ROTULO1315
ROTULO1314:
mov ax, 65535
jmp ROTULO1316
ROTULO1315:
xor ax, ax
ROTULO1316:
cmp ax, 0
jne ROTULO1312
jmp ROTULO1313
ROTULO1312:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:65:36 ===---
mov ax, _stream
mov [bp+-8], ax
mov ax, 65
mov [bp+-10], ax
mov ax, 7
cs jmp word [_os_trycode]
ROTULO1313:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:66:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:66:16 ===---
; ACAO CHAMADA - Chama indiretamente usando Invoke
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:66:30 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+10+2]
pop es
mov di, [bp+10]
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:66:16 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
es call far [di+6]
add sp, 8
jmp ROTULO1311
ROTULO1311:
mov sp, bp
pop bp
FIM_stream_read:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:69:21 ===---
_stream_writeraw:
push bp
mov bp, sp
; ARG: s TAM: 4 POS: BP+6 
; ARG: data TAM: 4 POS: BP+10 
; ARG: len TAM: 2 POS: BP+14 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:69:30 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:69:43 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:69:65 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:70:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:70:24 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:70:13 ===---
; ACAO STRUCTURE - Leitura de Segmento de Ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+12]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:70:27 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO1320
jmp ROTULO1321
ROTULO1320:
mov ax, 65535
jmp ROTULO1322
ROTULO1321:
xor ax, ax
ROTULO1322:
cmp ax, 0
jne ROTULO1318
jmp ROTULO1319
ROTULO1318:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:70:40 ===---
mov ax, _stream
mov [bp+-8], ax
mov ax, 70
mov [bp+-10], ax
mov ax, 7
cs jmp word [_os_trycode]
ROTULO1319:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:71:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:71:16 ===---
; ACAO CHAMADA - Chama indiretamente usando Invoke
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:71:40 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+14]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:71:34 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+10+2]
pop es
mov di, [bp+10]
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:71:16 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
es call far [di+10]
add sp, 10
jmp ROTULO1317
ROTULO1317:
mov sp, bp
pop bp
FIM_stream_writeraw:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:74:21 ===---
_stream_write:
push bp
mov bp, sp
; ARG: s TAM: 4 POS: BP+6 
; ARG: data TAM: 4 POS: BP+10 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:74:27 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:74:40 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:75:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:75:21 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:75:13 ===---
; ACAO STRUCTURE - Leitura de Segmento de Ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+16]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:75:24 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO1326
jmp ROTULO1327
ROTULO1326:
mov ax, 65535
jmp ROTULO1328
ROTULO1327:
xor ax, ax
ROTULO1328:
cmp ax, 0
jne ROTULO1324
jmp ROTULO1325
ROTULO1324:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:75:37 ===---
mov ax, _stream
mov [bp+-8], ax
mov ax, 75
mov [bp+-10], ax
mov ax, 7
cs jmp word [_os_trycode]
ROTULO1325:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:76:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:76:16 ===---
; ACAO CHAMADA - Chama indiretamente usando Invoke
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:76:31 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+10+2]
pop es
mov di, [bp+10]
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:76:16 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
es call far [di+14]
add sp, 8
jmp ROTULO1323
ROTULO1323:
mov sp, bp
pop bp
FIM_stream_write:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:79:21 ===---
_stream_close:
push bp
mov bp, sp
; ARG: s TAM: 4 POS: BP+6 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:79:27 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:80:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:80:21 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:80:13 ===---
; ACAO STRUCTURE - Leitura de Segmento de Ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+20]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:80:24 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO1332
jmp ROTULO1333
ROTULO1332:
mov ax, 65535
jmp ROTULO1334
ROTULO1333:
xor ax, ax
ROTULO1334:
cmp ax, 0
jne ROTULO1330
jmp ROTULO1331
ROTULO1330:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:80:37 ===---
mov ax, _stream
mov [bp+-8], ax
mov ax, 80
mov [bp+-10], ax
mov ax, 7
cs jmp word [_os_trycode]
ROTULO1331:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:81:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:81:16 ===---
; ACAO CHAMADA - Chama indiretamente usando Invoke
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:81:16 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
es call far [di+18]
add sp, 4
jmp ROTULO1329
ROTULO1329:
mov sp, bp
pop bp
FIM_stream_close:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:84:21 ===---
_stream_seekcurrent:
push bp
mov bp, sp
; ARG: s TAM: 4 POS: BP+6 
; ARG: position TAM: 2 POS: BP+10 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:84:33 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:84:46 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:85:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:85:27 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:85:13 ===---
; ACAO STRUCTURE - Leitura de Segmento de Ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+24]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:85:30 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO1338
jmp ROTULO1339
ROTULO1338:
mov ax, 65535
jmp ROTULO1340
ROTULO1339:
xor ax, ax
ROTULO1340:
cmp ax, 0
jne ROTULO1336
jmp ROTULO1337
ROTULO1336:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:85:43 ===---
mov ax, _stream
mov [bp+-8], ax
mov ax, 85
mov [bp+-10], ax
mov ax, 7
cs jmp word [_os_trycode]
ROTULO1337:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:86:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:86:16 ===---
; ACAO CHAMADA - Chama indiretamente usando Invoke
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:86:37 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:86:16 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
es call far [di+22]
add sp, 6
jmp ROTULO1335
ROTULO1335:
mov sp, bp
pop bp
FIM_stream_seekcurrent:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:89:21 ===---
_stream_seekend:
push bp
mov bp, sp
; ARG: s TAM: 4 POS: BP+6 
; ARG: pos TAM: 2 POS: BP+10 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:89:29 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:89:42 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:90:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:90:23 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:90:13 ===---
; ACAO STRUCTURE - Leitura de Segmento de Ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+32]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:90:26 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO1344
jmp ROTULO1345
ROTULO1344:
mov ax, 65535
jmp ROTULO1346
ROTULO1345:
xor ax, ax
ROTULO1346:
cmp ax, 0
jne ROTULO1342
jmp ROTULO1343
ROTULO1342:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:90:39 ===---
mov ax, _stream
mov [bp+-8], ax
mov ax, 90
mov [bp+-10], ax
mov ax, 7
cs jmp word [_os_trycode]
ROTULO1343:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:91:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:91:16 ===---
; ACAO CHAMADA - Chama indiretamente usando Invoke
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:91:33 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:91:16 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
es call far [di+30]
add sp, 6
jmp ROTULO1341
ROTULO1341:
mov sp, bp
pop bp
FIM_stream_seekend:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:94:21 ===---
_stream_seekstart:
push bp
mov bp, sp
; ARG: s TAM: 4 POS: BP+6 
; ARG: pos TAM: 2 POS: BP+10 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:94:31 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:94:44 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:95:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:95:25 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:95:13 ===---
; ACAO STRUCTURE - Leitura de Segmento de Ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+28]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:95:28 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO1350
jmp ROTULO1351
ROTULO1350:
mov ax, 65535
jmp ROTULO1352
ROTULO1351:
xor ax, ax
ROTULO1352:
cmp ax, 0
jne ROTULO1348
jmp ROTULO1349
ROTULO1348:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:95:41 ===---
mov ax, _stream
mov [bp+-8], ax
mov ax, 95
mov [bp+-10], ax
mov ax, 7
cs jmp word [_os_trycode]
ROTULO1349:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:96:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:96:16 ===---
; ACAO CHAMADA - Chama indiretamente usando Invoke
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:96:35 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Stream.hcb:96:16 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
es call far [di+26]
add sp, 6
jmp ROTULO1347
ROTULO1347:
mov sp, bp
pop bp
FIM_stream_seekstart:
retf
; MODULO FIM: stream
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/Config.hcb:3:8 ===---
; MODULO: config
_config:
db 10
db 67,111,110,102,105,103,46,104,99,98
db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/Config.hcb:4:16 ===---
_config_rootfilesystem:
times 4 db 0
db 255
times 255 db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/Config.hcb:5:16 ===---
_config_rootdisk:
times 4 db 0
db 255
times 255 db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/Config.hcb:7:16 ===---
_config_parseargs:
push bp
mov bp, sp
; ARG: args TAM: 4 POS: BP+6 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/Config.hcb:7:26 ===---
ROTULO1353:
mov sp, bp
pop bp
FIM_config_parseargs:
retf
; MODULO FIM: config
REALOC_TABLE:
dw 3
dw _multithreading_kernelthread
dw 4
dw 0
dw 3
dw _multithreading_inuse
dw 4
dw 0
dw 3
dw _memory_inuse
dw 4
dw 0
dw 3
dw _globalmemory_inuse
dw 4
dw 0
dw 3
dw _disk_disks
dw 4
dw 0
dw 3
dw _filesystem_fslist
dw 4
dw 0
dw 3
dw _filesystem_mountlist
dw 4
dw 0
dw 3
dw _filesystem_root
dw 4
dw 0
dw 3
dw _biosdisk_buffer
dw 4
dw 0
dw 3
dw _biosdisk_inuse
dw 4
dw 0
dw 3
dw _minixfs_inuse
dw 4
dw 0
dw 3
dw _config_rootfilesystem
dw 4
dw 0
dw 3
dw _config_rootdisk
dw 4
dw 0
dw 0
dw 0
dw 0
dw 0
END:
