;     ---=== System.OS.hcb:8:9 ===---
;     ---=== System.OS.hcb:10:13 ===---
cpu 8086
;     ---=== System.OS.hcb:11:13 ===---
bits 16
;     ---=== System.OS.hcb:12:13 ===---
org 0x100
;     ---=== System.OS.hcb:13:13 ===---
mov word [_os_minstackptr], END
;     ---=== System.OS.hcb:14:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _os_start2
ROTULO0:
;     ---=== System.OS.hcb:1:8 ===---
; MODULO: os
_os:
db 13
db 83,121,115,116,101,109,46,79,83,46,104,99,98
db 0
;     ---=== System.OS.hcb:2:9 ===---
_os_trystack:
times 2 db 0
;     ---=== System.OS.hcb:3:9 ===---
_os_trycode:
times 2 db 0
;     ---=== System.OS.hcb:4:9 ===---
_os_trybase:
times 2 db 0
;     ---=== System.OS.hcb:5:9 ===---
_os_tryfatal:
times 2 db 0
;     ---=== System.OS.hcb:6:9 ===---
_os_minstackptr:
times 2 db 0
;     ---=== System.OS.hcb:8:9 ===---
;     ---=== System.OS.hcb:17:9 ===---
_os_stackcheck:
ROTULO1:
FIM_os_stackcheck:
retf
;     ---=== System.OS.hcb:21:9 ===---
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
;     ---=== System.OS.hcb:23:13 ===---
;     ---=== System.OS.hcb:25:13 ===---
;     ---=== System.OS.hcb:26:13 ===---
;     ---=== System.OS.hcb:27:13 ===---
;     ---=== System.OS.hcb:28:13 ===---
;     ---=== System.OS.hcb:29:13 ===---
;     ---=== System.OS.hcb:30:10 ===---
; ACAO GRAVACAO - Grava segmento em variavel
;     ---=== System.OS.hcb:30:19 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _os_codesegment
mov word [bp+-18+2], ax
;     ---=== System.OS.hcb:31:10 ===---
; ACAO GRAVACAO - Grava segmento em variavel
;     ---=== System.OS.hcb:31:16 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _os_codesegment
mov word [bp+-22+2], ax
;     ---=== System.OS.hcb:32:10 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.OS.hcb:32:19 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _os_realoctable
mov [bp+-18], ax
;     ---=== System.OS.hcb:33:9 ===---
ROTULO3:
;     ---=== System.OS.hcb:33:22 ===---
;     ---=== System.OS.hcb:33:15 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-18+2]
pop es
mov di, [bp+-18]
es mov ax, [di+0]
push ax
;     ---=== System.OS.hcb:33:25 ===---
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
;     ---=== System.OS.hcb:34:13 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.OS.hcb:34:26 ===---
; ACAO LEITURA - Le ponteiro
es mov ax, [di+0]
mov [bp+-24], ax
;     ---=== System.OS.hcb:35:14 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-18]
;     ---=== System.OS.hcb:36:14 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-18]
;     ---=== System.OS.hcb:37:14 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.OS.hcb:37:20 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-18+2]
pop es
mov di, [bp+-18]
es mov ax, [di+0]
mov [bp+-22], ax
;     ---=== System.OS.hcb:38:14 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-18]
;     ---=== System.OS.hcb:39:14 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-18]
;     ---=== System.OS.hcb:40:13 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.OS.hcb:40:22 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-18+2]
pop es
mov di, [bp+-18]
es mov ax, [di+0]
mov [bp+-26], ax
;     ---=== System.OS.hcb:41:14 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-18]
;     ---=== System.OS.hcb:42:14 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-18]
;     ---=== System.OS.hcb:43:13 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.OS.hcb:43:20 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-18+2]
pop es
mov di, [bp+-18]
es mov ax, [di+0]
mov [bp+-28], ax
;     ---=== System.OS.hcb:44:14 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-18]
;     ---=== System.OS.hcb:45:14 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-18]
;     ---=== System.OS.hcb:46:13 ===---
;     ---=== System.OS.hcb:46:27 ===---
;     ---=== System.OS.hcb:46:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-24]
push ax
;     ---=== System.OS.hcb:46:30 ===---
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
;     ---=== System.OS.hcb:47:17 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.OS.hcb:47:33 ===---
;     ---=== System.OS.hcb:47:36 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-22]
push ax
;     ---=== System.OS.hcb:47:26 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-26]
pop bx
add ax, bx
mov [bp+-26], ax
;     ---=== System.OS.hcb:48:17 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.OS.hcb:48:23 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-26]
push word [bp+-22+2]
pop es
mov di, [bp+-22]
es mov [di+0], ax
;     ---=== System.OS.hcb:49:18 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-22]
;     ---=== System.OS.hcb:50:18 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-22]
;     ---=== System.OS.hcb:51:17 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.OS.hcb:51:37 ===---
;     ---=== System.OS.hcb:51:39 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-28]
push ax
;     ---=== System.OS.hcb:51:23 ===---
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
;     ---=== System.OS.hcb:53:13 ===---
;     ---=== System.OS.hcb:53:27 ===---
;     ---=== System.OS.hcb:53:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-24]
push ax
;     ---=== System.OS.hcb:53:30 ===---
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
;     ---=== System.OS.hcb:54:18 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.OS.hcb:54:29 ===---
;     ---=== System.OS.hcb:54:31 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-26]
push ax
;     ---=== System.OS.hcb:54:25 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-22]
pop bx
add ax, bx
mov [bp+-22], ax
;     ---=== System.OS.hcb:55:17 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.OS.hcb:55:38 ===---
;     ---=== System.OS.hcb:55:40 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-28]
push ax
;     ---=== System.OS.hcb:55:23 ===---
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
;     ---=== System.OS.hcb:57:13 ===---
;     ---=== System.OS.hcb:57:27 ===---
;     ---=== System.OS.hcb:57:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-24]
push ax
;     ---=== System.OS.hcb:57:30 ===---
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
;     ---=== System.OS.hcb:58:18 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.OS.hcb:58:29 ===---
;     ---=== System.OS.hcb:58:31 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-26]
push ax
;     ---=== System.OS.hcb:58:25 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-22]
pop bx
add ax, bx
mov [bp+-22], ax
;     ---=== System.OS.hcb:59:17 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.OS.hcb:59:37 ===---
;     ---=== System.OS.hcb:59:39 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-28]
push ax
;     ---=== System.OS.hcb:59:23 ===---
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
;     ---=== System.OS.hcb:63:13 ===---
mov ax, cs
;     ---=== System.OS.hcb:64:13 ===---
mov [bp-2], ax
;     ---=== System.OS.hcb:65:13 ===---
mov word [bp-4], 0x80
;     ---=== System.OS.hcb:67:13 ===---
mov al, [0x80]
;     ---=== System.OS.hcb:68:13 ===---
xor ah, ah
;     ---=== System.OS.hcb:69:13 ===---
mov si, ax
;     ---=== System.OS.hcb:70:13 ===---
add si, 0x80
;     ---=== System.OS.hcb:71:13 ===---
mov byte [si+1], 0
;     ---=== System.OS.hcb:73:11 ===---
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
;     ---=== System.OS.hcb:74:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.OS.hcb:74:26 ===---
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
;     ---=== System.OS.hcb:76:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.OS.hcb:76:65 ===---
; ACAO CHAMADA - Le linha com erro
mov ax, [bp+-10]
push ax
;     ---=== System.OS.hcb:76:52 ===---
; ACAO CHAMADA - Le nome do arquivo com erro
mov di, [bp+-8]
push cs
pop es
push es
push di
;     ---=== System.OS.hcb:76:32 ===---
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
;     ---=== System.OS.hcb:78:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.OS.hcb:78:65 ===---
; ACAO CHAMADA - Le linha com erro
mov ax, [bp+-10]
push ax
;     ---=== System.OS.hcb:78:52 ===---
; ACAO CHAMADA - Le nome do arquivo com erro
mov di, [bp+-8]
push cs
pop es
push es
push di
;     ---=== System.OS.hcb:78:32 ===---
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
;     ---=== System.OS.hcb:80:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.OS.hcb:80:60 ===---
; ACAO CHAMADA - Le linha com erro
mov ax, [bp+-10]
push ax
;     ---=== System.OS.hcb:80:47 ===---
; ACAO CHAMADA - Le nome do arquivo com erro
mov di, [bp+-8]
push cs
pop es
push es
push di
;     ---=== System.OS.hcb:80:32 ===---
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
;     ---=== System.OS.hcb:82:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.OS.hcb:82:71 ===---
; ACAO CHAMADA - Le linha com erro
mov ax, [bp+-10]
push ax
;     ---=== System.OS.hcb:82:58 ===---
; ACAO CHAMADA - Le nome do arquivo com erro
mov di, [bp+-8]
push cs
pop es
push es
push di
;     ---=== System.OS.hcb:82:32 ===---
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
;     ---=== System.OS.hcb:84:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.OS.hcb:84:63 ===---
; ACAO CHAMADA - Le linha com erro
mov ax, [bp+-10]
push ax
;     ---=== System.OS.hcb:84:50 ===---
; ACAO CHAMADA - Le nome do arquivo com erro
mov di, [bp+-8]
push cs
pop es
push es
push di
;     ---=== System.OS.hcb:84:32 ===---
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
;     ---=== System.OS.hcb:86:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.OS.hcb:86:63 ===---
; ACAO CHAMADA - Le linha com erro
mov ax, [bp+-10]
push ax
;     ---=== System.OS.hcb:86:50 ===---
; ACAO CHAMADA - Le nome do arquivo com erro
mov di, [bp+-8]
push cs
pop es
push es
push di
;     ---=== System.OS.hcb:86:32 ===---
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
;     ---=== System.OS.hcb:88:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.OS.hcb:88:65 ===---
; ACAO CHAMADA - Le linha com erro
mov ax, [bp+-10]
push ax
;     ---=== System.OS.hcb:88:52 ===---
; ACAO CHAMADA - Le nome do arquivo com erro
mov di, [bp+-8]
push cs
pop es
push es
push di
;     ---=== System.OS.hcb:88:32 ===---
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
;     ---=== System.OS.hcb:90:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.OS.hcb:90:67 ===---
; ACAO CHAMADA - Le linha com erro
mov ax, [bp+-10]
push ax
;     ---=== System.OS.hcb:90:54 ===---
; ACAO CHAMADA - Le nome do arquivo com erro
mov di, [bp+-8]
push cs
pop es
push es
push di
;     ---=== System.OS.hcb:90:32 ===---
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
;     ---=== System.OS.hcb:92:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.OS.hcb:92:70 ===---
; ACAO CHAMADA - Le linha com erro
mov ax, [bp+-10]
push ax
;     ---=== System.OS.hcb:92:57 ===---
; ACAO CHAMADA - Le nome do arquivo com erro
mov di, [bp+-8]
push cs
pop es
push es
push di
;     ---=== System.OS.hcb:92:32 ===---
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
;     ---=== System.OS.hcb:94:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.OS.hcb:94:61 ===---
; ACAO CHAMADA - Le linha com erro
mov ax, [bp+-10]
push ax
;     ---=== System.OS.hcb:94:48 ===---
; ACAO CHAMADA - Le nome do arquivo com erro
mov di, [bp+-8]
push cs
pop es
push es
push di
;     ---=== System.OS.hcb:94:32 ===---
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
;     ---=== System.OS.hcb:96:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.OS.hcb:96:72 ===---
; ACAO CHAMADA - Le linha com erro
mov ax, [bp+-10]
push ax
;     ---=== System.OS.hcb:96:59 ===---
; ACAO CHAMADA - Le nome do arquivo com erro
mov di, [bp+-8]
push cs
pop es
push es
push di
;     ---=== System.OS.hcb:96:32 ===---
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
;     ---=== System.OS.hcb:98:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.OS.hcb:98:63 ===---
; ACAO CHAMADA - Le linha com erro
mov ax, [bp+-10]
push ax
;     ---=== System.OS.hcb:98:50 ===---
; ACAO CHAMADA - Le nome do arquivo com erro
mov di, [bp+-8]
push cs
pop es
push es
push di
;     ---=== System.OS.hcb:98:32 ===---
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
;     ---=== System.OS.hcb:100:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.OS.hcb:100:62 ===---
; ACAO CHAMADA - Le linha com erro
mov ax, [bp+-10]
push ax
;     ---=== System.OS.hcb:100:49 ===---
; ACAO CHAMADA - Le nome do arquivo com erro
mov di, [bp+-8]
push cs
pop es
push es
push di
;     ---=== System.OS.hcb:100:32 ===---
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
;     ---=== System.OS.hcb:102:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.OS.hcb:102:76 ===---
; ACAO CHAMADA - Le linha com erro
mov ax, [bp+-10]
push ax
;     ---=== System.OS.hcb:102:63 ===---
; ACAO CHAMADA - Le nome do arquivo com erro
mov di, [bp+-8]
push cs
pop es
push es
push di
;     ---=== System.OS.hcb:102:32 ===---
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
;     ---=== System.OS.hcb:105:9 ===---
ROTULO82:
;     ---=== System.OS.hcb:105:15 ===---
mov ax, 1
cmp ax, 0
jne ROTULO83
jmp ROTULO84
ROTULO83:
;     ---=== System.OS.hcb:106:17 ===---
hlt
jmp ROTULO82
ROTULO84:
ROTULO2:
mov sp, bp
pop bp
FIM_os_start2:
retf
;     ---=== System.OS.hcb:110:21 ===---
_os_codesegment:
;     ---=== System.OS.hcb:111:13 ===---
mov ax, cs
ROTULO85:
FIM_os_codesegment:
retf
;     ---=== System.OS.hcb:114:21 ===---
_os_stacksegment:
;     ---=== System.OS.hcb:115:13 ===---
mov ax, ss
ROTULO86:
FIM_os_stacksegment:
retf
;     ---=== System.OS.hcb:118:21 ===---
_os_realoctable:
;     ---=== System.OS.hcb:119:13 ===---
mov ax, REALOC_TABLE
ROTULO87:
FIM_os_realoctable:
retf
;     ---=== System.OS.hcb:122:21 ===---
_os_consoleavail:
ROTULO88:
FIM_os_consoleavail:
retf
;     ---=== System.OS.hcb:126:21 ===---
_os_consolereadchar:
ROTULO89:
FIM_os_consolereadchar:
retf
;     ---=== System.OS.hcb:130:16 ===---
_os_consolewritechar:
push bp
mov bp, sp
; ARG: c TAM: 2 POS: BP+6 
;     ---=== System.OS.hcb:130:33 ===---
;     ---=== System.OS.hcb:131:13 ===---
mov ax, [bp+6]
;     ---=== System.OS.hcb:132:13 ===---
mov ah, 0xe
;     ---=== System.OS.hcb:133:13 ===---
int 0x10
ROTULO90:
mov sp, bp
pop bp
FIM_os_consolewritechar:
retf
; MODULO FIM: os
;     ---=== husix.hcb:15:8 ===---
; MODULO: program
_program:
db 9
db 104,117,115,105,120,46,104,99,98
db 0
;     ---=== husix.hcb:17:16 ===---
_program_main:
push bp
mov bp, sp
sub sp, 16
push cs
call _os_stackcheck
; ARG: args TAM: 4 POS: BP+6 
; ARG: ptr TAM: 4 POS: BP--4 
; ARG: ver TAM: 4 POS: BP--8 
; ARG: disk TAM: 4 POS: BP--12 
; ARG: block TAM: 4 POS: BP--16 
;     ---=== husix.hcb:17:21 ===---
;     ---=== husix.hcb:18:13 ===---
;     ---=== husix.hcb:19:13 ===---
;     ---=== husix.hcb:50:13 ===---
;     ---=== husix.hcb:55:13 ===---
;     ---=== husix.hcb:20:9 ===---
; ACAO STRUCTURE - Aloca estrutura na pilha
sub sp, 10
push ss
pop es
mov di, sp
push es
pop word [bp+-8+2]
mov [bp+-8], di
;     ---=== husix.hcb:21:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:21:33 ===---
; ACAO LEITURA - Le ponteiro
push es
push di
push cs
call _husixversion_getversion
add sp, 4
;     ---=== husix.hcb:22:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _console_mode80x25x4
;     ---=== husix.hcb:23:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:23:27 ===---
push cs
pop es
mov di, ROTULO93
jmp ROTULO92
ROTULO93:
db 22
db 72,85,83,73,88,32,79,112,101,114,97,116,105,110,103,32,83,121,115,116,101,109
times 1 db 0
ROTULO92:
push es
push di
push cs
call _console_writeline
add sp, 4
;     ---=== husix.hcb:24:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:24:23 ===---
push cs
pop es
mov di, ROTULO95
jmp ROTULO94
ROTULO95:
db 8
db 75,101,114,110,101,108,32,118
times 1 db 0
ROTULO94:
push es
push di
push cs
call _console_write
add sp, 4
;     ---=== husix.hcb:25:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:25:29 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 0
push word [bp+-8+2]
pop es
mov di, [bp+-8]
es mov ax, [di+0]
push ax
push cs
call _console_writeuint16
add sp, 2
;     ---=== husix.hcb:26:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:26:23 ===---
push cs
pop es
mov di, ROTULO97
jmp ROTULO96
ROTULO97:
db 1
db 46
times 1 db 0
ROTULO96:
push es
push di
push cs
call _console_write
add sp, 4
;     ---=== husix.hcb:27:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:27:29 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 2
push word [bp+-8+2]
pop es
mov di, [bp+-8]
es mov ax, [di+2]
push ax
push cs
call _console_writeuint16
add sp, 2
;     ---=== husix.hcb:28:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:28:23 ===---
push cs
pop es
mov di, ROTULO99
jmp ROTULO98
ROTULO99:
db 2
db 32,82
times 1 db 0
ROTULO98:
push es
push di
push cs
call _console_write
add sp, 4
;     ---=== husix.hcb:29:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:29:29 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 4
push word [bp+-8+2]
pop es
mov di, [bp+-8]
es mov ax, [di+4]
push ax
push cs
call _console_writeuint16
add sp, 2
;     ---=== husix.hcb:30:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:30:23 ===---
push cs
pop es
mov di, ROTULO101
jmp ROTULO100
ROTULO101:
db 3
db 32,45,32
times 1 db 0
ROTULO100:
push es
push di
push cs
call _console_write
add sp, 4
;     ---=== husix.hcb:31:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:31:27 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - Ponteiro Byte - Desvio 6
push word [bp+-8+2]
pop es
mov di, [bp+-8]
es push word [di+6+2]
es push word [di+6]
pop di
pop es
push es
push di
push cs
call _console_writeline
add sp, 4
;     ---=== husix.hcb:32:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:32:23 ===---
push cs
pop es
mov di, ROTULO103
jmp ROTULO102
ROTULO103:
db 12
db 73,110,105,116,105,97,108,105,122,105,110,103
times 1 db 0
ROTULO102:
push es
push di
push cs
call _console_write
add sp, 4
;     ---=== husix.hcb:33:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _multithreading_preinitialize
;     ---=== husix.hcb:34:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:34:23 ===---
push cs
pop es
mov di, ROTULO105
jmp ROTULO104
ROTULO105:
db 1
db 46
times 1 db 0
ROTULO104:
push es
push di
push cs
call _console_write
add sp, 4
;     ---=== husix.hcb:35:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _globalmemory_initialize
;     ---=== husix.hcb:36:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:36:23 ===---
push cs
pop es
mov di, ROTULO107
jmp ROTULO106
ROTULO107:
db 1
db 46
times 1 db 0
ROTULO106:
push es
push di
push cs
call _console_write
add sp, 4
;     ---=== husix.hcb:37:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _memory_initialize
;     ---=== husix.hcb:38:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:38:23 ===---
push cs
pop es
mov di, ROTULO109
jmp ROTULO108
ROTULO109:
db 1
db 46
times 1 db 0
ROTULO108:
push es
push di
push cs
call _console_write
add sp, 4
;     ---=== husix.hcb:39:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _multithreading_initialize
;     ---=== husix.hcb:40:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:40:23 ===---
push cs
pop es
mov di, ROTULO111
jmp ROTULO110
ROTULO111:
db 1
db 46
times 1 db 0
ROTULO110:
push es
push di
push cs
call _console_write
add sp, 4
;     ---=== husix.hcb:41:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _systemtimer_initialize
;     ---=== husix.hcb:42:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:42:23 ===---
push cs
pop es
mov di, ROTULO113
jmp ROTULO112
ROTULO113:
db 1
db 46
times 1 db 0
ROTULO112:
push es
push di
push cs
call _console_write
add sp, 4
;     ---=== husix.hcb:43:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _multithreading_resume
;     ---=== husix.hcb:44:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:44:23 ===---
push cs
pop es
mov di, ROTULO115
jmp ROTULO114
ROTULO115:
db 1
db 46
times 1 db 0
ROTULO114:
push es
push di
push cs
call _console_write
add sp, 4
;     ---=== husix.hcb:45:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _disk_initialize
;     ---=== husix.hcb:46:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:46:27 ===---
push cs
pop es
mov di, ROTULO117
jmp ROTULO116
ROTULO117:
db 8
db 46,32,91,32,79,75,32,93
times 1 db 0
ROTULO116:
push es
push di
push cs
call _console_writeline
add sp, 4
;     ---=== husix.hcb:48:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _configdefault_initialize
;     ---=== husix.hcb:51:9 ===---
; ACAO STRUCTURE - Associa texto em estrutura
; ACAO GRAVACAO - Gravacao de texto em ponteiro
jmp ROTULO118
ROTULO119:
db 11
db 70,108,111,112,112,121,48,95,51,54,48
times 1 db 0
ROTULO118:
mov ax, cs
mov word [bp+-12+2], ax
mov ax, ROTULO119
mov [bp+-12], ax
;     ---=== husix.hcb:52:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:52:23 ===---
push cs
pop es
mov di, ROTULO121
jmp ROTULO120
ROTULO121:
db 9
db 77,111,117,110,116,105,110,103,32
times 1 db 0
ROTULO120:
push es
push di
push cs
call _console_write
add sp, 4
;     ---=== husix.hcb:53:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:53:23 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-12+2]
pop es
mov di, [bp+-12]
push es
push di
push cs
call _console_write
add sp, 4
;     ---=== husix.hcb:54:9 ===---
;     ---=== husix.hcb:54:12 ===---
;     ---=== husix.hcb:54:16 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:54:27 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-12+2]
pop es
mov di, [bp+-12]
push es
push di
push cs
call _disk_exist
add sp, 4
not ax
ROTULO124:
mov ax, 65535
jmp ROTULO126
ROTULO125:
xor ax, ax
ROTULO126:
cmp ax, 0
jne ROTULO122
jmp ROTULO123
ROTULO122:
;     ---=== husix.hcb:54:44 ===---
mov ax, _program
mov [bp+-8], ax
mov ax, 54
mov [bp+-10], ax
mov ax, 5
cs jmp word [_os_trycode]
ROTULO123:
;     ---=== husix.hcb:56:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:56:40 ===---
xor ax, ax
push ax
;     ---=== husix.hcb:56:37 ===---
xor ax, ax
push ax
;     ---=== husix.hcb:56:30 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-16+2]
pop es
mov di, [bp+-16]
push es
push di
;     ---=== husix.hcb:56:24 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-12+2]
pop es
mov di, [bp+-12]
push es
push di
push cs
call _disk_readblock
add sp, 12
;     ---=== husix.hcb:57:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:57:27 ===---
push cs
pop es
mov di, ROTULO128
jmp ROTULO127
ROTULO128:
db 8
db 46,32,91,32,79,75,32,93
times 1 db 0
ROTULO127:
push es
push di
push cs
call _console_writeline
add sp, 4
;     ---=== husix.hcb:60:9 ===---
ROTULO129:
;     ---=== husix.hcb:60:15 ===---
mov ax, 1
cmp ax, 0
jne ROTULO130
jmp ROTULO131
ROTULO130:
;     ---=== husix.hcb:61:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:61:31 ===---
mov ax, 13
push ax
push cs
call _console_writechar
add sp, 2
;     ---=== husix.hcb:62:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:62:33 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_clock_minute]
push ax
push cs
call _console_writeuint16
add sp, 2
;     ---=== husix.hcb:63:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:63:27 ===---
push cs
pop es
mov di, ROTULO133
jmp ROTULO132
ROTULO133:
db 1
db 58
times 1 db 0
ROTULO132:
push es
push di
push cs
call _console_write
add sp, 4
;     ---=== husix.hcb:64:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:64:33 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_clock_second]
push ax
push cs
call _console_writeuint16
add sp, 2
;     ---=== husix.hcb:65:13 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _thread_yield
jmp ROTULO129
ROTULO131:
ROTULO91:
mov sp, bp
pop bp
FIM_program_main:
retf
;     ---=== husix.hcb:69:16 ===---
_program_fatalerror:
push bp
mov bp, sp
; ARG: msg TAM: 4 POS: BP+6 
; ARG: file TAM: 4 POS: BP+10 
; ARG: line TAM: 2 POS: BP+14 
;     ---=== husix.hcb:69:27 ===---
;     ---=== husix.hcb:69:42 ===---
;     ---=== husix.hcb:69:58 ===---
;     ---=== husix.hcb:70:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _console_mode80x25x4
;     ---=== husix.hcb:71:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:71:27 ===---
push cs
pop es
mov di, ROTULO136
jmp ROTULO135
ROTULO136:
db 12
db 70,65,84,65,76,32,69,82,82,79,82,58
times 1 db 0
ROTULO135:
push es
push di
push cs
call _console_writeline
add sp, 4
;     ---=== husix.hcb:72:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:72:23 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+10+2]
pop es
mov di, [bp+10]
push es
push di
push cs
call _console_write
add sp, 4
;     ---=== husix.hcb:73:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:73:23 ===---
push cs
pop es
mov di, ROTULO138
jmp ROTULO137
ROTULO138:
db 1
db 58
times 1 db 0
ROTULO137:
push es
push di
push cs
call _console_write
add sp, 4
;     ---=== husix.hcb:74:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:74:29 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+14]
push ax
push cs
call _console_writeuint16
add sp, 2
;     ---=== husix.hcb:75:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:75:27 ===---
push cs
pop es
mov di, ROTULO140
jmp ROTULO139
ROTULO140:
db 1
db 58
times 1 db 0
ROTULO139:
push es
push di
push cs
call _console_writeline
add sp, 4
;     ---=== husix.hcb:76:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:76:27 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
push cs
call _console_writeline
add sp, 4
;     ---=== husix.hcb:77:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:77:27 ===---
push cs
pop es
mov di, ROTULO142
jmp ROTULO141
ROTULO142:
db 0
times 1 db 0
ROTULO141:
push es
push di
push cs
call _console_writeline
add sp, 4
;     ---=== husix.hcb:78:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:78:27 ===---
push cs
pop es
mov di, ROTULO144
jmp ROTULO143
ROTULO144:
db 15
db 60,83,89,83,84,69,77,32,72,65,76,84,69,68,62
times 1 db 0
ROTULO143:
push es
push di
push cs
call _console_writeline
add sp, 4
;     ---=== husix.hcb:79:9 ===---
ROTULO145:
;     ---=== husix.hcb:79:15 ===---
mov ax, 1
cmp ax, 0
jne ROTULO146
jmp ROTULO147
ROTULO146:
;     ---=== husix.hcb:80:17 ===---
cli
;     ---=== husix.hcb:81:17 ===---
hlt
jmp ROTULO145
ROTULO147:
ROTULO134:
mov sp, bp
pop bp
FIM_program_fatalerror:
retf
; MODULO FIM: program
;     ---=== Version.hcb:11:8 ===---
; MODULO: husixversion
_husixversion:
db 11
db 86,101,114,115,105,111,110,46,104,99,98
db 0
;     ---=== Version.hcb:12:16 ===---
_husixversion_getversion:
push bp
mov bp, sp
; ARG: ver TAM: 4 POS: BP+6 
;     ---=== Version.hcb:12:27 ===---
;     ---=== Version.hcb:14:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== Version.hcb:14:23 ===---
mov ax, 2023
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov [di+0], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== Version.hcb:15:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== Version.hcb:15:26 ===---
mov ax, 1
es mov [di+2], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== Version.hcb:16:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== Version.hcb:16:25 ===---
mov ax, 2823
es mov [di+4], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== Version.hcb:17:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== Version.hcb:17:23 ===---
push cs
pop es
mov di, ROTULO150
jmp ROTULO149
ROTULO150:
db 4
db 65,108,102,97
times 1 db 0
ROTULO149:
push es
push di
push word [bp+6+2]
pop es
mov di, [bp+6]
es pop word [di+6]
es pop word [di+6+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
ROTULO148:
mov sp, bp
pop bp
FIM_husixversion_getversion:
retf
; MODULO FIM: husixversion
;     ---=== System.IO.Console.hcb:4:8 ===---
; MODULO: console
_console:
db 21
db 83,121,115,116,101,109,46,73,79,46,67,111,110,115,111,108,101,46,104,99,98
db 0
;     ---=== System.IO.Console.hcb:6:16 ===---
_console_mode80x25x4:
;     ---=== System.IO.Console.hcb:7:13 ===---
mov ax, 3
;     ---=== System.IO.Console.hcb:8:13 ===---
int 0x10
ROTULO151:
FIM_console_mode80x25x4:
retf
;     ---=== System.IO.Console.hcb:11:21 ===---
_console_readchar:
;     ---=== System.IO.Console.hcb:12:9 ===---
;     ---=== System.IO.Console.hcb:12:16 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _os_consolereadchar
jmp ROTULO152
ROTULO152:
FIM_console_readchar:
retf
;     ---=== System.IO.Console.hcb:15:16 ===---
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
;     ---=== System.IO.Console.hcb:15:25 ===---
;     ---=== System.IO.Console.hcb:16:13 ===---
;     ---=== System.IO.Console.hcb:17:13 ===---
;     ---=== System.IO.Console.hcb:18:13 ===---
;     ---=== System.IO.Console.hcb:19:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.IO.Console.hcb:19:15 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
xor ax, ax
es mov al, [di+0]
mov [bp+-2], ax
;     ---=== System.IO.Console.hcb:20:10 ===---
; ACAO INC - Incrementa variavel
inc word [bp+6]
;     ---=== System.IO.Console.hcb:21:9 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-4], 0
;     ---=== System.IO.Console.hcb:22:9 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-6], 1
;     ---=== System.IO.Console.hcb:23:9 ===---
ROTULO154:
;     ---=== System.IO.Console.hcb:23:15 ===---
mov ax, 1
cmp ax, 0
jne ROTULO155
jmp ROTULO156
ROTULO155:
;     ---=== System.IO.Console.hcb:24:13 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.IO.Console.hcb:24:17 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _os_consolereadchar
mov [bp+-4], ax
;     ---=== System.IO.Console.hcb:25:13 ===---
;     ---=== System.IO.Console.hcb:25:18 ===---
;     ---=== System.IO.Console.hcb:25:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
push ax
;     ---=== System.IO.Console.hcb:25:21 ===---
mov ax, 13
mov bx, ax
pop ax
cmp ax, bx
je ROTULO159
jmp ROTULO160
ROTULO159:
mov ax, 65535
jmp ROTULO161
ROTULO160:
xor ax, ax
ROTULO161:
cmp ax, 0
jne ROTULO157
jmp ROTULO158
ROTULO157:
;     ---=== System.IO.Console.hcb:25:34 ===---
jmp done
ROTULO158:
;     ---=== System.IO.Console.hcb:26:13 ===---
;     ---=== System.IO.Console.hcb:26:18 ===---
;     ---=== System.IO.Console.hcb:26:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
push ax
;     ---=== System.IO.Console.hcb:26:21 ===---
mov ax, 10
mov bx, ax
pop ax
cmp ax, bx
je ROTULO164
jmp ROTULO165
ROTULO164:
mov ax, 65535
jmp ROTULO166
ROTULO165:
xor ax, ax
ROTULO166:
cmp ax, 0
jne ROTULO162
jmp ROTULO163
ROTULO162:
;     ---=== System.IO.Console.hcb:26:34 ===---
jmp done
ROTULO163:
;     ---=== System.IO.Console.hcb:27:13 ===---
;     ---=== System.IO.Console.hcb:27:18 ===---
;     ---=== System.IO.Console.hcb:27:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
push ax
;     ---=== System.IO.Console.hcb:27:21 ===---
mov ax, 9
mov bx, ax
pop ax
cmp ax, bx
je ROTULO169
jmp ROTULO170
ROTULO169:
mov ax, 65535
jmp ROTULO171
ROTULO170:
xor ax, ax
ROTULO171:
cmp ax, 0
jne ROTULO167
jmp ROTULO168
ROTULO167:
;     ---=== System.IO.Console.hcb:28:17 ===---
;     ---=== System.IO.Console.hcb:28:24 ===---
;     ---=== System.IO.Console.hcb:28:20 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-6]
push ax
;     ---=== System.IO.Console.hcb:28:26 ===---
mov ax, 1
mov bx, ax
pop ax
cmp ax, bx
ja ROTULO174
jmp ROTULO175
ROTULO174:
mov ax, 65535
jmp ROTULO176
ROTULO175:
xor ax, ax
ROTULO176:
cmp ax, 0
jne ROTULO172
jmp ROTULO173
ROTULO172:
;     ---=== System.IO.Console.hcb:29:21 ===---
; ACAO DEC - Decrementa variavel
dec word [bp+-6]
;     ---=== System.IO.Console.hcb:30:22 ===---
; ACAO DEC - Decrementa variavel
dec word [bp+6]
;     ---=== System.IO.Console.hcb:31:21 ===---
; ACAO GRAVACAO - Gravacao de numero em ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov byte [di+0], 0
;     ---=== System.IO.Console.hcb:32:21 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Console.hcb:32:39 ===---
mov ax, 9
push ax
push cs
call _console_writechar
add sp, 2
;     ---=== System.IO.Console.hcb:33:21 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Console.hcb:33:39 ===---
mov ax, 32
push ax
push cs
call _console_writechar
add sp, 2
;     ---=== System.IO.Console.hcb:34:21 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Console.hcb:34:39 ===---
mov ax, 9
push ax
push cs
call _console_writechar
add sp, 2
ROTULO173:
jmp ROTULO177
ROTULO168:
;     ---=== System.IO.Console.hcb:37:17 ===---
;     ---=== System.IO.Console.hcb:37:24 ===---
;     ---=== System.IO.Console.hcb:37:20 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-6]
push ax
;     ---=== System.IO.Console.hcb:37:26 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
mov bx, ax
pop ax
cmp ax, bx
jb ROTULO180
jmp ROTULO181
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
;     ---=== System.IO.Console.hcb:38:21 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Console.hcb:38:39 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
push ax
push cs
call _console_writechar
add sp, 2
;     ---=== System.IO.Console.hcb:39:21 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.IO.Console.hcb:39:27 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov [di+0], al
;     ---=== System.IO.Console.hcb:40:21 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-6]
;     ---=== System.IO.Console.hcb:41:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+6]
ROTULO179:
ROTULO177:
jmp ROTULO154
ROTULO156:
;     ---=== System.IO.Console.hcb:45:9 ===---
done:
;     ---=== System.IO.Console.hcb:46:9 ===---
; ACAO GRAVACAO - Gravacao de numero em ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov byte [di+0], 0
ROTULO153:
mov sp, bp
pop bp
FIM_console_readline:
retf
;     ---=== System.IO.Console.hcb:49:16 ===---
_console_writechar:
push bp
mov bp, sp
; ARG: c TAM: 2 POS: BP+6 
;     ---=== System.IO.Console.hcb:49:26 ===---
;     ---=== System.IO.Console.hcb:50:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Console.hcb:50:29 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
push ax
push cs
call _os_consolewritechar
add sp, 2
ROTULO183:
mov sp, bp
pop bp
FIM_console_writechar:
retf
;     ---=== System.IO.Console.hcb:53:16 ===---
_console_write:
push bp
mov bp, sp
; ARG: txt TAM: 4 POS: BP+6 
;     ---=== System.IO.Console.hcb:53:22 ===---
;     ---=== System.IO.Console.hcb:55:10 ===---
; ACAO INC - Incrementa variavel
inc word [bp+6]
;     ---=== System.IO.Console.hcb:56:9 ===---
ROTULO185:
;     ---=== System.IO.Console.hcb:56:19 ===---
;     ---=== System.IO.Console.hcb:56:15 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== System.IO.Console.hcb:56:21 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
ja ROTULO188
jmp ROTULO189
ROTULO188:
mov ax, 65535
jmp ROTULO190
ROTULO189:
xor ax, ax
ROTULO190:
cmp ax, 0
jne ROTULO186
jmp ROTULO187
ROTULO186:
;     ---=== System.IO.Console.hcb:57:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Console.hcb:57:23 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Console.hcb:57:47 ===---
; ACAO LEITURA - Le ponteiro
push es
push di
push cs
call _utf8_convertchartocp437
add sp, 4
push ax
push cs
call _console_writechar
add sp, 2
;     ---=== System.IO.Console.hcb:58:14 ===---
; ACAO INC - Incrementa variavel
inc word [bp+6]
jmp ROTULO185
ROTULO187:
ROTULO184:
mov sp, bp
pop bp
FIM_console_write:
retf
;     ---=== System.IO.Console.hcb:62:16 ===---
_console_writeline:
push bp
mov bp, sp
; ARG: txt TAM: 4 POS: BP+6 
;     ---=== System.IO.Console.hcb:62:26 ===---
;     ---=== System.IO.Console.hcb:63:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Console.hcb:63:15 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
push cs
call _console_write
add sp, 4
;     ---=== System.IO.Console.hcb:64:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Console.hcb:64:19 ===---
mov ax, 13
push ax
push cs
call _console_writechar
add sp, 2
;     ---=== System.IO.Console.hcb:65:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Console.hcb:65:19 ===---
mov ax, 10
push ax
push cs
call _console_writechar
add sp, 2
ROTULO191:
mov sp, bp
pop bp
FIM_console_writeline:
retf
;     ---=== System.IO.Console.hcb:68:16 ===---
_console_writeuint16:
push bp
mov bp, sp
sub sp, 4
push cs
call _os_stackcheck
; ARG: nro TAM: 2 POS: BP+6 
; ARG: tmp TAM: 2 POS: BP--2 
; ARG: prox TAM: 2 POS: BP--4 
;     ---=== System.IO.Console.hcb:68:28 ===---
;     ---=== System.IO.Console.hcb:69:13 ===---
;     ---=== System.IO.Console.hcb:70:13 ===---
;     ---=== System.IO.Console.hcb:71:13 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.IO.Console.hcb:71:23 ===---
;     ---=== System.IO.Console.hcb:71:19 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
push ax
;     ---=== System.IO.Console.hcb:71:27 ===---
mov ax, 10
cmp ax, 0
jne ROTULO193
;     ---=== System.IO.Console.hcb:71:27 ===---
mov ax, _console
mov [bp+-8], ax
mov ax, 71
mov [bp+-10], ax
mov ax, 1
cs jmp word [_os_trycode]
ROTULO193:
mov bx, ax
pop ax
xor dx, dx
div bx
mov ax, dx
mov [bp+-2], ax
;     ---=== System.IO.Console.hcb:72:13 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.IO.Console.hcb:72:24 ===---
;     ---=== System.IO.Console.hcb:72:20 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
push ax
;     ---=== System.IO.Console.hcb:72:26 ===---
mov ax, 10
cmp ax, 0
jne ROTULO194
;     ---=== System.IO.Console.hcb:72:26 ===---
mov ax, _console
mov [bp+-8], ax
mov ax, 72
mov [bp+-10], ax
mov ax, 1
cs jmp word [_os_trycode]
ROTULO194:
mov bx, ax
pop ax
xor dx, dx
div bx
mov [bp+-4], ax
;     ---=== System.IO.Console.hcb:73:9 ===---
;     ---=== System.IO.Console.hcb:73:17 ===---
;     ---=== System.IO.Console.hcb:73:12 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
push ax
;     ---=== System.IO.Console.hcb:73:19 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
ja ROTULO197
jmp ROTULO198
ROTULO197:
mov ax, 65535
jmp ROTULO199
ROTULO198:
xor ax, ax
ROTULO199:
cmp ax, 0
jne ROTULO195
jmp ROTULO196
ROTULO195:
;     ---=== System.IO.Console.hcb:73:26 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Console.hcb:73:38 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
push ax
push cs
call _console_writeuint16
add sp, 2
ROTULO196:
;     ---=== System.IO.Console.hcb:74:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Console.hcb:74:22 ===---
;     ---=== System.IO.Console.hcb:74:24 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== System.IO.Console.hcb:74:19 ===---
mov ax, 48
pop bx
add ax, bx
push ax
push cs
call _console_writechar
add sp, 2
ROTULO192:
mov sp, bp
pop bp
FIM_console_writeuint16:
retf
;     ---=== System.IO.Console.hcb:77:16 ===---
_console_writeint16:
push bp
mov bp, sp
; ARG: nro TAM: 2 POS: BP+6 
;     ---=== System.IO.Console.hcb:77:27 ===---
;     ---=== System.IO.Console.hcb:78:9 ===---
;     ---=== System.IO.Console.hcb:78:16 ===---
;     ---=== System.IO.Console.hcb:78:12 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
push ax
;     ---=== System.IO.Console.hcb:78:18 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
jl ROTULO203
jmp ROTULO204
ROTULO203:
mov ax, 65535
jmp ROTULO205
ROTULO204:
xor ax, ax
ROTULO205:
cmp ax, 0
jne ROTULO201
jmp ROTULO202
ROTULO201:
;     ---=== System.IO.Console.hcb:79:17 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.IO.Console.hcb:79:23 ===---
;     ---=== System.IO.Console.hcb:79:24 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
push ax
;     ---=== System.IO.Console.hcb:79:23 ===---
xor ax, ax
pop bx
sub ax, bx
mov [bp+6], ax
ROTULO202:
;     ---=== System.IO.Console.hcb:81:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Console.hcb:81:21 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
push ax
push cs
call _console_writeuint16
add sp, 2
ROTULO200:
mov sp, bp
pop bp
FIM_console_writeint16:
retf
;     ---=== System.IO.Console.hcb:84:16 ===---
_console_writeuint8:
push bp
mov bp, sp
; ARG: nro TAM: 2 POS: BP+6 
;     ---=== System.IO.Console.hcb:84:27 ===---
;     ---=== System.IO.Console.hcb:85:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Console.hcb:85:21 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
push ax
push cs
call _console_writeuint16
add sp, 2
ROTULO206:
mov sp, bp
pop bp
FIM_console_writeuint8:
retf
;     ---=== System.IO.Console.hcb:88:16 ===---
_console_writeint8:
push bp
mov bp, sp
; ARG: nro TAM: 2 POS: BP+6 
;     ---=== System.IO.Console.hcb:88:26 ===---
;     ---=== System.IO.Console.hcb:89:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Console.hcb:89:20 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
push ax
push cs
call _console_writeint16
add sp, 2
ROTULO207:
mov sp, bp
pop bp
FIM_console_writeint8:
retf
; MODULO FIM: console
;     ---=== System.Text.hcb:1:8 ===---
; MODULO: utf8
_utf8:
db 15
db 83,121,115,116,101,109,46,84,101,120,116,46,104,99,98
db 0
;     ---=== System.Text.hcb:3:21 ===---
_utf8_charsize:
push bp
mov bp, sp
; ARG: c TAM: 4 POS: BP+6 
;     ---=== System.Text.hcb:3:30 ===---
;     ---=== System.Text.hcb:4:9 ===---
;     ---=== System.Text.hcb:4:14 ===---
;     ---=== System.Text.hcb:4:12 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== System.Text.hcb:4:16 ===---
mov ax, 128
mov bx, ax
pop ax
cmp ax, bx
jb ROTULO211
jmp ROTULO212
ROTULO211:
mov ax, 65535
jmp ROTULO213
ROTULO212:
xor ax, ax
ROTULO213:
cmp ax, 0
jne ROTULO209
jmp ROTULO210
ROTULO209:
;     ---=== System.Text.hcb:4:25 ===---
;     ---=== System.Text.hcb:4:32 ===---
mov ax, 1
jmp ROTULO208
ROTULO210:
;     ---=== System.Text.hcb:5:9 ===---
;     ---=== System.Text.hcb:5:22 ===---
;     ---=== System.Text.hcb:5:14 ===---
;     ---=== System.Text.hcb:5:12 ===---
; ACAO LEITURA - Le ponteiro
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== System.Text.hcb:5:17 ===---
mov ax, 194
mov bx, ax
pop ax
cmp ax, bx
jae ROTULO219
jmp ROTULO220
ROTULO219:
mov ax, 65535
jmp ROTULO221
ROTULO220:
xor ax, ax
ROTULO221:
cmp ax, 0
je ROTULO217
;     ---=== System.Text.hcb:5:32 ===---
;     ---=== System.Text.hcb:5:30 ===---
; ACAO LEITURA - Le ponteiro
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== System.Text.hcb:5:35 ===---
mov ax, 223
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO222
jmp ROTULO223
ROTULO222:
mov ax, 65535
jmp ROTULO224
ROTULO223:
xor ax, ax
ROTULO224:
cmp ax, 0
je ROTULO217
ROTULO216:
mov ax, 65535
jmp ROTULO218
ROTULO217:
xor ax, ax
ROTULO218:
cmp ax, 0
jne ROTULO214
jmp ROTULO215
ROTULO214:
;     ---=== System.Text.hcb:5:45 ===---
;     ---=== System.Text.hcb:5:52 ===---
mov ax, 2
jmp ROTULO208
ROTULO215:
;     ---=== System.Text.hcb:6:9 ===---
;     ---=== System.Text.hcb:6:22 ===---
;     ---=== System.Text.hcb:6:14 ===---
;     ---=== System.Text.hcb:6:12 ===---
; ACAO LEITURA - Le ponteiro
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== System.Text.hcb:6:17 ===---
mov ax, 224
mov bx, ax
pop ax
cmp ax, bx
jae ROTULO230
jmp ROTULO231
ROTULO230:
mov ax, 65535
jmp ROTULO232
ROTULO231:
xor ax, ax
ROTULO232:
cmp ax, 0
je ROTULO228
;     ---=== System.Text.hcb:6:32 ===---
;     ---=== System.Text.hcb:6:30 ===---
; ACAO LEITURA - Le ponteiro
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== System.Text.hcb:6:35 ===---
mov ax, 239
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO233
jmp ROTULO234
ROTULO233:
mov ax, 65535
jmp ROTULO235
ROTULO234:
xor ax, ax
ROTULO235:
cmp ax, 0
je ROTULO228
ROTULO227:
mov ax, 65535
jmp ROTULO229
ROTULO228:
xor ax, ax
ROTULO229:
cmp ax, 0
jne ROTULO225
jmp ROTULO226
ROTULO225:
;     ---=== System.Text.hcb:6:45 ===---
;     ---=== System.Text.hcb:6:52 ===---
mov ax, 3
jmp ROTULO208
ROTULO226:
;     ---=== System.Text.hcb:7:9 ===---
;     ---=== System.Text.hcb:7:22 ===---
;     ---=== System.Text.hcb:7:14 ===---
;     ---=== System.Text.hcb:7:12 ===---
; ACAO LEITURA - Le ponteiro
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== System.Text.hcb:7:17 ===---
mov ax, 240
mov bx, ax
pop ax
cmp ax, bx
jae ROTULO241
jmp ROTULO242
ROTULO241:
mov ax, 65535
jmp ROTULO243
ROTULO242:
xor ax, ax
ROTULO243:
cmp ax, 0
je ROTULO239
;     ---=== System.Text.hcb:7:32 ===---
;     ---=== System.Text.hcb:7:30 ===---
; ACAO LEITURA - Le ponteiro
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== System.Text.hcb:7:35 ===---
mov ax, 255
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO244
jmp ROTULO245
ROTULO244:
mov ax, 65535
jmp ROTULO246
ROTULO245:
xor ax, ax
ROTULO246:
cmp ax, 0
je ROTULO239
ROTULO238:
mov ax, 65535
jmp ROTULO240
ROTULO239:
xor ax, ax
ROTULO240:
cmp ax, 0
jne ROTULO236
jmp ROTULO237
ROTULO236:
;     ---=== System.Text.hcb:7:45 ===---
;     ---=== System.Text.hcb:7:52 ===---
mov ax, 4
jmp ROTULO208
ROTULO237:
;     ---=== System.Text.hcb:8:9 ===---
;     ---=== System.Text.hcb:8:16 ===---
mov ax, 1
jmp ROTULO208
ROTULO208:
mov sp, bp
pop bp
FIM_utf8_charsize:
retf
;     ---=== System.Text.hcb:11:21 ===---
_utf8_convertchartocp437:
push bp
mov bp, sp
; ARG: c TAM: 4 POS: BP+6 
;     ---=== System.Text.hcb:11:40 ===---
;     ---=== System.Text.hcb:12:9 ===---
;     ---=== System.Text.hcb:12:14 ===---
;     ---=== System.Text.hcb:12:12 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== System.Text.hcb:12:16 ===---
mov ax, 128
mov bx, ax
pop ax
cmp ax, bx
jb ROTULO250
jmp ROTULO251
ROTULO250:
mov ax, 65535
jmp ROTULO252
ROTULO251:
xor ax, ax
ROTULO252:
cmp ax, 0
jne ROTULO248
jmp ROTULO249
ROTULO248:
;     ---=== System.Text.hcb:12:25 ===---
;     ---=== System.Text.hcb:12:32 ===---
; ACAO LEITURA - Le ponteiro
xor ax, ax
es mov al, [di+0]
jmp ROTULO247
ROTULO249:
;     ---=== System.Text.hcb:13:9 ===---
;     ---=== System.Text.hcb:13:14 ===---
;     ---=== System.Text.hcb:13:12 ===---
; ACAO LEITURA - Le ponteiro
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== System.Text.hcb:13:17 ===---
mov ax, 195
mov bx, ax
pop ax
cmp ax, bx
je ROTULO255
jmp ROTULO256
ROTULO255:
mov ax, 65535
jmp ROTULO257
ROTULO256:
xor ax, ax
ROTULO257:
cmp ax, 0
jne ROTULO253
jmp ROTULO254
ROTULO253:
;     ---=== System.Text.hcb:14:14 ===---
; ACAO INC - Incrementa variavel
inc word [bp+6]
;     ---=== System.Text.hcb:15:13 ===---
;     ---=== System.Text.hcb:15:18 ===---
;     ---=== System.Text.hcb:15:16 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== System.Text.hcb:15:21 ===---
mov ax, 135
mov bx, ax
pop ax
cmp ax, bx
je ROTULO260
jmp ROTULO261
ROTULO260:
mov ax, 65535
jmp ROTULO262
ROTULO261:
xor ax, ax
ROTULO262:
cmp ax, 0
jne ROTULO258
jmp ROTULO259
ROTULO258:
;     ---=== System.Text.hcb:15:31 ===---
;     ---=== System.Text.hcb:15:38 ===---
mov ax, 128
jmp ROTULO247
ROTULO259:
;     ---=== System.Text.hcb:16:13 ===---
;     ---=== System.Text.hcb:16:18 ===---
;     ---=== System.Text.hcb:16:16 ===---
; ACAO LEITURA - Le ponteiro
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== System.Text.hcb:16:21 ===---
mov ax, 167
mov bx, ax
pop ax
cmp ax, bx
je ROTULO265
jmp ROTULO266
ROTULO265:
mov ax, 65535
jmp ROTULO267
ROTULO266:
xor ax, ax
ROTULO267:
cmp ax, 0
jne ROTULO263
jmp ROTULO264
ROTULO263:
;     ---=== System.Text.hcb:16:31 ===---
;     ---=== System.Text.hcb:16:38 ===---
mov ax, 135
jmp ROTULO247
ROTULO264:
;     ---=== System.Text.hcb:17:13 ===---
;     ---=== System.Text.hcb:17:18 ===---
;     ---=== System.Text.hcb:17:16 ===---
; ACAO LEITURA - Le ponteiro
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== System.Text.hcb:17:21 ===---
mov ax, 131
mov bx, ax
pop ax
cmp ax, bx
je ROTULO270
jmp ROTULO271
ROTULO270:
mov ax, 65535
jmp ROTULO272
ROTULO271:
xor ax, ax
ROTULO272:
cmp ax, 0
jne ROTULO268
jmp ROTULO269
ROTULO268:
;     ---=== System.Text.hcb:17:31 ===---
;     ---=== System.Text.hcb:17:38 ===---
mov ax, 65
jmp ROTULO247
ROTULO269:
;     ---=== System.Text.hcb:18:13 ===---
;     ---=== System.Text.hcb:18:18 ===---
;     ---=== System.Text.hcb:18:16 ===---
; ACAO LEITURA - Le ponteiro
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== System.Text.hcb:18:21 ===---
mov ax, 163
mov bx, ax
pop ax
cmp ax, bx
je ROTULO275
jmp ROTULO276
ROTULO275:
mov ax, 65535
jmp ROTULO277
ROTULO276:
xor ax, ax
ROTULO277:
cmp ax, 0
jne ROTULO273
jmp ROTULO274
ROTULO273:
;     ---=== System.Text.hcb:18:31 ===---
;     ---=== System.Text.hcb:18:38 ===---
mov ax, 97
jmp ROTULO247
ROTULO274:
;     ---=== System.Text.hcb:19:13 ===---
;     ---=== System.Text.hcb:19:18 ===---
;     ---=== System.Text.hcb:19:16 ===---
; ACAO LEITURA - Le ponteiro
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== System.Text.hcb:19:21 ===---
mov ax, 147
mov bx, ax
pop ax
cmp ax, bx
je ROTULO280
jmp ROTULO281
ROTULO280:
mov ax, 65535
jmp ROTULO282
ROTULO281:
xor ax, ax
ROTULO282:
cmp ax, 0
jne ROTULO278
jmp ROTULO279
ROTULO278:
;     ---=== System.Text.hcb:19:31 ===---
;     ---=== System.Text.hcb:19:38 ===---
mov ax, 79
jmp ROTULO247
ROTULO279:
;     ---=== System.Text.hcb:20:13 ===---
;     ---=== System.Text.hcb:20:18 ===---
;     ---=== System.Text.hcb:20:16 ===---
; ACAO LEITURA - Le ponteiro
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== System.Text.hcb:20:21 ===---
mov ax, 179
mov bx, ax
pop ax
cmp ax, bx
je ROTULO285
jmp ROTULO286
ROTULO285:
mov ax, 65535
jmp ROTULO287
ROTULO286:
xor ax, ax
ROTULO287:
cmp ax, 0
jne ROTULO283
jmp ROTULO284
ROTULO283:
;     ---=== System.Text.hcb:20:31 ===---
;     ---=== System.Text.hcb:20:38 ===---
mov ax, 162
jmp ROTULO247
ROTULO284:
ROTULO254:
;     ---=== System.Text.hcb:22:9 ===---
;     ---=== System.Text.hcb:22:14 ===---
;     ---=== System.Text.hcb:22:12 ===---
; ACAO LEITURA - Le ponteiro
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== System.Text.hcb:22:17 ===---
mov ax, 226
mov bx, ax
pop ax
cmp ax, bx
je ROTULO290
jmp ROTULO291
ROTULO290:
mov ax, 65535
jmp ROTULO292
ROTULO291:
xor ax, ax
ROTULO292:
cmp ax, 0
jne ROTULO288
jmp ROTULO289
ROTULO288:
;     ---=== System.Text.hcb:23:14 ===---
; ACAO INC - Incrementa variavel
inc word [bp+6]
;     ---=== System.Text.hcb:24:13 ===---
;     ---=== System.Text.hcb:24:18 ===---
;     ---=== System.Text.hcb:24:16 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== System.Text.hcb:24:21 ===---
mov ax, 152
mov bx, ax
pop ax
cmp ax, bx
je ROTULO295
jmp ROTULO296
ROTULO295:
mov ax, 65535
jmp ROTULO297
ROTULO296:
xor ax, ax
ROTULO297:
cmp ax, 0
jne ROTULO293
jmp ROTULO294
ROTULO293:
;     ---=== System.Text.hcb:25:18 ===---
; ACAO INC - Incrementa variavel
inc word [bp+6]
;     ---=== System.Text.hcb:26:17 ===---
;     ---=== System.Text.hcb:26:22 ===---
;     ---=== System.Text.hcb:26:20 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== System.Text.hcb:26:25 ===---
mov ax, 186
mov bx, ax
pop ax
cmp ax, bx
je ROTULO300
jmp ROTULO301
ROTULO300:
mov ax, 65535
jmp ROTULO302
ROTULO301:
xor ax, ax
ROTULO302:
cmp ax, 0
jne ROTULO298
jmp ROTULO299
ROTULO298:
;     ---=== System.Text.hcb:26:35 ===---
;     ---=== System.Text.hcb:26:42 ===---
mov ax, 1
jmp ROTULO247
ROTULO299:
;     ---=== System.Text.hcb:27:17 ===---
;     ---=== System.Text.hcb:27:22 ===---
;     ---=== System.Text.hcb:27:20 ===---
; ACAO LEITURA - Le ponteiro
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== System.Text.hcb:27:25 ===---
mov ax, 187
mov bx, ax
pop ax
cmp ax, bx
je ROTULO305
jmp ROTULO306
ROTULO305:
mov ax, 65535
jmp ROTULO307
ROTULO306:
xor ax, ax
ROTULO307:
cmp ax, 0
jne ROTULO303
jmp ROTULO304
ROTULO303:
;     ---=== System.Text.hcb:27:35 ===---
;     ---=== System.Text.hcb:27:42 ===---
mov ax, 2
jmp ROTULO247
ROTULO304:
ROTULO294:
;     ---=== System.Text.hcb:29:13 ===---
;     ---=== System.Text.hcb:29:18 ===---
;     ---=== System.Text.hcb:29:16 ===---
; ACAO LEITURA - Le ponteiro
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== System.Text.hcb:29:21 ===---
mov ax, 153
mov bx, ax
pop ax
cmp ax, bx
je ROTULO310
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
;     ---=== System.Text.hcb:30:18 ===---
; ACAO INC - Incrementa variavel
inc word [bp+6]
;     ---=== System.Text.hcb:31:17 ===---
;     ---=== System.Text.hcb:31:22 ===---
;     ---=== System.Text.hcb:31:20 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== System.Text.hcb:31:25 ===---
mov ax, 165
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
;     ---=== System.Text.hcb:31:35 ===---
;     ---=== System.Text.hcb:31:42 ===---
mov ax, 3
jmp ROTULO247
ROTULO314:
;     ---=== System.Text.hcb:32:17 ===---
;     ---=== System.Text.hcb:32:22 ===---
;     ---=== System.Text.hcb:32:20 ===---
; ACAO LEITURA - Le ponteiro
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== System.Text.hcb:32:25 ===---
mov ax, 166
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
;     ---=== System.Text.hcb:32:35 ===---
;     ---=== System.Text.hcb:32:42 ===---
mov ax, 4
jmp ROTULO247
ROTULO319:
;     ---=== System.Text.hcb:33:17 ===---
;     ---=== System.Text.hcb:33:22 ===---
;     ---=== System.Text.hcb:33:20 ===---
; ACAO LEITURA - Le ponteiro
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== System.Text.hcb:33:25 ===---
mov ax, 163
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
;     ---=== System.Text.hcb:33:35 ===---
;     ---=== System.Text.hcb:33:42 ===---
mov ax, 5
jmp ROTULO247
ROTULO324:
;     ---=== System.Text.hcb:34:17 ===---
;     ---=== System.Text.hcb:34:22 ===---
;     ---=== System.Text.hcb:34:20 ===---
; ACAO LEITURA - Le ponteiro
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== System.Text.hcb:34:25 ===---
mov ax, 160
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
;     ---=== System.Text.hcb:34:35 ===---
;     ---=== System.Text.hcb:34:42 ===---
mov ax, 6
jmp ROTULO247
ROTULO329:
ROTULO309:
ROTULO289:
;     ---=== System.Text.hcb:37:9 ===---
;     ---=== System.Text.hcb:37:16 ===---
mov ax, 63
jmp ROTULO247
ROTULO247:
mov sp, bp
pop bp
FIM_utf8_convertchartocp437:
retf
; MODULO FIM: utf8
;     ---=== System.Threading.hcb:58:8 ===---
; MODULO: multithreading
_multithreading:
db 20
db 83,121,115,116,101,109,46,84,104,114,101,97,100,105,110,103,46,104,99,98
db 0
;     ---=== System.Threading.hcb:59:9 ===---
_multithreading_active:
times 2 db 0
;     ---=== System.Threading.hcb:60:9 ===---
_multithreading_list:
times 4 db 0
;     ---=== System.Threading.hcb:61:24 ===---
_multithreading_current:
times 4 db 0
;     ---=== System.Threading.hcb:62:16 ===---
_multithreading_kernelthread:
times 30 db 0
;     ---=== System.Threading.hcb:63:9 ===---
_multithreading_inuse:
times 8 db 0
;     ---=== System.Threading.hcb:99:9 ===---
_multithreading_int81temp:
times 4 db 0
;     ---=== System.Threading.hcb:65:16 ===---
_multithreading_preinitialize:
;     ---=== System.Threading.hcb:67:9 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_multithreading_active], 0
;     ---=== System.Threading.hcb:68:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:68:27 ===---
mov ax, 1
cs push word [_multithreading_kernelthread+2]
pop es
cs mov di, [_multithreading_kernelthread]
es mov [di+0], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
ROTULO333:
FIM_multithreading_preinitialize:
retf
;     ---=== System.Threading.hcb:71:16 ===---
_multithreading_initialize:
push bp
mov bp, sp
sub sp, 10
push cs
call _os_stackcheck
; ARG: i TAM: 2 POS: BP--2 
; ARG: ptr TAM: 4 POS: BP--6 
; ARG: t TAM: 4 POS: BP--10 
;     ---=== System.Threading.hcb:73:13 ===---
;     ---=== System.Threading.hcb:74:13 ===---
;     ---=== System.Threading.hcb:75:13 ===---
;     ---=== System.Threading.hcb:72:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.Threading.hcb:72:16 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Threading.hcb:72:44 ===---
;     ---=== System.Threading.hcb:72:46 ===---
mov ax, 128
push ax
;     ---=== System.Threading.hcb:72:29 ===---
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
;     ---=== System.Threading.hcb:76:22 ===---
;     ---=== System.Threading.hcb:76:22 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-2], 1
ROTULO335:
;     ---=== System.Threading.hcb:76:22 ===---
;     ---=== System.Threading.hcb:76:22 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== System.Threading.hcb:76:22 ===---
mov ax, 128
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO338
jmp ROTULO339
ROTULO338:
mov ax, 65535
jmp ROTULO340
ROTULO339:
xor ax, ax
ROTULO340:
cmp ax, 0
jne ROTULO336
jmp ROTULO337
ROTULO336:
;     ---=== System.Threading.hcb:77:13 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.Threading.hcb:77:19 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Threading.hcb:77:24 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
push cs
call _multithreading_item
add sp, 2
push es
pop word [bp+-6+2]
mov [bp+-6], di
;     ---=== System.Threading.hcb:78:13 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.Threading.hcb:78:17 ===---
; ACAO LEITURA - Le ponteiro
push es
pop word [bp+-10+2]
mov [bp+-10], di
;     ---=== System.Threading.hcb:79:13 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:79:20 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
es mov [di+0], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Threading.hcb:80:13 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:80:24 ===---
xor ax, ax
es mov [di+2], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Threading.hcb:81:13 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:81:27 ===---
mov ax, 1
es mov [di+4], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Threading.hcb:82:13 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:82:26 ===---
xor ax, ax
es mov [di+6], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Threading.hcb:83:13 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:83:22 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-6+2]
pop es
mov di, [bp+-6]
push es
push di
push word [bp+-10+2]
pop es
mov di, [bp+-10]
es pop word [di+18]
es pop word [di+18+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Threading.hcb:84:13 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:84:26 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-6+2]
pop es
mov di, [bp+-6]
push es
push di
push word [bp+-10+2]
pop es
mov di, [bp+-10]
es pop word [di+22]
es pop word [di+22+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Threading.hcb:85:13 ===---
;     ---=== System.Threading.hcb:85:18 ===---
;     ---=== System.Threading.hcb:85:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== System.Threading.hcb:85:21 ===---
mov ax, 1
mov bx, ax
pop ax
cmp ax, bx
je ROTULO343
jmp ROTULO344
ROTULO343:
mov ax, 65535
jmp ROTULO345
ROTULO344:
xor ax, ax
ROTULO345:
cmp ax, 0
jne ROTULO341
jmp ROTULO342
ROTULO341:
;     ---=== System.Threading.hcb:86:18 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO GRAVACAO - Grava segmento em variavel
;     ---=== System.Threading.hcb:86:34 ===---
; ACAO LEITURA - Le segmento em variavel
mov ax, [bp+-6+2]
cs mov [_multithreading_kernelthread+2], ax
;     ---=== System.Threading.hcb:87:18 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.Threading.hcb:87:34 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-6]
cs mov [_multithreading_kernelthread], ax
;     ---=== System.Threading.hcb:88:18 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO GRAVACAO - Grava segmento em variavel
;     ---=== System.Threading.hcb:88:29 ===---
; ACAO LEITURA - Le segmento em variavel
mov ax, [bp+-6+2]
cs mov [_multithreading_current+2], ax
;     ---=== System.Threading.hcb:89:18 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.Threading.hcb:89:29 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-6]
cs mov [_multithreading_current], ax
ROTULO342:
;     ---=== System.Threading.hcb:76:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-2]
jmp ROTULO335
ROTULO337:
;     ---=== System.Threading.hcb:92:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Threading.hcb:92:37 ===---
mov ax, 1
push ax
;     ---=== System.Threading.hcb:92:30 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_multithreading_inuse+2]
pop es
cs mov di, [_multithreading_inuse]
push es
push di
push cs
call _semaphore_initialize
add sp, 6
;     ---=== System.Threading.hcb:93:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:93:31 ===---
mov ax, 1
cs push word [_multithreading_kernelthread+2]
pop es
cs mov di, [_multithreading_kernelthread]
es mov [di+2], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Threading.hcb:94:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:94:34 ===---
xor ax, ax
es mov [di+4], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Threading.hcb:95:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Threading.hcb:95:34 ===---
push cs
pop es
mov di, _multithreading_int81
push es
push di
;     ---=== System.Threading.hcb:95:28 ===---
mov ax, 129
push ax
push cs
call _io_registerhandler
add sp, 6
ROTULO334:
mov sp, bp
pop bp
FIM_multithreading_initialize:
retf
;     ---=== System.Threading.hcb:101:9 ===---
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
;     ---=== System.Threading.hcb:101:15 ===---
;     ---=== System.Threading.hcb:101:29 ===---
;     ---=== System.Threading.hcb:104:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:104:32 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+2]
cs push word [_multithreading_current+2]
pop es
cs mov di, [_multithreading_current]
es mov [di+14], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Threading.hcb:105:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:105:32 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+4]
es mov [di+16], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Threading.hcb:106:9 ===---
find_next:
;     ---=== System.Threading.hcb:107:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.Threading.hcb:107:21 ===---
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
;     ---=== System.Threading.hcb:108:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.Threading.hcb:108:19 ===---
; ACAO LEITURA - Le ponteiro
push es
cs pop word [_multithreading_current+2]
cs mov [_multithreading_current], di
;     ---=== System.Threading.hcb:109:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.Threading.hcb:109:14 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 14
es mov ax, [di+14]
mov [bp+2], ax
;     ---=== System.Threading.hcb:110:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.Threading.hcb:110:14 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 16
es mov ax, [di+16]
mov [bp+4], ax
;     ---=== System.Threading.hcb:111:9 ===---
;     ---=== System.Threading.hcb:111:12 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 4
es mov ax, [di+4]
cmp ax, 0
jne ROTULO347
jmp ROTULO348
ROTULO347:
;     ---=== System.Threading.hcb:111:40 ===---
jmp find_next
ROTULO348:
;     ---=== System.Threading.hcb:112:9 ===---
;     ---=== System.Threading.hcb:112:12 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 6
es mov ax, [di+6]
cmp ax, 0
jne ROTULO349
jmp ROTULO350
ROTULO349:
;     ---=== System.Threading.hcb:113:13 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:113:32 ===---
xor ax, ax
es mov [di+6], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Threading.hcb:114:13 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.Threading.hcb:114:25 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - Ponteiro Byte - Desvio 10
es push word [di+10+2]
es push word [di+10]
pop di
pop es
push es
cs pop word [_multithreading_int81temp+2]
cs mov [_multithreading_int81temp], di
;     ---=== System.Threading.hcb:115:17 ===---
mov ax, [bp+2]
;     ---=== System.Threading.hcb:116:17 ===---
mov bx, [bp+4]
;     ---=== System.Threading.hcb:117:17 ===---
cli
;     ---=== System.Threading.hcb:118:17 ===---
mov ss, ax
;     ---=== System.Threading.hcb:119:17 ===---
mov sp, ax
;     ---=== System.Threading.hcb:120:17 ===---
sti
;     ---=== System.Threading.hcb:121:17 ===---
push cs
;     ---=== System.Threading.hcb:122:17 ===---
mov ax, _thread_endthread
;     ---=== System.Threading.hcb:123:17 ===---
push ax
;     ---=== System.Threading.hcb:124:17 ===---
pushf
;     ---=== System.Threading.hcb:125:17 ===---
cs push word [_multithreading_int81temp+2]
;     ---=== System.Threading.hcb:126:17 ===---
cs push word [_multithreading_int81temp]
;     ---=== System.Threading.hcb:127:17 ===---
mov ax, ss
;     ---=== System.Threading.hcb:128:17 ===---
mov es, ax
;     ---=== System.Threading.hcb:129:17 ===---
mov ds, ax
;     ---=== System.Threading.hcb:130:17 ===---
jmp FIM_multithreading_int81
ROTULO350:
ROTULO346:
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
;     ---=== System.Threading.hcb:135:21 ===---
_multithreading_requestnew:
push bp
mov bp, sp
sub sp, 10
push cs
call _os_stackcheck
; ARG: ptr TAM: 4 POS: BP--4 
; ARG: t TAM: 4 POS: BP--8 
; ARG: i TAM: 2 POS: BP--10 
;     ---=== System.Threading.hcb:136:13 ===---
;     ---=== System.Threading.hcb:137:13 ===---
;     ---=== System.Threading.hcb:138:13 ===---
;     ---=== System.Threading.hcb:139:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Threading.hcb:139:27 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_multithreading_inuse+2]
pop es
cs mov di, [_multithreading_inuse]
push es
push di
push cs
call _semaphore_waitone
add sp, 4
;     ---=== System.Threading.hcb:140:22 ===---
;     ---=== System.Threading.hcb:140:22 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-10], 1
ROTULO352:
;     ---=== System.Threading.hcb:140:22 ===---
;     ---=== System.Threading.hcb:140:22 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-10]
push ax
;     ---=== System.Threading.hcb:140:22 ===---
mov ax, 128
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO355
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
;     ---=== System.Threading.hcb:141:13 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.Threading.hcb:141:17 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Threading.hcb:141:22 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-10]
push ax
push cs
call _multithreading_item
add sp, 2
push es
pop word [bp+-8+2]
mov [bp+-8], di
;     ---=== System.Threading.hcb:142:13 ===---
;     ---=== System.Threading.hcb:142:25 ===---
;     ---=== System.Threading.hcb:142:16 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 2
es mov ax, [di+2]
push ax
;     ---=== System.Threading.hcb:142:28 ===---
xor ax, ax
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
;     ---=== System.Threading.hcb:143:17 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:143:28 ===---
mov ax, 1
es mov [di+2], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Threading.hcb:144:17 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:144:31 ===---
mov ax, 1
es mov [di+4], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Threading.hcb:145:17 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:145:31 ===---
xor ax, ax
es mov [di+8], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Threading.hcb:146:17 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Threading.hcb:146:35 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_multithreading_inuse+2]
pop es
cs mov di, [_multithreading_inuse]
push es
push di
push cs
call _semaphore_release
add sp, 4
;     ---=== System.Threading.hcb:147:17 ===---
;     ---=== System.Threading.hcb:147:24 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-8+2]
pop es
mov di, [bp+-8]
jmp ROTULO351
ROTULO359:
;     ---=== System.Threading.hcb:140:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-10]
jmp ROTULO352
ROTULO354:
;     ---=== System.Threading.hcb:150:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Threading.hcb:150:27 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_multithreading_inuse+2]
pop es
cs mov di, [_multithreading_inuse]
push es
push di
push cs
call _semaphore_release
add sp, 4
;     ---=== System.Threading.hcb:151:15 ===---
mov ax, _multithreading
mov [bp+-8], ax
mov ax, 151
mov [bp+-10], ax
mov ax, 9
cs jmp word [_os_trycode]
ROTULO351:
mov sp, bp
pop bp
FIM_multithreading_requestnew:
retf
;     ---=== System.Threading.hcb:155:21 ===---
_multithreading_item:
push bp
mov bp, sp
sub sp, 4
push cs
call _os_stackcheck
; ARG: i TAM: 2 POS: BP+6 
; ARG: ptr TAM: 4 POS: BP--4 
;     ---=== System.Threading.hcb:155:26 ===---
;     ---=== System.Threading.hcb:156:13 ===---
;     ---=== System.Threading.hcb:157:9 ===---
; ACAO DEC - Decrementa variavel
dec word [bp+6]
;     ---=== System.Threading.hcb:158:9 ===---
;     ---=== System.Threading.hcb:158:14 ===---
;     ---=== System.Threading.hcb:158:12 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
push ax
;     ---=== System.Threading.hcb:158:17 ===---
mov ax, 128
mov bx, ax
pop ax
cmp ax, bx
jae ROTULO366
jmp ROTULO367
ROTULO366:
mov ax, 65535
jmp ROTULO368
ROTULO367:
xor ax, ax
ROTULO368:
cmp ax, 0
jne ROTULO364
jmp ROTULO365
ROTULO364:
;     ---=== System.Threading.hcb:158:32 ===---
mov ax, _multithreading
mov [bp+-8], ax
mov ax, 158
mov [bp+-10], ax
mov ax, 5
cs jmp word [_os_trycode]
ROTULO365:
;     ---=== System.Threading.hcb:159:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.Threading.hcb:159:15 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_multithreading_list+2]
pop es
cs mov di, [_multithreading_list]
push es
pop word [bp+-4+2]
mov [bp+-4], di
;     ---=== System.Threading.hcb:160:10 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.Threading.hcb:160:21 ===---
;     ---=== System.Threading.hcb:160:26 ===---
;     ---=== System.Threading.hcb:160:28 ===---
; ACAO CHAMADA - Calcula tamanho de item
mov ax, 26
push ax
;     ---=== System.Threading.hcb:160:24 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
pop bx
mul bx
push ax
;     ---=== System.Threading.hcb:160:17 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
pop bx
add ax, bx
mov [bp+-4], ax
;     ---=== System.Threading.hcb:161:9 ===---
;     ---=== System.Threading.hcb:161:16 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-4+2]
pop es
mov di, [bp+-4]
jmp ROTULO363
ROTULO363:
mov sp, bp
pop bp
FIM_multithreading_item:
retf
;     ---=== System.Threading.hcb:165:21 ===---
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
;     ---=== System.Threading.hcb:166:13 ===---
;     ---=== System.Threading.hcb:167:13 ===---
;     ---=== System.Threading.hcb:168:13 ===---
;     ---=== System.Threading.hcb:169:13 ===---
;     ---=== System.Threading.hcb:170:9 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-12], 0
;     ---=== System.Threading.hcb:171:22 ===---
;     ---=== System.Threading.hcb:171:22 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-10], 1
ROTULO370:
;     ---=== System.Threading.hcb:171:22 ===---
;     ---=== System.Threading.hcb:171:22 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-10]
push ax
;     ---=== System.Threading.hcb:171:22 ===---
mov ax, 128
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO373
jmp ROTULO374
ROTULO373:
mov ax, 65535
jmp ROTULO375
ROTULO374:
xor ax, ax
ROTULO375:
cmp ax, 0
jne ROTULO371
jmp ROTULO372
ROTULO371:
;     ---=== System.Threading.hcb:172:13 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.Threading.hcb:172:19 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Threading.hcb:172:24 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-10]
push ax
push cs
call _multithreading_item
add sp, 2
push es
pop word [bp+-4+2]
mov [bp+-4], di
;     ---=== System.Threading.hcb:173:14 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO GRAVACAO - Grava segmento em variavel
;     ---=== System.Threading.hcb:173:19 ===---
; ACAO LEITURA - Le segmento em variavel
mov ax, [bp+-4+2]
mov word [bp+-8+2], ax
;     ---=== System.Threading.hcb:174:14 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.Threading.hcb:174:19 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
mov [bp+-8], ax
;     ---=== System.Threading.hcb:175:13 ===---
;     ---=== System.Threading.hcb:175:25 ===---
;     ---=== System.Threading.hcb:175:16 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 2
push word [bp+-8+2]
pop es
mov di, [bp+-8]
es mov ax, [di+2]
push ax
;     ---=== System.Threading.hcb:175:28 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
jne ROTULO378
jmp ROTULO379
ROTULO378:
mov ax, 65535
jmp ROTULO380
ROTULO379:
xor ax, ax
ROTULO380:
cmp ax, 0
jne ROTULO376
jmp ROTULO377
ROTULO376:
;     ---=== System.Threading.hcb:175:35 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-12]
ROTULO377:
;     ---=== System.Threading.hcb:171:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-10]
jmp ROTULO370
ROTULO372:
;     ---=== System.Threading.hcb:177:9 ===---
;     ---=== System.Threading.hcb:177:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-12]
jmp ROTULO369
ROTULO369:
mov sp, bp
pop bp
FIM_multithreading_count:
retf
;     ---=== System.Threading.hcb:181:16 ===---
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
;     ---=== System.Threading.hcb:181:28 ===---
;     ---=== System.Threading.hcb:182:13 ===---
;     ---=== System.Threading.hcb:183:13 ===---
;     ---=== System.Threading.hcb:184:13 ===---
;     ---=== System.Threading.hcb:185:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.Threading.hcb:185:18 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _multithreading_isactive
mov [bp+-2], ax
;     ---=== System.Threading.hcb:186:9 ===---
;     ---=== System.Threading.hcb:186:12 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
cmp ax, 0
jne ROTULO382
jmp ROTULO383
ROTULO382:
;     ---=== System.Threading.hcb:186:24 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _multithreading_suspend
ROTULO383:
;     ---=== System.Threading.hcb:187:10 ===---
; ACAO GRAVACAO - Grava segmento em variavel
;     ---=== System.Threading.hcb:187:18 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO LEITURA - Le segmento em variavel
mov ax, [bp+6+2]
mov word [bp+-10+2], ax
;     ---=== System.Threading.hcb:188:10 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.Threading.hcb:188:18 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
mov [bp+-10], ax
;     ---=== System.Threading.hcb:189:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.Threading.hcb:189:16 ===---
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
;     ---=== System.Threading.hcb:190:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:190:24 ===---
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
;     ---=== System.Threading.hcb:191:10 ===---
; ACAO GRAVACAO - Grava segmento em variavel
;     ---=== System.Threading.hcb:191:18 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO LEITURA - Le segmento em variavel
cs mov ax, [_multithreading_current+2]
mov word [bp+-10+2], ax
;     ---=== System.Threading.hcb:192:10 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.Threading.hcb:192:18 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO LEITURA - Le variavel
cs mov ax, [_multithreading_current]
mov [bp+-10], ax
;     ---=== System.Threading.hcb:193:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:193:22 ===---
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
;     ---=== System.Threading.hcb:194:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:194:18 ===---
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
;     ---=== System.Threading.hcb:195:9 ===---
;     ---=== System.Threading.hcb:195:12 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
cmp ax, 0
jne ROTULO384
jmp ROTULO385
ROTULO384:
;     ---=== System.Threading.hcb:195:24 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _multithreading_resume
ROTULO385:
ROTULO381:
mov sp, bp
pop bp
FIM_multithreading_startthread:
retf
;     ---=== System.Threading.hcb:199:21 ===---
_multithreading_isactive:
;     ---=== System.Threading.hcb:200:9 ===---
;     ---=== System.Threading.hcb:200:16 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_multithreading_active]
jmp ROTULO386
ROTULO386:
FIM_multithreading_isactive:
retf
;     ---=== System.Threading.hcb:204:16 ===---
_multithreading_suspend:
;     ---=== System.Threading.hcb:205:9 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_multithreading_active], 0
ROTULO387:
FIM_multithreading_suspend:
retf
;     ---=== System.Threading.hcb:209:16 ===---
_multithreading_resume:
;     ---=== System.Threading.hcb:210:9 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_multithreading_active], 1
ROTULO388:
FIM_multithreading_resume:
retf
; MODULO FIM: multithreading
;     ---=== System.Collections.hcb:16:8 ===---
; MODULO: list
_list:
db 22
db 83,121,115,116,101,109,46,67,111,108,108,101,99,116,105,111,110,115,46,104,99,98
db 0
;     ---=== System.Collections.hcb:17:16 ===---
_list_initialize:
push bp
mov bp, sp
sub sp, 4
push cs
call _os_stackcheck
; ARG: l TAM: 4 POS: BP+6 
; ARG: itemsize TAM: 2 POS: BP+10 
; ARG: ptr TAM: 4 POS: BP--4 
;     ---=== System.Collections.hcb:17:27 ===---
;     ---=== System.Collections.hcb:17:38 ===---
;     ---=== System.Collections.hcb:18:13 ===---
;     ---=== System.Collections.hcb:19:10 ===---
; ACAO GRAVACAO - Grava segmento em variavel
mov word [bp+-4+2], 0
;     ---=== System.Collections.hcb:20:10 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-4], 0
;     ---=== System.Collections.hcb:21:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Collections.hcb:21:22 ===---
xor ax, ax
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov [di+0], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Collections.hcb:22:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Collections.hcb:22:22 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
es mov [di+8], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Collections.hcb:23:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Collections.hcb:23:24 ===---
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
;     ---=== System.Collections.hcb:24:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Collections.hcb:24:20 ===---
xor ax, ax
es mov [di+10], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Collections.hcb:25:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Collections.hcb:25:19 ===---
xor ax, ax
es mov [di+2], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
ROTULO389:
mov sp, bp
pop bp
FIM_list_initialize:
retf
;     ---=== System.Collections.hcb:28:14 ===---
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
;     ---=== System.Collections.hcb:28:25 ===---
;     ---=== System.Collections.hcb:29:13 ===---
;     ---=== System.Collections.hcb:30:13 ===---
;     ---=== System.Collections.hcb:31:13 ===---
;     ---=== System.Collections.hcb:32:13 ===---
;     ---=== System.Collections.hcb:33:9 ===---
;     ---=== System.Collections.hcb:33:23 ===---
;     ---=== System.Collections.hcb:33:12 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 8
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+8]
push ax
;     ---=== System.Collections.hcb:33:26 ===---
mov ax, 64
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO393
jmp ROTULO394
ROTULO393:
mov ax, 65535
jmp ROTULO395
ROTULO394:
xor ax, ax
ROTULO395:
cmp ax, 0
jne ROTULO391
jmp ROTULO392
ROTULO391:
;     ---=== System.Collections.hcb:33:34 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-2], 15
ROTULO392:
;     ---=== System.Collections.hcb:34:9 ===---
;     ---=== System.Collections.hcb:34:23 ===---
;     ---=== System.Collections.hcb:34:12 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 8
es mov ax, [di+8]
push ax
;     ---=== System.Collections.hcb:34:26 ===---
mov ax, 128
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO398
jmp ROTULO399
ROTULO398:
mov ax, 65535
jmp ROTULO400
ROTULO399:
xor ax, ax
ROTULO400:
cmp ax, 0
jne ROTULO396
jmp ROTULO397
ROTULO396:
;     ---=== System.Collections.hcb:34:35 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-2], 7
ROTULO397:
;     ---=== System.Collections.hcb:35:9 ===---
;     ---=== System.Collections.hcb:35:23 ===---
;     ---=== System.Collections.hcb:35:12 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 8
es mov ax, [di+8]
push ax
;     ---=== System.Collections.hcb:35:26 ===---
mov ax, 512
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO403
jmp ROTULO404
ROTULO403:
mov ax, 65535
jmp ROTULO405
ROTULO404:
xor ax, ax
ROTULO405:
cmp ax, 0
jne ROTULO401
jmp ROTULO402
ROTULO401:
;     ---=== System.Collections.hcb:35:35 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-2], 3
ROTULO402:
;     ---=== System.Collections.hcb:36:9 ===---
;     ---=== System.Collections.hcb:36:23 ===---
;     ---=== System.Collections.hcb:36:12 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 8
es mov ax, [di+8]
push ax
;     ---=== System.Collections.hcb:36:25 ===---
mov ax, 512
mov bx, ax
pop ax
cmp ax, bx
ja ROTULO408
jmp ROTULO409
ROTULO408:
mov ax, 65535
jmp ROTULO410
ROTULO409:
xor ax, ax
ROTULO410:
cmp ax, 0
jne ROTULO406
jmp ROTULO407
ROTULO406:
;     ---=== System.Collections.hcb:36:34 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-2], 1
ROTULO407:
;     ---=== System.Collections.hcb:37:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.Collections.hcb:37:15 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Collections.hcb:37:74 ===---
;     ---=== System.Collections.hcb:37:88 ===---
;     ---=== System.Collections.hcb:37:90 ===---
mov ax, 2
push ax
;     ---=== System.Collections.hcb:37:77 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 0
es mov ax, [di+0]
pop bx
mul bx
push ax
;     ---=== System.Collections.hcb:37:46 ===---
;     ---=== System.Collections.hcb:37:60 ===---
;     ---=== System.Collections.hcb:37:62 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 8
es mov ax, [di+8]
push ax
;     ---=== System.Collections.hcb:37:49 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 0
es mov ax, [di+0]
pop bx
mul bx
push ax
;     ---=== System.Collections.hcb:37:28 ===---
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
;     ---=== System.Collections.hcb:38:10 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.Collections.hcb:38:19 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-6]
mov [bp+-14], ax
;     ---=== System.Collections.hcb:39:10 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO GRAVACAO - Grava segmento em variavel
;     ---=== System.Collections.hcb:39:19 ===---
; ACAO LEITURA - Le segmento em variavel
mov ax, [bp+-6+2]
mov word [bp+-14+2], ax
;     ---=== System.Collections.hcb:40:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Collections.hcb:40:31 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push word [bp+-14+2]
pop es
mov di, [bp+-14]
es mov [di+4], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Collections.hcb:41:10 ===---
; ACAO GRAVACAO - Grava segmento em variavel
mov word [bp+-10+2], 0
;     ---=== System.Collections.hcb:42:10 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-10], 0
;     ---=== System.Collections.hcb:43:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Collections.hcb:43:27 ===---
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
;     ---=== System.Collections.hcb:44:9 ===---
;     ---=== System.Collections.hcb:44:16 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-6+2]
pop es
mov di, [bp+-6]
jmp ROTULO390
ROTULO390:
mov sp, bp
pop bp
FIM_list_allocblock:
retf
;     ---=== System.Collections.hcb:47:9 ===---
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
;     ---=== System.Collections.hcb:47:15 ===---
;     ---=== System.Collections.hcb:47:26 ===---
;     ---=== System.Collections.hcb:47:46 ===---
;     ---=== System.Collections.hcb:47:61 ===---
;     ---=== System.Collections.hcb:48:13 ===---
;     ---=== System.Collections.hcb:49:10 ===---
; ACAO GRAVACAO - Grava segmento em variavel
;     ---=== System.Collections.hcb:49:17 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
mov word [bp+-4+2], ax
;     ---=== System.Collections.hcb:50:10 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.Collections.hcb:50:43 ===---
;     ---=== System.Collections.hcb:50:56 ===---
;     ---=== System.Collections.hcb:50:70 ===---
;     ---=== System.Collections.hcb:50:72 ===---
mov ax, 2
push ax
;     ---=== System.Collections.hcb:50:59 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 8
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+8]
pop bx
add ax, bx
push ax
;     ---=== System.Collections.hcb:50:51 ===---
;     ---=== System.Collections.hcb:50:53 ===---
mov ax, 1
push ax
;     ---=== System.Collections.hcb:50:47 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+14]
pop bx
sub ax, bx
pop bx
mul bx
push ax
;     ---=== System.Collections.hcb:50:23 ===---
;     ---=== System.Collections.hcb:50:25 ===---
; ACAO CHAMADA - Calcula tamanho de item
mov ax, 6
push ax
;     ---=== System.Collections.hcb:50:17 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO LEITURA - Le segmento em variavel
mov ax, [bp+10+2]
pop bx
add ax, bx
pop bx
add ax, bx
mov [bp+-4], ax
;     ---=== System.Collections.hcb:51:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.Collections.hcb:51:15 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+16]
push word [bp+-4+2]
pop es
mov di, [bp+-4]
es mov [di+0], ax
ROTULO411:
mov sp, bp
pop bp
FIM_list_setid:
retf
;     ---=== System.Collections.hcb:54:14 ===---
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
;     ---=== System.Collections.hcb:54:20 ===---
;     ---=== System.Collections.hcb:54:31 ===---
;     ---=== System.Collections.hcb:54:51 ===---
;     ---=== System.Collections.hcb:55:13 ===---
;     ---=== System.Collections.hcb:56:10 ===---
; ACAO GRAVACAO - Grava segmento em variavel
;     ---=== System.Collections.hcb:56:17 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
mov word [bp+-4+2], ax
;     ---=== System.Collections.hcb:57:10 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.Collections.hcb:57:43 ===---
;     ---=== System.Collections.hcb:57:56 ===---
;     ---=== System.Collections.hcb:57:70 ===---
;     ---=== System.Collections.hcb:57:72 ===---
mov ax, 2
push ax
;     ---=== System.Collections.hcb:57:59 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 8
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+8]
pop bx
add ax, bx
push ax
;     ---=== System.Collections.hcb:57:51 ===---
;     ---=== System.Collections.hcb:57:53 ===---
mov ax, 1
push ax
;     ---=== System.Collections.hcb:57:47 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+14]
pop bx
sub ax, bx
pop bx
mul bx
push ax
;     ---=== System.Collections.hcb:57:23 ===---
;     ---=== System.Collections.hcb:57:25 ===---
; ACAO CHAMADA - Calcula tamanho de item
mov ax, 6
push ax
;     ---=== System.Collections.hcb:57:17 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO LEITURA - Le segmento em variavel
mov ax, [bp+10+2]
pop bx
add ax, bx
pop bx
add ax, bx
mov [bp+-4], ax
;     ---=== System.Collections.hcb:58:9 ===---
;     ---=== System.Collections.hcb:58:16 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-4+2]
pop es
mov di, [bp+-4]
es mov ax, [di+0]
jmp ROTULO412
ROTULO412:
mov sp, bp
pop bp
FIM_list_getid:
retf
;     ---=== System.Collections.hcb:61:14 ===---
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
;     ---=== System.Collections.hcb:61:21 ===---
;     ---=== System.Collections.hcb:61:32 ===---
;     ---=== System.Collections.hcb:61:52 ===---
;     ---=== System.Collections.hcb:62:13 ===---
;     ---=== System.Collections.hcb:63:10 ===---
; ACAO GRAVACAO - Grava segmento em variavel
;     ---=== System.Collections.hcb:63:17 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
mov word [bp+-4+2], ax
;     ---=== System.Collections.hcb:64:10 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.Collections.hcb:64:76 ===---
;     ---=== System.Collections.hcb:64:78 ===---
mov ax, 2
push ax
;     ---=== System.Collections.hcb:64:43 ===---
;     ---=== System.Collections.hcb:64:56 ===---
;     ---=== System.Collections.hcb:64:70 ===---
;     ---=== System.Collections.hcb:64:72 ===---
mov ax, 2
push ax
;     ---=== System.Collections.hcb:64:59 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 8
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+8]
pop bx
add ax, bx
push ax
;     ---=== System.Collections.hcb:64:51 ===---
;     ---=== System.Collections.hcb:64:53 ===---
mov ax, 1
push ax
;     ---=== System.Collections.hcb:64:47 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+14]
pop bx
sub ax, bx
pop bx
mul bx
push ax
;     ---=== System.Collections.hcb:64:23 ===---
;     ---=== System.Collections.hcb:64:25 ===---
; ACAO CHAMADA - Calcula tamanho de item
mov ax, 6
push ax
;     ---=== System.Collections.hcb:64:17 ===---
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
;     ---=== System.Collections.hcb:65:9 ===---
;     ---=== System.Collections.hcb:65:16 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-4+2]
pop es
mov di, [bp+-4]
jmp ROTULO413
ROTULO413:
mov sp, bp
pop bp
FIM_list_getptr:
retf
;     ---=== System.Collections.hcb:68:21 ===---
_list_count:
push bp
mov bp, sp
; ARG: l TAM: 4 POS: BP+6 
;     ---=== System.Collections.hcb:68:27 ===---
;     ---=== System.Collections.hcb:69:9 ===---
;     ---=== System.Collections.hcb:69:16 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 2
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+2]
jmp ROTULO414
ROTULO414:
mov sp, bp
pop bp
FIM_list_count:
retf
;     ---=== System.Collections.hcb:72:21 ===---
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
;     ---=== System.Collections.hcb:72:26 ===---
;     ---=== System.Collections.hcb:72:37 ===---
;     ---=== System.Collections.hcb:73:13 ===---
;     ---=== System.Collections.hcb:74:13 ===---
;     ---=== System.Collections.hcb:75:13 ===---
;     ---=== System.Collections.hcb:76:9 ===---
;     ---=== System.Collections.hcb:76:15 ===---
;     ---=== System.Collections.hcb:76:12 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
push ax
;     ---=== System.Collections.hcb:76:18 ===---
xor ax, ax
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
;     ---=== System.Collections.hcb:76:31 ===---
mov ax, _list
mov [bp+-8], ax
mov ax, 76
mov [bp+-10], ax
mov ax, 5
cs jmp word [_os_trycode]
ROTULO417:
;     ---=== System.Collections.hcb:77:9 ===---
;     ---=== System.Collections.hcb:77:15 ===---
;     ---=== System.Collections.hcb:77:12 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
push ax
;     ---=== System.Collections.hcb:77:17 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 2
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+2]
mov bx, ax
pop ax
cmp ax, bx
ja ROTULO423
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
;     ---=== System.Collections.hcb:77:36 ===---
mov ax, _list
mov [bp+-8], ax
mov ax, 77
mov [bp+-10], ax
mov ax, 5
cs jmp word [_os_trycode]
ROTULO422:
;     ---=== System.Collections.hcb:78:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.Collections.hcb:78:15 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - Ponteiro Byte - Desvio 4
es push word [di+4+2]
es push word [di+4]
pop di
pop es
push es
pop word [bp+-4+2]
mov [bp+-4], di
;     ---=== System.Collections.hcb:79:9 ===---
list_find_in_block_item:
;     ---=== System.Collections.hcb:80:10 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.Collections.hcb:80:19 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
mov [bp+-8], ax
;     ---=== System.Collections.hcb:81:10 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO GRAVACAO - Grava segmento em variavel
;     ---=== System.Collections.hcb:81:19 ===---
; ACAO LEITURA - Le segmento em variavel
mov ax, [bp+-4+2]
mov word [bp+-8+2], ax
;     ---=== System.Collections.hcb:82:28 ===---
;     ---=== System.Collections.hcb:82:28 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-10], 1
ROTULO426:
;     ---=== System.Collections.hcb:82:28 ===---
;     ---=== System.Collections.hcb:82:28 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-10]
push ax
;     ---=== System.Collections.hcb:82:22 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 4
push word [bp+-8+2]
pop es
mov di, [bp+-8]
es mov ax, [di+4]
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO429
jmp ROTULO430
ROTULO429:
mov ax, 65535
jmp ROTULO431
ROTULO430:
xor ax, ax
ROTULO431:
cmp ax, 0
jne ROTULO427
jmp ROTULO428
ROTULO427:
;     ---=== System.Collections.hcb:83:13 ===---
;     ---=== System.Collections.hcb:83:35 ===---
;     ---=== System.Collections.hcb:83:16 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Collections.hcb:83:32 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-10]
push ax
;     ---=== System.Collections.hcb:83:25 ===---
; ACAO LEITURA - Le ponteiro
push es
push di
;     ---=== System.Collections.hcb:83:22 ===---
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
;     ---=== System.Collections.hcb:83:38 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
mov bx, ax
pop ax
cmp ax, bx
je ROTULO434
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
;     ---=== System.Collections.hcb:84:17 ===---
;     ---=== System.Collections.hcb:84:24 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Collections.hcb:84:41 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-10]
push ax
;     ---=== System.Collections.hcb:84:34 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-8+2]
pop es
mov di, [bp+-8]
push es
push di
;     ---=== System.Collections.hcb:84:31 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
push cs
call _list_getptr
add sp, 10
jmp ROTULO415
ROTULO433:
;     ---=== System.Collections.hcb:82:28 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-10]
jmp ROTULO426
ROTULO428:
;     ---=== System.Collections.hcb:87:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.Collections.hcb:87:15 ===---
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
;     ---=== System.Collections.hcb:88:9 ===---
;     ---=== System.Collections.hcb:88:17 ===---
;     ---=== System.Collections.hcb:88:13 ===---
; ACAO LEITURA - Le segmento em variavel
mov ax, [bp+-4+2]
push ax
;     ---=== System.Collections.hcb:88:20 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO439
jmp ROTULO440
ROTULO439:
mov ax, 65535
jmp ROTULO441
ROTULO440:
xor ax, ax
ROTULO441:
cmp ax, 0
jne ROTULO437
jmp ROTULO438
ROTULO437:
;     ---=== System.Collections.hcb:89:13 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.Collections.hcb:89:19 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Collections.hcb:89:30 ===---
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
;     ---=== System.Collections.hcb:90:13 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Collections.hcb:90:31 ===---
; ACAO LEITURA - Le ponteiro
push es
push di
push word [bp+-8+2]
pop es
mov di, [bp+-8]
es pop word [di+0]
es pop word [di+0+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
ROTULO438:
;     ---=== System.Collections.hcb:92:14 ===---
jmp list_find_in_block_item
ROTULO415:
mov sp, bp
pop bp
FIM_list_item:
retf
;     ---=== System.Collections.hcb:95:21 ===---
_list_insert:
push bp
mov bp, sp
; ARG: l TAM: 4 POS: BP+6 
; ARG: id TAM: 2 POS: BP+10 
;     ---=== System.Collections.hcb:95:28 ===---
;     ---=== System.Collections.hcb:95:39 ===---
;     ---=== System.Collections.hcb:96:15 ===---
mov ax, _list
mov [bp+-8], ax
mov ax, 96
mov [bp+-10], ax
mov ax, 7
cs jmp word [_os_trycode]
ROTULO442:
mov sp, bp
pop bp
FIM_list_insert:
retf
;     ---=== System.Collections.hcb:99:16 ===---
_list_removeat:
push bp
mov bp, sp
; ARG: l TAM: 4 POS: BP+6 
; ARG: id TAM: 2 POS: BP+10 
;     ---=== System.Collections.hcb:99:25 ===---
;     ---=== System.Collections.hcb:99:36 ===---
;     ---=== System.Collections.hcb:100:15 ===---
mov ax, _list
mov [bp+-8], ax
mov ax, 100
mov [bp+-10], ax
mov ax, 7
cs jmp word [_os_trycode]
ROTULO443:
mov sp, bp
pop bp
FIM_list_removeat:
retf
;     ---=== System.Collections.hcb:103:16 ===---
_list_remove:
push bp
mov bp, sp
; ARG: l TAM: 4 POS: BP+6 
; ARG: item TAM: 4 POS: BP+10 
;     ---=== System.Collections.hcb:103:23 ===---
;     ---=== System.Collections.hcb:103:34 ===---
;     ---=== System.Collections.hcb:104:15 ===---
mov ax, _list
mov [bp+-8], ax
mov ax, 104
mov [bp+-10], ax
mov ax, 7
cs jmp word [_os_trycode]
ROTULO444:
mov sp, bp
pop bp
FIM_list_remove:
retf
;     ---=== System.Collections.hcb:107:21 ===---
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
;     ---=== System.Collections.hcb:107:25 ===---
;     ---=== System.Collections.hcb:108:13 ===---
;     ---=== System.Collections.hcb:109:13 ===---
;     ---=== System.Collections.hcb:110:13 ===---
;     ---=== System.Collections.hcb:111:9 ===---
;     ---=== System.Collections.hcb:111:23 ===---
;     ---=== System.Collections.hcb:111:12 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 0
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+0]
push ax
;     ---=== System.Collections.hcb:111:26 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO448
jmp ROTULO449
ROTULO448:
mov ax, 65535
jmp ROTULO450
ROTULO449:
xor ax, ax
ROTULO450:
cmp ax, 0
jne ROTULO446
jmp ROTULO447
ROTULO446:
;     ---=== System.Collections.hcb:112:13 ===---
;     ---=== System.Collections.hcb:112:27 ===---
;     ---=== System.Collections.hcb:112:16 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 8
es mov ax, [di+8]
push ax
;     ---=== System.Collections.hcb:112:29 ===---
mov ax, 64
mov bx, ax
pop ax
cmp ax, bx
jb ROTULO453
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
;     ---=== System.Collections.hcb:112:37 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Collections.hcb:112:50 ===---
mov ax, 5
es mov [di+0], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
ROTULO452:
;     ---=== System.Collections.hcb:113:13 ===---
;     ---=== System.Collections.hcb:113:27 ===---
;     ---=== System.Collections.hcb:113:16 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 8
es mov ax, [di+8]
push ax
;     ---=== System.Collections.hcb:113:29 ===---
mov ax, 128
mov bx, ax
pop ax
cmp ax, bx
jb ROTULO458
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
;     ---=== System.Collections.hcb:113:38 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Collections.hcb:113:51 ===---
mov ax, 4
es mov [di+0], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
ROTULO457:
;     ---=== System.Collections.hcb:114:13 ===---
;     ---=== System.Collections.hcb:114:27 ===---
;     ---=== System.Collections.hcb:114:16 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 8
es mov ax, [di+8]
push ax
;     ---=== System.Collections.hcb:114:30 ===---
mov ax, 128
mov bx, ax
pop ax
cmp ax, bx
jae ROTULO463
jmp ROTULO464
ROTULO463:
mov ax, 65535
jmp ROTULO465
ROTULO464:
xor ax, ax
ROTULO465:
cmp ax, 0
jne ROTULO461
jmp ROTULO462
ROTULO461:
;     ---=== System.Collections.hcb:114:39 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Collections.hcb:114:52 ===---
mov ax, 1
es mov [di+0], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
ROTULO462:
;     ---=== System.Collections.hcb:115:13 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.Collections.hcb:115:19 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Collections.hcb:115:30 ===---
; ACAO LEITURA - Le ponteiro
push es
push di
push cs
call _list_allocblock
add sp, 4
push es
pop word [bp+-4+2]
mov [bp+-4], di
;     ---=== System.Collections.hcb:116:14 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.Collections.hcb:116:23 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
mov [bp+-8], ax
;     ---=== System.Collections.hcb:117:14 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO GRAVACAO - Grava segmento em variavel
;     ---=== System.Collections.hcb:117:23 ===---
; ACAO LEITURA - Le segmento em variavel
mov ax, [bp+-4+2]
mov word [bp+-8+2], ax
;     ---=== System.Collections.hcb:118:13 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Collections.hcb:118:28 ===---
; ACAO LEITURA - Le ponteiro
push es
push di
push word [bp+6+2]
pop es
mov di, [bp+6]
es pop word [di+4]
es pop word [di+4+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Collections.hcb:119:13 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Collections.hcb:119:23 ===---
mov ax, 1
es mov [di+2], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Collections.hcb:120:13 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Collections.hcb:120:24 ===---
mov ax, 1
es mov [di+10], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Collections.hcb:121:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Collections.hcb:121:32 ===---
mov ax, 1
push ax
;     ---=== System.Collections.hcb:121:29 ===---
mov ax, 1
push ax
;     ---=== System.Collections.hcb:121:22 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-8+2]
pop es
mov di, [bp+-8]
push es
push di
;     ---=== System.Collections.hcb:121:19 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
push cs
call _list_setid
add sp, 12
;     ---=== System.Collections.hcb:122:32 ===---
;     ---=== System.Collections.hcb:122:32 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-10], 2
ROTULO466:
;     ---=== System.Collections.hcb:122:32 ===---
;     ---=== System.Collections.hcb:122:32 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-10]
push ax
;     ---=== System.Collections.hcb:122:26 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 4
push word [bp+-8+2]
pop es
mov di, [bp+-8]
es mov ax, [di+4]
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO469
jmp ROTULO470
ROTULO469:
mov ax, 65535
jmp ROTULO471
ROTULO470:
xor ax, ax
ROTULO471:
cmp ax, 0
jne ROTULO467
jmp ROTULO468
ROTULO467:
;     ---=== System.Collections.hcb:123:17 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Collections.hcb:123:36 ===---
xor ax, ax
push ax
;     ---=== System.Collections.hcb:123:33 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-10]
push ax
;     ---=== System.Collections.hcb:123:26 ===---
; ACAO LEITURA - Le ponteiro
push es
push di
;     ---=== System.Collections.hcb:123:23 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
push cs
call _list_setid
add sp, 12
;     ---=== System.Collections.hcb:122:32 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-10]
jmp ROTULO466
ROTULO468:
;     ---=== System.Collections.hcb:125:13 ===---
;     ---=== System.Collections.hcb:125:20 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Collections.hcb:125:37 ===---
mov ax, 1
push ax
;     ---=== System.Collections.hcb:125:30 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-8+2]
pop es
mov di, [bp+-8]
push es
push di
;     ---=== System.Collections.hcb:125:27 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
push cs
call _list_getptr
add sp, 10
jmp ROTULO445
jmp ROTULO472
ROTULO447:
;     ---=== System.Collections.hcb:127:13 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.Collections.hcb:127:19 ===---
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
;     ---=== System.Collections.hcb:128:13 ===---
list_find_in_block_add:
;     ---=== System.Collections.hcb:129:14 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.Collections.hcb:129:23 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
mov [bp+-8], ax
;     ---=== System.Collections.hcb:130:14 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO GRAVACAO - Grava segmento em variavel
;     ---=== System.Collections.hcb:130:23 ===---
; ACAO LEITURA - Le segmento em variavel
mov ax, [bp+-4+2]
mov word [bp+-8+2], ax
;     ---=== System.Collections.hcb:131:32 ===---
;     ---=== System.Collections.hcb:131:32 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-10], 1
ROTULO473:
;     ---=== System.Collections.hcb:131:32 ===---
;     ---=== System.Collections.hcb:131:32 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-10]
push ax
;     ---=== System.Collections.hcb:131:26 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 4
push word [bp+-8+2]
pop es
mov di, [bp+-8]
es mov ax, [di+4]
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO476
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
;     ---=== System.Collections.hcb:132:17 ===---
;     ---=== System.Collections.hcb:132:39 ===---
;     ---=== System.Collections.hcb:132:20 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Collections.hcb:132:36 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-10]
push ax
;     ---=== System.Collections.hcb:132:29 ===---
; ACAO LEITURA - Le ponteiro
push es
push di
;     ---=== System.Collections.hcb:132:26 ===---
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
;     ---=== System.Collections.hcb:132:42 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO481
jmp ROTULO482
ROTULO481:
mov ax, 65535
jmp ROTULO483
ROTULO482:
xor ax, ax
ROTULO483:
cmp ax, 0
jne ROTULO479
jmp ROTULO480
ROTULO479:
;     ---=== System.Collections.hcb:133:21 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Collections.hcb:133:41 ===---
;     ---=== System.Collections.hcb:133:43 ===---
mov ax, 1
push ax
;     ---=== System.Collections.hcb:133:32 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 10
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+10]
pop bx
add ax, bx
es mov [di+10], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Collections.hcb:134:21 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Collections.hcb:134:40 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 10
es mov ax, [di+10]
push ax
;     ---=== System.Collections.hcb:134:37 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-10]
push ax
;     ---=== System.Collections.hcb:134:30 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-8+2]
pop es
mov di, [bp+-8]
push es
push di
;     ---=== System.Collections.hcb:134:27 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
push cs
call _list_setid
add sp, 12
;     ---=== System.Collections.hcb:135:21 ===---
;     ---=== System.Collections.hcb:135:28 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Collections.hcb:135:45 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-10]
push ax
;     ---=== System.Collections.hcb:135:38 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-8+2]
pop es
mov di, [bp+-8]
push es
push di
;     ---=== System.Collections.hcb:135:35 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
push cs
call _list_getptr
add sp, 10
jmp ROTULO445
ROTULO480:
;     ---=== System.Collections.hcb:131:32 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-10]
jmp ROTULO473
ROTULO475:
;     ---=== System.Collections.hcb:138:13 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.Collections.hcb:138:19 ===---
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
;     ---=== System.Collections.hcb:139:13 ===---
;     ---=== System.Collections.hcb:139:21 ===---
;     ---=== System.Collections.hcb:139:17 ===---
; ACAO LEITURA - Le segmento em variavel
mov ax, [bp+-4+2]
push ax
;     ---=== System.Collections.hcb:139:24 ===---
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
;     ---=== System.Collections.hcb:140:17 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.Collections.hcb:140:23 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Collections.hcb:140:34 ===---
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
;     ---=== System.Collections.hcb:141:17 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Collections.hcb:141:35 ===---
; ACAO LEITURA - Le ponteiro
push es
push di
push word [bp+-8+2]
pop es
mov di, [bp+-8]
es pop word [di+0]
es pop word [di+0+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
ROTULO485:
;     ---=== System.Collections.hcb:143:18 ===---
jmp list_find_in_block_add
ROTULO472:
ROTULO445:
mov sp, bp
pop bp
FIM_list_add:
retf
; MODULO FIM: list
;     ---=== System.Memory.hcb:106:8 ===---
; MODULO: memory
_memory:
db 17
db 83,121,115,116,101,109,46,77,101,109,111,114,121,46,104,99,98
db 0
;     ---=== System.Memory.hcb:107:9 ===---
_memory_firstblockptr:
times 4 db 0
;     ---=== System.Memory.hcb:108:9 ===---
_memory_inuse:
times 8 db 0
;     ---=== System.Memory.hcb:110:16 ===---
_memory_initialize:
;     ---=== System.Memory.hcb:111:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.Memory.hcb:111:25 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Memory.hcb:111:76 ===---
mov ax, 1
push ax
;     ---=== System.Memory.hcb:111:47 ===---
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
;     ---=== System.Memory.hcb:112:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Memory.hcb:112:37 ===---
mov ax, 1
push ax
;     ---=== System.Memory.hcb:112:30 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_memory_inuse+2]
pop es
cs mov di, [_memory_inuse]
push es
push di
push cs
call _semaphore_initialize
add sp, 6
ROTULO489:
FIM_memory_initialize:
retf
;     ---=== System.Memory.hcb:115:21 ===---
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
;     ---=== System.Memory.hcb:115:27 ===---
;     ---=== System.Memory.hcb:116:13 ===---
;     ---=== System.Memory.hcb:117:13 ===---
;     ---=== System.Memory.hcb:118:13 ===---
;     ---=== System.Memory.hcb:119:13 ===---
;     ---=== System.Memory.hcb:120:13 ===---
;     ---=== System.Memory.hcb:121:13 ===---
;     ---=== System.Memory.hcb:122:13 ===---
;     ---=== System.Memory.hcb:123:13 ===---
;     ---=== System.Memory.hcb:124:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.Memory.hcb:124:23 ===---
;     ---=== System.Memory.hcb:124:18 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
push ax
;     ---=== System.Memory.hcb:124:25 ===---
mov ax, 64
cmp ax, 0
jne ROTULO491
;     ---=== System.Memory.hcb:124:25 ===---
mov ax, _memory
mov [bp+-8], ax
mov ax, 124
mov [bp+-10], ax
mov ax, 1
cs jmp word [_os_trycode]
ROTULO491:
mov bx, ax
pop ax
xor dx, dx
div bx
mov [bp+-2], ax
;     ---=== System.Memory.hcb:125:9 ===---
;     ---=== System.Memory.hcb:125:17 ===---
;     ---=== System.Memory.hcb:125:12 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
push ax
;     ---=== System.Memory.hcb:125:21 ===---
mov ax, 64
cmp ax, 0
jne ROTULO494
;     ---=== System.Memory.hcb:125:21 ===---
mov ax, _memory
mov [bp+-8], ax
mov ax, 125
mov [bp+-10], ax
mov ax, 1
cs jmp word [_os_trycode]
ROTULO494:
mov bx, ax
pop ax
xor dx, dx
div bx
mov ax, dx
cmp ax, 0
jne ROTULO492
jmp ROTULO493
ROTULO492:
;     ---=== System.Memory.hcb:125:29 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-2]
ROTULO493:
;     ---=== System.Memory.hcb:126:9 ===---
;     ---=== System.Memory.hcb:126:19 ===---
;     ---=== System.Memory.hcb:126:12 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== System.Memory.hcb:126:21 ===---
mov ax, 10
mov bx, ax
pop ax
cmp ax, bx
ja ROTULO497
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
;     ---=== System.Memory.hcb:127:13 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.Memory.hcb:127:34 ===---
;     ---=== System.Memory.hcb:127:36 ===---
mov ax, 16
push ax
;     ---=== System.Memory.hcb:127:26 ===---
;     ---=== System.Memory.hcb:127:21 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
push ax
;     ---=== System.Memory.hcb:127:28 ===---
mov ax, 1024
cmp ax, 0
jne ROTULO500
;     ---=== System.Memory.hcb:127:28 ===---
mov ax, _memory
mov [bp+-8], ax
mov ax, 127
mov [bp+-10], ax
mov ax, 1
cs jmp word [_os_trycode]
ROTULO500:
mov bx, ax
pop ax
xor dx, dx
div bx
pop bx
add ax, bx
mov [bp+-20], ax
;     ---=== System.Memory.hcb:128:13 ===---
;     ---=== System.Memory.hcb:128:21 ===---
;     ---=== System.Memory.hcb:128:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
push ax
;     ---=== System.Memory.hcb:128:25 ===---
mov ax, 1024
cmp ax, 0
jne ROTULO503
;     ---=== System.Memory.hcb:128:25 ===---
mov ax, _memory
mov [bp+-8], ax
mov ax, 128
mov [bp+-10], ax
mov ax, 1
cs jmp word [_os_trycode]
ROTULO503:
mov bx, ax
pop ax
xor dx, dx
div bx
mov ax, dx
cmp ax, 0
jne ROTULO501
jmp ROTULO502
ROTULO501:
;     ---=== System.Memory.hcb:128:35 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-20]
ROTULO502:
;     ---=== System.Memory.hcb:129:13 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.Memory.hcb:129:19 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Memory.hcb:129:70 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-20]
push ax
;     ---=== System.Memory.hcb:129:41 ===---
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
;     ---=== System.Memory.hcb:130:13 ===---
; ACAO GRAVACAO - Gravacao de numero em ponteiro
es mov byte [di+0], 1
;     ---=== System.Memory.hcb:131:14 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-12], 16
;     ---=== System.Memory.hcb:132:13 ===---
;     ---=== System.Memory.hcb:132:20 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-12+2]
pop es
mov di, [bp+-12]
jmp ROTULO490
ROTULO496:
;     ---=== System.Memory.hcb:134:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Memory.hcb:134:27 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_memory_inuse+2]
pop es
cs mov di, [_memory_inuse]
push es
push di
push cs
call _semaphore_waitone
add sp, 4
;     ---=== System.Memory.hcb:135:9 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-8], 0
;     ---=== System.Memory.hcb:136:9 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-18], 0
;     ---=== System.Memory.hcb:137:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.Memory.hcb:137:17 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_memory_firstblockptr+2]
pop es
cs mov di, [_memory_firstblockptr]
push es
pop word [bp+-16+2]
mov [bp+-16], di
;     ---=== System.Memory.hcb:138:9 ===---
ROTULO504:
;     ---=== System.Memory.hcb:138:15 ===---
mov ax, 1
cmp ax, 0
jne ROTULO505
jmp ROTULO506
ROTULO505:
;     ---=== System.Memory.hcb:139:14 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-16], 4
;     ---=== System.Memory.hcb:140:26 ===---
;     ---=== System.Memory.hcb:140:26 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-4], 1
ROTULO507:
;     ---=== System.Memory.hcb:140:26 ===---
;     ---=== System.Memory.hcb:140:26 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
push ax
;     ---=== System.Memory.hcb:140:26 ===---
mov ax, 15
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO510
jmp ROTULO511
ROTULO510:
mov ax, 65535
jmp ROTULO512
ROTULO511:
xor ax, ax
ROTULO512:
cmp ax, 0
jne ROTULO508
jmp ROTULO509
ROTULO508:
;     ---=== System.Memory.hcb:141:17 ===---
;     ---=== System.Memory.hcb:141:20 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-8]
cmp ax, 0
jne ROTULO513
jmp ROTULO514
ROTULO513:
;     ---=== System.Memory.hcb:142:21 ===---
;     ---=== System.Memory.hcb:142:30 ===---
;     ---=== System.Memory.hcb:142:24 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-16+2]
pop es
mov di, [bp+-16]
es mov ax, [di+0]
push ax
;     ---=== System.Memory.hcb:142:33 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO517
jmp ROTULO518
ROTULO517:
mov ax, 65535
jmp ROTULO519
ROTULO518:
xor ax, ax
ROTULO519:
cmp ax, 0
jne ROTULO515
jmp ROTULO516
ROTULO515:
;     ---=== System.Memory.hcb:143:25 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-18]
jmp ROTULO520
ROTULO516:
;     ---=== System.Memory.hcb:145:25 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-8], 0
ROTULO520:
jmp ROTULO521
ROTULO514:
;     ---=== System.Memory.hcb:148:21 ===---
;     ---=== System.Memory.hcb:148:30 ===---
;     ---=== System.Memory.hcb:148:24 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-16+2]
pop es
mov di, [bp+-16]
es mov ax, [di+0]
push ax
;     ---=== System.Memory.hcb:148:33 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO524
jmp ROTULO525
ROTULO524:
mov ax, 65535
jmp ROTULO526
ROTULO525:
xor ax, ax
ROTULO526:
cmp ax, 0
jne ROTULO522
jmp ROTULO523
ROTULO522:
;     ---=== System.Memory.hcb:149:25 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-18], 1
;     ---=== System.Memory.hcb:150:25 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.Memory.hcb:150:35 ===---
;     ---=== System.Memory.hcb:150:37 ===---
mov ax, 1
push ax
;     ---=== System.Memory.hcb:150:33 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
pop bx
sub ax, bx
mov [bp+-6], ax
;     ---=== System.Memory.hcb:151:25 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-8], 1
ROTULO523:
ROTULO521:
;     ---=== System.Memory.hcb:154:17 ===---
;     ---=== System.Memory.hcb:154:24 ===---
;     ---=== System.Memory.hcb:154:20 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-18]
push ax
;     ---=== System.Memory.hcb:154:27 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
mov bx, ax
pop ax
cmp ax, bx
jae ROTULO529
jmp ROTULO530
ROTULO529:
mov ax, 65535
jmp ROTULO531
ROTULO530:
xor ax, ax
ROTULO531:
cmp ax, 0
jne ROTULO527
jmp ROTULO528
ROTULO527:
;     ---=== System.Memory.hcb:155:22 ===---
; ACAO GRAVACAO - Grava segmento em variavel
;     ---=== System.Memory.hcb:155:29 ===---
; ACAO LEITURA - Le segmento em variavel
mov ax, [bp+-16+2]
mov word [bp+-12+2], ax
;     ---=== System.Memory.hcb:156:22 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.Memory.hcb:156:30 ===---
;     ---=== System.Memory.hcb:156:32 ===---
mov ax, 64
push ax
;     ---=== System.Memory.hcb:156:28 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
pop bx
mul bx
mov [bp+-12], ax
;     ---=== System.Memory.hcb:157:21 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Memory.hcb:157:45 ===---
;     ---=== System.Memory.hcb:157:47 ===---
mov ax, 64
push ax
;     ---=== System.Memory.hcb:157:38 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
pop bx
mul bx
push ax
;     ---=== System.Memory.hcb:157:35 ===---
xor ax, ax
push ax
;     ---=== System.Memory.hcb:157:30 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-12+2]
pop es
mov di, [bp+-12]
push es
push di
push cs
call _memory_setbytes
add sp, 8
;     ---=== System.Memory.hcb:158:22 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.Memory.hcb:158:32 ===---
;     ---=== System.Memory.hcb:158:41 ===---
;     ---=== System.Memory.hcb:158:43 ===---
mov ax, 2
push ax
;     ---=== System.Memory.hcb:158:35 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-6]
pop bx
mul bx
push ax
;     ---=== System.Memory.hcb:158:30 ===---
mov ax, 4
pop bx
add ax, bx
mov [bp+-16], ax
;     ---=== System.Memory.hcb:159:34 ===---
;     ---=== System.Memory.hcb:159:34 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-4], 1
ROTULO532:
;     ---=== System.Memory.hcb:159:34 ===---
;     ---=== System.Memory.hcb:159:34 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
push ax
;     ---=== System.Memory.hcb:159:34 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO535
jmp ROTULO536
ROTULO535:
mov ax, 65535
jmp ROTULO537
ROTULO536:
xor ax, ax
ROTULO537:
cmp ax, 0
jne ROTULO533
jmp ROTULO534
ROTULO533:
;     ---=== System.Memory.hcb:160:25 ===---
;     ---=== System.Memory.hcb:160:30 ===---
;     ---=== System.Memory.hcb:160:28 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
push ax
;     ---=== System.Memory.hcb:160:33 ===---
mov ax, 1
mov bx, ax
pop ax
cmp ax, bx
je ROTULO540
jmp ROTULO541
ROTULO540:
mov ax, 65535
jmp ROTULO542
ROTULO541:
xor ax, ax
ROTULO542:
cmp ax, 0
jne ROTULO538
jmp ROTULO539
ROTULO538:
;     ---=== System.Memory.hcb:161:29 ===---
; ACAO GRAVACAO - Gravacao de numero em ponteiro
push word [bp+-16+2]
pop es
mov di, [bp+-16]
es mov word [di+0], 1
jmp ROTULO543
ROTULO539:
;     ---=== System.Memory.hcb:163:29 ===---
; ACAO GRAVACAO - Gravacao de numero em ponteiro
push word [bp+-16+2]
pop es
mov di, [bp+-16]
es mov word [di+0], 2
ROTULO543:
;     ---=== System.Memory.hcb:165:26 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-16]
;     ---=== System.Memory.hcb:166:26 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-16]
;     ---=== System.Memory.hcb:159:34 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-4]
jmp ROTULO532
ROTULO534:
;     ---=== System.Memory.hcb:168:21 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Memory.hcb:168:39 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_memory_inuse+2]
pop es
cs mov di, [_memory_inuse]
push es
push di
push cs
call _semaphore_release
add sp, 4
;     ---=== System.Memory.hcb:169:21 ===---
;     ---=== System.Memory.hcb:169:28 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-12+2]
pop es
mov di, [bp+-12]
jmp ROTULO490
ROTULO528:
;     ---=== System.Memory.hcb:171:18 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-16]
;     ---=== System.Memory.hcb:172:18 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-16]
;     ---=== System.Memory.hcb:140:26 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-4]
jmp ROTULO507
ROTULO509:
;     ---=== System.Memory.hcb:174:14 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-16], 2
;     ---=== System.Memory.hcb:175:13 ===---
;     ---=== System.Memory.hcb:175:22 ===---
;     ---=== System.Memory.hcb:175:16 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-16+2]
pop es
mov di, [bp+-16]
es mov ax, [di+0]
push ax
;     ---=== System.Memory.hcb:175:25 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO546
jmp ROTULO547
ROTULO546:
mov ax, 65535
jmp ROTULO548
ROTULO547:
xor ax, ax
ROTULO548:
cmp ax, 0
jne ROTULO544
jmp ROTULO545
ROTULO544:
;     ---=== System.Memory.hcb:176:17 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.Memory.hcb:176:23 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Memory.hcb:176:74 ===---
mov ax, 1
push ax
;     ---=== System.Memory.hcb:176:45 ===---
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
;     ---=== System.Memory.hcb:177:17 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.Memory.hcb:177:26 ===---
; ACAO LEITURA - Le segmento em variavel
mov ax, [bp+-12+2]
push word [bp+-16+2]
pop es
mov di, [bp+-16]
es mov [di+0], ax
jmp ROTULO549
ROTULO545:
;     ---=== System.Memory.hcb:179:18 ===---
; ACAO GRAVACAO - Grava segmento em variavel
;     ---=== System.Memory.hcb:179:26 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-16+2]
pop es
mov di, [bp+-16]
es mov ax, [di+0]
mov word [bp+-16+2], ax
ROTULO549:
jmp ROTULO504
ROTULO506:
;     ---=== System.Memory.hcb:182:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Memory.hcb:182:27 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_memory_inuse+2]
pop es
cs mov di, [_memory_inuse]
push es
push di
push cs
call _semaphore_release
add sp, 4
ROTULO490:
mov sp, bp
pop bp
FIM_memory_alloc:
retf
;     ---=== System.Memory.hcb:186:16 ===---
_memory_setbytes:
push bp
mov bp, sp
; ARG: ptr TAM: 4 POS: BP+6 
; ARG: value TAM: 2 POS: BP+10 
; ARG: len TAM: 2 POS: BP+12 
;     ---=== System.Memory.hcb:186:25 ===---
;     ---=== System.Memory.hcb:186:46 ===---
;     ---=== System.Memory.hcb:186:62 ===---
;     ---=== System.Memory.hcb:187:13 ===---
cld
;     ---=== System.Memory.hcb:188:13 ===---
mov ax, [bp+8]
;     ---=== System.Memory.hcb:189:13 ===---
mov es, ax
;     ---=== System.Memory.hcb:190:13 ===---
mov di, [bp+6]
;     ---=== System.Memory.hcb:191:13 ===---
mov ax, [bp+10]
;     ---=== System.Memory.hcb:192:13 ===---
mov cx, [bp+12]
;     ---=== System.Memory.hcb:193:13 ===---
rep stosb
ROTULO550:
mov sp, bp
pop bp
FIM_memory_setbytes:
retf
;     ---=== System.Memory.hcb:196:16 ===---
_memory_setwords:
push bp
mov bp, sp
; ARG: ptr TAM: 4 POS: BP+6 
; ARG: value TAM: 2 POS: BP+10 
; ARG: len TAM: 2 POS: BP+12 
;     ---=== System.Memory.hcb:196:25 ===---
;     ---=== System.Memory.hcb:196:46 ===---
;     ---=== System.Memory.hcb:196:62 ===---
;     ---=== System.Memory.hcb:197:13 ===---
cld
;     ---=== System.Memory.hcb:198:13 ===---
mov ax, [bp+8]
;     ---=== System.Memory.hcb:199:13 ===---
mov es, ax
;     ---=== System.Memory.hcb:200:13 ===---
mov di, [bp+6]
;     ---=== System.Memory.hcb:201:13 ===---
mov ax, [bp+10]
;     ---=== System.Memory.hcb:202:13 ===---
mov cx, [bp+12]
;     ---=== System.Memory.hcb:203:13 ===---
rep stosw
ROTULO551:
mov sp, bp
pop bp
FIM_memory_setwords:
retf
;     ---=== System.Memory.hcb:206:16 ===---
_memory_copy:
push bp
mov bp, sp
; ARG: dest TAM: 4 POS: BP+6 
; ARG: orig TAM: 4 POS: BP+10 
; ARG: len TAM: 2 POS: BP+14 
;     ---=== System.Memory.hcb:206:21 ===---
;     ---=== System.Memory.hcb:206:43 ===---
;     ---=== System.Memory.hcb:206:65 ===---
;     ---=== System.Memory.hcb:207:13 ===---
cld
;     ---=== System.Memory.hcb:208:13 ===---
push ds
;     ---=== System.Memory.hcb:209:13 ===---
push si
;     ---=== System.Memory.hcb:210:13 ===---
mov ax, [bp+8]
;     ---=== System.Memory.hcb:211:13 ===---
mov es, ax
;     ---=== System.Memory.hcb:212:13 ===---
mov di, [bp+6]
;     ---=== System.Memory.hcb:213:13 ===---
mov ax, [bp+12]
;     ---=== System.Memory.hcb:214:13 ===---
mov ds, ax
;     ---=== System.Memory.hcb:215:13 ===---
mov si, [bp+10]
;     ---=== System.Memory.hcb:216:13 ===---
mov cx, [bp+14]
;     ---=== System.Memory.hcb:217:13 ===---
rep movsb
;     ---=== System.Memory.hcb:218:13 ===---
pop si
;     ---=== System.Memory.hcb:219:13 ===---
pop ds
ROTULO552:
mov sp, bp
pop bp
FIM_memory_copy:
retf
; MODULO FIM: memory
;     ---=== System.Memory.hcb:5:8 ===---
; MODULO: globalmemory
_globalmemory:
db 17
db 83,121,115,116,101,109,46,77,101,109,111,114,121,46,104,99,98
db 0
;     ---=== System.Memory.hcb:6:9 ===---
_globalmemory_memorysizekib:
times 2 db 0
;     ---=== System.Memory.hcb:7:9 ===---
_globalmemory_mapptr:
times 4 db 0
;     ---=== System.Memory.hcb:8:9 ===---
_globalmemory_inuse:
times 8 db 0
;     ---=== System.Memory.hcb:10:16 ===---
_globalmemory_initialize:
push bp
mov bp, sp
sub sp, 4
push cs
call _os_stackcheck
; ARG: freekib TAM: 2 POS: BP--2 
; ARG: i TAM: 2 POS: BP--4 
;     ---=== System.Memory.hcb:11:13 ===---
;     ---=== System.Memory.hcb:12:13 ===---
;     ---=== System.Memory.hcb:13:13 ===---
xor ax, ax
;     ---=== System.Memory.hcb:14:13 ===---
int 0x12
;     ---=== System.Memory.hcb:15:13 ===---
cs mov [_globalmemory_memorysizekib], ax
;     ---=== System.Memory.hcb:17:10 ===---
; ACAO GRAVACAO - Grava segmento em variavel
;     ---=== System.Memory.hcb:17:36 ===---
;     ---=== System.Memory.hcb:17:38 ===---
mov ax, 4096
push ax
;     ---=== System.Memory.hcb:17:19 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _os_codesegment
pop bx
add ax, bx
cs mov [_globalmemory_mapptr+2], ax
;     ---=== System.Memory.hcb:18:10 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_globalmemory_mapptr], 0
;     ---=== System.Memory.hcb:19:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.Memory.hcb:19:35 ===---
;     ---=== System.Memory.hcb:19:37 ===---
mov ax, 2
push ax
;     ---=== System.Memory.hcb:19:28 ===---
;     ---=== System.Memory.hcb:19:21 ===---
; ACAO LEITURA - Le segmento em variavel
cs mov ax, [_globalmemory_mapptr+2]
push ax
;     ---=== System.Memory.hcb:19:32 ===---
mov ax, 6
mov cx, ax
pop ax
shr ax, cl
pop bx
add ax, bx
mov [bp+-2], ax
;     ---=== System.Memory.hcb:20:22 ===---
;     ---=== System.Memory.hcb:20:22 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-4], 1
ROTULO554:
;     ---=== System.Memory.hcb:20:22 ===---
;     ---=== System.Memory.hcb:20:22 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
push ax
;     ---=== System.Memory.hcb:20:22 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_globalmemory_memorysizekib]
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO557
jmp ROTULO558
ROTULO557:
mov ax, 65535
jmp ROTULO559
ROTULO558:
xor ax, ax
ROTULO559:
cmp ax, 0
jne ROTULO555
jmp ROTULO556
ROTULO555:
;     ---=== System.Memory.hcb:21:13 ===---
;     ---=== System.Memory.hcb:21:18 ===---
;     ---=== System.Memory.hcb:21:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
push ax
;     ---=== System.Memory.hcb:21:20 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
mov bx, ax
pop ax
cmp ax, bx
jb ROTULO562
jmp ROTULO563
ROTULO562:
mov ax, 65535
jmp ROTULO564
ROTULO563:
xor ax, ax
ROTULO564:
cmp ax, 0
jne ROTULO560
jmp ROTULO561
ROTULO560:
;     ---=== System.Memory.hcb:21:33 ===---
; ACAO GRAVACAO - Gravacao de numero em ponteiro
cs push word [_globalmemory_mapptr+2]
pop es
cs mov di, [_globalmemory_mapptr]
es mov byte [di+0], 129
jmp ROTULO565
ROTULO561:
;     ---=== System.Memory.hcb:21:51 ===---
; ACAO GRAVACAO - Gravacao de numero em ponteiro
cs push word [_globalmemory_mapptr+2]
pop es
cs mov di, [_globalmemory_mapptr]
es mov byte [di+0], 0
ROTULO565:
;     ---=== System.Memory.hcb:22:14 ===---
; ACAO INC - Incrementa variavel
cs inc word [_globalmemory_mapptr]
;     ---=== System.Memory.hcb:20:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-4]
jmp ROTULO554
ROTULO556:
;     ---=== System.Memory.hcb:24:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Memory.hcb:24:37 ===---
mov ax, 1
push ax
;     ---=== System.Memory.hcb:24:30 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_globalmemory_inuse+2]
pop es
cs mov di, [_globalmemory_inuse]
push es
push di
push cs
call _semaphore_initialize
add sp, 6
ROTULO553:
mov sp, bp
pop bp
FIM_globalmemory_initialize:
retf
;     ---=== System.Memory.hcb:27:21 ===---
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
;     ---=== System.Memory.hcb:27:30 ===---
;     ---=== System.Memory.hcb:27:43 ===---
;     ---=== System.Memory.hcb:28:13 ===---
;     ---=== System.Memory.hcb:29:13 ===---
;     ---=== System.Memory.hcb:30:13 ===---
;     ---=== System.Memory.hcb:31:13 ===---
;     ---=== System.Memory.hcb:32:13 ===---
;     ---=== System.Memory.hcb:33:10 ===---
; ACAO GRAVACAO - Grava segmento em variavel
mov word [bp+-4+2], 0
;     ---=== System.Memory.hcb:34:10 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-4], 0
;     ---=== System.Memory.hcb:35:9 ===---
;     ---=== System.Memory.hcb:35:17 ===---
;     ---=== System.Memory.hcb:35:12 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 0
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+0]
push ax
;     ---=== System.Memory.hcb:35:19 ===---
mov ax, 127
mov bx, ax
pop ax
cmp ax, bx
ja ROTULO569
jmp ROTULO570
ROTULO569:
mov ax, 65535
jmp ROTULO571
ROTULO570:
xor ax, ax
ROTULO571:
cmp ax, 0
jne ROTULO567
jmp ROTULO568
ROTULO567:
;     ---=== System.Memory.hcb:35:34 ===---
mov ax, _globalmemory
mov [bp+-8], ax
mov ax, 35
mov [bp+-10], ax
mov ax, 4
cs jmp word [_os_trycode]
ROTULO568:
;     ---=== System.Memory.hcb:36:9 ===---
;     ---=== System.Memory.hcb:36:20 ===---
;     ---=== System.Memory.hcb:36:12 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
push ax
;     ---=== System.Memory.hcb:36:22 ===---
mov ax, 64
mov bx, ax
pop ax
cmp ax, bx
ja ROTULO574
jmp ROTULO575
ROTULO574:
mov ax, 65535
jmp ROTULO576
ROTULO575:
xor ax, ax
ROTULO576:
cmp ax, 0
jne ROTULO572
jmp ROTULO573
ROTULO572:
;     ---=== System.Memory.hcb:36:36 ===---
mov ax, _globalmemory
mov [bp+-8], ax
mov ax, 36
mov [bp+-10], ax
mov ax, 12
cs jmp word [_os_trycode]
ROTULO573:
;     ---=== System.Memory.hcb:37:9 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-12], 0
;     ---=== System.Memory.hcb:38:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Memory.hcb:38:27 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_globalmemory_inuse+2]
pop es
cs mov di, [_globalmemory_inuse]
push es
push di
push cs
call _semaphore_waitone
add sp, 4
;     ---=== System.Memory.hcb:39:10 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_globalmemory_mapptr], 0
;     ---=== System.Memory.hcb:40:9 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-10], 0
;     ---=== System.Memory.hcb:41:22 ===---
;     ---=== System.Memory.hcb:41:22 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-6], 1
ROTULO577:
;     ---=== System.Memory.hcb:41:22 ===---
;     ---=== System.Memory.hcb:41:22 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-6]
push ax
;     ---=== System.Memory.hcb:41:22 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_globalmemory_memorysizekib]
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO580
jmp ROTULO581
ROTULO580:
mov ax, 65535
jmp ROTULO582
ROTULO581:
xor ax, ax
ROTULO582:
cmp ax, 0
jne ROTULO578
jmp ROTULO579
ROTULO578:
;     ---=== System.Memory.hcb:42:13 ===---
;     ---=== System.Memory.hcb:42:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-12]
cmp ax, 0
jne ROTULO583
jmp ROTULO584
ROTULO583:
;     ---=== System.Memory.hcb:43:17 ===---
;     ---=== System.Memory.hcb:43:27 ===---
;     ---=== System.Memory.hcb:43:20 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_globalmemory_mapptr+2]
pop es
cs mov di, [_globalmemory_mapptr]
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== System.Memory.hcb:43:30 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO587
jmp ROTULO588
ROTULO587:
mov ax, 65535
jmp ROTULO589
ROTULO588:
xor ax, ax
ROTULO589:
cmp ax, 0
jne ROTULO585
jmp ROTULO586
ROTULO585:
;     ---=== System.Memory.hcb:44:21 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-10]
jmp ROTULO590
ROTULO586:
;     ---=== System.Memory.hcb:46:21 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-12], 0
ROTULO590:
jmp ROTULO591
ROTULO584:
;     ---=== System.Memory.hcb:49:17 ===---
;     ---=== System.Memory.hcb:49:27 ===---
;     ---=== System.Memory.hcb:49:20 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_globalmemory_mapptr+2]
pop es
cs mov di, [_globalmemory_mapptr]
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== System.Memory.hcb:49:30 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO594
jmp ROTULO595
ROTULO594:
mov ax, 65535
jmp ROTULO596
ROTULO595:
xor ax, ax
ROTULO596:
cmp ax, 0
jne ROTULO592
jmp ROTULO593
ROTULO592:
;     ---=== System.Memory.hcb:50:21 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-10], 1
;     ---=== System.Memory.hcb:51:21 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.Memory.hcb:51:31 ===---
;     ---=== System.Memory.hcb:51:33 ===---
mov ax, 1
push ax
;     ---=== System.Memory.hcb:51:29 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-6]
pop bx
sub ax, bx
mov [bp+-8], ax
;     ---=== System.Memory.hcb:52:21 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-12], 1
ROTULO593:
ROTULO591:
;     ---=== System.Memory.hcb:55:13 ===---
;     ---=== System.Memory.hcb:55:20 ===---
;     ---=== System.Memory.hcb:55:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-10]
push ax
;     ---=== System.Memory.hcb:55:23 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
mov bx, ax
pop ax
cmp ax, bx
jae ROTULO599
jmp ROTULO600
ROTULO599:
mov ax, 65535
jmp ROTULO601
ROTULO600:
xor ax, ax
ROTULO601:
cmp ax, 0
jne ROTULO597
jmp ROTULO598
ROTULO597:
;     ---=== System.Memory.hcb:56:18 ===---
; ACAO GRAVACAO - Grava segmento em variavel
;     ---=== System.Memory.hcb:56:30 ===---
;     ---=== System.Memory.hcb:56:24 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-8]
push ax
;     ---=== System.Memory.hcb:56:34 ===---
mov ax, 6
mov cx, ax
pop ax
shl ax, cl
mov word [bp+-4+2], ax
;     ---=== System.Memory.hcb:57:17 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Memory.hcb:57:58 ===---
;     ---=== System.Memory.hcb:57:60 ===---
mov ax, 1
push ax
;     ---=== System.Memory.hcb:57:47 ===---
;     ---=== System.Memory.hcb:57:49 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
push ax
;     ---=== System.Memory.hcb:57:42 ===---
mov ax, 1024
pop bx
mul bx
pop bx
sub ax, bx
push ax
;     ---=== System.Memory.hcb:57:38 ===---
xor ax, ax
push ax
;     ---=== System.Memory.hcb:57:33 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-4+2]
pop es
mov di, [bp+-4]
push es
push di
push cs
call _memory_setbytes
add sp, 8
;     ---=== System.Memory.hcb:58:18 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.Memory.hcb:58:27 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-8]
cs mov [_globalmemory_mapptr], ax
;     ---=== System.Memory.hcb:59:30 ===---
;     ---=== System.Memory.hcb:59:30 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-6], 1
ROTULO602:
;     ---=== System.Memory.hcb:59:30 ===---
;     ---=== System.Memory.hcb:59:30 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-6]
push ax
;     ---=== System.Memory.hcb:59:30 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO605
jmp ROTULO606
ROTULO605:
mov ax, 65535
jmp ROTULO607
ROTULO606:
xor ax, ax
ROTULO607:
cmp ax, 0
jne ROTULO603
jmp ROTULO604
ROTULO603:
;     ---=== System.Memory.hcb:60:21 ===---
;     ---=== System.Memory.hcb:60:26 ===---
;     ---=== System.Memory.hcb:60:24 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-6]
push ax
;     ---=== System.Memory.hcb:60:29 ===---
mov ax, 1
mov bx, ax
pop ax
cmp ax, bx
je ROTULO610
jmp ROTULO611
ROTULO610:
mov ax, 65535
jmp ROTULO612
ROTULO611:
xor ax, ax
ROTULO612:
cmp ax, 0
jne ROTULO608
jmp ROTULO609
ROTULO608:
;     ---=== System.Memory.hcb:61:25 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.Memory.hcb:61:39 ===---
;     ---=== System.Memory.hcb:61:34 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 0
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+0]
push ax
;     ---=== System.Memory.hcb:61:42 ===---
mov ax, 128
mov bx, ax
pop ax
or ax, bx
cs push word [_globalmemory_mapptr+2]
pop es
cs mov di, [_globalmemory_mapptr]
es mov [di+0], al
jmp ROTULO616
ROTULO609:
;     ---=== System.Memory.hcb:63:25 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.Memory.hcb:63:34 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 0
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+0]
cs push word [_globalmemory_mapptr+2]
pop es
cs mov di, [_globalmemory_mapptr]
es mov [di+0], al
ROTULO616:
;     ---=== System.Memory.hcb:65:22 ===---
; ACAO INC - Incrementa variavel
cs inc word [_globalmemory_mapptr]
;     ---=== System.Memory.hcb:59:30 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-6]
jmp ROTULO602
ROTULO604:
;     ---=== System.Memory.hcb:67:17 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Memory.hcb:67:35 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_globalmemory_inuse+2]
pop es
cs mov di, [_globalmemory_inuse]
push es
push di
push cs
call _semaphore_release
add sp, 4
;     ---=== System.Memory.hcb:68:17 ===---
;     ---=== System.Memory.hcb:68:24 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-4+2]
pop es
mov di, [bp+-4]
jmp ROTULO566
ROTULO598:
;     ---=== System.Memory.hcb:70:14 ===---
; ACAO INC - Incrementa variavel
cs inc word [_globalmemory_mapptr]
;     ---=== System.Memory.hcb:41:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-6]
jmp ROTULO577
ROTULO579:
;     ---=== System.Memory.hcb:72:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Memory.hcb:72:27 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_globalmemory_inuse+2]
pop es
cs mov di, [_globalmemory_inuse]
push es
push di
push cs
call _semaphore_release
add sp, 4
;     ---=== System.Memory.hcb:73:15 ===---
mov ax, _globalmemory
mov [bp+-8], ax
mov ax, 73
mov [bp+-10], ax
mov ax, 3
cs jmp word [_os_trycode]
ROTULO566:
mov sp, bp
pop bp
FIM_globalmemory_allockib:
retf
;     ---=== System.Memory.hcb:76:21 ===---
_globalmemory_getavailkib:
push bp
mov bp, sp
sub sp, 4
push cs
call _os_stackcheck
; ARG: ret TAM: 2 POS: BP--2 
; ARG: i TAM: 2 POS: BP--4 
;     ---=== System.Memory.hcb:77:13 ===---
;     ---=== System.Memory.hcb:78:13 ===---
;     ---=== System.Memory.hcb:79:9 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-2], 0
;     ---=== System.Memory.hcb:80:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Memory.hcb:80:27 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_globalmemory_inuse+2]
pop es
cs mov di, [_globalmemory_inuse]
push es
push di
push cs
call _semaphore_waitone
add sp, 4
;     ---=== System.Memory.hcb:81:10 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_globalmemory_mapptr], 0
;     ---=== System.Memory.hcb:82:22 ===---
;     ---=== System.Memory.hcb:82:22 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-4], 0
ROTULO618:
;     ---=== System.Memory.hcb:82:22 ===---
;     ---=== System.Memory.hcb:82:22 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
push ax
;     ---=== System.Memory.hcb:82:22 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_globalmemory_memorysizekib]
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO621
jmp ROTULO622
ROTULO621:
mov ax, 65535
jmp ROTULO623
ROTULO622:
xor ax, ax
ROTULO623:
cmp ax, 0
jne ROTULO619
jmp ROTULO620
ROTULO619:
;     ---=== System.Memory.hcb:83:13 ===---
;     ---=== System.Memory.hcb:83:23 ===---
;     ---=== System.Memory.hcb:83:16 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_globalmemory_mapptr+2]
pop es
cs mov di, [_globalmemory_mapptr]
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== System.Memory.hcb:83:26 ===---
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
;     ---=== System.Memory.hcb:83:33 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-2]
ROTULO625:
;     ---=== System.Memory.hcb:84:14 ===---
; ACAO INC - Incrementa variavel
cs inc word [_globalmemory_mapptr]
;     ---=== System.Memory.hcb:82:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-4]
jmp ROTULO618
ROTULO620:
;     ---=== System.Memory.hcb:86:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Memory.hcb:86:27 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_globalmemory_inuse+2]
pop es
cs mov di, [_globalmemory_inuse]
push es
push di
push cs
call _semaphore_release
add sp, 4
;     ---=== System.Memory.hcb:87:9 ===---
;     ---=== System.Memory.hcb:87:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
jmp ROTULO617
ROTULO617:
mov sp, bp
pop bp
FIM_globalmemory_getavailkib:
retf
;     ---=== System.Memory.hcb:90:21 ===---
_globalmemory_getusedkib:
push bp
mov bp, sp
sub sp, 4
push cs
call _os_stackcheck
; ARG: ret TAM: 2 POS: BP--2 
; ARG: i TAM: 2 POS: BP--4 
;     ---=== System.Memory.hcb:91:13 ===---
;     ---=== System.Memory.hcb:92:13 ===---
;     ---=== System.Memory.hcb:93:9 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-2], 0
;     ---=== System.Memory.hcb:94:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Memory.hcb:94:27 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_globalmemory_inuse+2]
pop es
cs mov di, [_globalmemory_inuse]
push es
push di
push cs
call _semaphore_waitone
add sp, 4
;     ---=== System.Memory.hcb:95:10 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_globalmemory_mapptr], 0
;     ---=== System.Memory.hcb:96:22 ===---
;     ---=== System.Memory.hcb:96:22 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-4], 0
ROTULO630:
;     ---=== System.Memory.hcb:96:22 ===---
;     ---=== System.Memory.hcb:96:22 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
push ax
;     ---=== System.Memory.hcb:96:22 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_globalmemory_memorysizekib]
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO633
jmp ROTULO634
ROTULO633:
mov ax, 65535
jmp ROTULO635
ROTULO634:
xor ax, ax
ROTULO635:
cmp ax, 0
jne ROTULO631
jmp ROTULO632
ROTULO631:
;     ---=== System.Memory.hcb:97:13 ===---
;     ---=== System.Memory.hcb:97:23 ===---
;     ---=== System.Memory.hcb:97:16 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_globalmemory_mapptr+2]
pop es
cs mov di, [_globalmemory_mapptr]
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== System.Memory.hcb:97:26 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
jne ROTULO638
jmp ROTULO639
ROTULO638:
mov ax, 65535
jmp ROTULO640
ROTULO639:
xor ax, ax
ROTULO640:
cmp ax, 0
jne ROTULO636
jmp ROTULO637
ROTULO636:
;     ---=== System.Memory.hcb:97:33 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-2]
ROTULO637:
;     ---=== System.Memory.hcb:98:14 ===---
; ACAO INC - Incrementa variavel
cs inc word [_globalmemory_mapptr]
;     ---=== System.Memory.hcb:96:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-4]
jmp ROTULO630
ROTULO632:
;     ---=== System.Memory.hcb:100:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Memory.hcb:100:27 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_globalmemory_inuse+2]
pop es
cs mov di, [_globalmemory_inuse]
push es
push di
push cs
call _semaphore_release
add sp, 4
;     ---=== System.Memory.hcb:101:9 ===---
;     ---=== System.Memory.hcb:101:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
jmp ROTULO629
ROTULO629:
mov sp, bp
pop bp
FIM_globalmemory_getusedkib:
retf
; MODULO FIM: globalmemory
;     ---=== System.Threading.hcb:25:8 ===---
; MODULO: semaphore
_semaphore:
db 20
db 83,121,115,116,101,109,46,84,104,114,101,97,100,105,110,103,46,104,99,98
db 0
;     ---=== System.Threading.hcb:27:16 ===---
_semaphore_initialize:
push bp
mov bp, sp
; ARG: s TAM: 4 POS: BP+6 
; ARG: limit TAM: 2 POS: BP+10 
;     ---=== System.Threading.hcb:27:27 ===---
;     ---=== System.Threading.hcb:27:43 ===---
;     ---=== System.Threading.hcb:28:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:28:19 ===---
xor ax, ax
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov [di+0], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Threading.hcb:29:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:29:19 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
es mov [di+2], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
ROTULO641:
mov sp, bp
pop bp
FIM_semaphore_initialize:
retf
;     ---=== System.Threading.hcb:33:16 ===---
_semaphore_waitone:
push bp
mov bp, sp
; ARG: s TAM: 4 POS: BP+6 
;     ---=== System.Threading.hcb:33:24 ===---
;     ---=== System.Threading.hcb:34:9 ===---
waiting:
;     ---=== System.Threading.hcb:35:9 ===---
ROTULO643:
;     ---=== System.Threading.hcb:35:23 ===---
;     ---=== System.Threading.hcb:35:15 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 0
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+0]
push ax
;     ---=== System.Threading.hcb:35:26 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 2
es mov ax, [di+2]
mov bx, ax
pop ax
cmp ax, bx
jae ROTULO646
jmp ROTULO647
ROTULO646:
mov ax, 65535
jmp ROTULO648
ROTULO647:
xor ax, ax
ROTULO648:
cmp ax, 0
jne ROTULO644
jmp ROTULO645
ROTULO644:
;     ---=== System.Threading.hcb:36:13 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _thread_yield
jmp ROTULO643
ROTULO645:
;     ---=== System.Threading.hcb:38:13 ===---
pushf
;     ---=== System.Threading.hcb:39:13 ===---
cli
;     ---=== System.Threading.hcb:40:9 ===---
;     ---=== System.Threading.hcb:40:20 ===---
;     ---=== System.Threading.hcb:40:12 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 0
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+0]
push ax
;     ---=== System.Threading.hcb:40:23 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 2
es mov ax, [di+2]
mov bx, ax
pop ax
cmp ax, bx
jae ROTULO651
jmp ROTULO652
ROTULO651:
mov ax, 65535
jmp ROTULO653
ROTULO652:
xor ax, ax
ROTULO653:
cmp ax, 0
jne ROTULO649
jmp ROTULO650
ROTULO649:
;     ---=== System.Threading.hcb:41:17 ===---
popf
;     ---=== System.Threading.hcb:42:18 ===---
jmp waiting
ROTULO650:
;     ---=== System.Threading.hcb:44:9 ===---
; ACAO STRUCTURE - Incremento de ponteiro
es inc word [di+0]
;     ---=== System.Threading.hcb:45:13 ===---
popf
ROTULO642:
mov sp, bp
pop bp
FIM_semaphore_waitone:
retf
;     ---=== System.Threading.hcb:49:16 ===---
_semaphore_release:
push bp
mov bp, sp
; ARG: s TAM: 4 POS: BP+6 
;     ---=== System.Threading.hcb:49:24 ===---
;     ---=== System.Threading.hcb:50:13 ===---
pushf
;     ---=== System.Threading.hcb:51:13 ===---
cli
;     ---=== System.Threading.hcb:52:9 ===---
;     ---=== System.Threading.hcb:52:20 ===---
;     ---=== System.Threading.hcb:52:12 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 0
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+0]
push ax
;     ---=== System.Threading.hcb:52:22 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
ja ROTULO657
jmp ROTULO658
ROTULO657:
mov ax, 65535
jmp ROTULO659
ROTULO658:
xor ax, ax
ROTULO659:
cmp ax, 0
jne ROTULO655
jmp ROTULO656
ROTULO655:
;     ---=== System.Threading.hcb:52:29 ===---
; ACAO STRUCTURE - Decremento de Ponteiro
es dec word [di+0]
ROTULO656:
;     ---=== System.Threading.hcb:53:13 ===---
popf
ROTULO654:
mov sp, bp
pop bp
FIM_semaphore_release:
retf
; MODULO FIM: semaphore
;     ---=== System.Threading.hcb:214:8 ===---
; MODULO: thread
_thread:
db 20
db 83,121,115,116,101,109,46,84,104,114,101,97,100,105,110,103,46,104,99,98
db 0
;     ---=== System.Threading.hcb:216:21 ===---
_thread_requestnew:
;     ---=== System.Threading.hcb:217:9 ===---
;     ---=== System.Threading.hcb:217:16 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _multithreading_requestnew
jmp ROTULO660
ROTULO660:
FIM_thread_requestnew:
retf
;     ---=== System.Threading.hcb:221:16 ===---
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
;     ---=== System.Threading.hcb:221:22 ===---
;     ---=== System.Threading.hcb:221:35 ===---
;     ---=== System.Threading.hcb:221:59 ===---
;     ---=== System.Threading.hcb:222:13 ===---
;     ---=== System.Threading.hcb:223:13 ===---
;     ---=== System.Threading.hcb:224:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:224:23 ===---
xor ax, ax
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov [di+4], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Threading.hcb:225:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.Threading.hcb:225:17 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Threading.hcb:225:42 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
push ax
;     ---=== System.Threading.hcb:225:39 ===---
; ACAO LEITURA - Le ponteiro
push es
push di
push cs
call _globalmemory_allockib
add sp, 6
push es
pop word [bp+-4+2]
mov [bp+-4], di
;     ---=== System.Threading.hcb:226:10 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.Threading.hcb:226:40 ===---
;     ---=== System.Threading.hcb:226:42 ===---
mov ax, 2
push ax
;     ---=== System.Threading.hcb:226:32 ===---
;     ---=== System.Threading.hcb:226:34 ===---
mov ax, 1024
push ax
;     ---=== System.Threading.hcb:226:19 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
pop bx
mul bx
pop bx
sub ax, bx
mov [bp+-4], ax
;     ---=== System.Threading.hcb:227:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:227:27 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov [di+16], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Threading.hcb:228:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:228:27 ===---
; ACAO LEITURA - Le segmento em variavel
mov ax, [bp+-4+2]
es mov [di+14], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Threading.hcb:229:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:229:22 ===---
mov ax, 1
es mov [di+6], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Threading.hcb:230:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:230:20 ===---
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
;     ---=== System.Threading.hcb:231:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Threading.hcb:231:36 ===---
; ACAO LEITURA - Le ponteiro
push es
push di
push cs
call _multithreading_startthread
add sp, 4
ROTULO661:
mov sp, bp
pop bp
FIM_thread_start:
retf
;     ---=== System.Threading.hcb:235:9 ===---
_thread_endthread:
push bp
mov bp, sp
sub sp, 4
push cs
call _os_stackcheck
; ARG: t TAM: 4 POS: BP--4 
;     ---=== System.Threading.hcb:236:13 ===---
;     ---=== System.Threading.hcb:237:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.Threading.hcb:237:13 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _thread_current
push es
pop word [bp+-4+2]
mov [bp+-4], di
;     ---=== System.Threading.hcb:238:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:238:20 ===---
xor ax, ax
es mov [di+2], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Threading.hcb:239:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:239:23 ===---
mov ax, 1
es mov [di+4], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Threading.hcb:240:9 ===---
ROTULO663:
;     ---=== System.Threading.hcb:240:15 ===---
mov ax, 1
cmp ax, 0
jne ROTULO664
jmp ROTULO665
ROTULO664:
;     ---=== System.Threading.hcb:240:17 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _thread_yield
jmp ROTULO663
ROTULO665:
ROTULO662:
mov sp, bp
pop bp
FIM_thread_endthread:
retf
;     ---=== System.Threading.hcb:244:16 ===---
_thread_abort:
push bp
mov bp, sp
; ARG: t TAM: 4 POS: BP+6 
;     ---=== System.Threading.hcb:244:22 ===---
;     ---=== System.Threading.hcb:245:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:245:23 ===---
mov ax, 1
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov [di+4], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Threading.hcb:246:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:246:20 ===---
xor ax, ax
es mov [di+2], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
ROTULO666:
mov sp, bp
pop bp
FIM_thread_abort:
retf
;     ---=== System.Threading.hcb:250:21 ===---
_thread_current:
;     ---=== System.Threading.hcb:251:9 ===---
;     ---=== System.Threading.hcb:251:16 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_multithreading_current+2]
pop es
cs mov di, [_multithreading_current]
jmp ROTULO667
ROTULO667:
FIM_thread_current:
retf
;     ---=== System.Threading.hcb:255:16 ===---
_thread_yield:
;     ---=== System.Threading.hcb:256:9 ===---
;     ---=== System.Threading.hcb:256:38 ===---
;     ---=== System.Threading.hcb:256:12 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _multithreading_isactive
push ax
;     ---=== System.Threading.hcb:256:41 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO671
jmp ROTULO672
ROTULO671:
mov ax, 65535
jmp ROTULO673
ROTULO672:
xor ax, ax
ROTULO673:
cmp ax, 0
jne ROTULO669
jmp ROTULO670
ROTULO669:
;     ---=== System.Threading.hcb:256:48 ===---
;     ---=== System.Threading.hcb:256:53 ===---
xor ax, ax
jmp ROTULO668
ROTULO670:
;     ---=== System.Threading.hcb:257:13 ===---
int 0x81
ROTULO668:
FIM_thread_yield:
retf
;     ---=== System.Threading.hcb:261:16 ===---
_thread_sleep:
push bp
mov bp, sp
sub sp, 4
push cs
call _os_stackcheck
; ARG: miliseconds TAM: 2 POS: BP+6 
; ARG: oldmili TAM: 2 POS: BP--2 
; ARG: diff TAM: 2 POS: BP--4 
;     ---=== System.Threading.hcb:261:22 ===---
;     ---=== System.Threading.hcb:262:13 ===---
;     ---=== System.Threading.hcb:263:13 ===---
;     ---=== System.Threading.hcb:264:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.Threading.hcb:264:19 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_clock_timermiliseconds]
mov [bp+-2], ax
;     ---=== System.Threading.hcb:265:9 ===---
ROTULO675:
;     ---=== System.Threading.hcb:265:15 ===---
mov ax, 1
cmp ax, 0
jne ROTULO676
jmp ROTULO677
ROTULO676:
;     ---=== System.Threading.hcb:266:13 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.Threading.hcb:266:43 ===---
;     ---=== System.Threading.hcb:266:45 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== System.Threading.hcb:266:20 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_clock_timermiliseconds]
pop bx
sub ax, bx
mov [bp+-4], ax
;     ---=== System.Threading.hcb:267:13 ===---
;     ---=== System.Threading.hcb:267:21 ===---
;     ---=== System.Threading.hcb:267:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
push ax
;     ---=== System.Threading.hcb:267:24 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
mov bx, ax
pop ax
cmp ax, bx
jae ROTULO680
jmp ROTULO681
ROTULO680:
mov ax, 65535
jmp ROTULO682
ROTULO681:
xor ax, ax
ROTULO682:
cmp ax, 0
jne ROTULO678
jmp ROTULO679
ROTULO678:
;     ---=== System.Threading.hcb:267:41 ===---
;     ---=== System.Threading.hcb:267:46 ===---
xor ax, ax
jmp ROTULO674
ROTULO679:
;     ---=== System.Threading.hcb:268:13 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _thread_yield
jmp ROTULO675
ROTULO677:
ROTULO674:
mov sp, bp
pop bp
FIM_thread_sleep:
retf
;     ---=== System.Threading.hcb:273:16 ===---
_thread_sleepseconds:
push bp
mov bp, sp
sub sp, 4
push cs
call _os_stackcheck
; ARG: seconds TAM: 2 POS: BP+6 
; ARG: oldsec TAM: 2 POS: BP--2 
; ARG: diff TAM: 2 POS: BP--4 
;     ---=== System.Threading.hcb:273:29 ===---
;     ---=== System.Threading.hcb:274:13 ===---
;     ---=== System.Threading.hcb:275:13 ===---
;     ---=== System.Threading.hcb:276:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.Threading.hcb:276:18 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_clock_timerseconds]
mov [bp+-2], ax
;     ---=== System.Threading.hcb:277:9 ===---
ROTULO684:
;     ---=== System.Threading.hcb:277:15 ===---
mov ax, 1
cmp ax, 0
jne ROTULO685
jmp ROTULO686
ROTULO685:
;     ---=== System.Threading.hcb:278:13 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.Threading.hcb:278:39 ===---
;     ---=== System.Threading.hcb:278:41 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== System.Threading.hcb:278:20 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_clock_timerseconds]
pop bx
sub ax, bx
mov [bp+-4], ax
;     ---=== System.Threading.hcb:279:13 ===---
;     ---=== System.Threading.hcb:279:21 ===---
;     ---=== System.Threading.hcb:279:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
push ax
;     ---=== System.Threading.hcb:279:24 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
mov bx, ax
pop ax
cmp ax, bx
jae ROTULO689
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
;     ---=== System.Threading.hcb:279:37 ===---
;     ---=== System.Threading.hcb:279:42 ===---
xor ax, ax
jmp ROTULO683
ROTULO688:
;     ---=== System.Threading.hcb:280:13 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _thread_yield
jmp ROTULO684
ROTULO686:
ROTULO683:
mov sp, bp
pop bp
FIM_thread_sleepseconds:
retf
; MODULO FIM: thread
;     ---=== System.Timer.hcb:6:8 ===---
; MODULO: clock
_clock:
db 16
db 83,121,115,116,101,109,46,84,105,109,101,114,46,104,99,98
db 0
;     ---=== System.Timer.hcb:7:16 ===---
_clock_timermiliseconds:
times 2 db 0
;     ---=== System.Timer.hcb:8:16 ===---
_clock_timerseconds:
times 2 db 0
;     ---=== System.Timer.hcb:9:16 ===---
_clock_milisecond:
times 2 db 0
;     ---=== System.Timer.hcb:10:16 ===---
_clock_second:
times 2 db 0
;     ---=== System.Timer.hcb:11:16 ===---
_clock_minute:
times 2 db 0
;     ---=== System.Timer.hcb:12:16 ===---
_clock_hour:
times 2 db 0
;     ---=== System.Timer.hcb:13:16 ===---
_clock_day:
times 2 db 0
;     ---=== System.Timer.hcb:14:16 ===---
_clock_month:
times 2 db 0
;     ---=== System.Timer.hcb:15:16 ===---
_clock_year:
times 2 db 0
;     ---=== System.Timer.hcb:17:16 ===---
_clock_initialize:
;     ---=== System.Timer.hcb:18:9 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_clock_year], 2023
;     ---=== System.Timer.hcb:19:9 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_clock_month], 1
;     ---=== System.Timer.hcb:20:9 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_clock_day], 1
;     ---=== System.Timer.hcb:21:9 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_clock_hour], 0
;     ---=== System.Timer.hcb:22:9 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_clock_minute], 0
;     ---=== System.Timer.hcb:23:9 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_clock_second], 0
;     ---=== System.Timer.hcb:24:9 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_clock_milisecond], 0
;     ---=== System.Timer.hcb:25:9 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_clock_timerseconds], 0
ROTULO692:
FIM_clock_initialize:
retf
;     ---=== System.Timer.hcb:28:16 ===---
_clock_autoajust:
;     ---=== System.Timer.hcb:29:9 ===---
;     ---=== System.Timer.hcb:29:17 ===---
;     ---=== System.Timer.hcb:29:12 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_clock_hour]
push ax
;     ---=== System.Timer.hcb:29:19 ===---
mov ax, 24
mov bx, ax
pop ax
cmp ax, bx
jb ROTULO696
jmp ROTULO697
ROTULO696:
mov ax, 65535
jmp ROTULO698
ROTULO697:
xor ax, ax
ROTULO698:
cmp ax, 0
jne ROTULO694
jmp ROTULO695
ROTULO694:
;     ---=== System.Timer.hcb:29:32 ===---
jmp end_ajust
ROTULO695:
;     ---=== System.Timer.hcb:30:9 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_clock_hour], 0
;     ---=== System.Timer.hcb:31:9 ===---
; ACAO INC - Incrementa variavel
cs inc word [_clock_day]
;     ---=== System.Timer.hcb:32:9 ===---
;     ---=== System.Timer.hcb:32:16 ===---
;     ---=== System.Timer.hcb:32:12 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_clock_day]
push ax
;     ---=== System.Timer.hcb:32:18 ===---
mov ax, 28
mov bx, ax
pop ax
cmp ax, bx
jb ROTULO701
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
;     ---=== System.Timer.hcb:32:31 ===---
jmp end_ajust
ROTULO700:
;     ---=== System.Timer.hcb:33:9 ===---
;     ---=== System.Timer.hcb:33:16 ===---
;     ---=== System.Timer.hcb:33:12 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_clock_day]
push ax
;     ---=== System.Timer.hcb:33:19 ===---
mov ax, 32
mov bx, ax
pop ax
cmp ax, bx
jae ROTULO706
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
;     ---=== System.Timer.hcb:33:32 ===---
jmp calc_month
ROTULO705:
;     ---=== System.Timer.hcb:34:9 ===---
;     ---=== System.Timer.hcb:34:18 ===---
;     ---=== System.Timer.hcb:34:12 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_clock_month]
push ax
;     ---=== System.Timer.hcb:34:21 ===---
mov ax, 2
mov bx, ax
pop ax
cmp ax, bx
je ROTULO711
jmp ROTULO712
ROTULO711:
mov ax, 65535
jmp ROTULO713
ROTULO712:
xor ax, ax
ROTULO713:
cmp ax, 0
jne ROTULO709
jmp ROTULO710
ROTULO709:
;     ---=== System.Timer.hcb:34:33 ===---
jmp calc_month
ROTULO710:
;     ---=== System.Timer.hcb:35:9 ===---
;     ---=== System.Timer.hcb:35:16 ===---
;     ---=== System.Timer.hcb:35:12 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_clock_day]
push ax
;     ---=== System.Timer.hcb:35:18 ===---
mov ax, 30
mov bx, ax
pop ax
cmp ax, bx
jb ROTULO716
jmp ROTULO717
ROTULO716:
mov ax, 65535
jmp ROTULO718
ROTULO717:
xor ax, ax
ROTULO718:
cmp ax, 0
jne ROTULO714
jmp ROTULO715
ROTULO714:
;     ---=== System.Timer.hcb:35:31 ===---
jmp end_ajust
ROTULO715:
;     ---=== System.Timer.hcb:36:9 ===---
;     ---=== System.Timer.hcb:36:18 ===---
;     ---=== System.Timer.hcb:36:12 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_clock_month]
push ax
;     ---=== System.Timer.hcb:36:21 ===---
mov ax, 4
mov bx, ax
pop ax
cmp ax, bx
je ROTULO721
jmp ROTULO722
ROTULO721:
mov ax, 65535
jmp ROTULO723
ROTULO722:
xor ax, ax
ROTULO723:
cmp ax, 0
jne ROTULO719
jmp ROTULO720
ROTULO719:
;     ---=== System.Timer.hcb:36:33 ===---
jmp calc_month
ROTULO720:
;     ---=== System.Timer.hcb:37:9 ===---
;     ---=== System.Timer.hcb:37:18 ===---
;     ---=== System.Timer.hcb:37:12 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_clock_month]
push ax
;     ---=== System.Timer.hcb:37:21 ===---
mov ax, 6
mov bx, ax
pop ax
cmp ax, bx
je ROTULO726
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
;     ---=== System.Timer.hcb:37:33 ===---
jmp calc_month
ROTULO725:
;     ---=== System.Timer.hcb:38:9 ===---
;     ---=== System.Timer.hcb:38:18 ===---
;     ---=== System.Timer.hcb:38:12 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_clock_month]
push ax
;     ---=== System.Timer.hcb:38:21 ===---
mov ax, 9
mov bx, ax
pop ax
cmp ax, bx
je ROTULO731
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
;     ---=== System.Timer.hcb:38:33 ===---
jmp calc_month
ROTULO730:
;     ---=== System.Timer.hcb:39:9 ===---
;     ---=== System.Timer.hcb:39:18 ===---
;     ---=== System.Timer.hcb:39:12 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_clock_month]
push ax
;     ---=== System.Timer.hcb:39:21 ===---
mov ax, 11
mov bx, ax
pop ax
cmp ax, bx
je ROTULO736
jmp ROTULO737
ROTULO736:
mov ax, 65535
jmp ROTULO738
ROTULO737:
xor ax, ax
ROTULO738:
cmp ax, 0
jne ROTULO734
jmp ROTULO735
ROTULO734:
;     ---=== System.Timer.hcb:39:34 ===---
jmp calc_month
ROTULO735:
;     ---=== System.Timer.hcb:40:14 ===---
jmp end_ajust
;     ---=== System.Timer.hcb:41:9 ===---
calc_month:
;     ---=== System.Timer.hcb:42:9 ===---
;     ---=== System.Timer.hcb:42:25 ===---
;     ---=== System.Timer.hcb:42:19 ===---
;     ---=== System.Timer.hcb:42:13 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_clock_month]
push ax
;     ---=== System.Timer.hcb:42:21 ===---
mov ax, 13
mov bx, ax
pop ax
cmp ax, bx
ja ROTULO744
jmp ROTULO745
ROTULO744:
mov ax, 65535
jmp ROTULO746
ROTULO745:
xor ax, ax
ROTULO746:
push ax
;     ---=== System.Timer.hcb:42:35 ===---
;     ---=== System.Timer.hcb:42:29 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_clock_month]
push ax
;     ---=== System.Timer.hcb:42:38 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO747
jmp ROTULO748
ROTULO747:
mov ax, 65535
jmp ROTULO749
ROTULO748:
xor ax, ax
ROTULO749:
mov bx, ax
pop ax
or ax, bx
cmp ax, 0
jne ROTULO739
jmp ROTULO740
ROTULO739:
;     ---=== System.Timer.hcb:43:13 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_clock_month], 1
;     ---=== System.Timer.hcb:44:13 ===---
; ACAO INC - Incrementa variavel
cs inc word [_clock_year]
ROTULO740:
;     ---=== System.Timer.hcb:46:9 ===---
end_ajust:
ROTULO693:
FIM_clock_autoajust:
retf
; MODULO FIM: clock
;     ---=== System.IO.hcb:3:8 ===---
; MODULO: io
_io:
db 13
db 83,121,115,116,101,109,46,73,79,46,104,99,98
db 0
;     ---=== System.IO.hcb:4:16 ===---
_io_outputbyte:
push bp
mov bp, sp
; ARG: port TAM: 2 POS: BP+6 
; ARG: value TAM: 2 POS: BP+8 
;     ---=== System.IO.hcb:4:27 ===---
;     ---=== System.IO.hcb:4:43 ===---
;     ---=== System.IO.hcb:5:13 ===---
mov dx, [bp+6]
;     ---=== System.IO.hcb:6:13 ===---
mov ax, [bp+8]
;     ---=== System.IO.hcb:7:13 ===---
out dx, al
ROTULO750:
mov sp, bp
pop bp
FIM_io_outputbyte:
retf
;     ---=== System.IO.hcb:10:16 ===---
_io_outputword:
push bp
mov bp, sp
; ARG: port TAM: 2 POS: BP+6 
; ARG: value TAM: 2 POS: BP+8 
;     ---=== System.IO.hcb:10:27 ===---
;     ---=== System.IO.hcb:10:43 ===---
;     ---=== System.IO.hcb:11:13 ===---
mov dx, [bp+6]
;     ---=== System.IO.hcb:12:13 ===---
mov ax, [bp+8]
;     ---=== System.IO.hcb:13:13 ===---
out dx, ax
ROTULO751:
mov sp, bp
pop bp
FIM_io_outputword:
retf
;     ---=== System.IO.hcb:16:21 ===---
_io_inputbyte:
push bp
mov bp, sp
; ARG: port TAM: 2 POS: BP+6 
;     ---=== System.IO.hcb:16:31 ===---
;     ---=== System.IO.hcb:17:13 ===---
mov dx, [bp+6]
;     ---=== System.IO.hcb:18:13 ===---
xor ax, ax
;     ---=== System.IO.hcb:19:13 ===---
in al, dx
ROTULO752:
mov sp, bp
pop bp
FIM_io_inputbyte:
retf
;     ---=== System.IO.hcb:22:21 ===---
_io_inputword:
push bp
mov bp, sp
; ARG: port TAM: 2 POS: BP+6 
;     ---=== System.IO.hcb:22:31 ===---
;     ---=== System.IO.hcb:23:13 ===---
mov dx, [bp+6]
;     ---=== System.IO.hcb:24:13 ===---
in ax, dx
ROTULO753:
mov sp, bp
pop bp
FIM_io_inputword:
retf
;     ---=== System.IO.hcb:27:16 ===---
_io_registerhandler:
push bp
mov bp, sp
sub sp, 4
push cs
call _os_stackcheck
; ARG: interrupt TAM: 2 POS: BP+6 
; ARG: handler TAM: 4 POS: BP+8 
; ARG: ptr TAM: 4 POS: BP--4 
;     ---=== System.IO.hcb:27:32 ===---
;     ---=== System.IO.hcb:27:52 ===---
;     ---=== System.IO.hcb:28:13 ===---
;     ---=== System.IO.hcb:29:13 ===---
pushf
;     ---=== System.IO.hcb:30:13 ===---
cli
;     ---=== System.IO.hcb:31:10 ===---
; ACAO GRAVACAO - Grava segmento em variavel
mov word [bp+-4+2], 0
;     ---=== System.IO.hcb:32:10 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.IO.hcb:32:26 ===---
;     ---=== System.IO.hcb:32:28 ===---
mov ax, 4
push ax
;     ---=== System.IO.hcb:32:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
pop bx
mul bx
mov [bp+-4], ax
;     ---=== System.IO.hcb:33:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.IO.hcb:33:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+8]
push word [bp+-4+2]
pop es
mov di, [bp+-4]
es mov [di+0], ax
;     ---=== System.IO.hcb:34:10 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-4]
;     ---=== System.IO.hcb:35:10 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-4]
;     ---=== System.IO.hcb:36:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.IO.hcb:36:16 ===---
; ACAO LEITURA - Le segmento em variavel
mov ax, [bp+8+2]
push word [bp+-4+2]
pop es
mov di, [bp+-4]
es mov [di+0], ax
;     ---=== System.IO.hcb:37:13 ===---
popf
ROTULO754:
mov sp, bp
pop bp
FIM_io_registerhandler:
retf
;     ---=== System.IO.hcb:40:21 ===---
_io_gethandler:
push bp
mov bp, sp
sub sp, 8
push cs
call _os_stackcheck
; ARG: interrupt TAM: 2 POS: BP+6 
; ARG: ptr TAM: 4 POS: BP--4 
; ARG: ret TAM: 4 POS: BP--8 
;     ---=== System.IO.hcb:40:32 ===---
;     ---=== System.IO.hcb:41:13 ===---
;     ---=== System.IO.hcb:42:13 ===---
;     ---=== System.IO.hcb:43:10 ===---
; ACAO GRAVACAO - Grava segmento em variavel
mov word [bp+-4+2], 0
;     ---=== System.IO.hcb:44:10 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.IO.hcb:44:26 ===---
;     ---=== System.IO.hcb:44:28 ===---
mov ax, 4
push ax
;     ---=== System.IO.hcb:44:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
pop bx
mul bx
mov [bp+-4], ax
;     ---=== System.IO.hcb:45:10 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.IO.hcb:45:16 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-4+2]
pop es
mov di, [bp+-4]
es mov ax, [di+0]
mov [bp+-8], ax
;     ---=== System.IO.hcb:46:10 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-4]
;     ---=== System.IO.hcb:47:10 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-4]
;     ---=== System.IO.hcb:48:10 ===---
; ACAO GRAVACAO - Grava segmento em variavel
;     ---=== System.IO.hcb:48:16 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-4+2]
pop es
mov di, [bp+-4]
es mov ax, [di+0]
mov word [bp+-8+2], ax
;     ---=== System.IO.hcb:49:9 ===---
;     ---=== System.IO.hcb:49:16 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-8+2]
pop es
mov di, [bp+-8]
jmp ROTULO755
ROTULO755:
mov sp, bp
pop bp
FIM_io_gethandler:
retf
; MODULO FIM: io
;     ---=== System.Timer.hcb:50:8 ===---
; MODULO: systemtimer
_systemtimer:
db 16
db 83,121,115,116,101,109,46,84,105,109,101,114,46,104,99,98
db 0
;     ---=== System.Timer.hcb:51:9 ===---
_systemtimer_biosint8cs:
times 2 db 0
;     ---=== System.Timer.hcb:52:9 ===---
_systemtimer_biosint8ip:
times 2 db 0
;     ---=== System.Timer.hcb:53:16 ===---
_systemtimer_ticklow:
times 2 db 0
;     ---=== System.Timer.hcb:54:16 ===---
_systemtimer_tickhigh:
times 2 db 0
;     ---=== System.Timer.hcb:55:16 ===---
_systemtimer_defaultflags:
times 2 db 0
;     ---=== System.Timer.hcb:57:16 ===---
_systemtimer_initialize:
push bp
mov bp, sp
sub sp, 4
push cs
call _os_stackcheck
; ARG: ptr TAM: 4 POS: BP--4 
;     ---=== System.Timer.hcb:58:13 ===---
;     ---=== System.Timer.hcb:59:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.Timer.hcb:59:15 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Timer.hcb:59:29 ===---
mov ax, 8
push ax
push cs
call _io_gethandler
add sp, 2
push es
pop word [bp+-4+2]
mov [bp+-4], di
;     ---=== System.Timer.hcb:60:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.Timer.hcb:60:23 ===---
; ACAO LEITURA - Le segmento em variavel
mov ax, [bp+-4+2]
cs mov [_systemtimer_biosint8cs], ax
;     ---=== System.Timer.hcb:61:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.Timer.hcb:61:23 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
cs mov [_systemtimer_biosint8ip], ax
;     ---=== System.Timer.hcb:62:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Timer.hcb:62:31 ===---
push cs
pop es
mov di, _systemtimer_inttick
push es
push di
;     ---=== System.Timer.hcb:62:28 ===---
mov ax, 8
push ax
push cs
call _io_registerhandler
add sp, 6
;     ---=== System.Timer.hcb:63:13 ===---
sti
;     ---=== System.Timer.hcb:64:13 ===---
pushf
;     ---=== System.Timer.hcb:65:13 ===---
cs pop word [_systemtimer_defaultflags]
ROTULO756:
mov sp, bp
pop bp
FIM_systemtimer_initialize:
retf
;     ---=== System.Timer.hcb:69:9 ===---
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
;     ---=== System.Timer.hcb:70:13 ===---
cs add word [_systemtimer_ticklow], 1
;     ---=== System.Timer.hcb:71:13 ===---
cs adc word [_systemtimer_tickhigh], 0
;     ---=== System.Timer.hcb:73:13 ===---
pushf
;     ---=== System.Timer.hcb:74:13 ===---
push cs
;     ---=== System.Timer.hcb:75:13 ===---
mov ax, .return
;     ---=== System.Timer.hcb:76:13 ===---
push ax
;     ---=== System.Timer.hcb:77:13 ===---
cs push word [_systemtimer_biosint8cs]
;     ---=== System.Timer.hcb:78:13 ===---
cs push word [_systemtimer_biosint8ip]
;     ---=== System.Timer.hcb:79:13 ===---
retf
;     ---=== System.Timer.hcb:80:13 ===---
.return:
;     ---=== System.Timer.hcb:82:13 ===---
cs add word [_clock_milisecond], 55
;     ---=== System.Timer.hcb:83:13 ===---
cs add word [_clock_timermiliseconds], 55
;     ---=== System.Timer.hcb:84:13 ===---
cs cmp word [_clock_milisecond], 990
;     ---=== System.Timer.hcb:85:13 ===---
jb .end_clock
;     ---=== System.Timer.hcb:86:13 ===---
cs mov word [_clock_milisecond], 0
;     ---=== System.Timer.hcb:87:13 ===---
cs add word [_clock_timermiliseconds], 10
;     ---=== System.Timer.hcb:88:13 ===---
cs inc word [_clock_second]
;     ---=== System.Timer.hcb:89:13 ===---
cs inc word [_clock_timerseconds]
;     ---=== System.Timer.hcb:90:13 ===---
cs cmp word [_clock_second], 60
;     ---=== System.Timer.hcb:91:13 ===---
jb .end_clock
;     ---=== System.Timer.hcb:92:13 ===---
cs mov word [_clock_second], 0
;     ---=== System.Timer.hcb:93:13 ===---
cs inc word [_clock_minute]
;     ---=== System.Timer.hcb:94:13 ===---
cs cmp word [_clock_minute], 60
;     ---=== System.Timer.hcb:95:13 ===---
jb .end_clock
;     ---=== System.Timer.hcb:96:13 ===---
cs mov word [_clock_minute], 0
;     ---=== System.Timer.hcb:97:13 ===---
cs inc word [_clock_hour]
;     ---=== System.Timer.hcb:98:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _clock_autoajust
;     ---=== System.Timer.hcb:99:13 ===---
.end_clock:
;     ---=== System.Timer.hcb:101:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _thread_yield
ROTULO757:
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
;     ---=== System.IO.Disk.hcb:33:8 ===---
; MODULO: disk
_disk:
db 18
db 83,121,115,116,101,109,46,73,79,46,68,105,115,107,46,104,99,98
db 0
;     ---=== System.IO.Disk.hcb:34:9 ===---
_disk_disks:
times 16 db 0
;     ---=== System.IO.Disk.hcb:36:16 ===---
_disk_initialize:
;     ---=== System.IO.Disk.hcb:37:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.hcb:37:32 ===---
; ACAO CHAMADA - Calcula tamanho de item
mov ax, 55
push ax
;     ---=== System.IO.Disk.hcb:37:25 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_disk_disks+2]
pop es
cs mov di, [_disk_disks]
push es
push di
push cs
call _list_initialize
add sp, 6
ROTULO758:
FIM_disk_initialize:
retf
;     ---=== System.IO.Disk.hcb:40:21 ===---
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
;     ---=== System.IO.Disk.hcb:40:33 ===---
;     ---=== System.IO.Disk.hcb:40:49 ===---
;     ---=== System.IO.Disk.hcb:40:71 ===---
;     ---=== System.IO.Disk.hcb:40:92 ===---
;     ---=== System.IO.Disk.hcb:40:109 ===---
;     ---=== System.IO.Disk.hcb:40:128 ===---
;     ---=== System.IO.Disk.hcb:41:13 ===---
;     ---=== System.IO.Disk.hcb:42:13 ===---
;     ---=== System.IO.Disk.hcb:43:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.IO.Disk.hcb:43:15 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.hcb:43:24 ===---
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
;     ---=== System.IO.Disk.hcb:44:10 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO GRAVACAO - Grava segmento em variavel
;     ---=== System.IO.Disk.hcb:44:18 ===---
; ACAO LEITURA - Le segmento em variavel
mov ax, [bp+-8+2]
mov word [bp+-4+2], ax
;     ---=== System.IO.Disk.hcb:45:10 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.IO.Disk.hcb:45:18 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-8]
mov [bp+-4], ax
;     ---=== System.IO.Disk.hcb:46:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.IO.Disk.hcb:46:21 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-4+2]
pop es
mov di, [bp+-4]
push es
push di
es pop word [di+33]
es pop word [di+33+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.IO.Disk.hcb:47:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.IO.Disk.hcb:47:27 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
es mov [di+37], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.IO.Disk.hcb:48:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.IO.Disk.hcb:48:26 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+12]
es mov [di+39], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.IO.Disk.hcb:49:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.IO.Disk.hcb:49:22 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+14]
es mov [di+41], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.IO.Disk.hcb:50:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.IO.Disk.hcb:50:24 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+16]
es mov [di+43], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.IO.Disk.hcb:51:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.IO.Disk.hcb:51:26 ===---
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
;     ---=== System.IO.Disk.hcb:52:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.IO.Disk.hcb:52:27 ===---
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
;     ---=== System.IO.Disk.hcb:53:9 ===---
; ACAO GRAVACAO - Gravacao de numero em ponteiro
push word [bp+-8+2]
pop es
mov di, [bp+-8]
es mov byte [di+0], 32
;     ---=== System.IO.Disk.hcb:54:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.hcb:54:32 ===---
push cs
pop es
mov di, ROTULO761
jmp ROTULO760
ROTULO761:
db 0
times 1 db 0
ROTULO760:
push es
push di
;     ---=== System.IO.Disk.hcb:54:21 ===---
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
;     ---=== System.IO.Disk.hcb:55:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.hcb:55:32 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
;     ---=== System.IO.Disk.hcb:55:21 ===---
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
;     ---=== System.IO.Disk.hcb:56:9 ===---
;     ---=== System.IO.Disk.hcb:56:16 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-4+2]
pop es
mov di, [bp+-4]
jmp ROTULO759
ROTULO759:
mov sp, bp
pop bp
FIM_disk_registernew:
retf
;     ---=== System.IO.Disk.hcb:59:16 ===---
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
;     ---=== System.IO.Disk.hcb:59:29 ===---
;     ---=== System.IO.Disk.hcb:59:48 ===---
;     ---=== System.IO.Disk.hcb:59:63 ===---
;     ---=== System.IO.Disk.hcb:59:85 ===---
;     ---=== System.IO.Disk.hcb:60:13 ===---
;     ---=== System.IO.Disk.hcb:61:9 ===---
;     ---=== System.IO.Disk.hcb:61:24 ===---
;     ---=== System.IO.Disk.hcb:61:12 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+16]
push ax
;     ---=== System.IO.Disk.hcb:61:27 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
jne ROTULO765
jmp ROTULO766
ROTULO765:
mov ax, 65535
jmp ROTULO767
ROTULO766:
xor ax, ax
ROTULO767:
cmp ax, 0
jne ROTULO763
jmp ROTULO764
ROTULO763:
;     ---=== System.IO.Disk.hcb:61:40 ===---
mov ax, _disk
mov [bp+-8], ax
mov ax, 61
mov [bp+-10], ax
mov ax, 4
cs jmp word [_os_trycode]
ROTULO764:
;     ---=== System.IO.Disk.hcb:62:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.IO.Disk.hcb:62:29 ===---
;     ---=== System.IO.Disk.hcb:62:31 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 41
push word [bp+10+2]
pop es
mov di, [bp+10]
es mov ax, [di+41]
push ax
;     ---=== System.IO.Disk.hcb:62:19 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 43
es mov ax, [di+43]
pop bx
mul bx
mov [bp+-2], ax
;     ---=== System.IO.Disk.hcb:63:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.IO.Disk.hcb:63:35 ===---
;     ---=== System.IO.Disk.hcb:63:24 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+14]
push ax
;     ---=== System.IO.Disk.hcb:63:37 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
cmp ax, 0
jne ROTULO768
;     ---=== System.IO.Disk.hcb:63:37 ===---
mov ax, _disk
mov [bp+-8], ax
mov ax, 63
mov [bp+-10], ax
mov ax, 1
cs jmp word [_os_trycode]
ROTULO768:
mov bx, ax
pop ax
xor dx, dx
div bx
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov [di+0], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.IO.Disk.hcb:64:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.IO.Disk.hcb:64:45 ===---
;     ---=== System.IO.Disk.hcb:64:32 ===---
;     ---=== System.IO.Disk.hcb:64:21 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+14]
push ax
;     ---=== System.IO.Disk.hcb:64:36 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
cmp ax, 0
jne ROTULO769
;     ---=== System.IO.Disk.hcb:64:36 ===---
mov ax, _disk
mov [bp+-8], ax
mov ax, 64
mov [bp+-10], ax
mov ax, 1
cs jmp word [_os_trycode]
ROTULO769:
mov bx, ax
pop ax
xor dx, dx
div bx
mov ax, dx
push ax
;     ---=== System.IO.Disk.hcb:64:47 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 43
push word [bp+10+2]
pop es
mov di, [bp+10]
es mov ax, [di+43]
cmp ax, 0
jne ROTULO770
;     ---=== System.IO.Disk.hcb:64:47 ===---
mov ax, _disk
mov [bp+-8], ax
mov ax, 64
mov [bp+-10], ax
mov ax, 1
cs jmp word [_os_trycode]
ROTULO770:
mov bx, ax
pop ax
xor dx, dx
div bx
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov [di+2], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.IO.Disk.hcb:65:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.IO.Disk.hcb:65:63 ===---
;     ---=== System.IO.Disk.hcb:65:65 ===---
mov ax, 1
push ax
;     ---=== System.IO.Disk.hcb:65:48 ===---
;     ---=== System.IO.Disk.hcb:65:35 ===---
;     ---=== System.IO.Disk.hcb:65:24 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+14]
push ax
;     ---=== System.IO.Disk.hcb:65:39 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
cmp ax, 0
jne ROTULO771
;     ---=== System.IO.Disk.hcb:65:39 ===---
mov ax, _disk
mov [bp+-8], ax
mov ax, 65
mov [bp+-10], ax
mov ax, 1
cs jmp word [_os_trycode]
ROTULO771:
mov bx, ax
pop ax
xor dx, dx
div bx
mov ax, dx
push ax
;     ---=== System.IO.Disk.hcb:65:52 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 43
push word [bp+10+2]
pop es
mov di, [bp+10]
es mov ax, [di+43]
cmp ax, 0
jne ROTULO772
;     ---=== System.IO.Disk.hcb:65:52 ===---
mov ax, _disk
mov [bp+-8], ax
mov ax, 65
mov [bp+-10], ax
mov ax, 1
cs jmp word [_os_trycode]
ROTULO772:
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
ROTULO762:
mov sp, bp
pop bp
FIM_disk_converttochs:
retf
;     ---=== System.IO.Disk.hcb:68:9 ===---
_disk_genericreadblock:
push bp
mov bp, sp
; ARG: info TAM: 4 POS: BP+6 
; ARG: data TAM: 4 POS: BP+10 
; ARG: addresslow TAM: 2 POS: BP+14 
; ARG: addresshigh TAM: 2 POS: BP+16 
;     ---=== System.IO.Disk.hcb:68:26 ===---
;     ---=== System.IO.Disk.hcb:68:44 ===---
;     ---=== System.IO.Disk.hcb:68:66 ===---
;     ---=== System.IO.Disk.hcb:68:88 ===---
;     ---=== System.IO.Disk.hcb:69:15 ===---
mov ax, _disk
mov [bp+-8], ax
mov ax, 69
mov [bp+-10], ax
mov ax, 7
cs jmp word [_os_trycode]
ROTULO773:
mov sp, bp
pop bp
FIM_disk_genericreadblock:
retf
;     ---=== System.IO.Disk.hcb:72:9 ===---
_disk_genericwriteblock:
push bp
mov bp, sp
; ARG: info TAM: 4 POS: BP+6 
; ARG: data TAM: 4 POS: BP+10 
; ARG: addresslow TAM: 2 POS: BP+14 
; ARG: addresshigh TAM: 2 POS: BP+16 
;     ---=== System.IO.Disk.hcb:72:27 ===---
;     ---=== System.IO.Disk.hcb:72:45 ===---
;     ---=== System.IO.Disk.hcb:72:67 ===---
;     ---=== System.IO.Disk.hcb:72:89 ===---
;     ---=== System.IO.Disk.hcb:73:15 ===---
mov ax, _disk
mov [bp+-8], ax
mov ax, 73
mov [bp+-10], ax
mov ax, 7
cs jmp word [_os_trycode]
ROTULO774:
mov sp, bp
pop bp
FIM_disk_genericwriteblock:
retf
;     ---=== System.IO.Disk.hcb:76:14 ===---
_disk_exist:
push bp
mov bp, sp
sub sp, 6
push cs
call _os_stackcheck
; ARG: name TAM: 4 POS: BP+6 
; ARG: i TAM: 2 POS: BP--2 
; ARG: d TAM: 4 POS: BP--6 
;     ---=== System.IO.Disk.hcb:76:20 ===---
;     ---=== System.IO.Disk.hcb:77:13 ===---
;     ---=== System.IO.Disk.hcb:79:17 ===---
;     ---=== System.IO.Disk.hcb:78:38 ===---
;     ---=== System.IO.Disk.hcb:78:38 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-2], 1
ROTULO776:
;     ---=== System.IO.Disk.hcb:78:38 ===---
;     ---=== System.IO.Disk.hcb:78:38 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== System.IO.Disk.hcb:78:22 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.hcb:78:33 ===---
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
jbe ROTULO779
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
;     ---=== System.IO.Disk.hcb:80:13 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.IO.Disk.hcb:80:17 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.hcb:80:34 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== System.IO.Disk.hcb:80:27 ===---
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
;     ---=== System.IO.Disk.hcb:81:13 ===---
;     ---=== System.IO.Disk.hcb:81:16 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.hcb:81:38 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
;     ---=== System.IO.Disk.hcb:81:30 ===---
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
jne ROTULO782
jmp ROTULO783
ROTULO782:
;     ---=== System.IO.Disk.hcb:81:49 ===---
;     ---=== System.IO.Disk.hcb:81:56 ===---
mov ax, 1
jmp ROTULO775
ROTULO783:
;     ---=== System.IO.Disk.hcb:78:38 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-2]
jmp ROTULO776
ROTULO778:
;     ---=== System.IO.Disk.hcb:83:9 ===---
;     ---=== System.IO.Disk.hcb:83:16 ===---
xor ax, ax
jmp ROTULO775
ROTULO775:
mov sp, bp
pop bp
FIM_disk_exist:
retf
;     ---=== System.IO.Disk.hcb:86:14 ===---
_disk_getblocksize:
push bp
mov bp, sp
sub sp, 6
push cs
call _os_stackcheck
; ARG: name TAM: 4 POS: BP+6 
; ARG: i TAM: 2 POS: BP--2 
; ARG: d TAM: 4 POS: BP--6 
;     ---=== System.IO.Disk.hcb:86:27 ===---
;     ---=== System.IO.Disk.hcb:87:13 ===---
;     ---=== System.IO.Disk.hcb:89:17 ===---
;     ---=== System.IO.Disk.hcb:88:38 ===---
;     ---=== System.IO.Disk.hcb:88:38 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-2], 1
ROTULO785:
;     ---=== System.IO.Disk.hcb:88:38 ===---
;     ---=== System.IO.Disk.hcb:88:38 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== System.IO.Disk.hcb:88:22 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.hcb:88:33 ===---
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
jbe ROTULO788
jmp ROTULO789
ROTULO788:
mov ax, 65535
jmp ROTULO790
ROTULO789:
xor ax, ax
ROTULO790:
cmp ax, 0
jne ROTULO786
jmp ROTULO787
ROTULO786:
;     ---=== System.IO.Disk.hcb:90:13 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.IO.Disk.hcb:90:17 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.hcb:90:34 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== System.IO.Disk.hcb:90:27 ===---
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
;     ---=== System.IO.Disk.hcb:91:13 ===---
;     ---=== System.IO.Disk.hcb:91:16 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.hcb:91:38 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
;     ---=== System.IO.Disk.hcb:91:30 ===---
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
jne ROTULO791
jmp ROTULO792
ROTULO791:
;     ---=== System.IO.Disk.hcb:91:49 ===---
;     ---=== System.IO.Disk.hcb:91:56 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 45
push word [bp+-6+2]
pop es
mov di, [bp+-6]
es mov ax, [di+45]
jmp ROTULO784
ROTULO792:
;     ---=== System.IO.Disk.hcb:88:38 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-2]
jmp ROTULO785
ROTULO787:
;     ---=== System.IO.Disk.hcb:93:15 ===---
mov ax, _disk
mov [bp+-8], ax
mov ax, 93
mov [bp+-10], ax
mov ax, 5
cs jmp word [_os_trycode]
ROTULO784:
mov sp, bp
pop bp
FIM_disk_getblocksize:
retf
;     ---=== System.IO.Disk.hcb:96:9 ===---
_disk_readblock:
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
;     ---=== System.IO.Disk.hcb:96:19 ===---
;     ---=== System.IO.Disk.hcb:96:35 ===---
;     ---=== System.IO.Disk.hcb:96:57 ===---
;     ---=== System.IO.Disk.hcb:96:79 ===---
;     ---=== System.IO.Disk.hcb:97:13 ===---
;     ---=== System.IO.Disk.hcb:99:17 ===---
;     ---=== System.IO.Disk.hcb:98:38 ===---
;     ---=== System.IO.Disk.hcb:98:38 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-2], 1
ROTULO794:
;     ---=== System.IO.Disk.hcb:98:38 ===---
;     ---=== System.IO.Disk.hcb:98:38 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== System.IO.Disk.hcb:98:22 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.hcb:98:33 ===---
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
jbe ROTULO797
jmp ROTULO798
ROTULO797:
mov ax, 65535
jmp ROTULO799
ROTULO798:
xor ax, ax
ROTULO799:
cmp ax, 0
jne ROTULO795
jmp ROTULO796
ROTULO795:
;     ---=== System.IO.Disk.hcb:100:13 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.IO.Disk.hcb:100:17 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.hcb:100:34 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== System.IO.Disk.hcb:100:27 ===---
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
;     ---=== System.IO.Disk.hcb:101:13 ===---
;     ---=== System.IO.Disk.hcb:101:16 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.hcb:101:38 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
;     ---=== System.IO.Disk.hcb:101:30 ===---
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
jne ROTULO800
jmp ROTULO801
ROTULO800:
;     ---=== System.IO.Disk.hcb:102:17 ===---
; ACAO CHAMADA - Chama indiretamente usando Invoke
;     ---=== System.IO.Disk.hcb:102:54 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+16]
push ax
;     ---=== System.IO.Disk.hcb:102:42 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+14]
push ax
;     ---=== System.IO.Disk.hcb:102:36 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+10+2]
pop es
mov di, [bp+10]
push es
push di
;     ---=== System.IO.Disk.hcb:102:17 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-6+2]
pop es
mov di, [bp+-6]
push es
push di
es call far [di+47]
add sp, 12
;     ---=== System.IO.Disk.hcb:103:17 ===---
;     ---=== System.IO.Disk.hcb:103:22 ===---
xor ax, ax
jmp ROTULO793
ROTULO801:
;     ---=== System.IO.Disk.hcb:98:38 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-2]
jmp ROTULO794
ROTULO796:
;     ---=== System.IO.Disk.hcb:106:15 ===---
mov ax, _disk
mov [bp+-8], ax
mov ax, 106
mov [bp+-10], ax
mov ax, 5
cs jmp word [_os_trycode]
ROTULO793:
mov sp, bp
pop bp
FIM_disk_readblock:
retf
; MODULO FIM: disk
;     ---=== System.hcb:178:8 ===---
; MODULO: string
_string:
db 10
db 83,121,115,116,101,109,46,104,99,98
db 0
;     ---=== System.hcb:179:21 ===---
_string_length:
push bp
mov bp, sp
sub sp, 2
push cs
call _os_stackcheck
; ARG: text TAM: 4 POS: BP+6 
; ARG: i TAM: 2 POS: BP--2 
;     ---=== System.hcb:179:28 ===---
;     ---=== System.hcb:180:13 ===---
;     ---=== System.hcb:181:13 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-2], 0
;     ---=== System.hcb:183:14 ===---
; ACAO INC - Incrementa variavel
inc word [bp+6]
;     ---=== System.hcb:184:9 ===---
ROTULO803:
;     ---=== System.hcb:184:20 ===---
;     ---=== System.hcb:184:15 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== System.hcb:184:22 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
ja ROTULO806
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
;     ---=== System.hcb:185:17 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-2]
;     ---=== System.hcb:186:18 ===---
; ACAO INC - Incrementa variavel
inc word [bp+6]
jmp ROTULO803
ROTULO805:
;     ---=== System.hcb:188:9 ===---
;     ---=== System.hcb:188:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
jmp ROTULO802
ROTULO802:
mov sp, bp
pop bp
FIM_string_length:
retf
;     ---=== System.hcb:191:21 ===---
_string_equals:
push bp
mov bp, sp
; ARG: txt1 TAM: 4 POS: BP+6 
; ARG: txt2 TAM: 4 POS: BP+10 
;     ---=== System.hcb:191:28 ===---
;     ---=== System.hcb:191:50 ===---
;     ---=== System.hcb:192:9 ===---
ROTULO810:
;     ---=== System.hcb:192:20 ===---
;     ---=== System.hcb:192:15 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== System.hcb:192:23 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+10+2]
pop es
mov di, [bp+10]
xor ax, ax
es mov al, [di+0]
mov bx, ax
pop ax
cmp ax, bx
je ROTULO813
jmp ROTULO814
ROTULO813:
mov ax, 65535
jmp ROTULO815
ROTULO814:
xor ax, ax
ROTULO815:
cmp ax, 0
jne ROTULO811
jmp ROTULO812
ROTULO811:
;     ---=== System.hcb:193:13 ===---
;     ---=== System.hcb:193:21 ===---
;     ---=== System.hcb:193:16 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== System.hcb:193:24 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO818
jmp ROTULO819
ROTULO818:
mov ax, 65535
jmp ROTULO820
ROTULO819:
xor ax, ax
ROTULO820:
cmp ax, 0
jne ROTULO816
jmp ROTULO817
ROTULO816:
;     ---=== System.hcb:193:31 ===---
;     ---=== System.hcb:193:38 ===---
mov ax, 1
jmp ROTULO809
ROTULO817:
;     ---=== System.hcb:194:14 ===---
; ACAO INC - Incrementa variavel
inc word [bp+6]
;     ---=== System.hcb:195:14 ===---
; ACAO INC - Incrementa variavel
inc word [bp+10]
jmp ROTULO810
ROTULO812:
;     ---=== System.hcb:197:9 ===---
;     ---=== System.hcb:197:16 ===---
xor ax, ax
jmp ROTULO809
ROTULO809:
mov sp, bp
pop bp
FIM_string_equals:
retf
;     ---=== System.hcb:200:21 ===---
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
;     ---=== System.hcb:200:28 ===---
;     ---=== System.hcb:200:50 ===---
;     ---=== System.hcb:201:13 ===---
;     ---=== System.hcb:202:13 ===---
;     ---=== System.hcb:203:13 ===---
;     ---=== System.hcb:204:13 ===---
;     ---=== System.hcb:205:13 ===---
;     ---=== System.hcb:206:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.hcb:206:20 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.hcb:206:34 ===---
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
;     ---=== System.hcb:207:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.hcb:207:25 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
xor ax, ax
es mov al, [di+0]
mov [bp+-4], ax
;     ---=== System.hcb:208:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.hcb:208:35 ===---
;     ---=== System.hcb:208:37 ===---
mov ax, 1
push ax
;     ---=== System.hcb:208:15 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.hcb:208:29 ===---
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
;     ---=== System.hcb:209:9 ===---
;     ---=== System.hcb:209:34 ===---
;     ---=== System.hcb:209:29 ===---
;     ---=== System.hcb:209:31 ===---
mov ax, 1
push ax
;     ---=== System.hcb:209:17 ===---
;     ---=== System.hcb:209:20 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== System.hcb:209:13 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-6]
pop bx
add ax, bx
pop bx
add ax, bx
push ax
;     ---=== System.hcb:209:37 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
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
cmp ax, 0
jne ROTULO822
jmp ROTULO823
ROTULO822:
;     ---=== System.hcb:209:62 ===---
mov ax, _string
mov [bp+-8], ax
mov ax, 209
mov [bp+-10], ax
mov ax, 9
cs jmp word [_os_trycode]
ROTULO823:
;     ---=== System.hcb:210:10 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.hcb:210:27 ===---
;     ---=== System.hcb:210:29 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== System.hcb:210:23 ===---
;     ---=== System.hcb:210:25 ===---
mov ax, 1
push ax
;     ---=== System.hcb:210:18 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
pop bx
add ax, bx
pop bx
add ax, bx
mov [bp+6], ax
;     ---=== System.hcb:211:10 ===---
; ACAO INC - Incrementa variavel
inc word [bp+10]
;     ---=== System.hcb:212:22 ===---
;     ---=== System.hcb:212:22 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-8], 1
ROTULO827:
;     ---=== System.hcb:212:22 ===---
;     ---=== System.hcb:212:22 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-8]
push ax
;     ---=== System.hcb:212:22 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-6]
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO830
jmp ROTULO831
ROTULO830:
mov ax, 65535
jmp ROTULO832
ROTULO831:
xor ax, ax
ROTULO832:
cmp ax, 0
jne ROTULO828
jmp ROTULO829
ROTULO828:
;     ---=== System.hcb:213:13 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.hcb:213:19 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+10+2]
pop es
mov di, [bp+10]
xor ax, ax
es mov al, [di+0]
mov [bp+-10], ax
;     ---=== System.hcb:214:13 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.hcb:214:20 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-10]
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov [di+0], al
;     ---=== System.hcb:215:14 ===---
; ACAO INC - Incrementa variavel
inc word [bp+6]
;     ---=== System.hcb:216:14 ===---
; ACAO INC - Incrementa variavel
inc word [bp+10]
;     ---=== System.hcb:212:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-8]
jmp ROTULO827
ROTULO829:
;     ---=== System.hcb:218:9 ===---
; ACAO GRAVACAO - Gravacao de numero em ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov byte [di+0], 0
;     ---=== System.hcb:219:9 ===---
;     ---=== System.hcb:219:16 ===---
mov ax, 1
jmp ROTULO821
ROTULO821:
mov sp, bp
pop bp
FIM_string_concat:
retf
;     ---=== System.hcb:222:21 ===---
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
;     ---=== System.hcb:222:26 ===---
;     ---=== System.hcb:222:48 ===---
;     ---=== System.hcb:223:13 ===---
;     ---=== System.hcb:224:13 ===---
;     ---=== System.hcb:225:13 ===---
;     ---=== System.hcb:226:13 ===---
;     ---=== System.hcb:227:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.hcb:227:25 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
xor ax, ax
es mov al, [di+0]
mov [bp+-2], ax
;     ---=== System.hcb:228:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.hcb:228:40 ===---
;     ---=== System.hcb:228:42 ===---
mov ax, 1
push ax
;     ---=== System.hcb:228:20 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.hcb:228:34 ===---
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
;     ---=== System.hcb:229:10 ===---
; ACAO INC - Incrementa variavel
inc word [bp+6]
;     ---=== System.hcb:230:10 ===---
; ACAO INC - Incrementa variavel
inc word [bp+10]
;     ---=== System.hcb:231:9 ===---
; ACAO GRAVACAO - Gravacao de numero em ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov byte [di+0], 0
;     ---=== System.hcb:232:9 ===---
;     ---=== System.hcb:232:26 ===---
;     ---=== System.hcb:232:12 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== System.hcb:232:38 ===---
;     ---=== System.hcb:232:40 ===---
mov ax, 1
push ax
;     ---=== System.hcb:232:29 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
pop bx
add ax, bx
mov bx, ax
pop ax
cmp ax, bx
jb ROTULO836
jmp ROTULO837
ROTULO836:
mov ax, 65535
jmp ROTULO838
ROTULO837:
xor ax, ax
ROTULO838:
cmp ax, 0
jne ROTULO834
jmp ROTULO835
ROTULO834:
;     ---=== System.hcb:232:54 ===---
mov ax, _string
mov [bp+-8], ax
mov ax, 232
mov [bp+-10], ax
mov ax, 9
cs jmp word [_os_trycode]
ROTULO835:
;     ---=== System.hcb:233:22 ===---
;     ---=== System.hcb:233:22 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-6], 1
ROTULO839:
;     ---=== System.hcb:233:22 ===---
;     ---=== System.hcb:233:22 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-6]
push ax
;     ---=== System.hcb:233:22 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO842
jmp ROTULO843
ROTULO842:
mov ax, 65535
jmp ROTULO844
ROTULO843:
xor ax, ax
ROTULO844:
cmp ax, 0
jne ROTULO840
jmp ROTULO841
ROTULO840:
;     ---=== System.hcb:234:13 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.hcb:234:19 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+10+2]
pop es
mov di, [bp+10]
xor ax, ax
es mov al, [di+0]
mov [bp+-8], ax
;     ---=== System.hcb:235:13 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.hcb:235:20 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-8]
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov [di+0], al
;     ---=== System.hcb:236:14 ===---
; ACAO INC - Incrementa variavel
inc word [bp+10]
;     ---=== System.hcb:237:14 ===---
; ACAO INC - Incrementa variavel
inc word [bp+6]
;     ---=== System.hcb:233:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-6]
jmp ROTULO839
ROTULO841:
;     ---=== System.hcb:239:9 ===---
; ACAO GRAVACAO - Gravacao de numero em ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov byte [di+0], 0
;     ---=== System.hcb:240:9 ===---
;     ---=== System.hcb:240:16 ===---
mov ax, 1
jmp ROTULO833
ROTULO833:
mov sp, bp
pop bp
FIM_string_copy:
retf
; MODULO FIM: string
;     ---=== ConfigDefault.hcb:6:8 ===---
; MODULO: configdefault
_configdefault:
db 17
db 67,111,110,102,105,103,68,101,102,97,117,108,116,46,104,99,98
db 0
;     ---=== ConfigDefault.hcb:7:16 ===---
_configdefault_initialize:
;     ---=== ConfigDefault.hcb:8:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _floppydisk_initialize
ROTULO845:
FIM_configdefault_initialize:
retf
; MODULO FIM: configdefault
;     ---=== System.IO.Disk.Floppy.hcb:6:8 ===---
; MODULO: floppydisk
_floppydisk:
db 25
db 83,121,115,116,101,109,46,73,79,46,68,105,115,107,46,70,108,111,112,112,121,46,104,99,98
db 0
;     ---=== System.IO.Disk.Floppy.hcb:7:17 ===---
_floppydisk_floppya360:
times 4 db 0
;     ---=== System.IO.Disk.Floppy.hcb:8:17 ===---
_floppydisk_floppya720:
times 4 db 0
;     ---=== System.IO.Disk.Floppy.hcb:9:17 ===---
_floppydisk_floppya1200:
times 4 db 0
;     ---=== System.IO.Disk.Floppy.hcb:10:17 ===---
_floppydisk_floppya1440:
times 4 db 0
;     ---=== System.IO.Disk.Floppy.hcb:11:17 ===---
_floppydisk_floppyb360:
times 4 db 0
;     ---=== System.IO.Disk.Floppy.hcb:12:17 ===---
_floppydisk_floppyb720:
times 4 db 0
;     ---=== System.IO.Disk.Floppy.hcb:13:17 ===---
_floppydisk_floppyb1200:
times 4 db 0
;     ---=== System.IO.Disk.Floppy.hcb:14:17 ===---
_floppydisk_floppyb1440:
times 4 db 0
;     ---=== System.IO.Disk.Floppy.hcb:15:9 ===---
_floppydisk_buffer:
times 516 db 0
;     ---=== System.IO.Disk.Floppy.hcb:16:9 ===---
_floppydisk_motor0counter:
times 2 db 0
;     ---=== System.IO.Disk.Floppy.hcb:17:9 ===---
_floppydisk_motor0status:
times 2 db 0
;     ---=== System.IO.Disk.Floppy.hcb:18:9 ===---
_floppydisk_motor1counter:
times 2 db 0
;     ---=== System.IO.Disk.Floppy.hcb:19:9 ===---
_floppydisk_motor1status:
times 2 db 0
;     ---=== System.IO.Disk.Floppy.hcb:20:9 ===---
_floppydisk_dmastatus:
times 2 db 0
;     ---=== System.IO.Disk.Floppy.hcb:21:9 ===---
_floppydisk_driveselected:
times 2 db 0
;     ---=== System.IO.Disk.Floppy.hcb:22:9 ===---
_floppydisk_resetstatus:
times 2 db 0
;     ---=== System.IO.Disk.Floppy.hcb:24:9 ===---
_floppydisk_drive0busy:
times 2 db 0
;     ---=== System.IO.Disk.Floppy.hcb:25:9 ===---
_floppydisk_drive1busy:
times 2 db 0
;     ---=== System.IO.Disk.Floppy.hcb:26:9 ===---
_floppydisk_controllerbusy:
times 2 db 0
;     ---=== System.IO.Disk.Floppy.hcb:27:9 ===---
_floppydisk_controllerdma:
times 2 db 0
;     ---=== System.IO.Disk.Floppy.hcb:28:9 ===---
_floppydisk_controllerdio:
times 2 db 0
;     ---=== System.IO.Disk.Floppy.hcb:29:9 ===---
_floppydisk_controllerrqm:
times 2 db 0
;     ---=== System.IO.Disk.Floppy.hcb:31:9 ===---
_floppydisk_currentcylinder:
times 2 db 0
;     ---=== System.IO.Disk.Floppy.hcb:32:9 ===---
_floppydisk_statusregister0:
times 2 db 0
;     ---=== System.IO.Disk.Floppy.hcb:88:9 ===---
_floppydisk_irqstatus:
times 2 db 0
;     ---=== System.IO.Disk.Floppy.hcb:34:16 ===---
_floppydisk_initialize:
push bp
mov bp, sp
sub sp, 4
push cs
call _os_stackcheck
; ARG: t TAM: 4 POS: BP--4 
;     ---=== System.IO.Disk.Floppy.hcb:35:12 ===---
;     ---=== System.IO.Disk.Floppy.hcb:36:8 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.IO.Disk.Floppy.hcb:36:12 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _thread_requestnew
push es
pop word [bp+-4+2]
mov [bp+-4], di
;     ---=== System.IO.Disk.Floppy.hcb:38:8 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:38:27 ===---
push cs
pop es
mov di, _floppydisk_main
push es
push di
;     ---=== System.IO.Disk.Floppy.hcb:38:24 ===---
mov ax, 2
push ax
;     ---=== System.IO.Disk.Floppy.hcb:38:21 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-4+2]
pop es
mov di, [bp+-4]
push es
push di
push cs
call _thread_start
add sp, 10
ROTULO846:
mov sp, bp
pop bp
FIM_floppydisk_initialize:
retf
;     ---=== System.IO.Disk.Floppy.hcb:42:9 ===---
_floppydisk_main:
push bp
mov bp, sp
sub sp, 2
push cs
call _os_stackcheck
; ARG: i TAM: 2 POS: BP--2 
;     ---=== System.IO.Disk.Floppy.hcb:43:13 ===---
;     ---=== System.IO.Disk.Floppy.hcb:44:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.IO.Disk.Floppy.hcb:44:23 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:44:68 ===---
mov ax, 512
push ax
;     ---=== System.IO.Disk.Floppy.hcb:44:65 ===---
mov ax, 9
push ax
;     ---=== System.IO.Disk.Floppy.hcb:44:62 ===---
mov ax, 2
push ax
;     ---=== System.IO.Disk.Floppy.hcb:44:58 ===---
mov ax, 40
push ax
;     ---=== System.IO.Disk.Floppy.hcb:44:55 ===---
xor ax, ax
push ax
;     ---=== System.IO.Disk.Floppy.hcb:44:40 ===---
push cs
pop es
mov di, ROTULO849
jmp ROTULO848
ROTULO849:
db 11
db 70,108,111,112,112,121,48,95,51,54,48
times 1 db 0
ROTULO848:
push es
push di
push cs
call _disk_registernew
add sp, 14
push es
cs pop word [_floppydisk_floppya360+2]
cs mov [_floppydisk_floppya360], di
;     ---=== System.IO.Disk.Floppy.hcb:45:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.IO.Disk.Floppy.hcb:45:32 ===---
push cs
pop es
mov di, _floppydisk_readblock
push es
push di
cs push word [_floppydisk_floppya360+2]
pop es
cs mov di, [_floppydisk_floppya360]
es pop word [di+47]
es pop word [di+47+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.IO.Disk.Floppy.hcb:46:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.IO.Disk.Floppy.hcb:46:33 ===---
push cs
pop es
mov di, _floppydisk_writeblock
push es
push di
cs push word [_floppydisk_floppya360+2]
pop es
cs mov di, [_floppydisk_floppya360]
es pop word [di+51]
es pop word [di+51+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.IO.Disk.Floppy.hcb:47:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.IO.Disk.Floppy.hcb:47:23 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:47:69 ===---
mov ax, 512
push ax
;     ---=== System.IO.Disk.Floppy.hcb:47:65 ===---
mov ax, 18
push ax
;     ---=== System.IO.Disk.Floppy.hcb:47:62 ===---
mov ax, 2
push ax
;     ---=== System.IO.Disk.Floppy.hcb:47:58 ===---
mov ax, 40
push ax
;     ---=== System.IO.Disk.Floppy.hcb:47:55 ===---
xor ax, ax
push ax
;     ---=== System.IO.Disk.Floppy.hcb:47:40 ===---
push cs
pop es
mov di, ROTULO851
jmp ROTULO850
ROTULO851:
db 11
db 70,108,111,112,112,121,48,95,55,50,48
times 1 db 0
ROTULO850:
push es
push di
push cs
call _disk_registernew
add sp, 14
push es
cs pop word [_floppydisk_floppya720+2]
cs mov [_floppydisk_floppya720], di
;     ---=== System.IO.Disk.Floppy.hcb:48:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.IO.Disk.Floppy.hcb:48:32 ===---
push cs
pop es
mov di, _floppydisk_readblock
push es
push di
cs push word [_floppydisk_floppya720+2]
pop es
cs mov di, [_floppydisk_floppya720]
es pop word [di+47]
es pop word [di+47+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.IO.Disk.Floppy.hcb:49:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.IO.Disk.Floppy.hcb:49:33 ===---
push cs
pop es
mov di, _floppydisk_writeblock
push es
push di
cs push word [_floppydisk_floppya720+2]
pop es
cs mov di, [_floppydisk_floppya720]
es pop word [di+51]
es pop word [di+51+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.IO.Disk.Floppy.hcb:50:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.IO.Disk.Floppy.hcb:50:23 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:50:70 ===---
mov ax, 512
push ax
;     ---=== System.IO.Disk.Floppy.hcb:50:66 ===---
mov ax, 15
push ax
;     ---=== System.IO.Disk.Floppy.hcb:50:63 ===---
mov ax, 2
push ax
;     ---=== System.IO.Disk.Floppy.hcb:50:59 ===---
mov ax, 80
push ax
;     ---=== System.IO.Disk.Floppy.hcb:50:56 ===---
xor ax, ax
push ax
;     ---=== System.IO.Disk.Floppy.hcb:50:40 ===---
push cs
pop es
mov di, ROTULO853
jmp ROTULO852
ROTULO853:
db 12
db 70,108,111,112,112,121,48,95,49,50,48,48
times 1 db 0
ROTULO852:
push es
push di
push cs
call _disk_registernew
add sp, 14
push es
cs pop word [_floppydisk_floppya1200+2]
cs mov [_floppydisk_floppya1200], di
;     ---=== System.IO.Disk.Floppy.hcb:51:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.IO.Disk.Floppy.hcb:51:33 ===---
push cs
pop es
mov di, _floppydisk_readblock
push es
push di
cs push word [_floppydisk_floppya1200+2]
pop es
cs mov di, [_floppydisk_floppya1200]
es pop word [di+47]
es pop word [di+47+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.IO.Disk.Floppy.hcb:52:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.IO.Disk.Floppy.hcb:52:34 ===---
push cs
pop es
mov di, _floppydisk_writeblock
push es
push di
cs push word [_floppydisk_floppya1200+2]
pop es
cs mov di, [_floppydisk_floppya1200]
es pop word [di+51]
es pop word [di+51+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.IO.Disk.Floppy.hcb:53:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.IO.Disk.Floppy.hcb:53:23 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:53:70 ===---
mov ax, 512
push ax
;     ---=== System.IO.Disk.Floppy.hcb:53:66 ===---
mov ax, 18
push ax
;     ---=== System.IO.Disk.Floppy.hcb:53:63 ===---
mov ax, 2
push ax
;     ---=== System.IO.Disk.Floppy.hcb:53:59 ===---
mov ax, 80
push ax
;     ---=== System.IO.Disk.Floppy.hcb:53:56 ===---
xor ax, ax
push ax
;     ---=== System.IO.Disk.Floppy.hcb:53:40 ===---
push cs
pop es
mov di, ROTULO855
jmp ROTULO854
ROTULO855:
db 12
db 70,108,111,112,112,121,48,95,49,52,52,48
times 1 db 0
ROTULO854:
push es
push di
push cs
call _disk_registernew
add sp, 14
push es
cs pop word [_floppydisk_floppya1440+2]
cs mov [_floppydisk_floppya1440], di
;     ---=== System.IO.Disk.Floppy.hcb:54:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.IO.Disk.Floppy.hcb:54:33 ===---
push cs
pop es
mov di, _floppydisk_readblock
push es
push di
cs push word [_floppydisk_floppya1440+2]
pop es
cs mov di, [_floppydisk_floppya1440]
es pop word [di+47]
es pop word [di+47+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.IO.Disk.Floppy.hcb:55:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.IO.Disk.Floppy.hcb:55:34 ===---
push cs
pop es
mov di, _floppydisk_writeblock
push es
push di
cs push word [_floppydisk_floppya1440+2]
pop es
cs mov di, [_floppydisk_floppya1440]
es pop word [di+51]
es pop word [di+51+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.IO.Disk.Floppy.hcb:56:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.IO.Disk.Floppy.hcb:56:23 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:56:68 ===---
mov ax, 512
push ax
;     ---=== System.IO.Disk.Floppy.hcb:56:65 ===---
mov ax, 9
push ax
;     ---=== System.IO.Disk.Floppy.hcb:56:62 ===---
mov ax, 2
push ax
;     ---=== System.IO.Disk.Floppy.hcb:56:58 ===---
mov ax, 40
push ax
;     ---=== System.IO.Disk.Floppy.hcb:56:55 ===---
mov ax, 1
push ax
;     ---=== System.IO.Disk.Floppy.hcb:56:40 ===---
push cs
pop es
mov di, ROTULO857
jmp ROTULO856
ROTULO857:
db 11
db 70,108,111,112,112,121,49,95,51,54,48
times 1 db 0
ROTULO856:
push es
push di
push cs
call _disk_registernew
add sp, 14
push es
cs pop word [_floppydisk_floppyb360+2]
cs mov [_floppydisk_floppyb360], di
;     ---=== System.IO.Disk.Floppy.hcb:57:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.IO.Disk.Floppy.hcb:57:32 ===---
push cs
pop es
mov di, _floppydisk_readblock
push es
push di
cs push word [_floppydisk_floppyb360+2]
pop es
cs mov di, [_floppydisk_floppyb360]
es pop word [di+47]
es pop word [di+47+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.IO.Disk.Floppy.hcb:58:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.IO.Disk.Floppy.hcb:58:33 ===---
push cs
pop es
mov di, _floppydisk_writeblock
push es
push di
cs push word [_floppydisk_floppyb360+2]
pop es
cs mov di, [_floppydisk_floppyb360]
es pop word [di+51]
es pop word [di+51+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.IO.Disk.Floppy.hcb:59:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.IO.Disk.Floppy.hcb:59:23 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:59:69 ===---
mov ax, 512
push ax
;     ---=== System.IO.Disk.Floppy.hcb:59:65 ===---
mov ax, 18
push ax
;     ---=== System.IO.Disk.Floppy.hcb:59:62 ===---
mov ax, 2
push ax
;     ---=== System.IO.Disk.Floppy.hcb:59:58 ===---
mov ax, 40
push ax
;     ---=== System.IO.Disk.Floppy.hcb:59:55 ===---
mov ax, 1
push ax
;     ---=== System.IO.Disk.Floppy.hcb:59:40 ===---
push cs
pop es
mov di, ROTULO859
jmp ROTULO858
ROTULO859:
db 11
db 70,108,111,112,112,121,49,95,55,50,48
times 1 db 0
ROTULO858:
push es
push di
push cs
call _disk_registernew
add sp, 14
push es
cs pop word [_floppydisk_floppyb720+2]
cs mov [_floppydisk_floppyb720], di
;     ---=== System.IO.Disk.Floppy.hcb:60:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.IO.Disk.Floppy.hcb:60:32 ===---
push cs
pop es
mov di, _floppydisk_readblock
push es
push di
cs push word [_floppydisk_floppyb720+2]
pop es
cs mov di, [_floppydisk_floppyb720]
es pop word [di+47]
es pop word [di+47+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.IO.Disk.Floppy.hcb:61:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.IO.Disk.Floppy.hcb:61:33 ===---
push cs
pop es
mov di, _floppydisk_writeblock
push es
push di
cs push word [_floppydisk_floppyb720+2]
pop es
cs mov di, [_floppydisk_floppyb720]
es pop word [di+51]
es pop word [di+51+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.IO.Disk.Floppy.hcb:62:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.IO.Disk.Floppy.hcb:62:23 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:62:70 ===---
mov ax, 512
push ax
;     ---=== System.IO.Disk.Floppy.hcb:62:66 ===---
mov ax, 15
push ax
;     ---=== System.IO.Disk.Floppy.hcb:62:63 ===---
mov ax, 2
push ax
;     ---=== System.IO.Disk.Floppy.hcb:62:59 ===---
mov ax, 80
push ax
;     ---=== System.IO.Disk.Floppy.hcb:62:56 ===---
mov ax, 1
push ax
;     ---=== System.IO.Disk.Floppy.hcb:62:40 ===---
push cs
pop es
mov di, ROTULO861
jmp ROTULO860
ROTULO861:
db 12
db 70,108,111,112,112,121,49,95,49,50,48,48
times 1 db 0
ROTULO860:
push es
push di
push cs
call _disk_registernew
add sp, 14
push es
cs pop word [_floppydisk_floppyb1200+2]
cs mov [_floppydisk_floppyb1200], di
;     ---=== System.IO.Disk.Floppy.hcb:63:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.IO.Disk.Floppy.hcb:63:33 ===---
push cs
pop es
mov di, _floppydisk_readblock
push es
push di
cs push word [_floppydisk_floppyb1200+2]
pop es
cs mov di, [_floppydisk_floppyb1200]
es pop word [di+47]
es pop word [di+47+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.IO.Disk.Floppy.hcb:64:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.IO.Disk.Floppy.hcb:64:34 ===---
push cs
pop es
mov di, _floppydisk_writeblock
push es
push di
cs push word [_floppydisk_floppyb1200+2]
pop es
cs mov di, [_floppydisk_floppyb1200]
es pop word [di+51]
es pop word [di+51+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.IO.Disk.Floppy.hcb:65:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.IO.Disk.Floppy.hcb:65:23 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:65:70 ===---
mov ax, 512
push ax
;     ---=== System.IO.Disk.Floppy.hcb:65:66 ===---
mov ax, 18
push ax
;     ---=== System.IO.Disk.Floppy.hcb:65:63 ===---
mov ax, 2
push ax
;     ---=== System.IO.Disk.Floppy.hcb:65:59 ===---
mov ax, 80
push ax
;     ---=== System.IO.Disk.Floppy.hcb:65:56 ===---
mov ax, 1
push ax
;     ---=== System.IO.Disk.Floppy.hcb:65:40 ===---
push cs
pop es
mov di, ROTULO863
jmp ROTULO862
ROTULO863:
db 12
db 70,108,111,112,112,121,49,95,49,52,52,48
times 1 db 0
ROTULO862:
push es
push di
push cs
call _disk_registernew
add sp, 14
push es
cs pop word [_floppydisk_floppyb1440+2]
cs mov [_floppydisk_floppyb1440], di
;     ---=== System.IO.Disk.Floppy.hcb:66:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.IO.Disk.Floppy.hcb:66:33 ===---
push cs
pop es
mov di, _floppydisk_readblock
push es
push di
cs push word [_floppydisk_floppyb1440+2]
pop es
cs mov di, [_floppydisk_floppyb1440]
es pop word [di+47]
es pop word [di+47+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.IO.Disk.Floppy.hcb:67:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.IO.Disk.Floppy.hcb:67:34 ===---
push cs
pop es
mov di, _floppydisk_writeblock
push es
push di
cs push word [_floppydisk_floppyb1440+2]
pop es
cs mov di, [_floppydisk_floppyb1440]
es pop word [di+51]
es pop word [di+51+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.IO.Disk.Floppy.hcb:68:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:68:32 ===---
push cs
pop es
mov di, _floppydisk_floppyint
push es
push di
;     ---=== System.IO.Disk.Floppy.hcb:68:28 ===---
mov ax, 14
push ax
push cs
call _io_registerhandler
add sp, 6
;     ---=== System.IO.Disk.Floppy.hcb:69:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _floppydisk_initdma
;     ---=== System.IO.Disk.Floppy.hcb:70:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _floppydisk_reset
;     ---=== System.IO.Disk.Floppy.hcb:71:9 ===---
ROTULO864:
;     ---=== System.IO.Disk.Floppy.hcb:71:15 ===---
mov ax, 1
cmp ax, 0
jne ROTULO865
jmp ROTULO866
ROTULO865:
;     ---=== System.IO.Disk.Floppy.hcb:72:13 ===---
;     ---=== System.IO.Disk.Floppy.hcb:72:30 ===---
;     ---=== System.IO.Disk.Floppy.hcb:72:16 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_floppydisk_motor0counter]
push ax
;     ---=== System.IO.Disk.Floppy.hcb:72:32 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
ja ROTULO869
jmp ROTULO870
ROTULO869:
mov ax, 65535
jmp ROTULO871
ROTULO870:
xor ax, ax
ROTULO871:
cmp ax, 0
jne ROTULO867
jmp ROTULO868
ROTULO867:
;     ---=== System.IO.Disk.Floppy.hcb:73:17 ===---
; ACAO DEC - Decrementa variavel
cs dec word [_floppydisk_motor0counter]
;     ---=== System.IO.Disk.Floppy.hcb:74:17 ===---
;     ---=== System.IO.Disk.Floppy.hcb:74:34 ===---
;     ---=== System.IO.Disk.Floppy.hcb:74:20 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_floppydisk_motor0counter]
push ax
;     ---=== System.IO.Disk.Floppy.hcb:74:37 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO874
jmp ROTULO875
ROTULO874:
mov ax, 65535
jmp ROTULO876
ROTULO875:
xor ax, ax
ROTULO876:
cmp ax, 0
jne ROTULO872
jmp ROTULO873
ROTULO872:
;     ---=== System.IO.Disk.Floppy.hcb:75:21 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:75:31 ===---
xor ax, ax
push ax
push cs
call _floppydisk_stopmotor
add sp, 2
ROTULO873:
ROTULO868:
;     ---=== System.IO.Disk.Floppy.hcb:78:13 ===---
;     ---=== System.IO.Disk.Floppy.hcb:78:30 ===---
;     ---=== System.IO.Disk.Floppy.hcb:78:16 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_floppydisk_motor1counter]
push ax
;     ---=== System.IO.Disk.Floppy.hcb:78:32 ===---
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
;     ---=== System.IO.Disk.Floppy.hcb:79:17 ===---
; ACAO DEC - Decrementa variavel
cs dec word [_floppydisk_motor1counter]
;     ---=== System.IO.Disk.Floppy.hcb:80:17 ===---
;     ---=== System.IO.Disk.Floppy.hcb:80:34 ===---
;     ---=== System.IO.Disk.Floppy.hcb:80:20 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_floppydisk_motor1counter]
push ax
;     ---=== System.IO.Disk.Floppy.hcb:80:37 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO884
jmp ROTULO885
ROTULO884:
mov ax, 65535
jmp ROTULO886
ROTULO885:
xor ax, ax
ROTULO886:
cmp ax, 0
jne ROTULO882
jmp ROTULO883
ROTULO882:
;     ---=== System.IO.Disk.Floppy.hcb:81:21 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:81:31 ===---
mov ax, 1
push ax
push cs
call _floppydisk_stopmotor
add sp, 2
ROTULO883:
ROTULO878:
;     ---=== System.IO.Disk.Floppy.hcb:84:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:84:26 ===---
mov ax, 1000
push ax
push cs
call _thread_sleep
add sp, 2
jmp ROTULO864
ROTULO866:
ROTULO847:
mov sp, bp
pop bp
FIM_floppydisk_main:
retf
;     ---=== System.IO.Disk.Floppy.hcb:90:9 ===---
_floppydisk_floppyint:
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
;     ---=== System.IO.Disk.Floppy.hcb:91:13 ===---
cli
;     ---=== System.IO.Disk.Floppy.hcb:92:9 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_floppydisk_irqstatus], 1
;     ---=== System.IO.Disk.Floppy.hcb:93:13 ===---
mov al, 0x20
;     ---=== System.IO.Disk.Floppy.hcb:94:13 ===---
out 0x20, al
;     ---=== System.IO.Disk.Floppy.hcb:95:13 ===---
sti
ROTULO887:
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
FIM_floppydisk_floppyint:
iret
;     ---=== System.IO.Disk.Floppy.hcb:100:9 ===---
_floppydisk_calibrate:
push bp
mov bp, sp
sub sp, 2
push cs
call _os_stackcheck
; ARG: d TAM: 2 POS: BP+6 
; ARG: i TAM: 2 POS: BP--2 
;     ---=== System.IO.Disk.Floppy.hcb:100:19 ===---
;     ---=== System.IO.Disk.Floppy.hcb:101:13 ===---
;     ---=== System.IO.Disk.Floppy.hcb:102:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:102:20 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
push ax
push cs
call _floppydisk_startmotor
add sp, 2
;     ---=== System.IO.Disk.Floppy.hcb:103:22 ===---
;     ---=== System.IO.Disk.Floppy.hcb:103:22 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-2], 1
ROTULO889:
;     ---=== System.IO.Disk.Floppy.hcb:103:22 ===---
;     ---=== System.IO.Disk.Floppy.hcb:103:22 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== System.IO.Disk.Floppy.hcb:103:22 ===---
mov ax, 10
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO892
jmp ROTULO893
ROTULO892:
mov ax, 65535
jmp ROTULO894
ROTULO893:
xor ax, ax
ROTULO894:
cmp ax, 0
jne ROTULO890
jmp ROTULO891
ROTULO890:
;     ---=== System.IO.Disk.Floppy.hcb:104:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:104:22 ===---
mov ax, 7
push ax
push cs
call _floppydisk_writecmd
add sp, 2
;     ---=== System.IO.Disk.Floppy.hcb:105:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:105:22 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
push ax
push cs
call _floppydisk_writecmd
add sp, 2
;     ---=== System.IO.Disk.Floppy.hcb:106:13 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _floppydisk_waitirq
;     ---=== System.IO.Disk.Floppy.hcb:107:13 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _floppydisk_checkinterrupt
;     ---=== System.IO.Disk.Floppy.hcb:108:13 ===---
;     ---=== System.IO.Disk.Floppy.hcb:108:32 ===---
;     ---=== System.IO.Disk.Floppy.hcb:108:16 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_floppydisk_currentcylinder]
push ax
;     ---=== System.IO.Disk.Floppy.hcb:108:35 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO897
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
;     ---=== System.IO.Disk.Floppy.hcb:109:17 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:109:27 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
push ax
push cs
call _floppydisk_stopmotor
add sp, 2
;     ---=== System.IO.Disk.Floppy.hcb:110:17 ===---
;     ---=== System.IO.Disk.Floppy.hcb:110:23 ===---
xor ax, ax
jmp ROTULO888
ROTULO896:
;     ---=== System.IO.Disk.Floppy.hcb:103:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-2]
jmp ROTULO889
ROTULO891:
;     ---=== System.IO.Disk.Floppy.hcb:113:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:113:19 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
push ax
push cs
call _floppydisk_stopmotor
add sp, 2
;     ---=== System.IO.Disk.Floppy.hcb:114:15 ===---
mov ax, _floppydisk
mov [bp+-8], ax
mov ax, 114
mov [bp+-10], ax
mov ax, 10
cs jmp word [_os_trycode]
ROTULO888:
mov sp, bp
pop bp
FIM_floppydisk_calibrate:
retf
;     ---=== System.IO.Disk.Floppy.hcb:117:9 ===---
_floppydisk_initdma:
;     ---=== System.IO.Disk.Floppy.hcb:118:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:118:28 ===---
mov ax, 6
push ax
;     ---=== System.IO.Disk.Floppy.hcb:118:23 ===---
mov ax, 10
push ax
push cs
call _io_outputbyte
add sp, 4
;     ---=== System.IO.Disk.Floppy.hcb:119:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:119:29 ===---
mov ax, 6
push ax
;     ---=== System.IO.Disk.Floppy.hcb:119:23 ===---
mov ax, 216
push ax
push cs
call _io_outputbyte
add sp, 4
;     ---=== System.IO.Disk.Floppy.hcb:120:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:120:36 ===---
;     ---=== System.IO.Disk.Floppy.hcb:120:29 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO LEITURA - Le variavel
cs mov ax, [_floppydisk_buffer]
push ax
;     ---=== System.IO.Disk.Floppy.hcb:120:40 ===---
mov ax, 15
mov bx, ax
pop ax
and ax, bx
push ax
;     ---=== System.IO.Disk.Floppy.hcb:120:23 ===---
mov ax, 4
push ax
push cs
call _io_outputbyte
add sp, 4
;     ---=== System.IO.Disk.Floppy.hcb:121:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:121:54 ===---
;     ---=== System.IO.Disk.Floppy.hcb:121:47 ===---
;     ---=== System.IO.Disk.Floppy.hcb:121:38 ===---
;     ---=== System.IO.Disk.Floppy.hcb:121:31 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO LEITURA - Le segmento em variavel
cs mov ax, [_floppydisk_buffer+2]
push ax
;     ---=== System.IO.Disk.Floppy.hcb:121:42 ===---
mov ax, 15
mov bx, ax
pop ax
and ax, bx
push ax
;     ---=== System.IO.Disk.Floppy.hcb:121:51 ===---
mov ax, 4
mov cx, ax
pop ax
shl ax, cl
push ax
;     ---=== System.IO.Disk.Floppy.hcb:121:74 ===---
;     ---=== System.IO.Disk.Floppy.hcb:121:67 ===---
;     ---=== System.IO.Disk.Floppy.hcb:121:60 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO LEITURA - Le variavel
cs mov ax, [_floppydisk_buffer]
push ax
;     ---=== System.IO.Disk.Floppy.hcb:121:71 ===---
mov ax, 4
mov cx, ax
pop ax
shr ax, cl
push ax
;     ---=== System.IO.Disk.Floppy.hcb:121:78 ===---
mov ax, 15
mov bx, ax
pop ax
and ax, bx
mov bx, ax
pop ax
or ax, bx
push ax
;     ---=== System.IO.Disk.Floppy.hcb:121:23 ===---
mov ax, 4
push ax
push cs
call _io_outputbyte
add sp, 4
;     ---=== System.IO.Disk.Floppy.hcb:122:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:122:28 ===---
mov ax, 255
push ax
;     ---=== System.IO.Disk.Floppy.hcb:122:23 ===---
mov ax, 8
push ax
push cs
call _io_outputbyte
add sp, 4
;     ---=== System.IO.Disk.Floppy.hcb:123:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:123:28 ===---
mov ax, 255
push ax
;     ---=== System.IO.Disk.Floppy.hcb:123:23 ===---
mov ax, 5
push ax
push cs
call _io_outputbyte
add sp, 4
;     ---=== System.IO.Disk.Floppy.hcb:124:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:124:28 ===---
mov ax, 1
push ax
;     ---=== System.IO.Disk.Floppy.hcb:124:23 ===---
mov ax, 5
push ax
push cs
call _io_outputbyte
add sp, 4
;     ---=== System.IO.Disk.Floppy.hcb:125:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:125:37 ===---
;     ---=== System.IO.Disk.Floppy.hcb:125:30 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO LEITURA - Le segmento em variavel
cs mov ax, [_floppydisk_buffer+2]
push ax
;     ---=== System.IO.Disk.Floppy.hcb:125:41 ===---
mov ax, 4
mov cx, ax
pop ax
shr ax, cl
push ax
;     ---=== System.IO.Disk.Floppy.hcb:125:23 ===---
mov ax, 128
push ax
push cs
call _io_outputbyte
add sp, 4
;     ---=== System.IO.Disk.Floppy.hcb:126:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:126:28 ===---
mov ax, 2
push ax
;     ---=== System.IO.Disk.Floppy.hcb:126:23 ===---
mov ax, 10
push ax
push cs
call _io_outputbyte
add sp, 4
ROTULO900:
FIM_floppydisk_initdma:
retf
;     ---=== System.IO.Disk.Floppy.hcb:129:9 ===---
_floppydisk_writedor:
;     ---=== System.IO.Disk.Floppy.hcb:130:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:130:142 ===---
;     ---=== System.IO.Disk.Floppy.hcb:130:159 ===---
;     ---=== System.IO.Disk.Floppy.hcb:130:145 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_floppydisk_driveselected]
push ax
;     ---=== System.IO.Disk.Floppy.hcb:130:163 ===---
mov ax, 3
mov bx, ax
pop ax
and ax, bx
push ax
;     ---=== System.IO.Disk.Floppy.hcb:130:116 ===---
;     ---=== System.IO.Disk.Floppy.hcb:130:137 ===---
;     ---=== System.IO.Disk.Floppy.hcb:130:139 ===---
mov ax, 8
push ax
;     ---=== System.IO.Disk.Floppy.hcb:130:130 ===---
;     ---=== System.IO.Disk.Floppy.hcb:130:120 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_floppydisk_dmastatus]
push ax
;     ---=== System.IO.Disk.Floppy.hcb:130:134 ===---
mov ax, 1
mov bx, ax
pop ax
and ax, bx
pop bx
mul bx
push ax
;     ---=== System.IO.Disk.Floppy.hcb:130:88 ===---
;     ---=== System.IO.Disk.Floppy.hcb:130:111 ===---
;     ---=== System.IO.Disk.Floppy.hcb:130:113 ===---
mov ax, 4
push ax
;     ---=== System.IO.Disk.Floppy.hcb:130:104 ===---
;     ---=== System.IO.Disk.Floppy.hcb:130:92 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_floppydisk_resetstatus]
push ax
;     ---=== System.IO.Disk.Floppy.hcb:130:108 ===---
mov ax, 1
mov bx, ax
pop ax
and ax, bx
pop bx
mul bx
push ax
;     ---=== System.IO.Disk.Floppy.hcb:130:58 ===---
;     ---=== System.IO.Disk.Floppy.hcb:130:82 ===---
;     ---=== System.IO.Disk.Floppy.hcb:130:84 ===---
mov ax, 32
push ax
;     ---=== System.IO.Disk.Floppy.hcb:130:75 ===---
;     ---=== System.IO.Disk.Floppy.hcb:130:62 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_floppydisk_motor1status]
push ax
;     ---=== System.IO.Disk.Floppy.hcb:130:79 ===---
mov ax, 1
mov bx, ax
pop ax
and ax, bx
pop bx
mul bx
push ax
;     ---=== System.IO.Disk.Floppy.hcb:130:52 ===---
;     ---=== System.IO.Disk.Floppy.hcb:130:54 ===---
mov ax, 16
push ax
;     ---=== System.IO.Disk.Floppy.hcb:130:45 ===---
;     ---=== System.IO.Disk.Floppy.hcb:130:32 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_floppydisk_motor0status]
push ax
;     ---=== System.IO.Disk.Floppy.hcb:130:49 ===---
mov ax, 1
mov bx, ax
pop ax
and ax, bx
pop bx
mul bx
pop bx
add ax, bx
pop bx
add ax, bx
pop bx
add ax, bx
pop bx
add ax, bx
push ax
;     ---=== System.IO.Disk.Floppy.hcb:130:23 ===---
mov ax, 1010
push ax
push cs
call _io_outputbyte
add sp, 4
ROTULO913:
FIM_floppydisk_writedor:
retf
;     ---=== System.IO.Disk.Floppy.hcb:133:9 ===---
_floppydisk_readmsr:
push bp
mov bp, sp
sub sp, 2
push cs
call _os_stackcheck
; ARG: tmp TAM: 2 POS: BP--2 
;     ---=== System.IO.Disk.Floppy.hcb:134:13 ===---
;     ---=== System.IO.Disk.Floppy.hcb:135:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.IO.Disk.Floppy.hcb:135:15 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:135:28 ===---
mov ax, 1012
push ax
push cs
call _io_inputbyte
add sp, 2
mov [bp+-2], ax
;     ---=== System.IO.Disk.Floppy.hcb:136:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.IO.Disk.Floppy.hcb:136:26 ===---
;     ---=== System.IO.Disk.Floppy.hcb:136:22 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== System.IO.Disk.Floppy.hcb:136:30 ===---
mov ax, 1
mov bx, ax
pop ax
and ax, bx
cs mov [_floppydisk_drive0busy], ax
;     ---=== System.IO.Disk.Floppy.hcb:137:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.IO.Disk.Floppy.hcb:137:26 ===---
;     ---=== System.IO.Disk.Floppy.hcb:137:22 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== System.IO.Disk.Floppy.hcb:137:30 ===---
mov ax, 2
mov bx, ax
pop ax
and ax, bx
cs mov [_floppydisk_drive1busy], ax
;     ---=== System.IO.Disk.Floppy.hcb:138:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.IO.Disk.Floppy.hcb:138:30 ===---
;     ---=== System.IO.Disk.Floppy.hcb:138:26 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== System.IO.Disk.Floppy.hcb:138:34 ===---
mov ax, 16
mov bx, ax
pop ax
and ax, bx
cs mov [_floppydisk_controllerbusy], ax
;     ---=== System.IO.Disk.Floppy.hcb:139:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.IO.Disk.Floppy.hcb:139:29 ===---
;     ---=== System.IO.Disk.Floppy.hcb:139:25 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== System.IO.Disk.Floppy.hcb:139:33 ===---
mov ax, 32
mov bx, ax
pop ax
and ax, bx
cs mov [_floppydisk_controllerdma], ax
;     ---=== System.IO.Disk.Floppy.hcb:140:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.IO.Disk.Floppy.hcb:140:29 ===---
;     ---=== System.IO.Disk.Floppy.hcb:140:25 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== System.IO.Disk.Floppy.hcb:140:33 ===---
mov ax, 64
mov bx, ax
pop ax
and ax, bx
cs mov [_floppydisk_controllerdio], ax
;     ---=== System.IO.Disk.Floppy.hcb:141:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.IO.Disk.Floppy.hcb:141:29 ===---
;     ---=== System.IO.Disk.Floppy.hcb:141:25 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== System.IO.Disk.Floppy.hcb:141:33 ===---
mov ax, 128
mov bx, ax
pop ax
and ax, bx
cs mov [_floppydisk_controllerrqm], ax
ROTULO929:
mov sp, bp
pop bp
FIM_floppydisk_readmsr:
retf
;     ---=== System.IO.Disk.Floppy.hcb:144:9 ===---
_floppydisk_writectrl:
push bp
mov bp, sp
; ARG: value TAM: 2 POS: BP+6 
;     ---=== System.IO.Disk.Floppy.hcb:144:19 ===---
;     ---=== System.IO.Disk.Floppy.hcb:145:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:145:30 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
push ax
;     ---=== System.IO.Disk.Floppy.hcb:145:23 ===---
mov ax, 1015
push ax
push cs
call _io_outputbyte
add sp, 4
ROTULO948:
mov sp, bp
pop bp
FIM_floppydisk_writectrl:
retf
;     ---=== System.IO.Disk.Floppy.hcb:148:9 ===---
_floppydisk_writefifo:
push bp
mov bp, sp
; ARG: value TAM: 2 POS: BP+6 
;     ---=== System.IO.Disk.Floppy.hcb:148:19 ===---
;     ---=== System.IO.Disk.Floppy.hcb:149:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:149:30 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
push ax
;     ---=== System.IO.Disk.Floppy.hcb:149:23 ===---
mov ax, 1013
push ax
push cs
call _io_outputbyte
add sp, 4
ROTULO949:
mov sp, bp
pop bp
FIM_floppydisk_writefifo:
retf
;     ---=== System.IO.Disk.Floppy.hcb:152:14 ===---
_floppydisk_readfifo:
;     ---=== System.IO.Disk.Floppy.hcb:153:9 ===---
;     ---=== System.IO.Disk.Floppy.hcb:153:16 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:153:29 ===---
mov ax, 1013
push ax
push cs
call _io_inputbyte
add sp, 2
jmp ROTULO950
ROTULO950:
FIM_floppydisk_readfifo:
retf
;     ---=== System.IO.Disk.Floppy.hcb:156:9 ===---
_floppydisk_writecmd:
push bp
mov bp, sp
sub sp, 2
push cs
call _os_stackcheck
; ARG: cmd TAM: 2 POS: BP+6 
; ARG: i TAM: 2 POS: BP--2 
;     ---=== System.IO.Disk.Floppy.hcb:156:18 ===---
;     ---=== System.IO.Disk.Floppy.hcb:157:13 ===---
;     ---=== System.IO.Disk.Floppy.hcb:158:22 ===---
;     ---=== System.IO.Disk.Floppy.hcb:158:22 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-2], 1
ROTULO952:
;     ---=== System.IO.Disk.Floppy.hcb:158:22 ===---
;     ---=== System.IO.Disk.Floppy.hcb:158:22 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== System.IO.Disk.Floppy.hcb:158:22 ===---
mov ax, 500
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO955
jmp ROTULO956
ROTULO955:
mov ax, 65535
jmp ROTULO957
ROTULO956:
xor ax, ax
ROTULO957:
cmp ax, 0
jne ROTULO953
jmp ROTULO954
ROTULO953:
;     ---=== System.IO.Disk.Floppy.hcb:159:13 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _floppydisk_readmsr
;     ---=== System.IO.Disk.Floppy.hcb:160:13 ===---
;     ---=== System.IO.Disk.Floppy.hcb:160:16 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_floppydisk_controllerrqm]
cmp ax, 0
jne ROTULO958
jmp ROTULO959
ROTULO958:
;     ---=== System.IO.Disk.Floppy.hcb:161:17 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:161:27 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
push ax
push cs
call _floppydisk_writefifo
add sp, 2
;     ---=== System.IO.Disk.Floppy.hcb:162:17 ===---
;     ---=== System.IO.Disk.Floppy.hcb:162:22 ===---
xor ax, ax
jmp ROTULO951
ROTULO959:
;     ---=== System.IO.Disk.Floppy.hcb:158:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-2]
jmp ROTULO952
ROTULO954:
ROTULO951:
mov sp, bp
pop bp
FIM_floppydisk_writecmd:
retf
;     ---=== System.IO.Disk.Floppy.hcb:167:14 ===---
_floppydisk_readdata:
push bp
mov bp, sp
sub sp, 2
push cs
call _os_stackcheck
; ARG: i TAM: 2 POS: BP--2 
;     ---=== System.IO.Disk.Floppy.hcb:168:13 ===---
;     ---=== System.IO.Disk.Floppy.hcb:169:22 ===---
;     ---=== System.IO.Disk.Floppy.hcb:169:22 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-2], 1
ROTULO961:
;     ---=== System.IO.Disk.Floppy.hcb:169:22 ===---
;     ---=== System.IO.Disk.Floppy.hcb:169:22 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== System.IO.Disk.Floppy.hcb:169:22 ===---
mov ax, 500
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO964
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
;     ---=== System.IO.Disk.Floppy.hcb:170:13 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _floppydisk_readmsr
;     ---=== System.IO.Disk.Floppy.hcb:171:13 ===---
;     ---=== System.IO.Disk.Floppy.hcb:171:16 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_floppydisk_controllerrqm]
cmp ax, 0
jne ROTULO967
jmp ROTULO968
ROTULO967:
;     ---=== System.IO.Disk.Floppy.hcb:172:17 ===---
;     ---=== System.IO.Disk.Floppy.hcb:172:24 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _floppydisk_readfifo
jmp ROTULO960
ROTULO968:
;     ---=== System.IO.Disk.Floppy.hcb:169:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-2]
jmp ROTULO961
ROTULO963:
;     ---=== System.IO.Disk.Floppy.hcb:175:9 ===---
;     ---=== System.IO.Disk.Floppy.hcb:175:16 ===---
xor ax, ax
jmp ROTULO960
ROTULO960:
mov sp, bp
pop bp
FIM_floppydisk_readdata:
retf
;     ---=== System.IO.Disk.Floppy.hcb:178:9 ===---
_floppydisk_stopmotor:
push bp
mov bp, sp
; ARG: motor TAM: 2 POS: BP+6 
;     ---=== System.IO.Disk.Floppy.hcb:178:19 ===---
;     ---=== System.IO.Disk.Floppy.hcb:179:9 ===---
;     ---=== System.IO.Disk.Floppy.hcb:179:18 ===---
;     ---=== System.IO.Disk.Floppy.hcb:179:12 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
push ax
;     ---=== System.IO.Disk.Floppy.hcb:179:21 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO972
jmp ROTULO973
ROTULO972:
mov ax, 65535
jmp ROTULO974
ROTULO973:
xor ax, ax
ROTULO974:
cmp ax, 0
jne ROTULO970
jmp ROTULO971
ROTULO970:
;     ---=== System.IO.Disk.Floppy.hcb:180:13 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_floppydisk_motor0status], 0
ROTULO971:
;     ---=== System.IO.Disk.Floppy.hcb:182:9 ===---
;     ---=== System.IO.Disk.Floppy.hcb:182:18 ===---
;     ---=== System.IO.Disk.Floppy.hcb:182:12 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
push ax
;     ---=== System.IO.Disk.Floppy.hcb:182:21 ===---
mov ax, 1
mov bx, ax
pop ax
cmp ax, bx
je ROTULO977
jmp ROTULO978
ROTULO977:
mov ax, 65535
jmp ROTULO979
ROTULO978:
xor ax, ax
ROTULO979:
cmp ax, 0
jne ROTULO975
jmp ROTULO976
ROTULO975:
;     ---=== System.IO.Disk.Floppy.hcb:183:13 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_floppydisk_motor1status], 0
ROTULO976:
;     ---=== System.IO.Disk.Floppy.hcb:185:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _floppydisk_writedor
ROTULO969:
mov sp, bp
pop bp
FIM_floppydisk_stopmotor:
retf
;     ---=== System.IO.Disk.Floppy.hcb:188:9 ===---
_floppydisk_startmotor:
push bp
mov bp, sp
sub sp, 2
push cs
call _os_stackcheck
; ARG: motor TAM: 2 POS: BP+6 
; ARG: wait TAM: 2 POS: BP--2 
;     ---=== System.IO.Disk.Floppy.hcb:188:20 ===---
;     ---=== System.IO.Disk.Floppy.hcb:189:13 ===---
;     ---=== System.IO.Disk.Floppy.hcb:190:9 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-2], 0
;     ---=== System.IO.Disk.Floppy.hcb:191:9 ===---
;     ---=== System.IO.Disk.Floppy.hcb:191:25 ===---
;     ---=== System.IO.Disk.Floppy.hcb:191:19 ===---
;     ---=== System.IO.Disk.Floppy.hcb:191:13 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
push ax
;     ---=== System.IO.Disk.Floppy.hcb:191:22 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO986
jmp ROTULO987
ROTULO986:
mov ax, 65535
jmp ROTULO988
ROTULO987:
xor ax, ax
ROTULO988:
cmp ax, 0
je ROTULO984
;     ---=== System.IO.Disk.Floppy.hcb:191:47 ===---
;     ---=== System.IO.Disk.Floppy.hcb:191:34 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_floppydisk_motor0status]
push ax
;     ---=== System.IO.Disk.Floppy.hcb:191:50 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO989
jmp ROTULO990
ROTULO989:
mov ax, 65535
jmp ROTULO991
ROTULO990:
xor ax, ax
ROTULO991:
cmp ax, 0
je ROTULO984
ROTULO983:
mov ax, 65535
jmp ROTULO985
ROTULO984:
xor ax, ax
ROTULO985:
cmp ax, 0
jne ROTULO981
jmp ROTULO982
ROTULO981:
;     ---=== System.IO.Disk.Floppy.hcb:191:58 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-2], 1
ROTULO982:
;     ---=== System.IO.Disk.Floppy.hcb:192:9 ===---
;     ---=== System.IO.Disk.Floppy.hcb:192:25 ===---
;     ---=== System.IO.Disk.Floppy.hcb:192:19 ===---
;     ---=== System.IO.Disk.Floppy.hcb:192:13 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
push ax
;     ---=== System.IO.Disk.Floppy.hcb:192:22 ===---
mov ax, 1
mov bx, ax
pop ax
cmp ax, bx
je ROTULO997
jmp ROTULO998
ROTULO997:
mov ax, 65535
jmp ROTULO999
ROTULO998:
xor ax, ax
ROTULO999:
cmp ax, 0
je ROTULO995
;     ---=== System.IO.Disk.Floppy.hcb:192:47 ===---
;     ---=== System.IO.Disk.Floppy.hcb:192:34 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_floppydisk_motor1status]
push ax
;     ---=== System.IO.Disk.Floppy.hcb:192:50 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO1000
jmp ROTULO1001
ROTULO1000:
mov ax, 65535
jmp ROTULO1002
ROTULO1001:
xor ax, ax
ROTULO1002:
cmp ax, 0
je ROTULO995
ROTULO994:
mov ax, 65535
jmp ROTULO996
ROTULO995:
xor ax, ax
ROTULO996:
cmp ax, 0
jne ROTULO992
jmp ROTULO993
ROTULO992:
;     ---=== System.IO.Disk.Floppy.hcb:192:58 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-2], 1
ROTULO993:
;     ---=== System.IO.Disk.Floppy.hcb:193:9 ===---
;     ---=== System.IO.Disk.Floppy.hcb:193:18 ===---
;     ---=== System.IO.Disk.Floppy.hcb:193:12 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
push ax
;     ---=== System.IO.Disk.Floppy.hcb:193:21 ===---
xor ax, ax
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
jne ROTULO1003
jmp ROTULO1004
ROTULO1003:
;     ---=== System.IO.Disk.Floppy.hcb:194:13 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_floppydisk_motor0counter], 5
;     ---=== System.IO.Disk.Floppy.hcb:195:13 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_floppydisk_motor0status], 1
ROTULO1004:
;     ---=== System.IO.Disk.Floppy.hcb:197:9 ===---
;     ---=== System.IO.Disk.Floppy.hcb:197:18 ===---
;     ---=== System.IO.Disk.Floppy.hcb:197:12 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
push ax
;     ---=== System.IO.Disk.Floppy.hcb:197:21 ===---
mov ax, 1
mov bx, ax
pop ax
cmp ax, bx
je ROTULO1010
jmp ROTULO1011
ROTULO1010:
mov ax, 65535
jmp ROTULO1012
ROTULO1011:
xor ax, ax
ROTULO1012:
cmp ax, 0
jne ROTULO1008
jmp ROTULO1009
ROTULO1008:
;     ---=== System.IO.Disk.Floppy.hcb:198:13 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_floppydisk_motor1counter], 5
;     ---=== System.IO.Disk.Floppy.hcb:199:13 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_floppydisk_motor1status], 1
ROTULO1009:
;     ---=== System.IO.Disk.Floppy.hcb:201:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _floppydisk_writedor
;     ---=== System.IO.Disk.Floppy.hcb:202:9 ===---
;     ---=== System.IO.Disk.Floppy.hcb:202:12 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
cmp ax, 0
jne ROTULO1013
jmp ROTULO1014
ROTULO1013:
;     ---=== System.IO.Disk.Floppy.hcb:202:22 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:202:35 ===---
mov ax, 400
push ax
push cs
call _thread_sleep
add sp, 2
ROTULO1014:
ROTULO980:
mov sp, bp
pop bp
FIM_floppydisk_startmotor:
retf
;     ---=== System.IO.Disk.Floppy.hcb:205:9 ===---
_floppydisk_reset:
push bp
mov bp, sp
sub sp, 12
push cs
call _os_stackcheck
; ARG: i TAM: 2 POS: BP--12 
;     ---=== System.IO.Disk.Floppy.hcb:206:13 ===---
;     ---=== System.IO.Disk.Floppy.hcb:207:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _floppydisk_disable
;     ---=== System.IO.Disk.Floppy.hcb:208:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:208:22 ===---
mov ax, 400
push ax
push cs
call _thread_sleep
add sp, 2
;     ---=== System.IO.Disk.Floppy.hcb:209:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _floppydisk_readmsr
;     ---=== System.IO.Disk.Floppy.hcb:210:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _floppydisk_enable
;     ---=== System.IO.Disk.Floppy.hcb:211:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _floppydisk_waitirq
;     ---=== System.IO.Disk.Floppy.hcb:212:22 ===---
;     ---=== System.IO.Disk.Floppy.hcb:212:22 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-12], 0
ROTULO1016:
;     ---=== System.IO.Disk.Floppy.hcb:212:22 ===---
;     ---=== System.IO.Disk.Floppy.hcb:212:22 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-12]
push ax
;     ---=== System.IO.Disk.Floppy.hcb:212:22 ===---
mov ax, 3
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO1019
jmp ROTULO1020
ROTULO1019:
mov ax, 65535
jmp ROTULO1021
ROTULO1020:
xor ax, ax
ROTULO1021:
cmp ax, 0
jne ROTULO1017
jmp ROTULO1018
ROTULO1017:
;     ---=== System.IO.Disk.Floppy.hcb:213:13 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _floppydisk_checkinterrupt
;     ---=== System.IO.Disk.Floppy.hcb:212:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-12]
jmp ROTULO1016
ROTULO1018:
;     ---=== System.IO.Disk.Floppy.hcb:215:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:215:19 ===---
xor ax, ax
push ax
push cs
call _floppydisk_writectrl
add sp, 2
;     ---=== System.IO.Disk.Floppy.hcb:216:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:216:31 ===---
mov ax, 240
push ax
;     ---=== System.IO.Disk.Floppy.hcb:216:27 ===---
mov ax, 16
push ax
;     ---=== System.IO.Disk.Floppy.hcb:216:24 ===---
mov ax, 3
push ax
;     ---=== System.IO.Disk.Floppy.hcb:216:21 ===---
mov ax, 1
push ax
push cs
call _floppydisk_configdrive
add sp, 8
;     ---=== System.IO.Disk.Floppy.hcb:217:11 ===---
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
mov ax, ROTULO1022
cs mov [_os_trycode], ax
;     ---=== System.IO.Disk.Floppy.hcb:218:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:218:23 ===---
xor ax, ax
push ax
push cs
call _floppydisk_calibrate
add sp, 2
jmp ROTULO1023
ROTULO1022:
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
jmp ROTULO1023
ROTULO1025:
cs jmp word [_os_tryfatal]
ROTULO1023:
mov ax, [bp+-6]
cs mov [_os_trybase], ax
mov ax, [bp+-4]
cs mov [_os_trystack], ax
mov ax, [bp+-2]
cs mov [_os_trycode], ax
;     ---=== System.IO.Disk.Floppy.hcb:221:11 ===---
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
mov ax, ROTULO1026
cs mov [_os_trycode], ax
;     ---=== System.IO.Disk.Floppy.hcb:222:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:222:23 ===---
mov ax, 1
push ax
push cs
call _floppydisk_calibrate
add sp, 2
jmp ROTULO1027
ROTULO1026:
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
jmp ROTULO1027
ROTULO1029:
cs jmp word [_os_tryfatal]
ROTULO1027:
mov ax, [bp+-6]
cs mov [_os_trybase], ax
mov ax, [bp+-4]
cs mov [_os_trystack], ax
mov ax, [bp+-2]
cs mov [_os_trycode], ax
ROTULO1015:
mov sp, bp
pop bp
FIM_floppydisk_reset:
retf
;     ---=== System.IO.Disk.Floppy.hcb:227:9 ===---
_floppydisk_disable:
;     ---=== System.IO.Disk.Floppy.hcb:228:9 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_floppydisk_dmastatus], 0
;     ---=== System.IO.Disk.Floppy.hcb:229:9 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_floppydisk_resetstatus], 0
;     ---=== System.IO.Disk.Floppy.hcb:230:9 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_floppydisk_motor0counter], 0
;     ---=== System.IO.Disk.Floppy.hcb:231:9 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_floppydisk_motor1counter], 0
;     ---=== System.IO.Disk.Floppy.hcb:232:9 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_floppydisk_motor0status], 0
;     ---=== System.IO.Disk.Floppy.hcb:233:9 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_floppydisk_motor1status], 0
;     ---=== System.IO.Disk.Floppy.hcb:234:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _floppydisk_writedor
ROTULO1030:
FIM_floppydisk_disable:
retf
;     ---=== System.IO.Disk.Floppy.hcb:237:9 ===---
_floppydisk_enable:
;     ---=== System.IO.Disk.Floppy.hcb:238:9 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_floppydisk_dmastatus], 1
;     ---=== System.IO.Disk.Floppy.hcb:239:9 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_floppydisk_resetstatus], 1
;     ---=== System.IO.Disk.Floppy.hcb:240:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _floppydisk_writedor
ROTULO1031:
FIM_floppydisk_enable:
retf
;     ---=== System.IO.Disk.Floppy.hcb:243:9 ===---
_floppydisk_dmaread:
;     ---=== System.IO.Disk.Floppy.hcb:244:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:244:28 ===---
mov ax, 6
push ax
;     ---=== System.IO.Disk.Floppy.hcb:244:23 ===---
mov ax, 10
push ax
push cs
call _io_outputbyte
add sp, 4
;     ---=== System.IO.Disk.Floppy.hcb:245:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:245:28 ===---
mov ax, 86
push ax
;     ---=== System.IO.Disk.Floppy.hcb:245:23 ===---
mov ax, 11
push ax
push cs
call _io_outputbyte
add sp, 4
;     ---=== System.IO.Disk.Floppy.hcb:246:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:246:28 ===---
mov ax, 2
push ax
;     ---=== System.IO.Disk.Floppy.hcb:246:23 ===---
mov ax, 10
push ax
push cs
call _io_outputbyte
add sp, 4
ROTULO1032:
FIM_floppydisk_dmaread:
retf
;     ---=== System.IO.Disk.Floppy.hcb:249:9 ===---
_floppydisk_dmawrite:
;     ---=== System.IO.Disk.Floppy.hcb:250:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:250:28 ===---
mov ax, 6
push ax
;     ---=== System.IO.Disk.Floppy.hcb:250:23 ===---
mov ax, 10
push ax
push cs
call _io_outputbyte
add sp, 4
;     ---=== System.IO.Disk.Floppy.hcb:251:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:251:28 ===---
mov ax, 90
push ax
;     ---=== System.IO.Disk.Floppy.hcb:251:23 ===---
mov ax, 11
push ax
push cs
call _io_outputbyte
add sp, 4
;     ---=== System.IO.Disk.Floppy.hcb:252:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:252:28 ===---
mov ax, 2
push ax
;     ---=== System.IO.Disk.Floppy.hcb:252:23 ===---
mov ax, 10
push ax
push cs
call _io_outputbyte
add sp, 4
ROTULO1033:
FIM_floppydisk_dmawrite:
retf
;     ---=== System.IO.Disk.Floppy.hcb:255:9 ===---
_floppydisk_waitirq:
;     ---=== System.IO.Disk.Floppy.hcb:256:9 ===---
ROTULO1035:
;     ---=== System.IO.Disk.Floppy.hcb:256:25 ===---
;     ---=== System.IO.Disk.Floppy.hcb:256:15 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_floppydisk_irqstatus]
push ax
;     ---=== System.IO.Disk.Floppy.hcb:256:28 ===---
xor ax, ax
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
jne ROTULO1036
jmp ROTULO1037
ROTULO1036:
;     ---=== System.IO.Disk.Floppy.hcb:256:30 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _thread_yield
jmp ROTULO1035
ROTULO1037:
;     ---=== System.IO.Disk.Floppy.hcb:257:9 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_floppydisk_irqstatus], 0
ROTULO1034:
FIM_floppydisk_waitirq:
retf
;     ---=== System.IO.Disk.Floppy.hcb:260:9 ===---
_floppydisk_configdrive:
push bp
mov bp, sp
; ARG: dma TAM: 2 POS: BP+6 
; ARG: steprate TAM: 2 POS: BP+8 
; ARG: unloadtime TAM: 2 POS: BP+10 
; ARG: loadtime TAM: 2 POS: BP+12 
;     ---=== System.IO.Disk.Floppy.hcb:260:21 ===---
;     ---=== System.IO.Disk.Floppy.hcb:260:36 ===---
;     ---=== System.IO.Disk.Floppy.hcb:260:56 ===---
;     ---=== System.IO.Disk.Floppy.hcb:260:78 ===---
;     ---=== System.IO.Disk.Floppy.hcb:261:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:261:18 ===---
mov ax, 3
push ax
push cs
call _floppydisk_writecmd
add sp, 2
;     ---=== System.IO.Disk.Floppy.hcb:262:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:262:39 ===---
;     ---=== System.IO.Disk.Floppy.hcb:262:30 ===---
;     ---=== System.IO.Disk.Floppy.hcb:262:19 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
push ax
;     ---=== System.IO.Disk.Floppy.hcb:262:34 ===---
mov ax, 15
mov bx, ax
pop ax
and ax, bx
push ax
;     ---=== System.IO.Disk.Floppy.hcb:262:62 ===---
;     ---=== System.IO.Disk.Floppy.hcb:262:53 ===---
;     ---=== System.IO.Disk.Floppy.hcb:262:44 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+8]
push ax
;     ---=== System.IO.Disk.Floppy.hcb:262:57 ===---
mov ax, 15
mov bx, ax
pop ax
and ax, bx
push ax
;     ---=== System.IO.Disk.Floppy.hcb:262:66 ===---
mov ax, 4
mov cx, ax
pop ax
shl ax, cl
mov bx, ax
pop ax
or ax, bx
push ax
push cs
call _floppydisk_writecmd
add sp, 2
;     ---=== System.IO.Disk.Floppy.hcb:263:9 ===---
;     ---=== System.IO.Disk.Floppy.hcb:263:12 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
cmp ax, 0
jne ROTULO1051
jmp ROTULO1052
ROTULO1051:
;     ---=== System.IO.Disk.Floppy.hcb:263:21 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+6], 1
ROTULO1052:
;     ---=== System.IO.Disk.Floppy.hcb:264:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:264:35 ===---
;     ---=== System.IO.Disk.Floppy.hcb:264:28 ===---
;     ---=== System.IO.Disk.Floppy.hcb:264:19 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+12]
push ax
;     ---=== System.IO.Disk.Floppy.hcb:264:32 ===---
mov ax, 1
mov cx, ax
pop ax
shl ax, cl
push ax
;     ---=== System.IO.Disk.Floppy.hcb:264:38 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
mov bx, ax
pop ax
or ax, bx
push ax
push cs
call _floppydisk_writecmd
add sp, 2
ROTULO1041:
mov sp, bp
pop bp
FIM_floppydisk_configdrive:
retf
;     ---=== System.IO.Disk.Floppy.hcb:267:9 ===---
_floppydisk_checkinterrupt:
;     ---=== System.IO.Disk.Floppy.hcb:268:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:268:18 ===---
mov ax, 8
push ax
push cs
call _floppydisk_writecmd
add sp, 2
;     ---=== System.IO.Disk.Floppy.hcb:269:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.IO.Disk.Floppy.hcb:269:27 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _floppydisk_readdata
cs mov [_floppydisk_statusregister0], ax
;     ---=== System.IO.Disk.Floppy.hcb:270:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.IO.Disk.Floppy.hcb:270:27 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _floppydisk_readdata
cs mov [_floppydisk_currentcylinder], ax
ROTULO1056:
FIM_floppydisk_checkinterrupt:
retf
;     ---=== System.IO.Disk.Floppy.hcb:273:9 ===---
_floppydisk_seek:
push bp
mov bp, sp
sub sp, 2
push cs
call _os_stackcheck
; ARG: disk TAM: 4 POS: BP+6 
; ARG: cylinder TAM: 2 POS: BP+10 
; ARG: head TAM: 2 POS: BP+12 
; ARG: i TAM: 2 POS: BP--2 
;     ---=== System.IO.Disk.Floppy.hcb:273:14 ===---
;     ---=== System.IO.Disk.Floppy.hcb:273:32 ===---
;     ---=== System.IO.Disk.Floppy.hcb:273:52 ===---
;     ---=== System.IO.Disk.Floppy.hcb:274:13 ===---
;     ---=== System.IO.Disk.Floppy.hcb:275:22 ===---
;     ---=== System.IO.Disk.Floppy.hcb:275:22 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-2], 1
ROTULO1058:
;     ---=== System.IO.Disk.Floppy.hcb:275:22 ===---
;     ---=== System.IO.Disk.Floppy.hcb:275:22 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== System.IO.Disk.Floppy.hcb:275:22 ===---
mov ax, 10
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO1061
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
;     ---=== System.IO.Disk.Floppy.hcb:276:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:276:22 ===---
mov ax, 15
push ax
push cs
call _floppydisk_writecmd
add sp, 2
;     ---=== System.IO.Disk.Floppy.hcb:277:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:277:36 ===---
;     ---=== System.IO.Disk.Floppy.hcb:277:29 ===---
;     ---=== System.IO.Disk.Floppy.hcb:277:24 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+12]
push ax
;     ---=== System.IO.Disk.Floppy.hcb:277:33 ===---
mov ax, 2
mov cx, ax
pop ax
shl ax, cl
push ax
;     ---=== System.IO.Disk.Floppy.hcb:277:39 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_floppydisk_driveselected]
mov bx, ax
pop ax
or ax, bx
push ax
push cs
call _floppydisk_writecmd
add sp, 2
;     ---=== System.IO.Disk.Floppy.hcb:278:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:278:22 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
push ax
push cs
call _floppydisk_writecmd
add sp, 2
;     ---=== System.IO.Disk.Floppy.hcb:280:13 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _floppydisk_waitirq
;     ---=== System.IO.Disk.Floppy.hcb:282:13 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _floppydisk_checkinterrupt
;     ---=== System.IO.Disk.Floppy.hcb:283:13 ===---
;     ---=== System.IO.Disk.Floppy.hcb:283:32 ===---
;     ---=== System.IO.Disk.Floppy.hcb:283:16 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_floppydisk_currentcylinder]
push ax
;     ---=== System.IO.Disk.Floppy.hcb:283:35 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
mov bx, ax
pop ax
cmp ax, bx
je ROTULO1069
jmp ROTULO1070
ROTULO1069:
mov ax, 65535
jmp ROTULO1071
ROTULO1070:
xor ax, ax
ROTULO1071:
cmp ax, 0
jne ROTULO1067
jmp ROTULO1068
ROTULO1067:
;     ---=== System.IO.Disk.Floppy.hcb:283:49 ===---
;     ---=== System.IO.Disk.Floppy.hcb:283:54 ===---
xor ax, ax
jmp ROTULO1057
ROTULO1068:
;     ---=== System.IO.Disk.Floppy.hcb:275:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-2]
jmp ROTULO1058
ROTULO1060:
;     ---=== System.IO.Disk.Floppy.hcb:285:15 ===---
mov ax, _floppydisk
mov [bp+-8], ax
mov ax, 285
mov [bp+-10], ax
mov ax, 10
cs jmp word [_os_trycode]
ROTULO1057:
mov sp, bp
pop bp
FIM_floppydisk_seek:
retf
;     ---=== System.IO.Disk.Floppy.hcb:288:9 ===---
_floppydisk_readblock:
push bp
mov bp, sp
sub sp, 4
push cs
call _os_stackcheck
; ARG: disk TAM: 4 POS: BP+6 
; ARG: block TAM: 4 POS: BP+10 
; ARG: positionlow TAM: 2 POS: BP+14 
; ARG: positionhigh TAM: 2 POS: BP+16 
; ARG: chs TAM: 4 POS: BP--4 
;     ---=== System.IO.Disk.Floppy.hcb:288:19 ===---
;     ---=== System.IO.Disk.Floppy.hcb:288:37 ===---
;     ---=== System.IO.Disk.Floppy.hcb:288:60 ===---
;     ---=== System.IO.Disk.Floppy.hcb:288:83 ===---
;     ---=== System.IO.Disk.Floppy.hcb:289:13 ===---
;     ---=== System.IO.Disk.Floppy.hcb:290:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:290:51 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+16]
push ax
;     ---=== System.IO.Disk.Floppy.hcb:290:38 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+14]
push ax
;     ---=== System.IO.Disk.Floppy.hcb:290:32 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
;     ---=== System.IO.Disk.Floppy.hcb:290:27 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-4+2]
pop es
mov di, [bp+-4]
push es
push di
push cs
call _disk_converttochs
add sp, 12
;     ---=== System.IO.Disk.Floppy.hcb:291:9 ===---
;     ---=== System.IO.Disk.Floppy.hcb:291:25 ===---
;     ---=== System.IO.Disk.Floppy.hcb:291:12 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 43
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+43]
push ax
;     ---=== System.IO.Disk.Floppy.hcb:291:28 ===---
mov ax, 18
mov bx, ax
pop ax
cmp ax, bx
je ROTULO1075
jmp ROTULO1076
ROTULO1075:
mov ax, 65535
jmp ROTULO1077
ROTULO1076:
xor ax, ax
ROTULO1077:
cmp ax, 0
jne ROTULO1073
jmp ROTULO1074
ROTULO1073:
;     ---=== System.IO.Disk.Floppy.hcb:292:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:292:22 ===---
mov ax, 27
push ax
push cs
call _floppydisk_writecmd
add sp, 2
jmp ROTULO1078
ROTULO1074:
;     ---=== System.IO.Disk.Floppy.hcb:294:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:294:22 ===---
mov ax, 32
push ax
push cs
call _floppydisk_writecmd
add sp, 2
ROTULO1078:
;     ---=== System.IO.Disk.Floppy.hcb:296:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:296:34 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 2
push word [bp+-4+2]
pop es
mov di, [bp+-4]
es mov ax, [di+2]
push ax
;     ---=== System.IO.Disk.Floppy.hcb:296:20 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 0
es mov ax, [di+0]
push ax
;     ---=== System.IO.Disk.Floppy.hcb:296:14 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
push cs
call _floppydisk_seek
add sp, 8
;     ---=== System.IO.Disk.Floppy.hcb:297:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _floppydisk_dmaread
;     ---=== System.IO.Disk.Floppy.hcb:298:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:298:39 ===---
;     ---=== System.IO.Disk.Floppy.hcb:298:31 ===---
;     ---=== System.IO.Disk.Floppy.hcb:298:23 ===---
;     ---=== System.IO.Disk.Floppy.hcb:298:18 ===---
mov ax, 128
push ax
;     ---=== System.IO.Disk.Floppy.hcb:298:26 ===---
mov ax, 64
mov bx, ax
pop ax
or ax, bx
push ax
;     ---=== System.IO.Disk.Floppy.hcb:298:34 ===---
mov ax, 32
mov bx, ax
pop ax
or ax, bx
push ax
;     ---=== System.IO.Disk.Floppy.hcb:298:42 ===---
mov ax, 2
mov bx, ax
pop ax
or ax, bx
push ax
push cs
call _floppydisk_writecmd
add sp, 2
;     ---=== System.IO.Disk.Floppy.hcb:299:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:299:35 ===---
;     ---=== System.IO.Disk.Floppy.hcb:299:28 ===---
;     ---=== System.IO.Disk.Floppy.hcb:299:19 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 2
push word [bp+-4+2]
pop es
mov di, [bp+-4]
es mov ax, [di+2]
push ax
;     ---=== System.IO.Disk.Floppy.hcb:299:32 ===---
mov ax, 2
mov cx, ax
pop ax
shl ax, cl
push ax
;     ---=== System.IO.Disk.Floppy.hcb:299:39 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_floppydisk_driveselected]
mov bx, ax
pop ax
or ax, bx
push ax
push cs
call _floppydisk_writecmd
add sp, 2
;     ---=== System.IO.Disk.Floppy.hcb:300:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:300:18 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 0
push word [bp+-4+2]
pop es
mov di, [bp+-4]
es mov ax, [di+0]
push ax
push cs
call _floppydisk_writecmd
add sp, 2
;     ---=== System.IO.Disk.Floppy.hcb:301:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:301:18 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 2
push word [bp+-4+2]
pop es
mov di, [bp+-4]
es mov ax, [di+2]
push ax
push cs
call _floppydisk_writecmd
add sp, 2
;     ---=== System.IO.Disk.Floppy.hcb:302:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:302:18 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 4
push word [bp+-4+2]
pop es
mov di, [bp+-4]
es mov ax, [di+4]
push ax
push cs
call _floppydisk_writecmd
add sp, 2
;     ---=== System.IO.Disk.Floppy.hcb:303:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:303:18 ===---
mov ax, 2
push ax
push cs
call _floppydisk_writecmd
add sp, 2
;     ---=== System.IO.Disk.Floppy.hcb:304:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:304:18 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 0
push word [bp+-4+2]
pop es
mov di, [bp+-4]
es mov ax, [di+0]
push ax
push cs
call _floppydisk_writecmd
add sp, 2
;     ---=== System.IO.Disk.Floppy.hcb:305:9 ===---
;     ---=== System.IO.Disk.Floppy.hcb:305:29 ===---
;     ---=== System.IO.Disk.Floppy.hcb:305:24 ===---
;     ---=== System.IO.Disk.Floppy.hcb:305:26 ===---
mov ax, 1
push ax
;     ---=== System.IO.Disk.Floppy.hcb:305:13 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 4
push word [bp+-4+2]
pop es
mov di, [bp+-4]
es mov ax, [di+4]
pop bx
add ax, bx
push ax
;     ---=== System.IO.Disk.Floppy.hcb:305:32 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 43
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+43]
mov bx, ax
pop ax
cmp ax, bx
jae ROTULO1093
jmp ROTULO1094
ROTULO1093:
mov ax, 65535
jmp ROTULO1095
ROTULO1094:
xor ax, ax
ROTULO1095:
cmp ax, 0
jne ROTULO1091
jmp ROTULO1092
ROTULO1091:
;     ---=== System.IO.Disk.Floppy.hcb:306:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:306:22 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 43
es mov ax, [di+43]
push ax
push cs
call _floppydisk_writecmd
add sp, 2
jmp ROTULO1096
ROTULO1092:
;     ---=== System.IO.Disk.Floppy.hcb:308:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:308:33 ===---
;     ---=== System.IO.Disk.Floppy.hcb:308:35 ===---
mov ax, 1
push ax
;     ---=== System.IO.Disk.Floppy.hcb:308:22 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 4
push word [bp+-4+2]
pop es
mov di, [bp+-4]
es mov ax, [di+4]
pop bx
add ax, bx
push ax
push cs
call _floppydisk_writecmd
add sp, 2
ROTULO1096:
;     ---=== System.IO.Disk.Floppy.hcb:310:9 ===---
;     ---=== System.IO.Disk.Floppy.hcb:310:25 ===---
;     ---=== System.IO.Disk.Floppy.hcb:310:12 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 43
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+43]
push ax
;     ---=== System.IO.Disk.Floppy.hcb:310:28 ===---
mov ax, 18
mov bx, ax
pop ax
cmp ax, bx
je ROTULO1099
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
;     ---=== System.IO.Disk.Floppy.hcb:311:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:311:22 ===---
mov ax, 27
push ax
push cs
call _floppydisk_writecmd
add sp, 2
jmp ROTULO1102
ROTULO1098:
;     ---=== System.IO.Disk.Floppy.hcb:313:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:313:22 ===---
mov ax, 32
push ax
push cs
call _floppydisk_writecmd
add sp, 2
ROTULO1102:
;     ---=== System.IO.Disk.Floppy.hcb:315:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:315:18 ===---
mov ax, 255
push ax
push cs
call _floppydisk_writecmd
add sp, 2
;     ---=== System.IO.Disk.Floppy.hcb:316:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _floppydisk_waitirq
;     ---=== System.IO.Disk.Floppy.hcb:317:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _floppydisk_readdata
;     ---=== System.IO.Disk.Floppy.hcb:318:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _floppydisk_readdata
;     ---=== System.IO.Disk.Floppy.hcb:319:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _floppydisk_readdata
;     ---=== System.IO.Disk.Floppy.hcb:320:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _floppydisk_readdata
;     ---=== System.IO.Disk.Floppy.hcb:321:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _floppydisk_readdata
;     ---=== System.IO.Disk.Floppy.hcb:322:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _floppydisk_readdata
;     ---=== System.IO.Disk.Floppy.hcb:323:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _floppydisk_readdata
;     ---=== System.IO.Disk.Floppy.hcb:324:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _floppydisk_checkinterrupt
;     ---=== System.IO.Disk.Floppy.hcb:325:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.Floppy.hcb:325:36 ===---
mov ax, 512
push ax
;     ---=== System.IO.Disk.Floppy.hcb:325:28 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_floppydisk_buffer+2]
pop es
cs mov di, [_floppydisk_buffer]
push es
push di
;     ---=== System.IO.Disk.Floppy.hcb:325:21 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+10+2]
pop es
mov di, [bp+10]
push es
push di
push cs
call _memory_copy
add sp, 10
ROTULO1072:
mov sp, bp
pop bp
FIM_floppydisk_readblock:
retf
;     ---=== System.IO.Disk.Floppy.hcb:328:9 ===---
_floppydisk_writeblock:
push bp
mov bp, sp
; ARG: disk TAM: 4 POS: BP+6 
; ARG: block TAM: 4 POS: BP+10 
; ARG: positionlow TAM: 2 POS: BP+14 
; ARG: positionhigh TAM: 2 POS: BP+16 
;     ---=== System.IO.Disk.Floppy.hcb:328:20 ===---
;     ---=== System.IO.Disk.Floppy.hcb:328:38 ===---
;     ---=== System.IO.Disk.Floppy.hcb:328:61 ===---
;     ---=== System.IO.Disk.Floppy.hcb:328:84 ===---
;     ---=== System.IO.Disk.Floppy.hcb:329:15 ===---
mov ax, _floppydisk
mov [bp+-8], ax
mov ax, 329
mov [bp+-10], ax
mov ax, 7
cs jmp word [_os_trycode]
ROTULO1103:
mov sp, bp
pop bp
FIM_floppydisk_writeblock:
retf
; MODULO FIM: floppydisk
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
dw _floppydisk_buffer
dw 4
dw 0
dw 0
dw 0
dw 0
dw 0
END:
