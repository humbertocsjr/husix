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
;     ---=== husix.hcb:16:8 ===---
; MODULO: program
_program:
db 9
db 104,117,115,105,120,46,104,99,98
db 0
;     ---=== husix.hcb:18:9 ===---
_program_writedot:
;     ---=== husix.hcb:19:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:19:23 ===---
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
;     ---=== husix.hcb:22:16 ===---
_program_main:
push bp
mov bp, sp
sub sp, 30
push cs
call _os_stackcheck
; ARG: args TAM: 4 POS: BP+6 
; ARG: ptr TAM: 4 POS: BP--14 
; ARG: ver TAM: 4 POS: BP--18 
; ARG: disk TAM: 4 POS: BP--22 
; ARG: root TAM: 4 POS: BP--26 
; ARG: dir TAM: 4 POS: BP--30 
;     ---=== husix.hcb:22:21 ===---
;     ---=== husix.hcb:23:13 ===---
;     ---=== husix.hcb:24:13 ===---
;     ---=== husix.hcb:62:13 ===---
;     ---=== husix.hcb:78:13 ===---
;     ---=== husix.hcb:80:13 ===---
;     ---=== husix.hcb:25:9 ===---
; ACAO STRUCTURE - Aloca estrutura na pilha
sub sp, 10
push ss
pop es
mov di, sp
push es
pop word [bp+-18+2]
mov [bp+-18], di
;     ---=== husix.hcb:26:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:26:33 ===---
; ACAO LEITURA - Le ponteiro
push es
push di
push cs
call _husixversion_getversion
add sp, 4
;     ---=== husix.hcb:27:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _console_initialize
;     ---=== husix.hcb:28:9 ===---
;     ---=== husix.hcb:28:12 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _console_cantextonly
cmp ax, 0
jne ROTULO92
jmp ROTULO93
ROTULO92:
;     ---=== husix.hcb:29:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:29:92 ===---
xor ax, ax
push ax
;     ---=== husix.hcb:29:79 ===---
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
;     ---=== husix.hcb:29:24 ===---
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
;     ---=== husix.hcb:31:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _console_mode80x25x4
;     ---=== husix.hcb:32:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:32:27 ===---
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
;     ---=== husix.hcb:33:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:33:23 ===---
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
;     ---=== husix.hcb:34:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:34:29 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 0
push word [bp+-18+2]
pop es
mov di, [bp+-18]
es mov ax, [di+0]
push ax
push cs
call _console_writeuint16
add sp, 2
;     ---=== husix.hcb:35:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:35:23 ===---
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
;     ---=== husix.hcb:36:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:36:29 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 2
push word [bp+-18+2]
pop es
mov di, [bp+-18]
es mov ax, [di+2]
push ax
push cs
call _console_writeuint16
add sp, 2
;     ---=== husix.hcb:37:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:37:23 ===---
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
;     ---=== husix.hcb:38:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:38:29 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 4
push word [bp+-18+2]
pop es
mov di, [bp+-18]
es mov ax, [di+4]
push ax
push cs
call _console_writeuint16
add sp, 2
;     ---=== husix.hcb:39:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:39:23 ===---
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
;     ---=== husix.hcb:40:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:40:27 ===---
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
;     ---=== husix.hcb:41:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:41:23 ===---
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
;     ---=== husix.hcb:42:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _multithreading_preinitialize
;     ---=== husix.hcb:43:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _program_writedot
;     ---=== husix.hcb:44:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _globalmemory_initialize
;     ---=== husix.hcb:45:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _program_writedot
;     ---=== husix.hcb:46:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _memory_initialize
;     ---=== husix.hcb:47:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _program_writedot
;     ---=== husix.hcb:48:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _multithreading_initialize
;     ---=== husix.hcb:49:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _program_writedot
;     ---=== husix.hcb:50:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _systemtimer_initialize
;     ---=== husix.hcb:51:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _program_writedot
;     ---=== husix.hcb:52:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _multithreading_resume
;     ---=== husix.hcb:53:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _program_writedot
;     ---=== husix.hcb:54:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _disk_initialize
;     ---=== husix.hcb:55:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _program_writedot
;     ---=== husix.hcb:56:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _filesystem_initialize
;     ---=== husix.hcb:57:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _program_writedot
;     ---=== husix.hcb:58:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:58:27 ===---
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
;     ---=== husix.hcb:60:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _configdefault_initialize
;     ---=== husix.hcb:63:9 ===---
; ACAO STRUCTURE - Associa texto em estrutura
; ACAO GRAVACAO - Gravacao de texto em ponteiro
jmp ROTULO112
ROTULO113:
db 11
db 66,73,79,83,68,105,115,107,48,48,48
times 1 db 0
ROTULO112:
mov ax, cs
mov word [bp+-22+2], ax
mov ax, ROTULO113
mov [bp+-22], ax
;     ---=== husix.hcb:64:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:64:23 ===---
push cs
pop es
mov di, ROTULO115
jmp ROTULO114
ROTULO115:
db 10
db 77,111,117,110,116,105,110,103,32,91
times 1 db 0
ROTULO114:
push es
push di
push cs
call _console_write
add sp, 4
;     ---=== husix.hcb:65:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:65:23 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-22+2]
pop es
mov di, [bp+-22]
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
mov di, ROTULO117
jmp ROTULO116
ROTULO117:
db 1
db 93
times 1 db 0
ROTULO116:
push es
push di
push cs
call _console_write
add sp, 4
;     ---=== husix.hcb:67:9 ===---
;     ---=== husix.hcb:67:29 ===---
;     ---=== husix.hcb:67:12 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:67:23 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-22+2]
pop es
mov di, [bp+-22]
push es
push di
push cs
call _disk_exist
add sp, 4
push ax
;     ---=== husix.hcb:67:32 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO120
jmp ROTULO121
ROTULO120:
mov ax, 65535
jmp ROTULO122
ROTULO121:
xor ax, ax
ROTULO122:
cmp ax, 0
jne ROTULO118
jmp ROTULO119
ROTULO118:
;     ---=== husix.hcb:68:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:68:52 ===---
xor ax, ax
push ax
;     ---=== husix.hcb:68:46 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-22+2]
pop es
mov di, [bp+-22]
push es
push di
;     ---=== husix.hcb:68:24 ===---
push cs
pop es
mov di, ROTULO124
jmp ROTULO123
ROTULO124:
db 18
db 91,32,68,73,83,75,32,78,79,84,32,70,79,85,78,68,32,93
times 1 db 0
ROTULO123:
push es
push di
push cs
call _program_fatalerror
add sp, 10
ROTULO119:
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
mov ax, ROTULO125
cs mov [_os_trycode], ax
;     ---=== husix.hcb:72:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:72:47 ===---
push cs
pop es
mov di, ROTULO128
jmp ROTULO127
ROTULO128:
db 1
db 47
times 1 db 0
ROTULO127:
push es
push di
;     ---=== husix.hcb:72:36 ===---
push cs
pop es
mov di, ROTULO130
jmp ROTULO129
ROTULO130:
db 7
db 77,105,110,105,120,70,83
times 1 db 0
ROTULO129:
push es
push di
;     ---=== husix.hcb:72:30 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-22+2]
pop es
mov di, [bp+-22]
push es
push di
push cs
call _filesystem_mount
add sp, 12
jmp ROTULO126
ROTULO125:
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
;     ---=== husix.hcb:74:55 ===---
xor ax, ax
push ax
;     ---=== husix.hcb:74:49 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-22+2]
pop es
mov di, [bp+-22]
push es
push di
;     ---=== husix.hcb:74:24 ===---
push cs
pop es
mov di, ROTULO134
jmp ROTULO133
ROTULO134:
db 21
db 91,32,68,73,83,75,32,78,79,84,32,70,79,82,77,65,84,69,68,32,93
times 1 db 0
ROTULO133:
push es
push di
push cs
call _program_fatalerror
add sp, 10
jmp ROTULO126
ROTULO132:
cs jmp word [_os_tryfatal]
ROTULO126:
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
mov di, ROTULO136
jmp ROTULO135
ROTULO136:
db 7
db 32,91,32,79,75,32,93
times 1 db 0
ROTULO135:
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
pop word [bp+-26+2]
mov [bp+-26], di
;     ---=== husix.hcb:81:9 ===---
; ACAO STRUCTURE - Aloca estrutura na pilha
sub sp, 51
push ss
pop es
mov di, sp
push es
pop word [bp+-30+2]
mov [bp+-30], di
;     ---=== husix.hcb:82:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:82:28 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-26+2]
pop es
mov di, [bp+-26]
push es
push di
push cs
call _filesystem_getroot
add sp, 4
;     ---=== husix.hcb:83:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:83:46 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-30+2]
pop es
mov di, [bp+-30]
push es
push di
;     ---=== husix.hcb:83:43 ===---
mov ax, 2
push ax
;     ---=== husix.hcb:83:37 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-26+2]
pop es
mov di, [bp+-26]
push es
push di
push cs
call _filesystem_getdirectoryinfo
add sp, 10
;     ---=== husix.hcb:84:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:84:27 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - Ponteiro Byte - Desvio 35
push word [bp+-30+2]
pop es
mov di, [bp+-30]
es push word [di+35+2]
es push word [di+35]
pop di
pop es
push es
push di
push cs
call _console_writeline
add sp, 4
;     ---=== husix.hcb:86:9 ===---
ROTULO137:
;     ---=== husix.hcb:86:15 ===---
mov ax, 1
cmp ax, 0
jne ROTULO138
jmp ROTULO139
ROTULO138:
;     ---=== husix.hcb:87:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:87:31 ===---
mov ax, 13
xor ah, ah
push ax
push cs
call _console_writechar
add sp, 2
;     ---=== husix.hcb:88:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:88:33 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_clock_minute]
push ax
push cs
call _console_writeuint16
add sp, 2
;     ---=== husix.hcb:89:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:89:27 ===---
push cs
pop es
mov di, ROTULO141
jmp ROTULO140
ROTULO141:
db 1
db 58
times 1 db 0
ROTULO140:
push es
push di
push cs
call _console_write
add sp, 4
;     ---=== husix.hcb:90:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:90:33 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_clock_second]
push ax
push cs
call _console_writeuint16
add sp, 2
;     ---=== husix.hcb:91:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:91:26 ===---
mov ax, 1000
push ax
push cs
call _thread_sleep
add sp, 2
jmp ROTULO137
ROTULO139:
ROTULO91:
mov sp, bp
pop bp
FIM_program_main:
retf
;     ---=== husix.hcb:95:16 ===---
_program_fatalerror:
push bp
mov bp, sp
; ARG: msg TAM: 4 POS: BP+6 
; ARG: file TAM: 4 POS: BP+10 
; ARG: line TAM: 2 POS: BP+14 
;     ---=== husix.hcb:95:27 ===---
;     ---=== husix.hcb:95:42 ===---
;     ---=== husix.hcb:95:58 ===---
;     ---=== husix.hcb:96:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _console_mode80x25x4
;     ---=== husix.hcb:97:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:97:27 ===---
push cs
pop es
mov di, ROTULO144
jmp ROTULO143
ROTULO144:
db 12
db 70,65,84,65,76,32,69,82,82,79,82,58
times 1 db 0
ROTULO143:
push es
push di
push cs
call _console_writeline
add sp, 4
;     ---=== husix.hcb:98:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:98:23 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+10+2]
pop es
mov di, [bp+10]
push es
push di
push cs
call _console_write
add sp, 4
;     ---=== husix.hcb:99:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:99:23 ===---
push cs
pop es
mov di, ROTULO146
jmp ROTULO145
ROTULO146:
db 1
db 58
times 1 db 0
ROTULO145:
push es
push di
push cs
call _console_write
add sp, 4
;     ---=== husix.hcb:100:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:100:29 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+14]
push ax
push cs
call _console_writeuint16
add sp, 2
;     ---=== husix.hcb:101:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:101:27 ===---
push cs
pop es
mov di, ROTULO148
jmp ROTULO147
ROTULO148:
db 1
db 58
times 1 db 0
ROTULO147:
push es
push di
push cs
call _console_writeline
add sp, 4
;     ---=== husix.hcb:102:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:102:27 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
push cs
call _console_writeline
add sp, 4
;     ---=== husix.hcb:103:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:103:27 ===---
push cs
pop es
mov di, ROTULO150
jmp ROTULO149
ROTULO150:
db 0
times 1 db 0
ROTULO149:
push es
push di
push cs
call _console_writeline
add sp, 4
;     ---=== husix.hcb:104:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:104:27 ===---
push cs
pop es
mov di, ROTULO152
jmp ROTULO151
ROTULO152:
db 15
db 60,83,89,83,84,69,77,32,72,65,76,84,69,68,62
times 1 db 0
ROTULO151:
push es
push di
push cs
call _console_writeline
add sp, 4
;     ---=== husix.hcb:105:9 ===---
ROTULO153:
;     ---=== husix.hcb:105:15 ===---
mov ax, 1
cmp ax, 0
jne ROTULO154
jmp ROTULO155
ROTULO154:
;     ---=== husix.hcb:106:17 ===---
cli
;     ---=== husix.hcb:107:17 ===---
hlt
jmp ROTULO153
ROTULO155:
ROTULO142:
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
jae ROTULO157
jmp ROTULO158
ROTULO157:
mov ax, 65535
jmp ROTULO159
ROTULO158:
xor ax, ax
ROTULO159:
jmp ROTULO156
ROTULO156:
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
jae ROTULO161
jmp ROTULO162
ROTULO161:
mov ax, 65535
jmp ROTULO163
ROTULO162:
xor ax, ax
ROTULO163:
jmp ROTULO160
ROTULO160:
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
jae ROTULO165
jmp ROTULO166
ROTULO165:
mov ax, 65535
jmp ROTULO167
ROTULO166:
xor ax, ax
ROTULO167:
jmp ROTULO164
ROTULO164:
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
jae ROTULO169
jmp ROTULO170
ROTULO169:
mov ax, 65535
jmp ROTULO171
ROTULO170:
xor ax, ax
ROTULO171:
jmp ROTULO168
ROTULO168:
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
je ROTULO173
jmp ROTULO174
ROTULO173:
mov ax, 65535
jmp ROTULO175
ROTULO174:
xor ax, ax
ROTULO175:
jmp ROTULO172
ROTULO172:
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
je ROTULO182
jmp ROTULO183
ROTULO182:
mov ax, 65535
jmp ROTULO184
ROTULO183:
xor ax, ax
ROTULO184:
cmp ax, 0
jne ROTULO179
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
je ROTULO185
jmp ROTULO186
ROTULO185:
mov ax, 65535
jmp ROTULO187
ROTULO186:
xor ax, ax
ROTULO187:
cmp ax, 0
je ROTULO180
ROTULO179:
mov ax, 65535
jmp ROTULO181
ROTULO180:
xor ax, ax
ROTULO181:
cmp ax, 0
jne ROTULO177
jmp ROTULO178
ROTULO177:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:37:13 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_console_supportlevel], 3
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:38:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:38:18 ===---
xor ax, ax
jmp ROTULO176
ROTULO178:
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
jne ROTULO190
jmp ROTULO191
ROTULO190:
mov ax, 65535
jmp ROTULO192
ROTULO191:
xor ax, ax
ROTULO192:
cmp ax, 0
jne ROTULO188
jmp ROTULO189
ROTULO188:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:46:13 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_console_supportlevel], 2
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:47:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:47:18 ===---
xor ax, ax
jmp ROTULO176
ROTULO189:
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
je ROTULO195
jmp ROTULO196
ROTULO195:
mov ax, 65535
jmp ROTULO197
ROTULO196:
xor ax, ax
ROTULO197:
cmp ax, 0
jne ROTULO193
jmp ROTULO194
ROTULO193:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:56:13 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_console_supportlevel], 1
jmp ROTULO198
ROTULO194:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:58:13 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_console_supportlevel], 0
ROTULO198:
ROTULO176:
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
ROTULO199:
FIM_console_mode80x25x4:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:66:21 ===---
_console_readchar:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:67:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:67:16 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _io_consolereadchar
jmp ROTULO200
ROTULO200:
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
ROTULO202:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:78:15 ===---
mov ax, 1
cmp ax, 0
jne ROTULO203
jmp ROTULO204
ROTULO203:
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
je ROTULO207
jmp ROTULO208
ROTULO207:
mov ax, 65535
jmp ROTULO209
ROTULO208:
xor ax, ax
ROTULO209:
cmp ax, 0
jne ROTULO205
jmp ROTULO206
ROTULO205:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:80:34 ===---
jmp done
ROTULO206:
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
je ROTULO212
jmp ROTULO213
ROTULO212:
mov ax, 65535
jmp ROTULO214
ROTULO213:
xor ax, ax
ROTULO214:
cmp ax, 0
jne ROTULO210
jmp ROTULO211
ROTULO210:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:81:34 ===---
jmp done
ROTULO211:
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
je ROTULO217
jmp ROTULO218
ROTULO217:
mov ax, 65535
jmp ROTULO219
ROTULO218:
xor ax, ax
ROTULO219:
cmp ax, 0
jne ROTULO215
jmp ROTULO216
ROTULO215:
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
ja ROTULO222
jmp ROTULO223
ROTULO222:
mov ax, 65535
jmp ROTULO224
ROTULO223:
xor ax, ax
ROTULO224:
cmp ax, 0
jne ROTULO220
jmp ROTULO221
ROTULO220:
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
ROTULO221:
jmp ROTULO225
ROTULO216:
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
jb ROTULO228
jmp ROTULO229
ROTULO228:
mov ax, 65535
jmp ROTULO230
ROTULO229:
xor ax, ax
ROTULO230:
cmp ax, 0
jne ROTULO226
jmp ROTULO227
ROTULO226:
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
ROTULO227:
ROTULO225:
jmp ROTULO202
ROTULO204:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:100:9 ===---
done:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:101:9 ===---
; ACAO GRAVACAO - Gravacao de numero em ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov byte [di+0], 0
ROTULO201:
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
ROTULO231:
mov sp, bp
pop bp
FIM_console_writechar:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:108:16 ===---
_console_write:
push bp
mov bp, sp
; ARG: txt TAM: 4 POS: BP+6 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:108:22 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:110:10 ===---
; ACAO INC - Incrementa variavel
inc word [bp+6]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:111:9 ===---
ROTULO233:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:111:19 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:111:15 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:111:21 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
ja ROTULO236
jmp ROTULO237
ROTULO236:
mov ax, 65535
jmp ROTULO238
ROTULO237:
xor ax, ax
ROTULO238:
cmp ax, 0
jne ROTULO234
jmp ROTULO235
ROTULO234:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:112:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:112:23 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:112:47 ===---
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
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:113:14 ===---
; ACAO INC - Incrementa variavel
inc word [bp+6]
jmp ROTULO233
ROTULO235:
ROTULO232:
mov sp, bp
pop bp
FIM_console_write:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:117:16 ===---
_console_writeline:
push bp
mov bp, sp
; ARG: txt TAM: 4 POS: BP+6 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:117:26 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:118:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:118:15 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
push cs
call _console_write
add sp, 4
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:119:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:119:19 ===---
mov ax, 13
xor ah, ah
push ax
push cs
call _console_writechar
add sp, 2
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:120:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:120:19 ===---
mov ax, 10
xor ah, ah
push ax
push cs
call _console_writechar
add sp, 2
ROTULO239:
mov sp, bp
pop bp
FIM_console_writeline:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:123:16 ===---
_console_writeuint16:
push bp
mov bp, sp
sub sp, 4
push cs
call _os_stackcheck
; ARG: nro TAM: 2 POS: BP+6 
; ARG: tmp TAM: 2 POS: BP--2 
; ARG: prox TAM: 2 POS: BP--4 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:123:28 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:124:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:125:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:126:13 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:126:23 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:126:19 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:126:27 ===---
mov ax, 10
cmp ax, 0
jne ROTULO241
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:126:27 ===---
mov ax, _console
mov [bp+-8], ax
mov ax, 126
mov [bp+-10], ax
mov ax, 1
cs jmp word [_os_trycode]
ROTULO241:
mov bx, ax
pop ax
xor dx, dx
div bx
mov ax, dx
mov [bp+-2], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:127:13 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:127:24 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:127:20 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:127:26 ===---
mov ax, 10
cmp ax, 0
jne ROTULO242
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:127:26 ===---
mov ax, _console
mov [bp+-8], ax
mov ax, 127
mov [bp+-10], ax
mov ax, 1
cs jmp word [_os_trycode]
ROTULO242:
mov bx, ax
pop ax
xor dx, dx
div bx
mov [bp+-4], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:128:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:128:17 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:128:12 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:128:19 ===---
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
jne ROTULO243
jmp ROTULO244
ROTULO243:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:128:26 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:128:38 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
push ax
push cs
call _console_writeuint16
add sp, 2
ROTULO244:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:129:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:129:22 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:129:24 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:129:19 ===---
mov ax, 48
pop bx
add ax, bx
xor ah, ah
push ax
push cs
call _console_writechar
add sp, 2
ROTULO240:
mov sp, bp
pop bp
FIM_console_writeuint16:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:132:16 ===---
_console_writeint16:
push bp
mov bp, sp
; ARG: nro TAM: 2 POS: BP+6 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:132:27 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:133:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:133:16 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:133:12 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:133:18 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
jl ROTULO251
jmp ROTULO252
ROTULO251:
mov ax, 65535
jmp ROTULO253
ROTULO252:
xor ax, ax
ROTULO253:
cmp ax, 0
jne ROTULO249
jmp ROTULO250
ROTULO249:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:134:17 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:134:23 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:134:24 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:134:23 ===---
xor ax, ax
pop bx
sub ax, bx
mov [bp+6], ax
ROTULO250:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:136:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:136:21 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
push ax
push cs
call _console_writeuint16
add sp, 2
ROTULO248:
mov sp, bp
pop bp
FIM_console_writeint16:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:139:16 ===---
_console_writeuint8:
push bp
mov bp, sp
; ARG: nro TAM: 2 POS: BP+6 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:139:27 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:140:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:140:21 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
push ax
push cs
call _console_writeuint16
add sp, 2
ROTULO254:
mov sp, bp
pop bp
FIM_console_writeuint8:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:143:16 ===---
_console_writeint8:
push bp
mov bp, sp
; ARG: nro TAM: 2 POS: BP+6 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:143:26 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:144:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Console.hcb:144:20 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
push ax
push cs
call _console_writeint16
add sp, 2
ROTULO255:
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
ROTULO256:
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
ROTULO257:
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
ROTULO258:
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
ROTULO259:
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
ROTULO260:
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
jmp ROTULO261
ROTULO261:
mov sp, bp
pop bp
FIM_io_gethandler:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:52:21 ===---
_io_consoleavail:
ROTULO262:
FIM_io_consoleavail:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:56:21 ===---
_io_consolereadchar:
ROTULO263:
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
ROTULO264:
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
ROTULO265:
mov sp, bp
pop bp
FIM_io_setvideomode:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:71:16 ===---
_io_disableinterrupts:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:72:13 ===---
cli
ROTULO266:
FIM_io_disableinterrupts:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:75:16 ===---
_io_enableinterrupts:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.hcb:76:13 ===---
sti
ROTULO267:
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
jb ROTULO271
jmp ROTULO272
ROTULO271:
mov ax, 65535
jmp ROTULO273
ROTULO272:
xor ax, ax
ROTULO273:
cmp ax, 0
jne ROTULO269
jmp ROTULO270
ROTULO269:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:4:25 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:4:32 ===---
mov ax, 1
jmp ROTULO268
ROTULO270:
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
jae ROTULO279
jmp ROTULO280
ROTULO279:
mov ax, 65535
jmp ROTULO281
ROTULO280:
xor ax, ax
ROTULO281:
cmp ax, 0
je ROTULO277
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
jbe ROTULO282
jmp ROTULO283
ROTULO282:
mov ax, 65535
jmp ROTULO284
ROTULO283:
xor ax, ax
ROTULO284:
cmp ax, 0
je ROTULO277
ROTULO276:
mov ax, 65535
jmp ROTULO278
ROTULO277:
xor ax, ax
ROTULO278:
cmp ax, 0
jne ROTULO274
jmp ROTULO275
ROTULO274:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:5:45 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:5:52 ===---
mov ax, 2
jmp ROTULO268
ROTULO275:
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
jae ROTULO290
jmp ROTULO291
ROTULO290:
mov ax, 65535
jmp ROTULO292
ROTULO291:
xor ax, ax
ROTULO292:
cmp ax, 0
je ROTULO288
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
jbe ROTULO293
jmp ROTULO294
ROTULO293:
mov ax, 65535
jmp ROTULO295
ROTULO294:
xor ax, ax
ROTULO295:
cmp ax, 0
je ROTULO288
ROTULO287:
mov ax, 65535
jmp ROTULO289
ROTULO288:
xor ax, ax
ROTULO289:
cmp ax, 0
jne ROTULO285
jmp ROTULO286
ROTULO285:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:6:45 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:6:52 ===---
mov ax, 3
jmp ROTULO268
ROTULO286:
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
jae ROTULO301
jmp ROTULO302
ROTULO301:
mov ax, 65535
jmp ROTULO303
ROTULO302:
xor ax, ax
ROTULO303:
cmp ax, 0
je ROTULO299
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
jbe ROTULO304
jmp ROTULO305
ROTULO304:
mov ax, 65535
jmp ROTULO306
ROTULO305:
xor ax, ax
ROTULO306:
cmp ax, 0
je ROTULO299
ROTULO298:
mov ax, 65535
jmp ROTULO300
ROTULO299:
xor ax, ax
ROTULO300:
cmp ax, 0
jne ROTULO296
jmp ROTULO297
ROTULO296:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:7:45 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:7:52 ===---
mov ax, 4
jmp ROTULO268
ROTULO297:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:8:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:8:16 ===---
mov ax, 1
jmp ROTULO268
ROTULO268:
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
jb ROTULO310
jmp ROTULO311
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
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:12:25 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:12:32 ===---
; ACAO LEITURA - Le ponteiro
xor ax, ax
es mov al, [di+0]
jmp ROTULO307
ROTULO309:
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
je ROTULO315
jmp ROTULO316
ROTULO315:
mov ax, 65535
jmp ROTULO317
ROTULO316:
xor ax, ax
ROTULO317:
cmp ax, 0
jne ROTULO313
jmp ROTULO314
ROTULO313:
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
je ROTULO320
jmp ROTULO321
ROTULO320:
mov ax, 65535
jmp ROTULO322
ROTULO321:
xor ax, ax
ROTULO322:
cmp ax, 0
jne ROTULO318
jmp ROTULO319
ROTULO318:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:15:31 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:15:38 ===---
mov ax, 128
jmp ROTULO307
ROTULO319:
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
je ROTULO325
jmp ROTULO326
ROTULO325:
mov ax, 65535
jmp ROTULO327
ROTULO326:
xor ax, ax
ROTULO327:
cmp ax, 0
jne ROTULO323
jmp ROTULO324
ROTULO323:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:16:31 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:16:38 ===---
mov ax, 135
jmp ROTULO307
ROTULO324:
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
je ROTULO330
jmp ROTULO331
ROTULO330:
mov ax, 65535
jmp ROTULO332
ROTULO331:
xor ax, ax
ROTULO332:
cmp ax, 0
jne ROTULO328
jmp ROTULO329
ROTULO328:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:17:31 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:17:38 ===---
mov ax, 65
jmp ROTULO307
ROTULO329:
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
je ROTULO335
jmp ROTULO336
ROTULO335:
mov ax, 65535
jmp ROTULO337
ROTULO336:
xor ax, ax
ROTULO337:
cmp ax, 0
jne ROTULO333
jmp ROTULO334
ROTULO333:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:18:31 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:18:38 ===---
mov ax, 97
jmp ROTULO307
ROTULO334:
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
je ROTULO340
jmp ROTULO341
ROTULO340:
mov ax, 65535
jmp ROTULO342
ROTULO341:
xor ax, ax
ROTULO342:
cmp ax, 0
jne ROTULO338
jmp ROTULO339
ROTULO338:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:19:31 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:19:38 ===---
mov ax, 79
jmp ROTULO307
ROTULO339:
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
je ROTULO345
jmp ROTULO346
ROTULO345:
mov ax, 65535
jmp ROTULO347
ROTULO346:
xor ax, ax
ROTULO347:
cmp ax, 0
jne ROTULO343
jmp ROTULO344
ROTULO343:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:20:31 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:20:38 ===---
mov ax, 162
jmp ROTULO307
ROTULO344:
ROTULO314:
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
je ROTULO350
jmp ROTULO351
ROTULO350:
mov ax, 65535
jmp ROTULO352
ROTULO351:
xor ax, ax
ROTULO352:
cmp ax, 0
jne ROTULO348
jmp ROTULO349
ROTULO348:
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
je ROTULO355
jmp ROTULO356
ROTULO355:
mov ax, 65535
jmp ROTULO357
ROTULO356:
xor ax, ax
ROTULO357:
cmp ax, 0
jne ROTULO353
jmp ROTULO354
ROTULO353:
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
je ROTULO360
jmp ROTULO361
ROTULO360:
mov ax, 65535
jmp ROTULO362
ROTULO361:
xor ax, ax
ROTULO362:
cmp ax, 0
jne ROTULO358
jmp ROTULO359
ROTULO358:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:26:35 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:26:42 ===---
mov ax, 1
jmp ROTULO307
ROTULO359:
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
je ROTULO365
jmp ROTULO366
ROTULO365:
mov ax, 65535
jmp ROTULO367
ROTULO366:
xor ax, ax
ROTULO367:
cmp ax, 0
jne ROTULO363
jmp ROTULO364
ROTULO363:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:27:35 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:27:42 ===---
mov ax, 2
jmp ROTULO307
ROTULO364:
ROTULO354:
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
je ROTULO370
jmp ROTULO371
ROTULO370:
mov ax, 65535
jmp ROTULO372
ROTULO371:
xor ax, ax
ROTULO372:
cmp ax, 0
jne ROTULO368
jmp ROTULO369
ROTULO368:
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
je ROTULO375
jmp ROTULO376
ROTULO375:
mov ax, 65535
jmp ROTULO377
ROTULO376:
xor ax, ax
ROTULO377:
cmp ax, 0
jne ROTULO373
jmp ROTULO374
ROTULO373:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:31:35 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:31:42 ===---
mov ax, 3
jmp ROTULO307
ROTULO374:
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
je ROTULO380
jmp ROTULO381
ROTULO380:
mov ax, 65535
jmp ROTULO382
ROTULO381:
xor ax, ax
ROTULO382:
cmp ax, 0
jne ROTULO378
jmp ROTULO379
ROTULO378:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:32:35 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:32:42 ===---
mov ax, 4
jmp ROTULO307
ROTULO379:
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
je ROTULO385
jmp ROTULO386
ROTULO385:
mov ax, 65535
jmp ROTULO387
ROTULO386:
xor ax, ax
ROTULO387:
cmp ax, 0
jne ROTULO383
jmp ROTULO384
ROTULO383:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:33:35 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:33:42 ===---
mov ax, 5
jmp ROTULO307
ROTULO384:
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
je ROTULO390
jmp ROTULO391
ROTULO390:
mov ax, 65535
jmp ROTULO392
ROTULO391:
xor ax, ax
ROTULO392:
cmp ax, 0
jne ROTULO388
jmp ROTULO389
ROTULO388:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:34:35 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:34:42 ===---
mov ax, 6
jmp ROTULO307
ROTULO389:
ROTULO369:
ROTULO349:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:37:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Text.hcb:37:16 ===---
mov ax, 63
jmp ROTULO307
ROTULO307:
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
mov ax, 3512
es mov [di+4], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/Version.hcb:17:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/Version.hcb:17:23 ===---
push cs
pop es
mov di, ROTULO395
jmp ROTULO394
ROTULO395:
db 4
db 65,108,102,97
times 1 db 0
ROTULO394:
push es
push di
push word [bp+6+2]
pop es
mov di, [bp+6]
es pop word [di+6]
es pop word [di+6+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
ROTULO393:
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
ROTULO396:
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
ROTULO398:
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
jbe ROTULO401
jmp ROTULO402
ROTULO401:
mov ax, 65535
jmp ROTULO403
ROTULO402:
xor ax, ax
ROTULO403:
cmp ax, 0
jne ROTULO399
jmp ROTULO400
ROTULO399:
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
je ROTULO406
jmp ROTULO407
ROTULO406:
mov ax, 65535
jmp ROTULO408
ROTULO407:
xor ax, ax
ROTULO408:
cmp ax, 0
jne ROTULO404
jmp ROTULO405
ROTULO404:
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
ROTULO405:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:76:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-2]
jmp ROTULO398
ROTULO400:
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
ROTULO397:
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
je ROTULO412
jmp ROTULO413
ROTULO412:
mov ax, 65535
jmp ROTULO414
ROTULO413:
xor ax, ax
ROTULO414:
cmp ax, 0
jne ROTULO410
jmp ROTULO411
ROTULO410:
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
ROTULO411:
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
jne ROTULO415
jmp ROTULO416
ROTULO415:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:114:40 ===---
jmp find_next
ROTULO416:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:115:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:115:12 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 6
cs push word [_multithreading_current+2]
pop es
cs mov di, [_multithreading_current]
es mov ax, [di+6]
cmp ax, 0
jne ROTULO417
jmp ROTULO418
ROTULO417:
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
ROTULO418:
ROTULO409:
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
ROTULO420:
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
jbe ROTULO423
jmp ROTULO424
ROTULO423:
mov ax, 65535
jmp ROTULO425
ROTULO424:
xor ax, ax
ROTULO425:
cmp ax, 0
jne ROTULO421
jmp ROTULO422
ROTULO421:
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
je ROTULO428
jmp ROTULO429
ROTULO428:
mov ax, 65535
jmp ROTULO430
ROTULO429:
xor ax, ax
ROTULO430:
cmp ax, 0
jne ROTULO426
jmp ROTULO427
ROTULO426:
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
jmp ROTULO419
ROTULO427:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:143:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-10]
jmp ROTULO420
ROTULO422:
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
ROTULO419:
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
jae ROTULO434
jmp ROTULO435
ROTULO434:
mov ax, 65535
jmp ROTULO436
ROTULO435:
xor ax, ax
ROTULO436:
cmp ax, 0
jne ROTULO432
jmp ROTULO433
ROTULO432:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:161:32 ===---
mov ax, _multithreading
mov [bp+-8], ax
mov ax, 161
mov [bp+-10], ax
mov ax, 5
cs jmp word [_os_trycode]
ROTULO433:
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
jmp ROTULO431
ROTULO431:
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
ROTULO438:
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
jbe ROTULO441
jmp ROTULO442
ROTULO441:
mov ax, 65535
jmp ROTULO443
ROTULO442:
xor ax, ax
ROTULO443:
cmp ax, 0
jne ROTULO439
jmp ROTULO440
ROTULO439:
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
jne ROTULO446
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
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:178:35 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-12]
ROTULO445:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:174:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-10]
jmp ROTULO438
ROTULO440:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:180:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:180:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-12]
jmp ROTULO437
ROTULO437:
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
jne ROTULO450
jmp ROTULO451
ROTULO450:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:189:24 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _multithreading_suspend
ROTULO451:
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
jne ROTULO452
jmp ROTULO453
ROTULO452:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:198:24 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _multithreading_resume
ROTULO453:
ROTULO449:
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
jmp ROTULO454
ROTULO454:
FIM_multithreading_isactive:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:207:16 ===---
_multithreading_suspend:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:208:9 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_multithreading_active], 0
ROTULO455:
FIM_multithreading_suspend:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:212:16 ===---
_multithreading_resume:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:213:9 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_multithreading_active], 1
ROTULO456:
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
ROTULO457:
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
jbe ROTULO461
jmp ROTULO462
ROTULO461:
mov ax, 65535
jmp ROTULO463
ROTULO462:
xor ax, ax
ROTULO463:
cmp ax, 0
jne ROTULO459
jmp ROTULO460
ROTULO459:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:33:34 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-2], 15
ROTULO460:
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
jbe ROTULO466
jmp ROTULO467
ROTULO466:
mov ax, 65535
jmp ROTULO468
ROTULO467:
xor ax, ax
ROTULO468:
cmp ax, 0
jne ROTULO464
jmp ROTULO465
ROTULO464:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:34:35 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-2], 7
ROTULO465:
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
jbe ROTULO471
jmp ROTULO472
ROTULO471:
mov ax, 65535
jmp ROTULO473
ROTULO472:
xor ax, ax
ROTULO473:
cmp ax, 0
jne ROTULO469
jmp ROTULO470
ROTULO469:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:35:35 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-2], 3
ROTULO470:
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
ja ROTULO476
jmp ROTULO477
ROTULO476:
mov ax, 65535
jmp ROTULO478
ROTULO477:
xor ax, ax
ROTULO478:
cmp ax, 0
jne ROTULO474
jmp ROTULO475
ROTULO474:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:36:34 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-2], 1
ROTULO475:
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
jmp ROTULO458
ROTULO458:
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
ROTULO479:
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
jmp ROTULO480
ROTULO480:
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
jmp ROTULO481
ROTULO481:
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
jmp ROTULO482
ROTULO482:
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
je ROTULO486
jmp ROTULO487
ROTULO486:
mov ax, 65535
jmp ROTULO488
ROTULO487:
xor ax, ax
ROTULO488:
cmp ax, 0
jne ROTULO484
jmp ROTULO485
ROTULO484:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:76:31 ===---
mov ax, _list
mov [bp+-8], ax
mov ax, 76
mov [bp+-10], ax
mov ax, 5
cs jmp word [_os_trycode]
ROTULO485:
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
ja ROTULO491
jmp ROTULO492
ROTULO491:
mov ax, 65535
jmp ROTULO493
ROTULO492:
xor ax, ax
ROTULO493:
cmp ax, 0
jne ROTULO489
jmp ROTULO490
ROTULO489:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:77:36 ===---
mov ax, _list
mov [bp+-8], ax
mov ax, 77
mov [bp+-10], ax
mov ax, 5
cs jmp word [_os_trycode]
ROTULO490:
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
ROTULO494:
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
jbe ROTULO497
jmp ROTULO498
ROTULO497:
mov ax, 65535
jmp ROTULO499
ROTULO498:
xor ax, ax
ROTULO499:
cmp ax, 0
jne ROTULO495
jmp ROTULO496
ROTULO495:
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
je ROTULO502
jmp ROTULO503
ROTULO502:
mov ax, 65535
jmp ROTULO504
ROTULO503:
xor ax, ax
ROTULO504:
cmp ax, 0
jne ROTULO500
jmp ROTULO501
ROTULO500:
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
jmp ROTULO483
ROTULO501:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:82:28 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-10]
jmp ROTULO494
ROTULO496:
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
je ROTULO507
jmp ROTULO508
ROTULO507:
mov ax, 65535
jmp ROTULO509
ROTULO508:
xor ax, ax
ROTULO509:
cmp ax, 0
jne ROTULO505
jmp ROTULO506
ROTULO505:
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
ROTULO506:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:92:14 ===---
jmp list_find_in_block_item
ROTULO483:
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
ROTULO510:
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
ROTULO511:
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
ROTULO512:
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
je ROTULO516
jmp ROTULO517
ROTULO516:
mov ax, 65535
jmp ROTULO518
ROTULO517:
xor ax, ax
ROTULO518:
cmp ax, 0
jne ROTULO514
jmp ROTULO515
ROTULO514:
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
jb ROTULO521
jmp ROTULO522
ROTULO521:
mov ax, 65535
jmp ROTULO523
ROTULO522:
xor ax, ax
ROTULO523:
cmp ax, 0
jne ROTULO519
jmp ROTULO520
ROTULO519:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:112:37 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:112:50 ===---
mov ax, 5
es mov [di+0], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
ROTULO520:
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
jb ROTULO526
jmp ROTULO527
ROTULO526:
mov ax, 65535
jmp ROTULO528
ROTULO527:
xor ax, ax
ROTULO528:
cmp ax, 0
jne ROTULO524
jmp ROTULO525
ROTULO524:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:113:38 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:113:51 ===---
mov ax, 4
es mov [di+0], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
ROTULO525:
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
jae ROTULO531
jmp ROTULO532
ROTULO531:
mov ax, 65535
jmp ROTULO533
ROTULO532:
xor ax, ax
ROTULO533:
cmp ax, 0
jne ROTULO529
jmp ROTULO530
ROTULO529:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:114:39 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:114:52 ===---
mov ax, 1
es mov [di+0], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
ROTULO530:
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
ROTULO534:
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
jbe ROTULO537
jmp ROTULO538
ROTULO537:
mov ax, 65535
jmp ROTULO539
ROTULO538:
xor ax, ax
ROTULO539:
cmp ax, 0
jne ROTULO535
jmp ROTULO536
ROTULO535:
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
jmp ROTULO534
ROTULO536:
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
jmp ROTULO513
jmp ROTULO540
ROTULO515:
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
ROTULO541:
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
jbe ROTULO544
jmp ROTULO545
ROTULO544:
mov ax, 65535
jmp ROTULO546
ROTULO545:
xor ax, ax
ROTULO546:
cmp ax, 0
jne ROTULO542
jmp ROTULO543
ROTULO542:
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
je ROTULO549
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
jmp ROTULO513
ROTULO548:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:131:32 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-10]
jmp ROTULO541
ROTULO543:
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
je ROTULO554
jmp ROTULO555
ROTULO554:
mov ax, 65535
jmp ROTULO556
ROTULO555:
xor ax, ax
ROTULO556:
cmp ax, 0
jne ROTULO552
jmp ROTULO553
ROTULO552:
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
ROTULO553:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Collections.hcb:144:18 ===---
jmp list_find_in_block_add
ROTULO540:
ROTULO513:
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
ROTULO557:
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
jne ROTULO559
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:124:25 ===---
mov ax, _memory
mov [bp+-8], ax
mov ax, 124
mov [bp+-10], ax
mov ax, 1
cs jmp word [_os_trycode]
ROTULO559:
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
jne ROTULO562
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:125:21 ===---
mov ax, _memory
mov [bp+-8], ax
mov ax, 125
mov [bp+-10], ax
mov ax, 1
cs jmp word [_os_trycode]
ROTULO562:
mov bx, ax
pop ax
xor dx, dx
div bx
mov ax, dx
cmp ax, 0
jne ROTULO560
jmp ROTULO561
ROTULO560:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:125:29 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-2]
ROTULO561:
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
ja ROTULO565
jmp ROTULO566
ROTULO565:
mov ax, 65535
jmp ROTULO567
ROTULO566:
xor ax, ax
ROTULO567:
cmp ax, 0
jne ROTULO563
jmp ROTULO564
ROTULO563:
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
jne ROTULO568
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:127:28 ===---
mov ax, _memory
mov [bp+-8], ax
mov ax, 127
mov [bp+-10], ax
mov ax, 1
cs jmp word [_os_trycode]
ROTULO568:
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
jne ROTULO571
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:128:25 ===---
mov ax, _memory
mov [bp+-8], ax
mov ax, 128
mov [bp+-10], ax
mov ax, 1
cs jmp word [_os_trycode]
ROTULO571:
mov bx, ax
pop ax
xor dx, dx
div bx
mov ax, dx
cmp ax, 0
jne ROTULO569
jmp ROTULO570
ROTULO569:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:128:35 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-20]
ROTULO570:
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
jmp ROTULO558
ROTULO564:
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
ROTULO572:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:138:15 ===---
mov ax, 1
cmp ax, 0
jne ROTULO573
jmp ROTULO574
ROTULO573:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:139:14 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-16], 4
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:140:26 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:140:26 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-4], 1
ROTULO575:
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
jbe ROTULO578
jmp ROTULO579
ROTULO578:
mov ax, 65535
jmp ROTULO580
ROTULO579:
xor ax, ax
ROTULO580:
cmp ax, 0
jne ROTULO576
jmp ROTULO577
ROTULO576:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:141:17 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:141:20 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-8]
cmp ax, 0
jne ROTULO581
jmp ROTULO582
ROTULO581:
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
je ROTULO585
jmp ROTULO586
ROTULO585:
mov ax, 65535
jmp ROTULO587
ROTULO586:
xor ax, ax
ROTULO587:
cmp ax, 0
jne ROTULO583
jmp ROTULO584
ROTULO583:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:143:25 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-18]
jmp ROTULO588
ROTULO584:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:145:25 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-8], 0
ROTULO588:
jmp ROTULO589
ROTULO582:
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
je ROTULO592
jmp ROTULO593
ROTULO592:
mov ax, 65535
jmp ROTULO594
ROTULO593:
xor ax, ax
ROTULO594:
cmp ax, 0
jne ROTULO590
jmp ROTULO591
ROTULO590:
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
ROTULO591:
ROTULO589:
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
jae ROTULO597
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
ROTULO600:
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
jbe ROTULO603
jmp ROTULO604
ROTULO603:
mov ax, 65535
jmp ROTULO605
ROTULO604:
xor ax, ax
ROTULO605:
cmp ax, 0
jne ROTULO601
jmp ROTULO602
ROTULO601:
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
je ROTULO608
jmp ROTULO609
ROTULO608:
mov ax, 65535
jmp ROTULO610
ROTULO609:
xor ax, ax
ROTULO610:
cmp ax, 0
jne ROTULO606
jmp ROTULO607
ROTULO606:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:161:29 ===---
; ACAO GRAVACAO - Gravacao de numero em ponteiro
push word [bp+-16+2]
pop es
mov di, [bp+-16]
es mov word [di+0], 1
jmp ROTULO611
ROTULO607:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:163:29 ===---
; ACAO GRAVACAO - Gravacao de numero em ponteiro
push word [bp+-16+2]
pop es
mov di, [bp+-16]
es mov word [di+0], 2
ROTULO611:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:165:26 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-16]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:166:26 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-16]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:159:34 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-4]
jmp ROTULO600
ROTULO602:
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
jmp ROTULO558
ROTULO596:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:171:18 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-16]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:172:18 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-16]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:140:26 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-4]
jmp ROTULO575
ROTULO577:
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
je ROTULO614
jmp ROTULO615
ROTULO614:
mov ax, 65535
jmp ROTULO616
ROTULO615:
xor ax, ax
ROTULO616:
cmp ax, 0
jne ROTULO612
jmp ROTULO613
ROTULO612:
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
jmp ROTULO617
ROTULO613:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:179:18 ===---
; ACAO GRAVACAO - Grava segmento em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:179:26 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-16+2]
pop es
mov di, [bp+-16]
es mov ax, [di+0]
mov word [bp+-16+2], ax
ROTULO617:
jmp ROTULO572
ROTULO574:
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
ROTULO558:
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
ROTULO618:
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
ROTULO619:
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
ROTULO620:
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
ROTULO622:
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
jbe ROTULO625
jmp ROTULO626
ROTULO625:
mov ax, 65535
jmp ROTULO627
ROTULO626:
xor ax, ax
ROTULO627:
cmp ax, 0
jne ROTULO623
jmp ROTULO624
ROTULO623:
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
jb ROTULO630
jmp ROTULO631
ROTULO630:
mov ax, 65535
jmp ROTULO632
ROTULO631:
xor ax, ax
ROTULO632:
cmp ax, 0
jne ROTULO628
jmp ROTULO629
ROTULO628:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:21:33 ===---
; ACAO GRAVACAO - Gravacao de numero em ponteiro
cs push word [_globalmemory_mapptr+2]
pop es
cs mov di, [_globalmemory_mapptr]
es mov byte [di+0], 129
jmp ROTULO633
ROTULO629:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:21:51 ===---
; ACAO GRAVACAO - Gravacao de numero em ponteiro
cs push word [_globalmemory_mapptr+2]
pop es
cs mov di, [_globalmemory_mapptr]
es mov byte [di+0], 0
ROTULO633:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:22:14 ===---
; ACAO INC - Incrementa variavel
cs inc word [_globalmemory_mapptr]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:20:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-4]
jmp ROTULO622
ROTULO624:
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
ROTULO621:
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
ja ROTULO637
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
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:35:34 ===---
mov ax, _globalmemory
mov [bp+-8], ax
mov ax, 35
mov [bp+-10], ax
mov ax, 4
cs jmp word [_os_trycode]
ROTULO636:
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
ja ROTULO642
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
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:36:36 ===---
mov ax, _globalmemory
mov [bp+-8], ax
mov ax, 36
mov [bp+-10], ax
mov ax, 12
cs jmp word [_os_trycode]
ROTULO641:
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
ROTULO645:
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
jbe ROTULO648
jmp ROTULO649
ROTULO648:
mov ax, 65535
jmp ROTULO650
ROTULO649:
xor ax, ax
ROTULO650:
cmp ax, 0
jne ROTULO646
jmp ROTULO647
ROTULO646:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:42:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:42:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-12]
cmp ax, 0
jne ROTULO651
jmp ROTULO652
ROTULO651:
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
je ROTULO655
jmp ROTULO656
ROTULO655:
mov ax, 65535
jmp ROTULO657
ROTULO656:
xor ax, ax
ROTULO657:
cmp ax, 0
jne ROTULO653
jmp ROTULO654
ROTULO653:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:44:21 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-10]
jmp ROTULO658
ROTULO654:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:46:21 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-12], 0
ROTULO658:
jmp ROTULO659
ROTULO652:
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
je ROTULO662
jmp ROTULO663
ROTULO662:
mov ax, 65535
jmp ROTULO664
ROTULO663:
xor ax, ax
ROTULO664:
cmp ax, 0
jne ROTULO660
jmp ROTULO661
ROTULO660:
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
ROTULO661:
ROTULO659:
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
jae ROTULO667
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
ROTULO670:
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
jbe ROTULO673
jmp ROTULO674
ROTULO673:
mov ax, 65535
jmp ROTULO675
ROTULO674:
xor ax, ax
ROTULO675:
cmp ax, 0
jne ROTULO671
jmp ROTULO672
ROTULO671:
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
je ROTULO678
jmp ROTULO679
ROTULO678:
mov ax, 65535
jmp ROTULO680
ROTULO679:
xor ax, ax
ROTULO680:
cmp ax, 0
jne ROTULO676
jmp ROTULO677
ROTULO676:
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
jmp ROTULO684
ROTULO677:
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
ROTULO684:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:65:22 ===---
; ACAO INC - Incrementa variavel
cs inc word [_globalmemory_mapptr]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:59:30 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-6]
jmp ROTULO670
ROTULO672:
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
jmp ROTULO634
ROTULO666:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:70:14 ===---
; ACAO INC - Incrementa variavel
cs inc word [_globalmemory_mapptr]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:41:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-6]
jmp ROTULO645
ROTULO647:
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
ROTULO634:
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
ROTULO686:
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
jbe ROTULO689
jmp ROTULO690
ROTULO689:
mov ax, 65535
jmp ROTULO691
ROTULO690:
xor ax, ax
ROTULO691:
cmp ax, 0
jne ROTULO687
jmp ROTULO688
ROTULO687:
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
je ROTULO694
jmp ROTULO695
ROTULO694:
mov ax, 65535
jmp ROTULO696
ROTULO695:
xor ax, ax
ROTULO696:
cmp ax, 0
jne ROTULO692
jmp ROTULO693
ROTULO692:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:83:33 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-2]
ROTULO693:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:84:14 ===---
; ACAO INC - Incrementa variavel
cs inc word [_globalmemory_mapptr]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:82:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-4]
jmp ROTULO686
ROTULO688:
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
jmp ROTULO685
ROTULO685:
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
ROTULO698:
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
jne ROTULO706
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
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:97:33 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-2]
ROTULO705:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:98:14 ===---
; ACAO INC - Incrementa variavel
cs inc word [_globalmemory_mapptr]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Memory.hcb:96:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-4]
jmp ROTULO698
ROTULO700:
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
jmp ROTULO697
ROTULO697:
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
ROTULO709:
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
ROTULO711:
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
jae ROTULO714
jmp ROTULO715
ROTULO714:
mov ax, 65535
jmp ROTULO716
ROTULO715:
xor ax, ax
ROTULO716:
cmp ax, 0
jne ROTULO712
jmp ROTULO713
ROTULO712:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:36:13 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _thread_yield
jmp ROTULO711
ROTULO713:
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
jae ROTULO719
jmp ROTULO720
ROTULO719:
mov ax, 65535
jmp ROTULO721
ROTULO720:
xor ax, ax
ROTULO721:
cmp ax, 0
jne ROTULO717
jmp ROTULO718
ROTULO717:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:41:17 ===---
popf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:42:18 ===---
jmp waiting
ROTULO718:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:44:9 ===---
; ACAO STRUCTURE - Incremento de ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
es inc word [di+0]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:45:13 ===---
popf
ROTULO710:
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
ja ROTULO725
jmp ROTULO726
ROTULO725:
mov ax, 65535
jmp ROTULO727
ROTULO726:
xor ax, ax
ROTULO727:
cmp ax, 0
jne ROTULO723
jmp ROTULO724
ROTULO723:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:52:29 ===---
; ACAO STRUCTURE - Decremento de Ponteiro
es dec word [di+0]
ROTULO724:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:53:13 ===---
popf
ROTULO722:
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
jmp ROTULO728
ROTULO728:
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
ROTULO729:
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
ROTULO731:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:243:15 ===---
mov ax, 1
cmp ax, 0
jne ROTULO732
jmp ROTULO733
ROTULO732:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:243:17 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _thread_yield
jmp ROTULO731
ROTULO733:
ROTULO730:
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
ROTULO734:
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
jmp ROTULO735
ROTULO735:
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
je ROTULO739
jmp ROTULO740
ROTULO739:
mov ax, 65535
jmp ROTULO741
ROTULO740:
xor ax, ax
ROTULO741:
cmp ax, 0
jne ROTULO737
jmp ROTULO738
ROTULO737:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:260:48 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:260:53 ===---
xor ax, ax
jmp ROTULO736
ROTULO738:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:261:13 ===---
int 0x81
ROTULO736:
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
ROTULO743:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:269:15 ===---
mov ax, 1
cmp ax, 0
jne ROTULO744
jmp ROTULO745
ROTULO744:
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
jae ROTULO748
jmp ROTULO749
ROTULO748:
mov ax, 65535
jmp ROTULO750
ROTULO749:
xor ax, ax
ROTULO750:
cmp ax, 0
jne ROTULO746
jmp ROTULO747
ROTULO746:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:271:41 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:271:46 ===---
xor ax, ax
jmp ROTULO742
ROTULO747:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:272:13 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _thread_yield
jmp ROTULO743
ROTULO745:
ROTULO742:
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
ROTULO752:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:281:15 ===---
mov ax, 1
cmp ax, 0
jne ROTULO753
jmp ROTULO754
ROTULO753:
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
jae ROTULO757
jmp ROTULO758
ROTULO757:
mov ax, 65535
jmp ROTULO759
ROTULO758:
xor ax, ax
ROTULO759:
cmp ax, 0
jne ROTULO755
jmp ROTULO756
ROTULO755:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:283:37 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:283:42 ===---
xor ax, ax
jmp ROTULO751
ROTULO756:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Threading.hcb:284:13 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _thread_yield
jmp ROTULO752
ROTULO754:
ROTULO751:
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
ROTULO760:
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
jb ROTULO764
jmp ROTULO765
ROTULO764:
mov ax, 65535
jmp ROTULO766
ROTULO765:
xor ax, ax
ROTULO766:
cmp ax, 0
jne ROTULO762
jmp ROTULO763
ROTULO762:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:29:32 ===---
jmp end_ajust
ROTULO763:
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
jb ROTULO769
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
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:32:31 ===---
jmp end_ajust
ROTULO768:
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
jae ROTULO774
jmp ROTULO775
ROTULO774:
mov ax, 65535
jmp ROTULO776
ROTULO775:
xor ax, ax
ROTULO776:
cmp ax, 0
jne ROTULO772
jmp ROTULO773
ROTULO772:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:33:32 ===---
jmp calc_month
ROTULO773:
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
je ROTULO779
jmp ROTULO780
ROTULO779:
mov ax, 65535
jmp ROTULO781
ROTULO780:
xor ax, ax
ROTULO781:
cmp ax, 0
jne ROTULO777
jmp ROTULO778
ROTULO777:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:34:33 ===---
jmp calc_month
ROTULO778:
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
jb ROTULO784
jmp ROTULO785
ROTULO784:
mov ax, 65535
jmp ROTULO786
ROTULO785:
xor ax, ax
ROTULO786:
cmp ax, 0
jne ROTULO782
jmp ROTULO783
ROTULO782:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:35:31 ===---
jmp end_ajust
ROTULO783:
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
je ROTULO789
jmp ROTULO790
ROTULO789:
mov ax, 65535
jmp ROTULO791
ROTULO790:
xor ax, ax
ROTULO791:
cmp ax, 0
jne ROTULO787
jmp ROTULO788
ROTULO787:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:36:33 ===---
jmp calc_month
ROTULO788:
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
je ROTULO794
jmp ROTULO795
ROTULO794:
mov ax, 65535
jmp ROTULO796
ROTULO795:
xor ax, ax
ROTULO796:
cmp ax, 0
jne ROTULO792
jmp ROTULO793
ROTULO792:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:37:33 ===---
jmp calc_month
ROTULO793:
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
je ROTULO799
jmp ROTULO800
ROTULO799:
mov ax, 65535
jmp ROTULO801
ROTULO800:
xor ax, ax
ROTULO801:
cmp ax, 0
jne ROTULO797
jmp ROTULO798
ROTULO797:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:38:33 ===---
jmp calc_month
ROTULO798:
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
je ROTULO804
jmp ROTULO805
ROTULO804:
mov ax, 65535
jmp ROTULO806
ROTULO805:
xor ax, ax
ROTULO806:
cmp ax, 0
jne ROTULO802
jmp ROTULO803
ROTULO802:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:39:34 ===---
jmp calc_month
ROTULO803:
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
ja ROTULO812
jmp ROTULO813
ROTULO812:
mov ax, 65535
jmp ROTULO814
ROTULO813:
xor ax, ax
ROTULO814:
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
je ROTULO815
jmp ROTULO816
ROTULO815:
mov ax, 65535
jmp ROTULO817
ROTULO816:
xor ax, ax
ROTULO817:
mov bx, ax
pop ax
or ax, bx
cmp ax, 0
jne ROTULO807
jmp ROTULO808
ROTULO807:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:43:13 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_clock_month], 1
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:44:13 ===---
; ACAO INC - Incrementa variavel
cs inc word [_clock_year]
ROTULO808:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.Timer.hcb:46:9 ===---
end_ajust:
ROTULO761:
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
ROTULO818:
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
ROTULO819:
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
ROTULO820:
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
mov di, ROTULO823
jmp ROTULO822
ROTULO823:
db 0
times 1 db 0
ROTULO822:
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
jmp ROTULO821
ROTULO821:
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
jne ROTULO827
jmp ROTULO828
ROTULO827:
mov ax, 65535
jmp ROTULO829
ROTULO828:
xor ax, ax
ROTULO829:
cmp ax, 0
jne ROTULO825
jmp ROTULO826
ROTULO825:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:69:40 ===---
mov ax, _disk
mov [bp+-8], ax
mov ax, 69
mov [bp+-10], ax
mov ax, 4
cs jmp word [_os_trycode]
ROTULO826:
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
jne ROTULO830
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:71:37 ===---
mov ax, _disk
mov [bp+-8], ax
mov ax, 71
mov [bp+-10], ax
mov ax, 1
cs jmp word [_os_trycode]
ROTULO830:
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
jne ROTULO831
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:72:36 ===---
mov ax, _disk
mov [bp+-8], ax
mov ax, 72
mov [bp+-10], ax
mov ax, 1
cs jmp word [_os_trycode]
ROTULO831:
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
jne ROTULO832
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:72:47 ===---
mov ax, _disk
mov [bp+-8], ax
mov ax, 72
mov [bp+-10], ax
mov ax, 1
cs jmp word [_os_trycode]
ROTULO832:
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
jne ROTULO833
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:73:39 ===---
mov ax, _disk
mov [bp+-8], ax
mov ax, 73
mov [bp+-10], ax
mov ax, 1
cs jmp word [_os_trycode]
ROTULO833:
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
jne ROTULO834
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:73:52 ===---
mov ax, _disk
mov [bp+-8], ax
mov ax, 73
mov [bp+-10], ax
mov ax, 1
cs jmp word [_os_trycode]
ROTULO834:
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
ROTULO824:
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
ROTULO835:
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
ROTULO836:
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
ROTULO838:
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
jbe ROTULO841
jmp ROTULO842
ROTULO841:
mov ax, 65535
jmp ROTULO843
ROTULO842:
xor ax, ax
ROTULO843:
cmp ax, 0
jne ROTULO839
jmp ROTULO840
ROTULO839:
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
jne ROTULO844
jmp ROTULO845
ROTULO844:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:90:17 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:90:24 ===---
mov ax, 65535
jmp ROTULO837
ROTULO845:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:86:38 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-2]
jmp ROTULO838
ROTULO840:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:93:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:93:16 ===---
xor ax, ax
jmp ROTULO837
ROTULO837:
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
ROTULO847:
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
jbe ROTULO850
jmp ROTULO851
ROTULO850:
mov ax, 65535
jmp ROTULO852
ROTULO851:
xor ax, ax
ROTULO852:
cmp ax, 0
jne ROTULO848
jmp ROTULO849
ROTULO848:
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
jne ROTULO853
jmp ROTULO854
ROTULO853:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:101:49 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:101:56 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-6+2]
pop es
mov di, [bp+-6]
jmp ROTULO846
ROTULO854:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:98:38 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-2]
jmp ROTULO847
ROTULO849:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:103:15 ===---
mov ax, _disk
mov [bp+-8], ax
mov ax, 103
mov [bp+-10], ax
mov ax, 5
cs jmp word [_os_trycode]
ROTULO846:
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
jmp ROTULO855
ROTULO855:
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
ROTULO857:
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
jbe ROTULO860
jmp ROTULO861
ROTULO860:
mov ax, 65535
jmp ROTULO862
ROTULO861:
xor ax, ax
ROTULO862:
cmp ax, 0
jne ROTULO858
jmp ROTULO859
ROTULO858:
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
jne ROTULO863
jmp ROTULO864
ROTULO863:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:115:49 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:115:56 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 45
push word [bp+-6+2]
pop es
mov di, [bp+-6]
es mov ax, [di+45]
jmp ROTULO856
ROTULO864:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:112:38 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-2]
jmp ROTULO857
ROTULO859:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:117:15 ===---
mov ax, _disk
mov [bp+-8], ax
mov ax, 117
mov [bp+-10], ax
mov ax, 5
cs jmp word [_os_trycode]
ROTULO856:
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
ROTULO865:
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
ROTULO867:
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
jbe ROTULO870
jmp ROTULO871
ROTULO870:
mov ax, 65535
jmp ROTULO872
ROTULO871:
xor ax, ax
ROTULO872:
cmp ax, 0
jne ROTULO868
jmp ROTULO869
ROTULO868:
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
jne ROTULO873
jmp ROTULO874
ROTULO873:
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
jmp ROTULO866
ROTULO874:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:126:38 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-2]
jmp ROTULO867
ROTULO869:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.Disk.hcb:134:15 ===---
mov ax, _disk
mov [bp+-8], ax
mov ax, 134
mov [bp+-10], ax
mov ax, 5
cs jmp word [_os_trycode]
ROTULO866:
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
ROTULO876:
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
ja ROTULO879
jmp ROTULO880
ROTULO879:
mov ax, 65535
jmp ROTULO881
ROTULO880:
xor ax, ax
ROTULO881:
cmp ax, 0
jne ROTULO877
jmp ROTULO878
ROTULO877:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:174:17 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-2]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:175:18 ===---
; ACAO INC - Incrementa variavel
inc word [bp+6]
inc di
jmp ROTULO876
ROTULO878:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:177:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:177:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
jmp ROTULO875
ROTULO875:
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
ROTULO883:
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
je ROTULO886
jmp ROTULO887
ROTULO886:
mov ax, 65535
jmp ROTULO888
ROTULO887:
xor ax, ax
ROTULO888:
cmp ax, 0
jne ROTULO884
jmp ROTULO885
ROTULO884:
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
je ROTULO891
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
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:184:31 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:184:38 ===---
mov ax, 1
jmp ROTULO882
ROTULO890:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:185:14 ===---
; ACAO INC - Incrementa variavel
inc word [bp+6]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:186:14 ===---
; ACAO INC - Incrementa variavel
inc word [bp+10]
jmp ROTULO883
ROTULO885:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:188:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:188:16 ===---
xor ax, ax
jmp ROTULO882
ROTULO882:
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
ja ROTULO897
jmp ROTULO898
ROTULO897:
mov ax, 65535
jmp ROTULO899
ROTULO898:
xor ax, ax
ROTULO899:
cmp ax, 0
jne ROTULO895
jmp ROTULO896
ROTULO895:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:200:62 ===---
mov ax, _string
mov [bp+-8], ax
mov ax, 200
mov [bp+-10], ax
mov ax, 9
cs jmp word [_os_trycode]
ROTULO896:
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
ROTULO900:
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
jbe ROTULO903
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
jmp ROTULO900
ROTULO902:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:209:9 ===---
; ACAO GRAVACAO - Gravacao de numero em ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov byte [di+0], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:210:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:210:16 ===---
mov ax, 1
jmp ROTULO894
ROTULO894:
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
jb ROTULO909
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
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:223:54 ===---
mov ax, _string
mov [bp+-8], ax
mov ax, 223
mov [bp+-10], ax
mov ax, 9
cs jmp word [_os_trycode]
ROTULO908:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:224:22 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:224:22 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-6], 1
ROTULO912:
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
jmp ROTULO912
ROTULO914:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:230:9 ===---
; ACAO GRAVACAO - Gravacao de numero em ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov byte [di+0], 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:231:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.hcb:231:16 ===---
mov ax, 1
jmp ROTULO906
ROTULO906:
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
ROTULO918:
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
je ROTULO922
jmp ROTULO923
ROTULO922:
mov ax, 65535
jmp ROTULO924
ROTULO923:
xor ax, ax
ROTULO924:
cmp ax, 0
jne ROTULO920
jmp ROTULO921
ROTULO920:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:45:42 ===---
mov ax, _filesystem
mov [bp+-8], ax
mov ax, 45
mov [bp+-10], ax
mov ax, 5
cs jmp word [_os_trycode]
ROTULO921:
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
ROTULO919:
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
jmp ROTULO925
ROTULO925:
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
jmp ROTULO926
ROTULO926:
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
ROTULO928:
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
jbe ROTULO931
jmp ROTULO932
ROTULO931:
mov ax, 65535
jmp ROTULO933
ROTULO932:
xor ax, ax
ROTULO933:
cmp ax, 0
jne ROTULO929
jmp ROTULO930
ROTULO929:
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
jne ROTULO934
jmp ROTULO935
ROTULO934:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:63:17 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:63:24 ===---
mov ax, 65535
jmp ROTULO927
ROTULO935:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:59:39 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-2]
jmp ROTULO928
ROTULO930:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:66:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:66:16 ===---
xor ax, ax
jmp ROTULO927
ROTULO927:
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
ROTULO937:
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
jbe ROTULO940
jmp ROTULO941
ROTULO940:
mov ax, 65535
jmp ROTULO942
ROTULO941:
xor ax, ax
ROTULO942:
cmp ax, 0
jne ROTULO938
jmp ROTULO939
ROTULO938:
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
jne ROTULO943
jmp ROTULO944
ROTULO943:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:74:50 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:74:57 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-6+2]
pop es
mov di, [bp+-6]
jmp ROTULO936
ROTULO944:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:71:39 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-2]
jmp ROTULO937
ROTULO939:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:76:15 ===---
mov ax, _filesystem
mov [bp+-8], ax
mov ax, 76
mov [bp+-10], ax
mov ax, 5
cs jmp word [_os_trycode]
ROTULO936:
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
jmp ROTULO945
ROTULO945:
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
mov di, ROTULO948
jmp ROTULO947
ROTULO948:
db 0
times 1 db 0
ROTULO947:
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
jmp ROTULO946
ROTULO946:
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
je ROTULO952
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
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:107:44 ===---
mov ax, _filesystem
mov [bp+-8], ax
mov ax, 107
mov [bp+-10], ax
mov ax, 7
cs jmp word [_os_trycode]
ROTULO951:
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
je ROTULO957
jmp ROTULO958
ROTULO957:
mov ax, 65535
jmp ROTULO959
ROTULO958:
xor ax, ax
ROTULO959:
cmp ax, 0
jne ROTULO955
jmp ROTULO956
ROTULO955:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:108:38 ===---
mov ax, _filesystem
mov [bp+-8], ax
mov ax, 108
mov [bp+-10], ax
mov ax, 7
cs jmp word [_os_trycode]
ROTULO956:
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
je ROTULO962
jmp ROTULO963
ROTULO962:
mov ax, 65535
jmp ROTULO964
ROTULO963:
xor ax, ax
ROTULO964:
cmp ax, 0
jne ROTULO960
jmp ROTULO961
ROTULO960:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:109:53 ===---
mov ax, _filesystem
mov [bp+-8], ax
mov ax, 109
mov [bp+-10], ax
mov ax, 12
cs jmp word [_os_trycode]
ROTULO961:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:110:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:110:12 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/System.IO.FileSystem.hcb:110:38 ===---
push cs
pop es
mov di, ROTULO968
jmp ROTULO967
ROTULO968:
db 1
db 47
times 1 db 0
ROTULO967:
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
jne ROTULO965
jmp ROTULO966
ROTULO965:
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
jmp ROTULO969
ROTULO966:
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
ROTULO969:
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
ROTULO949:
mov sp, bp
pop bp
FIM_filesystem_mount:
retf
; MODULO FIM: filesystem
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/ConfigDefault.hcb:7:8 ===---
; MODULO: configdefault
_configdefault:
db 17
db 67,111,110,102,105,103,68,101,102,97,117,108,116,46,104,99,98
db 0
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/ConfigDefault.hcb:8:16 ===---
_configdefault_initialize:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/ConfigDefault.hcb:9:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _biosdisk_initialize
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/ConfigDefault.hcb:10:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _minixfs_initialize
ROTULO970:
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
mov di, ROTULO973
jmp ROTULO972
ROTULO973:
db 11
db 66,73,79,83,68,105,115,107,48,48,48
times 1 db 0
ROTULO972:
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
mov di, ROTULO975
jmp ROTULO974
ROTULO975:
db 11
db 66,73,79,83,68,105,115,107,48,48,49
times 1 db 0
ROTULO974:
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
ROTULO971:
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
ROTULO976:
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
jbe ROTULO980
jmp ROTULO981
ROTULO980:
mov ax, 65535
jmp ROTULO982
ROTULO981:
xor ax, ax
ROTULO982:
cmp ax, 0
jne ROTULO978
jmp ROTULO979
ROTULO978:
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
je ROTULO985
jmp ROTULO986
ROTULO985:
mov ax, 65535
jmp ROTULO987
ROTULO986:
xor ax, ax
ROTULO987:
cmp ax, 0
jne ROTULO983
jmp ROTULO984
ROTULO983:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:44:43 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-4]
ROTULO984:
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
je ROTULO1002
jmp ROTULO1003
ROTULO1002:
mov ax, 65535
jmp ROTULO1004
ROTULO1003:
xor ax, ax
ROTULO1004:
cmp ax, 0
jne ROTULO999
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
je ROTULO1005
jmp ROTULO1006
ROTULO1005:
mov ax, 65535
jmp ROTULO1007
ROTULO1006:
xor ax, ax
ROTULO1007:
cmp ax, 0
je ROTULO1000
ROTULO999:
mov ax, 65535
jmp ROTULO1001
ROTULO1000:
xor ax, ax
ROTULO1001:
cmp ax, 0
jne ROTULO996
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
je ROTULO1008
jmp ROTULO1009
ROTULO1008:
mov ax, 65535
jmp ROTULO1010
ROTULO1009:
xor ax, ax
ROTULO1010:
cmp ax, 0
je ROTULO997
ROTULO996:
mov ax, 65535
jmp ROTULO998
ROTULO997:
xor ax, ax
ROTULO998:
cmp ax, 0
jne ROTULO993
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
je ROTULO1011
jmp ROTULO1012
ROTULO1011:
mov ax, 65535
jmp ROTULO1013
ROTULO1012:
xor ax, ax
ROTULO1013:
cmp ax, 0
je ROTULO994
ROTULO993:
mov ax, 65535
jmp ROTULO995
ROTULO994:
xor ax, ax
ROTULO995:
cmp ax, 0
jne ROTULO991
jmp ROTULO992
ROTULO991:
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
ROTULO992:
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
je ROTULO1019
jmp ROTULO1020
ROTULO1019:
mov ax, 65535
jmp ROTULO1021
ROTULO1020:
xor ax, ax
ROTULO1021:
cmp ax, 0
jne ROTULO1016
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
je ROTULO1022
jmp ROTULO1023
ROTULO1022:
mov ax, 65535
jmp ROTULO1024
ROTULO1023:
xor ax, ax
ROTULO1024:
cmp ax, 0
je ROTULO1017
ROTULO1016:
mov ax, 65535
jmp ROTULO1018
ROTULO1017:
xor ax, ax
ROTULO1018:
cmp ax, 0
jne ROTULO1014
jmp ROTULO1015
ROTULO1014:
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
ROTULO1015:
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
je ROTULO1027
jmp ROTULO1028
ROTULO1027:
mov ax, 65535
jmp ROTULO1029
ROTULO1028:
xor ax, ax
ROTULO1029:
cmp ax, 0
jne ROTULO1025
jmp ROTULO1026
ROTULO1025:
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
ROTULO1026:
ROTULO979:
ROTULO977:
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
ROTULO1031:
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
jbe ROTULO1037
jmp ROTULO1038
ROTULO1037:
mov ax, 65535
jmp ROTULO1039
ROTULO1038:
xor ax, ax
ROTULO1039:
cmp ax, 0
je ROTULO1035
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
jl ROTULO1040
jmp ROTULO1041
ROTULO1040:
mov ax, 65535
jmp ROTULO1042
ROTULO1041:
xor ax, ax
ROTULO1042:
cmp ax, 0
je ROTULO1035
ROTULO1034:
mov ax, 65535
jmp ROTULO1036
ROTULO1035:
xor ax, ax
ROTULO1036:
cmp ax, 0
jne ROTULO1032
jmp ROTULO1033
ROTULO1032:
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
jl ROTULO1045
jmp ROTULO1046
ROTULO1045:
mov ax, 65535
jmp ROTULO1047
ROTULO1046:
xor ax, ax
ROTULO1047:
cmp ax, 0
jne ROTULO1043
jmp ROTULO1044
ROTULO1043:
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
ROTULO1044:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:76:13 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _multithreading_resume
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:77:13 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _thread_yield
jmp ROTULO1031
ROTULO1033:
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
je ROTULO1050
jmp ROTULO1051
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
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:80:33 ===---
mov ax, _biosdisk
mov [bp+-8], ax
mov ax, 80
mov [bp+-10], ax
mov ax, 13
cs jmp word [_os_trycode]
ROTULO1049:
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
jl ROTULO1055
jmp ROTULO1056
ROTULO1055:
mov ax, 65535
jmp ROTULO1057
ROTULO1056:
xor ax, ax
ROTULO1057:
cmp ax, 0
jne ROTULO1053
jmp ROTULO1054
ROTULO1053:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:81:31 ===---
mov ax, _biosdisk
mov [bp+-8], ax
mov ax, 81
mov [bp+-10], ax
mov ax, 12
cs jmp word [_os_trycode]
ROTULO1054:
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
ROTULO1030:
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
ROTULO1059:
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
jbe ROTULO1065
jmp ROTULO1066
ROTULO1065:
mov ax, 65535
jmp ROTULO1067
ROTULO1066:
xor ax, ax
ROTULO1067:
cmp ax, 0
je ROTULO1063
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
jl ROTULO1068
jmp ROTULO1069
ROTULO1068:
mov ax, 65535
jmp ROTULO1070
ROTULO1069:
xor ax, ax
ROTULO1070:
cmp ax, 0
je ROTULO1063
ROTULO1062:
mov ax, 65535
jmp ROTULO1064
ROTULO1063:
xor ax, ax
ROTULO1064:
cmp ax, 0
jne ROTULO1060
jmp ROTULO1061
ROTULO1060:
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
jl ROTULO1073
jmp ROTULO1074
ROTULO1073:
mov ax, 65535
jmp ROTULO1075
ROTULO1074:
xor ax, ax
ROTULO1075:
cmp ax, 0
jne ROTULO1071
jmp ROTULO1072
ROTULO1071:
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
ROTULO1072:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:100:13 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _multithreading_resume
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:101:13 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _thread_yield
jmp ROTULO1059
ROTULO1061:
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
je ROTULO1078
jmp ROTULO1079
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
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:104:33 ===---
mov ax, _biosdisk
mov [bp+-8], ax
mov ax, 104
mov [bp+-10], ax
mov ax, 13
cs jmp word [_os_trycode]
ROTULO1077:
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
jl ROTULO1083
jmp ROTULO1084
ROTULO1083:
mov ax, 65535
jmp ROTULO1085
ROTULO1084:
xor ax, ax
ROTULO1085:
cmp ax, 0
jne ROTULO1081
jmp ROTULO1082
ROTULO1081:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/BIOSDisk.hcb:105:31 ===---
mov ax, _biosdisk
mov [bp+-8], ax
mov ax, 105
mov [bp+-10], ax
mov ax, 12
cs jmp word [_os_trycode]
ROTULO1082:
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
ROTULO1058:
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
mov di, ROTULO1088
jmp ROTULO1087
ROTULO1088:
db 7
db 77,105,110,105,120,70,83
times 1 db 0
ROTULO1087:
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
ROTULO1086:
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
jne ROTULO1090
jmp ROTULO1091
ROTULO1090:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:55:42 ===---
mov ax, _minixfs
mov [bp+-8], ax
mov ax, 55
mov [bp+-10], ax
mov ax, 4
cs jmp word [_os_trycode]
ROTULO1091:
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
ROTULO1089:
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
jne ROTULO1098
jmp ROTULO1099
ROTULO1098:
mov ax, 65535
jmp ROTULO1100
ROTULO1099:
xor ax, ax
ROTULO1100:
cmp ax, 0
jne ROTULO1096
jmp ROTULO1097
ROTULO1096:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:66:36 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:66:43 ===---
xor ax, ax
jmp ROTULO1095
ROTULO1097:
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
jne ROTULO1103
jmp ROTULO1104
ROTULO1103:
mov ax, 65535
jmp ROTULO1105
ROTULO1104:
xor ax, ax
ROTULO1105:
cmp ax, 0
jne ROTULO1101
jmp ROTULO1102
ROTULO1101:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:68:41 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:68:48 ===---
xor ax, ax
jmp ROTULO1095
ROTULO1102:
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
jae ROTULO1108
jmp ROTULO1109
ROTULO1108:
mov ax, 65535
jmp ROTULO1110
ROTULO1109:
xor ax, ax
ROTULO1110:
cmp ax, 0
jne ROTULO1106
jmp ROTULO1107
ROTULO1106:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:69:40 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:69:47 ===---
xor ax, ax
jmp ROTULO1095
ROTULO1107:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:70:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:70:16 ===---
mov ax, 1
jmp ROTULO1095
ROTULO1095:
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
je ROTULO1114
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
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:80:58 ===---
mov ax, _minixfs
mov [bp+-8], ax
mov ax, 80
mov [bp+-10], ax
mov ax, 14
cs jmp word [_os_trycode]
ROTULO1113:
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
ROTULO1111:
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
mov di, ROTULO1119
jmp ROTULO1118
ROTULO1119:
db 0
times 1 db 0
ROTULO1118:
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
ROTULO1117:
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
jne ROTULO1123
jmp ROTULO1124
ROTULO1123:
mov ax, 65535
jmp ROTULO1125
ROTULO1124:
xor ax, ax
ROTULO1125:
cmp ax, 0
jne ROTULO1121
jmp ROTULO1122
ROTULO1121:
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
ROTULO1122:
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
ROTULO1120:
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
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:116:27 ===---
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
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:117:9 ===---
; ACAO STRUCTURE - Aloca estrutura na pilha
sub sp, 1024
push ss
pop es
mov di, sp
push es
pop word [bp+-4+2]
mov [bp+-4], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:118:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:118:41 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:118:38 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:118:43 ===---
mov ax, 32
cmp ax, 0
jne ROTULO1127
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:118:43 ===---
mov ax, _minixfs
mov [bp+-8], ax
mov ax, 118
mov [bp+-10], ax
mov ax, 1
cs jmp word [_os_trycode]
ROTULO1127:
mov bx, ax
pop ax
xor dx, dx
div bx
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:118:31 ===---
; ACAO LEITURA - Le ponteiro
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:118:26 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
push cs
call _minixfs_loaditemmapblock
add sp, 10
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:119:10 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:119:25 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:119:40 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:119:42 ===---
mov ax, 32
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:119:32 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:119:29 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:119:36 ===---
mov ax, 32
cmp ax, 0
jne ROTULO1128
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:119:36 ===---
mov ax, _minixfs
mov [bp+-8], ax
mov ax, 119
mov [bp+-10], ax
mov ax, 1
cs jmp word [_os_trycode]
ROTULO1128:
mov bx, ax
pop ax
xor dx, dx
div bx
mov ax, dx
pop bx
mul bx
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:119:19 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
pop bx
add ax, bx
mov [bp+-4], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:120:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:120:27 ===---
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
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:121:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:121:34 ===---
; ACAO CHAMADA - Calcula tamanho de item
mov ax, 32
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:121:27 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-4+2]
pop es
mov di, [bp+-4]
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:121:21 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+12+2]
pop es
mov di, [bp+12]
push es
push di
push cs
call _memory_copy
add sp, 10
ROTULO1126:
mov sp, bp
pop bp
FIM_minixfs_loaditem:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:124:9 ===---
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
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:124:27 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:124:53 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:124:74 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:124:94 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:125:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:126:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:127:9 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:127:16 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:127:12 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+18]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:127:18 ===---
mov ax, 7
mov bx, ax
pop ax
cmp ax, bx
jb ROTULO1132
jmp ROTULO1133
ROTULO1132:
mov ax, 65535
jmp ROTULO1134
ROTULO1133:
xor ax, ax
ROTULO1134:
cmp ax, 0
jne ROTULO1130
jmp ROTULO1131
ROTULO1130:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:128:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:128:20 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:128:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+18]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:128:23 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO1137
jmp ROTULO1138
ROTULO1137:
mov ax, 65535
jmp ROTULO1139
ROTULO1138:
xor ax, ax
ROTULO1139:
cmp ax, 0
jne ROTULO1135
jmp ROTULO1136
ROTULO1135:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:128:30 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:128:41 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 14
push word [bp+10+2]
pop es
mov di, [bp+10]
es mov ax, [di+14]
mov [bp+-6], ax
ROTULO1136:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:129:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:129:20 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:129:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+18]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:129:23 ===---
mov ax, 1
mov bx, ax
pop ax
cmp ax, bx
je ROTULO1142
jmp ROTULO1143
ROTULO1142:
mov ax, 65535
jmp ROTULO1144
ROTULO1143:
xor ax, ax
ROTULO1144:
cmp ax, 0
jne ROTULO1140
jmp ROTULO1141
ROTULO1140:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:129:30 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:129:41 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 16
push word [bp+10+2]
pop es
mov di, [bp+10]
es mov ax, [di+16]
mov [bp+-6], ax
ROTULO1141:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:130:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:130:20 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:130:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+18]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:130:23 ===---
mov ax, 2
mov bx, ax
pop ax
cmp ax, bx
je ROTULO1147
jmp ROTULO1148
ROTULO1147:
mov ax, 65535
jmp ROTULO1149
ROTULO1148:
xor ax, ax
ROTULO1149:
cmp ax, 0
jne ROTULO1145
jmp ROTULO1146
ROTULO1145:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:130:30 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:130:41 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 18
push word [bp+10+2]
pop es
mov di, [bp+10]
es mov ax, [di+18]
mov [bp+-6], ax
ROTULO1146:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:131:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:131:20 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:131:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+18]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:131:23 ===---
mov ax, 3
mov bx, ax
pop ax
cmp ax, bx
je ROTULO1152
jmp ROTULO1153
ROTULO1152:
mov ax, 65535
jmp ROTULO1154
ROTULO1153:
xor ax, ax
ROTULO1154:
cmp ax, 0
jne ROTULO1150
jmp ROTULO1151
ROTULO1150:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:131:30 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:131:41 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 20
push word [bp+10+2]
pop es
mov di, [bp+10]
es mov ax, [di+20]
mov [bp+-6], ax
ROTULO1151:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:132:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:132:20 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:132:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+18]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:132:23 ===---
mov ax, 4
mov bx, ax
pop ax
cmp ax, bx
je ROTULO1157
jmp ROTULO1158
ROTULO1157:
mov ax, 65535
jmp ROTULO1159
ROTULO1158:
xor ax, ax
ROTULO1159:
cmp ax, 0
jne ROTULO1155
jmp ROTULO1156
ROTULO1155:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:132:30 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:132:41 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 22
push word [bp+10+2]
pop es
mov di, [bp+10]
es mov ax, [di+22]
mov [bp+-6], ax
ROTULO1156:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:133:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:133:20 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:133:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+18]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:133:23 ===---
mov ax, 5
mov bx, ax
pop ax
cmp ax, bx
je ROTULO1162
jmp ROTULO1163
ROTULO1162:
mov ax, 65535
jmp ROTULO1164
ROTULO1163:
xor ax, ax
ROTULO1164:
cmp ax, 0
jne ROTULO1160
jmp ROTULO1161
ROTULO1160:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:133:30 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:133:41 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 24
push word [bp+10+2]
pop es
mov di, [bp+10]
es mov ax, [di+24]
mov [bp+-6], ax
ROTULO1161:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:134:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:134:20 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:134:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+18]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:134:23 ===---
mov ax, 6
mov bx, ax
pop ax
cmp ax, bx
je ROTULO1167
jmp ROTULO1168
ROTULO1167:
mov ax, 65535
jmp ROTULO1169
ROTULO1168:
xor ax, ax
ROTULO1169:
cmp ax, 0
jne ROTULO1165
jmp ROTULO1166
ROTULO1165:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:134:30 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:134:41 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 26
push word [bp+10+2]
pop es
mov di, [bp+10]
es mov ax, [di+26]
mov [bp+-6], ax
ROTULO1166:
jmp ROTULO1170
ROTULO1131:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:136:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:136:20 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:136:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+18]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:136:25 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:136:27 ===---
mov ax, 512
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:136:23 ===---
mov ax, 7
pop bx
add ax, bx
mov bx, ax
pop ax
cmp ax, bx
jb ROTULO1173
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
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:137:17 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:137:48 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 28
push word [bp+10+2]
pop es
mov di, [bp+10]
es mov ax, [di+28]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:137:41 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+14+2]
pop es
mov di, [bp+14]
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:137:27 ===---
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
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:138:17 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:138:27 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:138:29 ===---
mov ax, 7
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:138:23 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+18]
pop bx
sub ax, bx
mov [bp+18], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:139:17 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:139:23 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+14+2]
pop es
mov di, [bp+14]
push es
pop word [bp+-4+2]
mov [bp+-4], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:140:18 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:140:29 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:140:36 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:140:32 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+18]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:140:40 ===---
mov ax, 1
mov cx, ax
pop ax
shl ax, cl
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:140:25 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
pop bx
add ax, bx
mov [bp+-4], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:141:17 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:141:28 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-4+2]
pop es
mov di, [bp+-4]
es mov ax, [di+0]
mov [bp+-6], ax
jmp ROTULO1176
ROTULO1172:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:143:23 ===---
mov ax, _minixfs
mov [bp+-8], ax
mov ax, 143
mov [bp+-10], ax
mov ax, 7
cs jmp word [_os_trycode]
ROTULO1176:
ROTULO1170:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:146:9 ===---
; ACAO DEC - Decrementa variavel
dec word [bp+-6]
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:147:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:147:40 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-6]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:147:33 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+14+2]
pop es
mov di, [bp+14]
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:147:19 ===---
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
ROTULO1129:
mov sp, bp
pop bp
FIM_minixfs_readblockfromitem:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:150:14 ===---
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
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:150:25 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:150:50 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:150:65 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:150:92 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:151:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:152:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:153:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:154:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:155:13 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:156:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:156:15 ===---
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
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:157:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:157:27 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_minixfs_inuse+2]
pop es
cs mov di, [_minixfs_inuse]
push es
push di
push cs
call _semaphore_waitone
add sp, 4
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:158:11 ===---
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
mov ax, ROTULO1178
cs mov [_os_trycode], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:159:13 ===---
; ACAO STRUCTURE - Aloca estrutura na pilha
sub sp, 32
push ss
pop es
mov di, sp
push es
pop word [bp+-14+2]
mov [bp+-14], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:160:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:160:38 ===---
; ACAO LEITURA - Le ponteiro
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:160:27 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 33
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+33]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:160:22 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-30+2]
pop es
mov di, [bp+-30]
push es
push di
push cs
call _minixfs_loaditem
add sp, 10
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:161:13 ===---
; ACAO STRUCTURE - Aloca estrutura na pilha
sub sp, 1024
push ss
pop es
mov di, sp
push es
pop word [bp+-18+2]
mov [bp+-18], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:162:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:162:59 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:162:55 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:162:61 ===---
mov ax, 32
cmp ax, 0
jne ROTULO1180
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:162:61 ===---
mov ax, _minixfs
mov [bp+-8], ax
mov ax, 162
mov [bp+-10], ax
mov ax, 1
cs jmp word [_os_trycode]
ROTULO1180:
mov bx, ax
pop ax
xor dx, dx
div bx
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:162:48 ===---
; ACAO LEITURA - Le ponteiro
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:162:36 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-14+2]
pop es
mov di, [bp+-14]
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:162:31 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-30+2]
pop es
mov di, [bp+-30]
push es
push di
push cs
call _minixfs_readblockfromitem
add sp, 14
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:163:13 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:163:19 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-18+2]
pop es
mov di, [bp+-18]
push es
pop word [bp+-22+2]
mov [bp+-22], di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:164:14 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO GRAVACAO - Grava em variavel
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:164:25 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:164:41 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:164:43 ===---
; ACAO CHAMADA - Calcula tamanho de item
mov ax, 32
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:164:33 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:164:29 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:164:37 ===---
mov ax, 32
cmp ax, 0
jne ROTULO1181
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:164:37 ===---
mov ax, _minixfs
mov [bp+-8], ax
mov ax, 164
mov [bp+-10], ax
mov ax, 1
cs jmp word [_os_trycode]
ROTULO1181:
mov bx, ax
pop ax
xor dx, dx
div bx
mov ax, dx
pop bx
mul bx
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:164:21 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO LEITURA - Le variavel
mov ax, [bp+-22]
pop bx
add ax, bx
mov [bp+-22], ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:165:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:165:41 ===---
; ACAO CHAMADA - Calcula tamanho de item
mov ax, 32
push ax
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:165:36 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-22+2]
pop es
mov di, [bp+-22]
push es
push di
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:165:25 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+16+2]
pop es
mov di, [bp+16]
push es
push di
push cs
call _memory_copy
add sp, 10
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:166:13 ===---
; ACAO STRUCTURE - Incremento de ponteiro
push word [bp+16+2]
pop es
mov di, [bp+16]
es inc word [di+0]
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
jmp ROTULO1179
ROTULO1178:
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
jmp ROTULO1177
jmp ROTULO1179
ROTULO1183:
cs jmp word [_os_tryfatal]
ROTULO1179:
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
jmp ROTULO1177
ROTULO1177:
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
ROTULO1185:
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
jbe ROTULO1188
jmp ROTULO1189
ROTULO1188:
mov ax, 65535
jmp ROTULO1190
ROTULO1189:
xor ax, ax
ROTULO1190:
cmp ax, 0
jne ROTULO1186
jmp ROTULO1187
ROTULO1186:
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
je ROTULO1193
jmp ROTULO1194
ROTULO1193:
mov ax, 65535
jmp ROTULO1195
ROTULO1194:
xor ax, ax
ROTULO1195:
cmp ax, 0
jne ROTULO1191
jmp ROTULO1192
ROTULO1191:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:187:59 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:187:66 ===---
xor ax, ax
jmp ROTULO1184
ROTULO1192:
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
jne ROTULO1196
jmp ROTULO1197
ROTULO1196:
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
je ROTULO1203
jmp ROTULO1204
ROTULO1203:
mov ax, 65535
jmp ROTULO1205
ROTULO1204:
xor ax, ax
ROTULO1205:
cmp ax, 0
jne ROTULO1201
jmp ROTULO1202
ROTULO1201:
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
jmp ROTULO1184
ROTULO1202:
ROTULO1197:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:186:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-2]
jmp ROTULO1185
ROTULO1187:
ROTULO1184:
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
ROTULO1207:
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
jbe ROTULO1210
jmp ROTULO1211
ROTULO1210:
mov ax, 65535
jmp ROTULO1212
ROTULO1211:
xor ax, ax
ROTULO1212:
cmp ax, 0
jne ROTULO1208
jmp ROTULO1209
ROTULO1208:
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
je ROTULO1215
jmp ROTULO1216
ROTULO1215:
mov ax, 65535
jmp ROTULO1217
ROTULO1216:
xor ax, ax
ROTULO1217:
cmp ax, 0
jne ROTULO1213
jmp ROTULO1214
ROTULO1213:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:221:59 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:221:66 ===---
xor ax, ax
jmp ROTULO1206
ROTULO1214:
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
mov ax, 16384
mov bx, ax
pop ax
and ax, bx
cmp ax, 0
jne ROTULO1218
jmp ROTULO1219
ROTULO1218:
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
je ROTULO1225
jmp ROTULO1226
ROTULO1225:
mov ax, 65535
jmp ROTULO1227
ROTULO1226:
xor ax, ax
ROTULO1227:
cmp ax, 0
jne ROTULO1223
jmp ROTULO1224
ROTULO1223:
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
jmp ROTULO1206
ROTULO1224:
ROTULO1219:
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:220:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-2]
jmp ROTULO1207
ROTULO1209:
ROTULO1206:
mov sp, bp
pop bp
FIM_minixfs_getfileinfo:
retf
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:243:9 ===---
_minixfs_open:
push bp
mov bp, sp
; ARG: file TAM: 4 POS: BP+6 
; ARG: s TAM: 4 POS: BP+10 
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:243:14 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:243:32 ===---
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:244:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:244:16 ===---
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
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:245:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== /home/humberto/Nextcloud/hcso/Kernel/MinixFS.hcb:245:31 ===---
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
ROTULO1228:
mov sp, bp
pop bp
FIM_minixfs_open:
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
ROTULO1229:
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
ROTULO1230:
mov sp, bp
pop bp
FIM_fileinfo_initialize:
retf
; MODULO FIM: fileinfo
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
dw 0
dw 0
dw 0
dw 0
END:
