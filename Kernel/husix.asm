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
; MODULO FIM: os
;     ---=== husix.hcb:16:8 ===---
; MODULO: program
_program:
db 9
db 104,117,115,105,120,46,104,99,98
db 0
;     ---=== husix.hcb:18:16 ===---
_program_main:
push bp
mov bp, sp
sub sp, 12
push cs
call _os_stackcheck
; ARG: args TAM: 4 POS: BP+6 
; ARG: ptr TAM: 4 POS: BP--4 
; ARG: ver TAM: 4 POS: BP--8 
; ARG: disk TAM: 4 POS: BP--12 
;     ---=== husix.hcb:18:21 ===---
;     ---=== husix.hcb:19:13 ===---
;     ---=== husix.hcb:20:13 ===---
;     ---=== husix.hcb:53:13 ===---
;     ---=== husix.hcb:21:9 ===---
; ACAO STRUCTURE - Aloca estrutura na pilha
sub sp, 10
push ss
pop es
mov di, sp
push es
pop word [bp+-8+2]
mov [bp+-8], di
;     ---=== husix.hcb:22:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:22:33 ===---
; ACAO LEITURA - Le ponteiro
push es
push di
push cs
call _husixversion_getversion
add sp, 4
;     ---=== husix.hcb:23:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _console_mode80x25x4
;     ---=== husix.hcb:24:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:24:27 ===---
push cs
pop es
mov di, ROTULO90
jmp ROTULO89
ROTULO90:
db 22
db 72,85,83,73,88,32,79,112,101,114,97,116,105,110,103,32,83,121,115,116,101,109
times 1 db 0
ROTULO89:
push es
push di
push cs
call _console_writeline
add sp, 4
;     ---=== husix.hcb:25:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:25:23 ===---
push cs
pop es
mov di, ROTULO92
jmp ROTULO91
ROTULO92:
db 8
db 75,101,114,110,101,108,32,118
times 1 db 0
ROTULO91:
push es
push di
push cs
call _console_write
add sp, 4
;     ---=== husix.hcb:26:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:26:29 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 0
push word [bp+-8+2]
pop es
mov di, [bp+-8]
es mov ax, [di+0]
push ax
push cs
call _console_writeuint16
add sp, 2
;     ---=== husix.hcb:27:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:27:23 ===---
push cs
pop es
mov di, ROTULO94
jmp ROTULO93
ROTULO94:
db 1
db 46
times 1 db 0
ROTULO93:
push es
push di
push cs
call _console_write
add sp, 4
;     ---=== husix.hcb:28:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:28:29 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 2
push word [bp+-8+2]
pop es
mov di, [bp+-8]
es mov ax, [di+2]
push ax
push cs
call _console_writeuint16
add sp, 2
;     ---=== husix.hcb:29:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:29:23 ===---
push cs
pop es
mov di, ROTULO96
jmp ROTULO95
ROTULO96:
db 2
db 32,82
times 1 db 0
ROTULO95:
push es
push di
push cs
call _console_write
add sp, 4
;     ---=== husix.hcb:30:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:30:29 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 4
push word [bp+-8+2]
pop es
mov di, [bp+-8]
es mov ax, [di+4]
push ax
push cs
call _console_writeuint16
add sp, 2
;     ---=== husix.hcb:31:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:31:23 ===---
push cs
pop es
mov di, ROTULO98
jmp ROTULO97
ROTULO98:
db 3
db 32,45,32
times 1 db 0
ROTULO97:
push es
push di
push cs
call _console_write
add sp, 4
;     ---=== husix.hcb:32:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:32:27 ===---
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
;     ---=== husix.hcb:33:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:33:23 ===---
push cs
pop es
mov di, ROTULO100
jmp ROTULO99
ROTULO100:
db 12
db 73,110,105,116,105,97,108,105,122,105,110,103
times 1 db 0
ROTULO99:
push es
push di
push cs
call _console_write
add sp, 4
;     ---=== husix.hcb:34:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _multithreading_preinitialize
;     ---=== husix.hcb:35:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:35:23 ===---
push cs
pop es
mov di, ROTULO102
jmp ROTULO101
ROTULO102:
db 1
db 46
times 1 db 0
ROTULO101:
push es
push di
push cs
call _console_write
add sp, 4
;     ---=== husix.hcb:36:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _globalmemory_initialize
;     ---=== husix.hcb:37:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:37:23 ===---
push cs
pop es
mov di, ROTULO104
jmp ROTULO103
ROTULO104:
db 1
db 46
times 1 db 0
ROTULO103:
push es
push di
push cs
call _console_write
add sp, 4
;     ---=== husix.hcb:38:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _memory_initialize
;     ---=== husix.hcb:39:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:39:23 ===---
push cs
pop es
mov di, ROTULO106
jmp ROTULO105
ROTULO106:
db 1
db 46
times 1 db 0
ROTULO105:
push es
push di
push cs
call _console_write
add sp, 4
;     ---=== husix.hcb:40:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _multithreading_initialize
;     ---=== husix.hcb:41:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:41:23 ===---
push cs
pop es
mov di, ROTULO108
jmp ROTULO107
ROTULO108:
db 1
db 46
times 1 db 0
ROTULO107:
push es
push di
push cs
call _console_write
add sp, 4
;     ---=== husix.hcb:42:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _systemtimer_initialize
;     ---=== husix.hcb:43:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:43:23 ===---
push cs
pop es
mov di, ROTULO110
jmp ROTULO109
ROTULO110:
db 1
db 46
times 1 db 0
ROTULO109:
push es
push di
push cs
call _console_write
add sp, 4
;     ---=== husix.hcb:44:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _multithreading_resume
;     ---=== husix.hcb:45:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:45:23 ===---
push cs
pop es
mov di, ROTULO112
jmp ROTULO111
ROTULO112:
db 1
db 46
times 1 db 0
ROTULO111:
push es
push di
push cs
call _console_write
add sp, 4
;     ---=== husix.hcb:46:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _disk_initialize
;     ---=== husix.hcb:47:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:47:23 ===---
push cs
pop es
mov di, ROTULO114
jmp ROTULO113
ROTULO114:
db 1
db 46
times 1 db 0
ROTULO113:
push es
push di
push cs
call _console_write
add sp, 4
;     ---=== husix.hcb:48:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _filesystem_initialize
;     ---=== husix.hcb:49:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:49:27 ===---
push cs
pop es
mov di, ROTULO116
jmp ROTULO115
ROTULO116:
db 8
db 46,32,91,32,79,75,32,93
times 1 db 0
ROTULO115:
push es
push di
push cs
call _console_writeline
add sp, 4
;     ---=== husix.hcb:51:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _configdefault_initialize
;     ---=== husix.hcb:54:9 ===---
; ACAO STRUCTURE - Associa texto em estrutura
; ACAO GRAVACAO - Gravacao de texto em ponteiro
jmp ROTULO117
ROTULO118:
db 15
db 66,73,79,83,68,105,115,107,48,48,48,95,51,54,48
times 1 db 0
ROTULO117:
mov ax, cs
mov word [bp+-12+2], ax
mov ax, ROTULO118
mov [bp+-12], ax
;     ---=== husix.hcb:55:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:55:23 ===---
push cs
pop es
mov di, ROTULO120
jmp ROTULO119
ROTULO120:
db 9
db 77,111,117,110,116,105,110,103,32
times 1 db 0
ROTULO119:
push es
push di
push cs
call _console_write
add sp, 4
;     ---=== husix.hcb:56:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:56:23 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-12+2]
pop es
mov di, [bp+-12]
push es
push di
push cs
call _console_write
add sp, 4
;     ---=== husix.hcb:57:9 ===---
;     ---=== husix.hcb:57:29 ===---
;     ---=== husix.hcb:57:12 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:57:23 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-12+2]
pop es
mov di, [bp+-12]
push es
push di
push cs
call _disk_exist
add sp, 4
push ax
;     ---=== husix.hcb:57:32 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO123
jmp ROTULO124
ROTULO123:
mov ax, 65535
jmp ROTULO125
ROTULO124:
xor ax, ax
ROTULO125:
cmp ax, 0
jne ROTULO121
jmp ROTULO122
ROTULO121:
;     ---=== husix.hcb:58:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:58:52 ===---
xor ax, ax
push ax
;     ---=== husix.hcb:58:46 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-12+2]
pop es
mov di, [bp+-12]
push es
push di
;     ---=== husix.hcb:58:24 ===---
push cs
pop es
mov di, ROTULO127
jmp ROTULO126
ROTULO127:
db 18
db 91,32,68,73,83,75,32,78,79,84,32,70,79,85,78,68,32,93
times 1 db 0
ROTULO126:
push es
push di
push cs
call _program_fatalerror
add sp, 10
ROTULO122:
;     ---=== husix.hcb:60:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:60:27 ===---
push cs
pop es
mov di, ROTULO129
jmp ROTULO128
ROTULO129:
db 8
db 46,32,91,32,79,75,32,93
times 1 db 0
ROTULO128:
push es
push di
push cs
call _console_writeline
add sp, 4
;     ---=== husix.hcb:62:9 ===---
ROTULO130:
;     ---=== husix.hcb:62:15 ===---
mov ax, 1
cmp ax, 0
jne ROTULO131
jmp ROTULO132
ROTULO131:
;     ---=== husix.hcb:63:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:63:31 ===---
mov ax, 13
push ax
push cs
call _console_writechar
add sp, 2
;     ---=== husix.hcb:64:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:64:33 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_clock_minute]
push ax
push cs
call _console_writeuint16
add sp, 2
;     ---=== husix.hcb:65:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:65:27 ===---
push cs
pop es
mov di, ROTULO134
jmp ROTULO133
ROTULO134:
db 1
db 58
times 1 db 0
ROTULO133:
push es
push di
push cs
call _console_write
add sp, 4
;     ---=== husix.hcb:66:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:66:33 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_clock_second]
push ax
push cs
call _console_writeuint16
add sp, 2
;     ---=== husix.hcb:67:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:67:26 ===---
mov ax, 1000
push ax
push cs
call _thread_sleep
add sp, 2
jmp ROTULO130
ROTULO132:
ROTULO88:
mov sp, bp
pop bp
FIM_program_main:
retf
;     ---=== husix.hcb:71:16 ===---
_program_fatalerror:
push bp
mov bp, sp
; ARG: msg TAM: 4 POS: BP+6 
; ARG: file TAM: 4 POS: BP+10 
; ARG: line TAM: 2 POS: BP+14 
;     ---=== husix.hcb:71:27 ===---
;     ---=== husix.hcb:71:42 ===---
;     ---=== husix.hcb:71:58 ===---
;     ---=== husix.hcb:72:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _console_mode80x25x4
;     ---=== husix.hcb:73:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:73:27 ===---
push cs
pop es
mov di, ROTULO137
jmp ROTULO136
ROTULO137:
db 12
db 70,65,84,65,76,32,69,82,82,79,82,58
times 1 db 0
ROTULO136:
push es
push di
push cs
call _console_writeline
add sp, 4
;     ---=== husix.hcb:74:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:74:23 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+10+2]
pop es
mov di, [bp+10]
push es
push di
push cs
call _console_write
add sp, 4
;     ---=== husix.hcb:75:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:75:23 ===---
push cs
pop es
mov di, ROTULO139
jmp ROTULO138
ROTULO139:
db 1
db 58
times 1 db 0
ROTULO138:
push es
push di
push cs
call _console_write
add sp, 4
;     ---=== husix.hcb:76:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:76:29 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+14]
push ax
push cs
call _console_writeuint16
add sp, 2
;     ---=== husix.hcb:77:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:77:27 ===---
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
call _console_writeline
add sp, 4
;     ---=== husix.hcb:78:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:78:27 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
push cs
call _console_writeline
add sp, 4
;     ---=== husix.hcb:79:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:79:27 ===---
push cs
pop es
mov di, ROTULO143
jmp ROTULO142
ROTULO143:
db 0
times 1 db 0
ROTULO142:
push es
push di
push cs
call _console_writeline
add sp, 4
;     ---=== husix.hcb:80:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:80:27 ===---
push cs
pop es
mov di, ROTULO145
jmp ROTULO144
ROTULO145:
db 15
db 60,83,89,83,84,69,77,32,72,65,76,84,69,68,62
times 1 db 0
ROTULO144:
push es
push di
push cs
call _console_writeline
add sp, 4
;     ---=== husix.hcb:81:9 ===---
ROTULO146:
;     ---=== husix.hcb:81:15 ===---
mov ax, 1
cmp ax, 0
jne ROTULO147
jmp ROTULO148
ROTULO147:
;     ---=== husix.hcb:82:17 ===---
cli
;     ---=== husix.hcb:83:17 ===---
hlt
jmp ROTULO146
ROTULO148:
ROTULO135:
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
mov ax, 2923
es mov [di+4], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== Version.hcb:17:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== Version.hcb:17:23 ===---
push cs
pop es
mov di, ROTULO151
jmp ROTULO150
ROTULO151:
db 4
db 65,108,102,97
times 1 db 0
ROTULO150:
push es
push di
push word [bp+6+2]
pop es
mov di, [bp+6]
es pop word [di+6]
es pop word [di+6+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
ROTULO149:
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
;     ---=== System.IO.Console.hcb:7:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Console.hcb:7:25 ===---
mov ax, 3
push ax
push cs
call _io_setvideomode
add sp, 2
ROTULO152:
FIM_console_mode80x25x4:
retf
;     ---=== System.IO.Console.hcb:10:21 ===---
_console_readchar:
;     ---=== System.IO.Console.hcb:11:9 ===---
;     ---=== System.IO.Console.hcb:11:16 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _io_consolereadchar
jmp ROTULO153
ROTULO153:
FIM_console_readchar:
retf
;     ---=== System.IO.Console.hcb:14:16 ===---
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
;     ---=== System.IO.Console.hcb:14:25 ===---
;     ---=== System.IO.Console.hcb:15:13 ===---
;     ---=== System.IO.Console.hcb:16:13 ===---
;     ---=== System.IO.Console.hcb:17:13 ===---
;     ---=== System.IO.Console.hcb:18:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.IO.Console.hcb:18:15 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
xor ax, ax
es mov al, [di+0]
mov [bp+-2], ax
;     ---=== System.IO.Console.hcb:19:10 ===---
; ACAO INC - Incrementa variavel
inc word [bp+6]
;     ---=== System.IO.Console.hcb:20:9 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-4], 0
;     ---=== System.IO.Console.hcb:21:9 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-6], 1
;     ---=== System.IO.Console.hcb:22:9 ===---
ROTULO155:
;     ---=== System.IO.Console.hcb:22:15 ===---
mov ax, 1
cmp ax, 0
jne ROTULO156
jmp ROTULO157
ROTULO156:
;     ---=== System.IO.Console.hcb:23:13 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.IO.Console.hcb:23:17 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _io_consolereadchar
mov [bp+-4], ax
;     ---=== System.IO.Console.hcb:24:13 ===---
;     ---=== System.IO.Console.hcb:24:18 ===---
;     ---=== System.IO.Console.hcb:24:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
push ax
;     ---=== System.IO.Console.hcb:24:21 ===---
mov ax, 13
mov bx, ax
pop ax
cmp ax, bx
je ROTULO160
jmp ROTULO161
ROTULO160:
mov ax, 65535
jmp ROTULO162
ROTULO161:
xor ax, ax
ROTULO162:
cmp ax, 0
jne ROTULO158
jmp ROTULO159
ROTULO158:
;     ---=== System.IO.Console.hcb:24:34 ===---
jmp done
ROTULO159:
;     ---=== System.IO.Console.hcb:25:13 ===---
;     ---=== System.IO.Console.hcb:25:18 ===---
;     ---=== System.IO.Console.hcb:25:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
push ax
;     ---=== System.IO.Console.hcb:25:21 ===---
mov ax, 10
mov bx, ax
pop ax
cmp ax, bx
je ROTULO165
jmp ROTULO166
ROTULO165:
mov ax, 65535
jmp ROTULO167
ROTULO166:
xor ax, ax
ROTULO167:
cmp ax, 0
jne ROTULO163
jmp ROTULO164
ROTULO163:
;     ---=== System.IO.Console.hcb:25:34 ===---
jmp done
ROTULO164:
;     ---=== System.IO.Console.hcb:26:13 ===---
;     ---=== System.IO.Console.hcb:26:18 ===---
;     ---=== System.IO.Console.hcb:26:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
push ax
;     ---=== System.IO.Console.hcb:26:21 ===---
mov ax, 9
mov bx, ax
pop ax
cmp ax, bx
je ROTULO170
jmp ROTULO171
ROTULO170:
mov ax, 65535
jmp ROTULO172
ROTULO171:
xor ax, ax
ROTULO172:
cmp ax, 0
jne ROTULO168
jmp ROTULO169
ROTULO168:
;     ---=== System.IO.Console.hcb:27:17 ===---
;     ---=== System.IO.Console.hcb:27:24 ===---
;     ---=== System.IO.Console.hcb:27:20 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-6]
push ax
;     ---=== System.IO.Console.hcb:27:26 ===---
mov ax, 1
mov bx, ax
pop ax
cmp ax, bx
ja ROTULO175
jmp ROTULO176
ROTULO175:
mov ax, 65535
jmp ROTULO177
ROTULO176:
xor ax, ax
ROTULO177:
cmp ax, 0
jne ROTULO173
jmp ROTULO174
ROTULO173:
;     ---=== System.IO.Console.hcb:28:21 ===---
; ACAO DEC - Decrementa variavel
dec word [bp+-6]
;     ---=== System.IO.Console.hcb:29:22 ===---
; ACAO DEC - Decrementa variavel
dec word [bp+6]
;     ---=== System.IO.Console.hcb:30:21 ===---
; ACAO GRAVACAO - Gravacao de numero em ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov byte [di+0], 0
;     ---=== System.IO.Console.hcb:31:21 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Console.hcb:31:39 ===---
mov ax, 9
push ax
push cs
call _console_writechar
add sp, 2
;     ---=== System.IO.Console.hcb:32:21 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Console.hcb:32:39 ===---
mov ax, 32
push ax
push cs
call _console_writechar
add sp, 2
;     ---=== System.IO.Console.hcb:33:21 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Console.hcb:33:39 ===---
mov ax, 9
push ax
push cs
call _console_writechar
add sp, 2
ROTULO174:
jmp ROTULO178
ROTULO169:
;     ---=== System.IO.Console.hcb:36:17 ===---
;     ---=== System.IO.Console.hcb:36:24 ===---
;     ---=== System.IO.Console.hcb:36:20 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-6]
push ax
;     ---=== System.IO.Console.hcb:36:26 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
mov bx, ax
pop ax
cmp ax, bx
jb ROTULO181
jmp ROTULO182
ROTULO181:
mov ax, 65535
jmp ROTULO183
ROTULO182:
xor ax, ax
ROTULO183:
cmp ax, 0
jne ROTULO179
jmp ROTULO180
ROTULO179:
;     ---=== System.IO.Console.hcb:37:21 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Console.hcb:37:39 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
push ax
push cs
call _console_writechar
add sp, 2
;     ---=== System.IO.Console.hcb:38:21 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.IO.Console.hcb:38:27 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov [di+0], al
;     ---=== System.IO.Console.hcb:39:21 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-6]
;     ---=== System.IO.Console.hcb:40:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+6]
ROTULO180:
ROTULO178:
jmp ROTULO155
ROTULO157:
;     ---=== System.IO.Console.hcb:44:9 ===---
done:
;     ---=== System.IO.Console.hcb:45:9 ===---
; ACAO GRAVACAO - Gravacao de numero em ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov byte [di+0], 0
ROTULO154:
mov sp, bp
pop bp
FIM_console_readline:
retf
;     ---=== System.IO.Console.hcb:48:16 ===---
_console_writechar:
push bp
mov bp, sp
; ARG: c TAM: 2 POS: BP+6 
;     ---=== System.IO.Console.hcb:48:26 ===---
;     ---=== System.IO.Console.hcb:49:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Console.hcb:49:29 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
push ax
push cs
call _io_consolewritechar
add sp, 2
ROTULO184:
mov sp, bp
pop bp
FIM_console_writechar:
retf
;     ---=== System.IO.Console.hcb:52:16 ===---
_console_write:
push bp
mov bp, sp
; ARG: txt TAM: 4 POS: BP+6 
;     ---=== System.IO.Console.hcb:52:22 ===---
;     ---=== System.IO.Console.hcb:54:10 ===---
; ACAO INC - Incrementa variavel
inc word [bp+6]
;     ---=== System.IO.Console.hcb:55:9 ===---
ROTULO186:
;     ---=== System.IO.Console.hcb:55:19 ===---
;     ---=== System.IO.Console.hcb:55:15 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== System.IO.Console.hcb:55:21 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
ja ROTULO189
jmp ROTULO190
ROTULO189:
mov ax, 65535
jmp ROTULO191
ROTULO190:
xor ax, ax
ROTULO191:
cmp ax, 0
jne ROTULO187
jmp ROTULO188
ROTULO187:
;     ---=== System.IO.Console.hcb:56:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Console.hcb:56:23 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Console.hcb:56:47 ===---
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
;     ---=== System.IO.Console.hcb:57:14 ===---
; ACAO INC - Incrementa variavel
inc word [bp+6]
jmp ROTULO186
ROTULO188:
ROTULO185:
mov sp, bp
pop bp
FIM_console_write:
retf
;     ---=== System.IO.Console.hcb:61:16 ===---
_console_writeline:
push bp
mov bp, sp
; ARG: txt TAM: 4 POS: BP+6 
;     ---=== System.IO.Console.hcb:61:26 ===---
;     ---=== System.IO.Console.hcb:62:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Console.hcb:62:15 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
push cs
call _console_write
add sp, 4
;     ---=== System.IO.Console.hcb:63:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Console.hcb:63:19 ===---
mov ax, 13
push ax
push cs
call _console_writechar
add sp, 2
;     ---=== System.IO.Console.hcb:64:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Console.hcb:64:19 ===---
mov ax, 10
push ax
push cs
call _console_writechar
add sp, 2
ROTULO192:
mov sp, bp
pop bp
FIM_console_writeline:
retf
;     ---=== System.IO.Console.hcb:67:16 ===---
_console_writeuint16:
push bp
mov bp, sp
sub sp, 4
push cs
call _os_stackcheck
; ARG: nro TAM: 2 POS: BP+6 
; ARG: tmp TAM: 2 POS: BP--2 
; ARG: prox TAM: 2 POS: BP--4 
;     ---=== System.IO.Console.hcb:67:28 ===---
;     ---=== System.IO.Console.hcb:68:13 ===---
;     ---=== System.IO.Console.hcb:69:13 ===---
;     ---=== System.IO.Console.hcb:70:13 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.IO.Console.hcb:70:23 ===---
;     ---=== System.IO.Console.hcb:70:19 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
push ax
;     ---=== System.IO.Console.hcb:70:27 ===---
mov ax, 10
cmp ax, 0
jne ROTULO194
;     ---=== System.IO.Console.hcb:70:27 ===---
mov ax, _console
mov [bp+-8], ax
mov ax, 70
mov [bp+-10], ax
mov ax, 1
cs jmp word [_os_trycode]
ROTULO194:
mov bx, ax
pop ax
xor dx, dx
div bx
mov ax, dx
mov [bp+-2], ax
;     ---=== System.IO.Console.hcb:71:13 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.IO.Console.hcb:71:24 ===---
;     ---=== System.IO.Console.hcb:71:20 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
push ax
;     ---=== System.IO.Console.hcb:71:26 ===---
mov ax, 10
cmp ax, 0
jne ROTULO195
;     ---=== System.IO.Console.hcb:71:26 ===---
mov ax, _console
mov [bp+-8], ax
mov ax, 71
mov [bp+-10], ax
mov ax, 1
cs jmp word [_os_trycode]
ROTULO195:
mov bx, ax
pop ax
xor dx, dx
div bx
mov [bp+-4], ax
;     ---=== System.IO.Console.hcb:72:9 ===---
;     ---=== System.IO.Console.hcb:72:17 ===---
;     ---=== System.IO.Console.hcb:72:12 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
push ax
;     ---=== System.IO.Console.hcb:72:19 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
ja ROTULO198
jmp ROTULO199
ROTULO198:
mov ax, 65535
jmp ROTULO200
ROTULO199:
xor ax, ax
ROTULO200:
cmp ax, 0
jne ROTULO196
jmp ROTULO197
ROTULO196:
;     ---=== System.IO.Console.hcb:72:26 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Console.hcb:72:38 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
push ax
push cs
call _console_writeuint16
add sp, 2
ROTULO197:
;     ---=== System.IO.Console.hcb:73:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Console.hcb:73:22 ===---
;     ---=== System.IO.Console.hcb:73:24 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== System.IO.Console.hcb:73:19 ===---
mov ax, 48
pop bx
add ax, bx
push ax
push cs
call _console_writechar
add sp, 2
ROTULO193:
mov sp, bp
pop bp
FIM_console_writeuint16:
retf
;     ---=== System.IO.Console.hcb:76:16 ===---
_console_writeint16:
push bp
mov bp, sp
; ARG: nro TAM: 2 POS: BP+6 
;     ---=== System.IO.Console.hcb:76:27 ===---
;     ---=== System.IO.Console.hcb:77:9 ===---
;     ---=== System.IO.Console.hcb:77:16 ===---
;     ---=== System.IO.Console.hcb:77:12 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
push ax
;     ---=== System.IO.Console.hcb:77:18 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
jl ROTULO204
jmp ROTULO205
ROTULO204:
mov ax, 65535
jmp ROTULO206
ROTULO205:
xor ax, ax
ROTULO206:
cmp ax, 0
jne ROTULO202
jmp ROTULO203
ROTULO202:
;     ---=== System.IO.Console.hcb:78:17 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.IO.Console.hcb:78:23 ===---
;     ---=== System.IO.Console.hcb:78:24 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
push ax
;     ---=== System.IO.Console.hcb:78:23 ===---
xor ax, ax
pop bx
sub ax, bx
mov [bp+6], ax
ROTULO203:
;     ---=== System.IO.Console.hcb:80:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Console.hcb:80:21 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
push ax
push cs
call _console_writeuint16
add sp, 2
ROTULO201:
mov sp, bp
pop bp
FIM_console_writeint16:
retf
;     ---=== System.IO.Console.hcb:83:16 ===---
_console_writeuint8:
push bp
mov bp, sp
; ARG: nro TAM: 2 POS: BP+6 
;     ---=== System.IO.Console.hcb:83:27 ===---
;     ---=== System.IO.Console.hcb:84:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Console.hcb:84:21 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
push ax
push cs
call _console_writeuint16
add sp, 2
ROTULO207:
mov sp, bp
pop bp
FIM_console_writeuint8:
retf
;     ---=== System.IO.Console.hcb:87:16 ===---
_console_writeint8:
push bp
mov bp, sp
; ARG: nro TAM: 2 POS: BP+6 
;     ---=== System.IO.Console.hcb:87:26 ===---
;     ---=== System.IO.Console.hcb:88:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Console.hcb:88:20 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
push ax
push cs
call _console_writeint16
add sp, 2
ROTULO208:
mov sp, bp
pop bp
FIM_console_writeint8:
retf
; MODULO FIM: console
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
ROTULO209:
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
ROTULO210:
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
ROTULO211:
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
ROTULO212:
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
ROTULO213:
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
jmp ROTULO214
ROTULO214:
mov sp, bp
pop bp
FIM_io_gethandler:
retf
;     ---=== System.IO.hcb:52:21 ===---
_io_consoleavail:
ROTULO215:
FIM_io_consoleavail:
retf
;     ---=== System.IO.hcb:56:21 ===---
_io_consolereadchar:
ROTULO216:
FIM_io_consolereadchar:
retf
;     ---=== System.IO.hcb:60:16 ===---
_io_consolewritechar:
push bp
mov bp, sp
; ARG: c TAM: 2 POS: BP+6 
;     ---=== System.IO.hcb:60:33 ===---
;     ---=== System.IO.hcb:61:13 ===---
mov ax, [bp+6]
;     ---=== System.IO.hcb:62:13 ===---
mov ah, 0xe
;     ---=== System.IO.hcb:63:13 ===---
int 0x10
ROTULO217:
mov sp, bp
pop bp
FIM_io_consolewritechar:
retf
;     ---=== System.IO.hcb:66:16 ===---
_io_setvideomode:
push bp
mov bp, sp
; ARG: mode TAM: 2 POS: BP+6 
;     ---=== System.IO.hcb:66:29 ===---
;     ---=== System.IO.hcb:67:13 ===---
mov ax, [bp+6]
;     ---=== System.IO.hcb:68:13 ===---
int 0x10
ROTULO218:
mov sp, bp
pop bp
FIM_io_setvideomode:
retf
;     ---=== System.IO.hcb:71:16 ===---
_io_disableinterrupts:
;     ---=== System.IO.hcb:72:13 ===---
cli
ROTULO219:
FIM_io_disableinterrupts:
retf
;     ---=== System.IO.hcb:75:16 ===---
_io_enableinterrupts:
;     ---=== System.IO.hcb:76:13 ===---
sti
ROTULO220:
FIM_io_enableinterrupts:
retf
; MODULO FIM: io
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
jb ROTULO224
jmp ROTULO225
ROTULO224:
mov ax, 65535
jmp ROTULO226
ROTULO225:
xor ax, ax
ROTULO226:
cmp ax, 0
jne ROTULO222
jmp ROTULO223
ROTULO222:
;     ---=== System.Text.hcb:4:25 ===---
;     ---=== System.Text.hcb:4:32 ===---
mov ax, 1
jmp ROTULO221
ROTULO223:
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
jae ROTULO232
jmp ROTULO233
ROTULO232:
mov ax, 65535
jmp ROTULO234
ROTULO233:
xor ax, ax
ROTULO234:
cmp ax, 0
je ROTULO230
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
jbe ROTULO235
jmp ROTULO236
ROTULO235:
mov ax, 65535
jmp ROTULO237
ROTULO236:
xor ax, ax
ROTULO237:
cmp ax, 0
je ROTULO230
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
;     ---=== System.Text.hcb:5:45 ===---
;     ---=== System.Text.hcb:5:52 ===---
mov ax, 2
jmp ROTULO221
ROTULO228:
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
jae ROTULO243
jmp ROTULO244
ROTULO243:
mov ax, 65535
jmp ROTULO245
ROTULO244:
xor ax, ax
ROTULO245:
cmp ax, 0
je ROTULO241
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
jbe ROTULO246
jmp ROTULO247
ROTULO246:
mov ax, 65535
jmp ROTULO248
ROTULO247:
xor ax, ax
ROTULO248:
cmp ax, 0
je ROTULO241
ROTULO240:
mov ax, 65535
jmp ROTULO242
ROTULO241:
xor ax, ax
ROTULO242:
cmp ax, 0
jne ROTULO238
jmp ROTULO239
ROTULO238:
;     ---=== System.Text.hcb:6:45 ===---
;     ---=== System.Text.hcb:6:52 ===---
mov ax, 3
jmp ROTULO221
ROTULO239:
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
jae ROTULO254
jmp ROTULO255
ROTULO254:
mov ax, 65535
jmp ROTULO256
ROTULO255:
xor ax, ax
ROTULO256:
cmp ax, 0
je ROTULO252
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
jbe ROTULO257
jmp ROTULO258
ROTULO257:
mov ax, 65535
jmp ROTULO259
ROTULO258:
xor ax, ax
ROTULO259:
cmp ax, 0
je ROTULO252
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
;     ---=== System.Text.hcb:7:45 ===---
;     ---=== System.Text.hcb:7:52 ===---
mov ax, 4
jmp ROTULO221
ROTULO250:
;     ---=== System.Text.hcb:8:9 ===---
;     ---=== System.Text.hcb:8:16 ===---
mov ax, 1
jmp ROTULO221
ROTULO221:
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
jb ROTULO263
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
;     ---=== System.Text.hcb:12:25 ===---
;     ---=== System.Text.hcb:12:32 ===---
; ACAO LEITURA - Le ponteiro
xor ax, ax
es mov al, [di+0]
jmp ROTULO260
ROTULO262:
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
je ROTULO268
jmp ROTULO269
ROTULO268:
mov ax, 65535
jmp ROTULO270
ROTULO269:
xor ax, ax
ROTULO270:
cmp ax, 0
jne ROTULO266
jmp ROTULO267
ROTULO266:
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
je ROTULO273
jmp ROTULO274
ROTULO273:
mov ax, 65535
jmp ROTULO275
ROTULO274:
xor ax, ax
ROTULO275:
cmp ax, 0
jne ROTULO271
jmp ROTULO272
ROTULO271:
;     ---=== System.Text.hcb:15:31 ===---
;     ---=== System.Text.hcb:15:38 ===---
mov ax, 128
jmp ROTULO260
ROTULO272:
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
je ROTULO278
jmp ROTULO279
ROTULO278:
mov ax, 65535
jmp ROTULO280
ROTULO279:
xor ax, ax
ROTULO280:
cmp ax, 0
jne ROTULO276
jmp ROTULO277
ROTULO276:
;     ---=== System.Text.hcb:16:31 ===---
;     ---=== System.Text.hcb:16:38 ===---
mov ax, 135
jmp ROTULO260
ROTULO277:
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
je ROTULO283
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
;     ---=== System.Text.hcb:17:31 ===---
;     ---=== System.Text.hcb:17:38 ===---
mov ax, 65
jmp ROTULO260
ROTULO282:
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
je ROTULO288
jmp ROTULO289
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
;     ---=== System.Text.hcb:18:31 ===---
;     ---=== System.Text.hcb:18:38 ===---
mov ax, 97
jmp ROTULO260
ROTULO287:
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
je ROTULO293
jmp ROTULO294
ROTULO293:
mov ax, 65535
jmp ROTULO295
ROTULO294:
xor ax, ax
ROTULO295:
cmp ax, 0
jne ROTULO291
jmp ROTULO292
ROTULO291:
;     ---=== System.Text.hcb:19:31 ===---
;     ---=== System.Text.hcb:19:38 ===---
mov ax, 79
jmp ROTULO260
ROTULO292:
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
je ROTULO298
jmp ROTULO299
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
;     ---=== System.Text.hcb:20:31 ===---
;     ---=== System.Text.hcb:20:38 ===---
mov ax, 162
jmp ROTULO260
ROTULO297:
ROTULO267:
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
je ROTULO303
jmp ROTULO304
ROTULO303:
mov ax, 65535
jmp ROTULO305
ROTULO304:
xor ax, ax
ROTULO305:
cmp ax, 0
jne ROTULO301
jmp ROTULO302
ROTULO301:
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
je ROTULO308
jmp ROTULO309
ROTULO308:
mov ax, 65535
jmp ROTULO310
ROTULO309:
xor ax, ax
ROTULO310:
cmp ax, 0
jne ROTULO306
jmp ROTULO307
ROTULO306:
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
je ROTULO313
jmp ROTULO314
ROTULO313:
mov ax, 65535
jmp ROTULO315
ROTULO314:
xor ax, ax
ROTULO315:
cmp ax, 0
jne ROTULO311
jmp ROTULO312
ROTULO311:
;     ---=== System.Text.hcb:26:35 ===---
;     ---=== System.Text.hcb:26:42 ===---
mov ax, 1
jmp ROTULO260
ROTULO312:
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
je ROTULO318
jmp ROTULO319
ROTULO318:
mov ax, 65535
jmp ROTULO320
ROTULO319:
xor ax, ax
ROTULO320:
cmp ax, 0
jne ROTULO316
jmp ROTULO317
ROTULO316:
;     ---=== System.Text.hcb:27:35 ===---
;     ---=== System.Text.hcb:27:42 ===---
mov ax, 2
jmp ROTULO260
ROTULO317:
ROTULO307:
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
je ROTULO323
jmp ROTULO324
ROTULO323:
mov ax, 65535
jmp ROTULO325
ROTULO324:
xor ax, ax
ROTULO325:
cmp ax, 0
jne ROTULO321
jmp ROTULO322
ROTULO321:
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
je ROTULO328
jmp ROTULO329
ROTULO328:
mov ax, 65535
jmp ROTULO330
ROTULO329:
xor ax, ax
ROTULO330:
cmp ax, 0
jne ROTULO326
jmp ROTULO327
ROTULO326:
;     ---=== System.Text.hcb:31:35 ===---
;     ---=== System.Text.hcb:31:42 ===---
mov ax, 3
jmp ROTULO260
ROTULO327:
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
je ROTULO333
jmp ROTULO334
ROTULO333:
mov ax, 65535
jmp ROTULO335
ROTULO334:
xor ax, ax
ROTULO335:
cmp ax, 0
jne ROTULO331
jmp ROTULO332
ROTULO331:
;     ---=== System.Text.hcb:32:35 ===---
;     ---=== System.Text.hcb:32:42 ===---
mov ax, 4
jmp ROTULO260
ROTULO332:
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
je ROTULO338
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
;     ---=== System.Text.hcb:33:35 ===---
;     ---=== System.Text.hcb:33:42 ===---
mov ax, 5
jmp ROTULO260
ROTULO337:
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
;     ---=== System.Text.hcb:34:35 ===---
;     ---=== System.Text.hcb:34:42 ===---
mov ax, 6
jmp ROTULO260
ROTULO342:
ROTULO322:
ROTULO302:
;     ---=== System.Text.hcb:37:9 ===---
;     ---=== System.Text.hcb:37:16 ===---
mov ax, 63
jmp ROTULO260
ROTULO260:
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
;     ---=== System.Threading.hcb:101:9 ===---
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
ROTULO346:
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
ROTULO348:
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
jbe ROTULO351
jmp ROTULO352
ROTULO351:
mov ax, 65535
jmp ROTULO353
ROTULO352:
xor ax, ax
ROTULO353:
cmp ax, 0
jne ROTULO349
jmp ROTULO350
ROTULO349:
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
push es
push di
es pop word [di+18]
es pop word [di+18+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Threading.hcb:84:13 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:84:26 ===---
; ACAO LEITURA - Le ponteiro
push es
push di
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
je ROTULO356
jmp ROTULO357
ROTULO356:
mov ax, 65535
jmp ROTULO358
ROTULO357:
xor ax, ax
ROTULO358:
cmp ax, 0
jne ROTULO354
jmp ROTULO355
ROTULO354:
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
;     ---=== System.Threading.hcb:90:17 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:90:32 ===---
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
;     ---=== System.Threading.hcb:91:17 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:91:36 ===---
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
ROTULO355:
;     ---=== System.Threading.hcb:76:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-2]
jmp ROTULO348
ROTULO350:
;     ---=== System.Threading.hcb:94:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Threading.hcb:94:37 ===---
mov ax, 1
push ax
;     ---=== System.Threading.hcb:94:30 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_multithreading_inuse+2]
pop es
cs mov di, [_multithreading_inuse]
push es
push di
push cs
call _semaphore_initialize
add sp, 6
;     ---=== System.Threading.hcb:95:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:95:31 ===---
mov ax, 1
cs push word [_multithreading_kernelthread+2]
pop es
cs mov di, [_multithreading_kernelthread]
es mov [di+2], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Threading.hcb:96:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:96:34 ===---
xor ax, ax
es mov [di+4], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Threading.hcb:97:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Threading.hcb:97:34 ===---
push cs
pop es
mov di, _multithreading_int81
push es
push di
;     ---=== System.Threading.hcb:97:28 ===---
mov ax, 129
push ax
push cs
call _io_registerhandler
add sp, 6
ROTULO347:
mov sp, bp
pop bp
FIM_multithreading_initialize:
retf
;     ---=== System.Threading.hcb:103:9 ===---
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
;     ---=== System.Threading.hcb:103:15 ===---
;     ---=== System.Threading.hcb:103:29 ===---
;     ---=== System.Threading.hcb:106:9 ===---
;     ---=== System.Threading.hcb:106:26 ===---
;     ---=== System.Threading.hcb:106:13 ===---
; ACAO STRUCTURE - Leitura de Desvio de Ponteiro
cs push word [_multithreading_current+2]
pop es
cs mov di, [_multithreading_current]
es mov ax, [di+18]
push ax
;     ---=== System.Threading.hcb:106:29 ===---
xor ax, ax
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
;     ---=== System.Threading.hcb:106:36 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:106:51 ===---
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
ROTULO361:
;     ---=== System.Threading.hcb:107:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:107:32 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+2]
es mov [di+14], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Threading.hcb:108:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:108:32 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+4]
es mov [di+16], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Threading.hcb:109:9 ===---
find_next:
;     ---=== System.Threading.hcb:110:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.Threading.hcb:110:21 ===---
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
;     ---=== System.Threading.hcb:111:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.Threading.hcb:111:19 ===---
; ACAO LEITURA - Le ponteiro
push es
cs pop word [_multithreading_current+2]
cs mov [_multithreading_current], di
;     ---=== System.Threading.hcb:112:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.Threading.hcb:112:14 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 14
es mov ax, [di+14]
mov [bp+2], ax
;     ---=== System.Threading.hcb:113:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.Threading.hcb:113:14 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 16
es mov ax, [di+16]
mov [bp+4], ax
;     ---=== System.Threading.hcb:114:9 ===---
;     ---=== System.Threading.hcb:114:12 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 4
es mov ax, [di+4]
cmp ax, 0
jne ROTULO365
jmp ROTULO366
ROTULO365:
;     ---=== System.Threading.hcb:114:40 ===---
jmp find_next
ROTULO366:
;     ---=== System.Threading.hcb:115:9 ===---
;     ---=== System.Threading.hcb:115:12 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 6
es mov ax, [di+6]
cmp ax, 0
jne ROTULO367
jmp ROTULO368
ROTULO367:
;     ---=== System.Threading.hcb:116:13 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:116:32 ===---
xor ax, ax
es mov [di+6], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Threading.hcb:117:13 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.Threading.hcb:117:25 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - Ponteiro Byte - Desvio 10
es push word [di+10+2]
es push word [di+10]
pop di
pop es
push es
cs pop word [_multithreading_int81temp+2]
cs mov [_multithreading_int81temp], di
;     ---=== System.Threading.hcb:118:17 ===---
mov ax, [bp+2]
;     ---=== System.Threading.hcb:119:17 ===---
mov bx, [bp+4]
;     ---=== System.Threading.hcb:120:17 ===---
cli
;     ---=== System.Threading.hcb:121:17 ===---
mov ss, ax
;     ---=== System.Threading.hcb:122:17 ===---
mov sp, ax
;     ---=== System.Threading.hcb:123:17 ===---
sti
;     ---=== System.Threading.hcb:124:17 ===---
push cs
;     ---=== System.Threading.hcb:125:17 ===---
mov ax, _thread_endthread
;     ---=== System.Threading.hcb:126:17 ===---
push ax
;     ---=== System.Threading.hcb:127:17 ===---
pushf
;     ---=== System.Threading.hcb:128:17 ===---
cs push word [_multithreading_int81temp+2]
;     ---=== System.Threading.hcb:129:17 ===---
cs push word [_multithreading_int81temp]
;     ---=== System.Threading.hcb:130:17 ===---
mov ax, ss
;     ---=== System.Threading.hcb:131:17 ===---
mov es, ax
;     ---=== System.Threading.hcb:132:17 ===---
mov ds, ax
;     ---=== System.Threading.hcb:133:17 ===---
jmp FIM_multithreading_int81
ROTULO368:
ROTULO359:
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
;     ---=== System.Threading.hcb:138:21 ===---
_multithreading_requestnew:
push bp
mov bp, sp
sub sp, 10
push cs
call _os_stackcheck
; ARG: ptr TAM: 4 POS: BP--4 
; ARG: t TAM: 4 POS: BP--8 
; ARG: i TAM: 2 POS: BP--10 
;     ---=== System.Threading.hcb:139:13 ===---
;     ---=== System.Threading.hcb:140:13 ===---
;     ---=== System.Threading.hcb:141:13 ===---
;     ---=== System.Threading.hcb:142:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Threading.hcb:142:27 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_multithreading_inuse+2]
pop es
cs mov di, [_multithreading_inuse]
push es
push di
push cs
call _semaphore_waitone
add sp, 4
;     ---=== System.Threading.hcb:143:22 ===---
;     ---=== System.Threading.hcb:143:22 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-10], 1
ROTULO370:
;     ---=== System.Threading.hcb:143:22 ===---
;     ---=== System.Threading.hcb:143:22 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-10]
push ax
;     ---=== System.Threading.hcb:143:22 ===---
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
;     ---=== System.Threading.hcb:144:13 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.Threading.hcb:144:17 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Threading.hcb:144:22 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-10]
push ax
push cs
call _multithreading_item
add sp, 2
push es
pop word [bp+-8+2]
mov [bp+-8], di
;     ---=== System.Threading.hcb:145:13 ===---
;     ---=== System.Threading.hcb:145:25 ===---
;     ---=== System.Threading.hcb:145:16 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 2
es mov ax, [di+2]
push ax
;     ---=== System.Threading.hcb:145:28 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO378
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
;     ---=== System.Threading.hcb:146:17 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:146:28 ===---
mov ax, 1
es mov [di+2], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Threading.hcb:147:17 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:147:31 ===---
mov ax, 1
es mov [di+4], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Threading.hcb:148:17 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:148:31 ===---
xor ax, ax
es mov [di+8], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Threading.hcb:149:17 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Threading.hcb:149:35 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_multithreading_inuse+2]
pop es
cs mov di, [_multithreading_inuse]
push es
push di
push cs
call _semaphore_release
add sp, 4
;     ---=== System.Threading.hcb:150:17 ===---
;     ---=== System.Threading.hcb:150:24 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-8+2]
pop es
mov di, [bp+-8]
jmp ROTULO369
ROTULO377:
;     ---=== System.Threading.hcb:143:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-10]
jmp ROTULO370
ROTULO372:
;     ---=== System.Threading.hcb:153:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Threading.hcb:153:27 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_multithreading_inuse+2]
pop es
cs mov di, [_multithreading_inuse]
push es
push di
push cs
call _semaphore_release
add sp, 4
;     ---=== System.Threading.hcb:154:15 ===---
mov ax, _multithreading
mov [bp+-8], ax
mov ax, 154
mov [bp+-10], ax
mov ax, 9
cs jmp word [_os_trycode]
ROTULO369:
mov sp, bp
pop bp
FIM_multithreading_requestnew:
retf
;     ---=== System.Threading.hcb:158:21 ===---
_multithreading_item:
push bp
mov bp, sp
sub sp, 4
push cs
call _os_stackcheck
; ARG: i TAM: 2 POS: BP+6 
; ARG: ptr TAM: 4 POS: BP--4 
;     ---=== System.Threading.hcb:158:26 ===---
;     ---=== System.Threading.hcb:159:13 ===---
;     ---=== System.Threading.hcb:160:9 ===---
; ACAO DEC - Decrementa variavel
dec word [bp+6]
;     ---=== System.Threading.hcb:161:9 ===---
;     ---=== System.Threading.hcb:161:14 ===---
;     ---=== System.Threading.hcb:161:12 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
push ax
;     ---=== System.Threading.hcb:161:17 ===---
mov ax, 128
mov bx, ax
pop ax
cmp ax, bx
jae ROTULO384
jmp ROTULO385
ROTULO384:
mov ax, 65535
jmp ROTULO386
ROTULO385:
xor ax, ax
ROTULO386:
cmp ax, 0
jne ROTULO382
jmp ROTULO383
ROTULO382:
;     ---=== System.Threading.hcb:161:32 ===---
mov ax, _multithreading
mov [bp+-8], ax
mov ax, 161
mov [bp+-10], ax
mov ax, 5
cs jmp word [_os_trycode]
ROTULO383:
;     ---=== System.Threading.hcb:162:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.Threading.hcb:162:15 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_multithreading_list+2]
pop es
cs mov di, [_multithreading_list]
push es
pop word [bp+-4+2]
mov [bp+-4], di
;     ---=== System.Threading.hcb:163:10 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.Threading.hcb:163:21 ===---
;     ---=== System.Threading.hcb:163:26 ===---
;     ---=== System.Threading.hcb:163:28 ===---
; ACAO CHAMADA - Calcula tamanho de item
mov ax, 26
push ax
;     ---=== System.Threading.hcb:163:24 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
pop bx
mul bx
push ax
;     ---=== System.Threading.hcb:163:17 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
pop bx
add ax, bx
mov [bp+-4], ax
;     ---=== System.Threading.hcb:164:9 ===---
;     ---=== System.Threading.hcb:164:16 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-4+2]
pop es
mov di, [bp+-4]
jmp ROTULO381
ROTULO381:
mov sp, bp
pop bp
FIM_multithreading_item:
retf
;     ---=== System.Threading.hcb:168:21 ===---
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
;     ---=== System.Threading.hcb:169:13 ===---
;     ---=== System.Threading.hcb:170:13 ===---
;     ---=== System.Threading.hcb:171:13 ===---
;     ---=== System.Threading.hcb:172:13 ===---
;     ---=== System.Threading.hcb:173:9 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-12], 0
;     ---=== System.Threading.hcb:174:22 ===---
;     ---=== System.Threading.hcb:174:22 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-10], 1
ROTULO388:
;     ---=== System.Threading.hcb:174:22 ===---
;     ---=== System.Threading.hcb:174:22 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-10]
push ax
;     ---=== System.Threading.hcb:174:22 ===---
mov ax, 128
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO391
jmp ROTULO392
ROTULO391:
mov ax, 65535
jmp ROTULO393
ROTULO392:
xor ax, ax
ROTULO393:
cmp ax, 0
jne ROTULO389
jmp ROTULO390
ROTULO389:
;     ---=== System.Threading.hcb:175:13 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.Threading.hcb:175:19 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Threading.hcb:175:24 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-10]
push ax
push cs
call _multithreading_item
add sp, 2
push es
pop word [bp+-4+2]
mov [bp+-4], di
;     ---=== System.Threading.hcb:176:14 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO GRAVACAO - Grava segmento em variavel
;     ---=== System.Threading.hcb:176:19 ===---
; ACAO LEITURA - Le segmento em variavel
mov ax, [bp+-4+2]
mov word [bp+-8+2], ax
;     ---=== System.Threading.hcb:177:14 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.Threading.hcb:177:19 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
mov [bp+-8], ax
;     ---=== System.Threading.hcb:178:13 ===---
;     ---=== System.Threading.hcb:178:25 ===---
;     ---=== System.Threading.hcb:178:16 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 2
push word [bp+-8+2]
pop es
mov di, [bp+-8]
es mov ax, [di+2]
push ax
;     ---=== System.Threading.hcb:178:28 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
jne ROTULO396
jmp ROTULO397
ROTULO396:
mov ax, 65535
jmp ROTULO398
ROTULO397:
xor ax, ax
ROTULO398:
cmp ax, 0
jne ROTULO394
jmp ROTULO395
ROTULO394:
;     ---=== System.Threading.hcb:178:35 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-12]
ROTULO395:
;     ---=== System.Threading.hcb:174:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-10]
jmp ROTULO388
ROTULO390:
;     ---=== System.Threading.hcb:180:9 ===---
;     ---=== System.Threading.hcb:180:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-12]
jmp ROTULO387
ROTULO387:
mov sp, bp
pop bp
FIM_multithreading_count:
retf
;     ---=== System.Threading.hcb:184:16 ===---
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
;     ---=== System.Threading.hcb:184:28 ===---
;     ---=== System.Threading.hcb:185:13 ===---
;     ---=== System.Threading.hcb:186:13 ===---
;     ---=== System.Threading.hcb:187:13 ===---
;     ---=== System.Threading.hcb:188:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.Threading.hcb:188:18 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _multithreading_isactive
mov [bp+-2], ax
;     ---=== System.Threading.hcb:189:9 ===---
;     ---=== System.Threading.hcb:189:12 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
cmp ax, 0
jne ROTULO400
jmp ROTULO401
ROTULO400:
;     ---=== System.Threading.hcb:189:24 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _multithreading_suspend
ROTULO401:
;     ---=== System.Threading.hcb:190:10 ===---
; ACAO GRAVACAO - Grava segmento em variavel
;     ---=== System.Threading.hcb:190:18 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO LEITURA - Le segmento em variavel
mov ax, [bp+6+2]
mov word [bp+-10+2], ax
;     ---=== System.Threading.hcb:191:10 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.Threading.hcb:191:18 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
mov [bp+-10], ax
;     ---=== System.Threading.hcb:192:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.Threading.hcb:192:16 ===---
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
;     ---=== System.Threading.hcb:193:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:193:24 ===---
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
;     ---=== System.Threading.hcb:194:10 ===---
; ACAO GRAVACAO - Grava segmento em variavel
;     ---=== System.Threading.hcb:194:18 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO LEITURA - Le segmento em variavel
cs mov ax, [_multithreading_current+2]
mov word [bp+-10+2], ax
;     ---=== System.Threading.hcb:195:10 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.Threading.hcb:195:18 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO LEITURA - Le variavel
cs mov ax, [_multithreading_current]
mov [bp+-10], ax
;     ---=== System.Threading.hcb:196:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:196:22 ===---
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
;     ---=== System.Threading.hcb:197:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:197:18 ===---
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
;     ---=== System.Threading.hcb:198:9 ===---
;     ---=== System.Threading.hcb:198:12 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
cmp ax, 0
jne ROTULO402
jmp ROTULO403
ROTULO402:
;     ---=== System.Threading.hcb:198:24 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _multithreading_resume
ROTULO403:
ROTULO399:
mov sp, bp
pop bp
FIM_multithreading_startthread:
retf
;     ---=== System.Threading.hcb:202:21 ===---
_multithreading_isactive:
;     ---=== System.Threading.hcb:203:9 ===---
;     ---=== System.Threading.hcb:203:16 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_multithreading_active]
jmp ROTULO404
ROTULO404:
FIM_multithreading_isactive:
retf
;     ---=== System.Threading.hcb:207:16 ===---
_multithreading_suspend:
;     ---=== System.Threading.hcb:208:9 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_multithreading_active], 0
ROTULO405:
FIM_multithreading_suspend:
retf
;     ---=== System.Threading.hcb:212:16 ===---
_multithreading_resume:
;     ---=== System.Threading.hcb:213:9 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_multithreading_active], 1
ROTULO406:
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
ROTULO407:
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
jbe ROTULO411
jmp ROTULO412
ROTULO411:
mov ax, 65535
jmp ROTULO413
ROTULO412:
xor ax, ax
ROTULO413:
cmp ax, 0
jne ROTULO409
jmp ROTULO410
ROTULO409:
;     ---=== System.Collections.hcb:33:34 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-2], 15
ROTULO410:
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
jbe ROTULO416
jmp ROTULO417
ROTULO416:
mov ax, 65535
jmp ROTULO418
ROTULO417:
xor ax, ax
ROTULO418:
cmp ax, 0
jne ROTULO414
jmp ROTULO415
ROTULO414:
;     ---=== System.Collections.hcb:34:35 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-2], 7
ROTULO415:
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
jbe ROTULO421
jmp ROTULO422
ROTULO421:
mov ax, 65535
jmp ROTULO423
ROTULO422:
xor ax, ax
ROTULO423:
cmp ax, 0
jne ROTULO419
jmp ROTULO420
ROTULO419:
;     ---=== System.Collections.hcb:35:35 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-2], 3
ROTULO420:
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
ja ROTULO426
jmp ROTULO427
ROTULO426:
mov ax, 65535
jmp ROTULO428
ROTULO427:
xor ax, ax
ROTULO428:
cmp ax, 0
jne ROTULO424
jmp ROTULO425
ROTULO424:
;     ---=== System.Collections.hcb:36:34 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-2], 1
ROTULO425:
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
jmp ROTULO408
ROTULO408:
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
ROTULO429:
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
jmp ROTULO430
ROTULO430:
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
jmp ROTULO431
ROTULO431:
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
jmp ROTULO432
ROTULO432:
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
je ROTULO436
jmp ROTULO437
ROTULO436:
mov ax, 65535
jmp ROTULO438
ROTULO437:
xor ax, ax
ROTULO438:
cmp ax, 0
jne ROTULO434
jmp ROTULO435
ROTULO434:
;     ---=== System.Collections.hcb:76:31 ===---
mov ax, _list
mov [bp+-8], ax
mov ax, 76
mov [bp+-10], ax
mov ax, 5
cs jmp word [_os_trycode]
ROTULO435:
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
ja ROTULO441
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
;     ---=== System.Collections.hcb:77:36 ===---
mov ax, _list
mov [bp+-8], ax
mov ax, 77
mov [bp+-10], ax
mov ax, 5
cs jmp word [_os_trycode]
ROTULO440:
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
ROTULO444:
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
jbe ROTULO447
jmp ROTULO448
ROTULO447:
mov ax, 65535
jmp ROTULO449
ROTULO448:
xor ax, ax
ROTULO449:
cmp ax, 0
jne ROTULO445
jmp ROTULO446
ROTULO445:
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
je ROTULO452
jmp ROTULO453
ROTULO452:
mov ax, 65535
jmp ROTULO454
ROTULO453:
xor ax, ax
ROTULO454:
cmp ax, 0
jne ROTULO450
jmp ROTULO451
ROTULO450:
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
jmp ROTULO433
ROTULO451:
;     ---=== System.Collections.hcb:82:28 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-10]
jmp ROTULO444
ROTULO446:
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
je ROTULO457
jmp ROTULO458
ROTULO457:
mov ax, 65535
jmp ROTULO459
ROTULO458:
xor ax, ax
ROTULO459:
cmp ax, 0
jne ROTULO455
jmp ROTULO456
ROTULO455:
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
ROTULO456:
;     ---=== System.Collections.hcb:92:14 ===---
jmp list_find_in_block_item
ROTULO433:
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
ROTULO460:
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
ROTULO461:
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
ROTULO462:
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
je ROTULO466
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
jb ROTULO471
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
;     ---=== System.Collections.hcb:112:37 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Collections.hcb:112:50 ===---
mov ax, 5
es mov [di+0], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
ROTULO470:
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
jb ROTULO476
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
;     ---=== System.Collections.hcb:113:38 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Collections.hcb:113:51 ===---
mov ax, 4
es mov [di+0], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
ROTULO475:
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
jae ROTULO481
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
;     ---=== System.Collections.hcb:114:39 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Collections.hcb:114:52 ===---
mov ax, 1
es mov [di+0], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
ROTULO480:
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
ROTULO484:
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
jbe ROTULO487
jmp ROTULO488
ROTULO487:
mov ax, 65535
jmp ROTULO489
ROTULO488:
xor ax, ax
ROTULO489:
cmp ax, 0
jne ROTULO485
jmp ROTULO486
ROTULO485:
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
jmp ROTULO484
ROTULO486:
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
jmp ROTULO463
jmp ROTULO490
ROTULO465:
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
ROTULO491:
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
jbe ROTULO494
jmp ROTULO495
ROTULO494:
mov ax, 65535
jmp ROTULO496
ROTULO495:
xor ax, ax
ROTULO496:
cmp ax, 0
jne ROTULO492
jmp ROTULO493
ROTULO492:
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
je ROTULO499
jmp ROTULO500
ROTULO499:
mov ax, 65535
jmp ROTULO501
ROTULO500:
xor ax, ax
ROTULO501:
cmp ax, 0
jne ROTULO497
jmp ROTULO498
ROTULO497:
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
; ACAO STRUCTURE - Incremento de ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
es inc word [di+2]
;     ---=== System.Collections.hcb:136:21 ===---
;     ---=== System.Collections.hcb:136:28 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Collections.hcb:136:45 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-10]
push ax
;     ---=== System.Collections.hcb:136:38 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-8+2]
pop es
mov di, [bp+-8]
push es
push di
;     ---=== System.Collections.hcb:136:35 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
push cs
call _list_getptr
add sp, 10
jmp ROTULO463
ROTULO498:
;     ---=== System.Collections.hcb:131:32 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-10]
jmp ROTULO491
ROTULO493:
;     ---=== System.Collections.hcb:139:13 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.Collections.hcb:139:19 ===---
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
;     ---=== System.Collections.hcb:140:13 ===---
;     ---=== System.Collections.hcb:140:21 ===---
;     ---=== System.Collections.hcb:140:17 ===---
; ACAO LEITURA - Le segmento em variavel
mov ax, [bp+-4+2]
push ax
;     ---=== System.Collections.hcb:140:24 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO504
jmp ROTULO505
ROTULO504:
mov ax, 65535
jmp ROTULO506
ROTULO505:
xor ax, ax
ROTULO506:
cmp ax, 0
jne ROTULO502
jmp ROTULO503
ROTULO502:
;     ---=== System.Collections.hcb:141:17 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.Collections.hcb:141:23 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Collections.hcb:141:34 ===---
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
;     ---=== System.Collections.hcb:142:17 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Collections.hcb:142:35 ===---
; ACAO LEITURA - Le ponteiro
push es
push di
push word [bp+-8+2]
pop es
mov di, [bp+-8]
es pop word [di+0]
es pop word [di+0+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
ROTULO503:
;     ---=== System.Collections.hcb:144:18 ===---
jmp list_find_in_block_add
ROTULO490:
ROTULO463:
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
ROTULO507:
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
jne ROTULO509
;     ---=== System.Memory.hcb:124:25 ===---
mov ax, _memory
mov [bp+-8], ax
mov ax, 124
mov [bp+-10], ax
mov ax, 1
cs jmp word [_os_trycode]
ROTULO509:
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
jne ROTULO512
;     ---=== System.Memory.hcb:125:21 ===---
mov ax, _memory
mov [bp+-8], ax
mov ax, 125
mov [bp+-10], ax
mov ax, 1
cs jmp word [_os_trycode]
ROTULO512:
mov bx, ax
pop ax
xor dx, dx
div bx
mov ax, dx
cmp ax, 0
jne ROTULO510
jmp ROTULO511
ROTULO510:
;     ---=== System.Memory.hcb:125:29 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-2]
ROTULO511:
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
ja ROTULO515
jmp ROTULO516
ROTULO515:
mov ax, 65535
jmp ROTULO517
ROTULO516:
xor ax, ax
ROTULO517:
cmp ax, 0
jne ROTULO513
jmp ROTULO514
ROTULO513:
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
jne ROTULO518
;     ---=== System.Memory.hcb:127:28 ===---
mov ax, _memory
mov [bp+-8], ax
mov ax, 127
mov [bp+-10], ax
mov ax, 1
cs jmp word [_os_trycode]
ROTULO518:
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
jne ROTULO521
;     ---=== System.Memory.hcb:128:25 ===---
mov ax, _memory
mov [bp+-8], ax
mov ax, 128
mov [bp+-10], ax
mov ax, 1
cs jmp word [_os_trycode]
ROTULO521:
mov bx, ax
pop ax
xor dx, dx
div bx
mov ax, dx
cmp ax, 0
jne ROTULO519
jmp ROTULO520
ROTULO519:
;     ---=== System.Memory.hcb:128:35 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-20]
ROTULO520:
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
jmp ROTULO508
ROTULO514:
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
ROTULO522:
;     ---=== System.Memory.hcb:138:15 ===---
mov ax, 1
cmp ax, 0
jne ROTULO523
jmp ROTULO524
ROTULO523:
;     ---=== System.Memory.hcb:139:14 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-16], 4
;     ---=== System.Memory.hcb:140:26 ===---
;     ---=== System.Memory.hcb:140:26 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-4], 1
ROTULO525:
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
jbe ROTULO528
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
;     ---=== System.Memory.hcb:141:17 ===---
;     ---=== System.Memory.hcb:141:20 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-8]
cmp ax, 0
jne ROTULO531
jmp ROTULO532
ROTULO531:
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
je ROTULO535
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
;     ---=== System.Memory.hcb:143:25 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-18]
jmp ROTULO538
ROTULO534:
;     ---=== System.Memory.hcb:145:25 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-8], 0
ROTULO538:
jmp ROTULO539
ROTULO532:
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
je ROTULO542
jmp ROTULO543
ROTULO542:
mov ax, 65535
jmp ROTULO544
ROTULO543:
xor ax, ax
ROTULO544:
cmp ax, 0
jne ROTULO540
jmp ROTULO541
ROTULO540:
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
ROTULO541:
ROTULO539:
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
jae ROTULO547
jmp ROTULO548
ROTULO547:
mov ax, 65535
jmp ROTULO549
ROTULO548:
xor ax, ax
ROTULO549:
cmp ax, 0
jne ROTULO545
jmp ROTULO546
ROTULO545:
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
ROTULO550:
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
jbe ROTULO553
jmp ROTULO554
ROTULO553:
mov ax, 65535
jmp ROTULO555
ROTULO554:
xor ax, ax
ROTULO555:
cmp ax, 0
jne ROTULO551
jmp ROTULO552
ROTULO551:
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
je ROTULO558
jmp ROTULO559
ROTULO558:
mov ax, 65535
jmp ROTULO560
ROTULO559:
xor ax, ax
ROTULO560:
cmp ax, 0
jne ROTULO556
jmp ROTULO557
ROTULO556:
;     ---=== System.Memory.hcb:161:29 ===---
; ACAO GRAVACAO - Gravacao de numero em ponteiro
push word [bp+-16+2]
pop es
mov di, [bp+-16]
es mov word [di+0], 1
jmp ROTULO561
ROTULO557:
;     ---=== System.Memory.hcb:163:29 ===---
; ACAO GRAVACAO - Gravacao de numero em ponteiro
push word [bp+-16+2]
pop es
mov di, [bp+-16]
es mov word [di+0], 2
ROTULO561:
;     ---=== System.Memory.hcb:165:26 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-16]
;     ---=== System.Memory.hcb:166:26 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-16]
;     ---=== System.Memory.hcb:159:34 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-4]
jmp ROTULO550
ROTULO552:
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
jmp ROTULO508
ROTULO546:
;     ---=== System.Memory.hcb:171:18 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-16]
;     ---=== System.Memory.hcb:172:18 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-16]
;     ---=== System.Memory.hcb:140:26 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-4]
jmp ROTULO525
ROTULO527:
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
je ROTULO564
jmp ROTULO565
ROTULO564:
mov ax, 65535
jmp ROTULO566
ROTULO565:
xor ax, ax
ROTULO566:
cmp ax, 0
jne ROTULO562
jmp ROTULO563
ROTULO562:
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
jmp ROTULO567
ROTULO563:
;     ---=== System.Memory.hcb:179:18 ===---
; ACAO GRAVACAO - Grava segmento em variavel
;     ---=== System.Memory.hcb:179:26 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-16+2]
pop es
mov di, [bp+-16]
es mov ax, [di+0]
mov word [bp+-16+2], ax
ROTULO567:
jmp ROTULO522
ROTULO524:
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
ROTULO508:
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
ROTULO568:
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
ROTULO569:
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
ROTULO570:
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
ROTULO572:
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
jbe ROTULO575
jmp ROTULO576
ROTULO575:
mov ax, 65535
jmp ROTULO577
ROTULO576:
xor ax, ax
ROTULO577:
cmp ax, 0
jne ROTULO573
jmp ROTULO574
ROTULO573:
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
jb ROTULO580
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
;     ---=== System.Memory.hcb:21:33 ===---
; ACAO GRAVACAO - Gravacao de numero em ponteiro
cs push word [_globalmemory_mapptr+2]
pop es
cs mov di, [_globalmemory_mapptr]
es mov byte [di+0], 129
jmp ROTULO583
ROTULO579:
;     ---=== System.Memory.hcb:21:51 ===---
; ACAO GRAVACAO - Gravacao de numero em ponteiro
cs push word [_globalmemory_mapptr+2]
pop es
cs mov di, [_globalmemory_mapptr]
es mov byte [di+0], 0
ROTULO583:
;     ---=== System.Memory.hcb:22:14 ===---
; ACAO INC - Incrementa variavel
cs inc word [_globalmemory_mapptr]
;     ---=== System.Memory.hcb:20:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-4]
jmp ROTULO572
ROTULO574:
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
ROTULO571:
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
ja ROTULO587
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
;     ---=== System.Memory.hcb:35:34 ===---
mov ax, _globalmemory
mov [bp+-8], ax
mov ax, 35
mov [bp+-10], ax
mov ax, 4
cs jmp word [_os_trycode]
ROTULO586:
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
ja ROTULO592
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
;     ---=== System.Memory.hcb:36:36 ===---
mov ax, _globalmemory
mov [bp+-8], ax
mov ax, 36
mov [bp+-10], ax
mov ax, 12
cs jmp word [_os_trycode]
ROTULO591:
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
ROTULO595:
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
jbe ROTULO598
jmp ROTULO599
ROTULO598:
mov ax, 65535
jmp ROTULO600
ROTULO599:
xor ax, ax
ROTULO600:
cmp ax, 0
jne ROTULO596
jmp ROTULO597
ROTULO596:
;     ---=== System.Memory.hcb:42:13 ===---
;     ---=== System.Memory.hcb:42:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-12]
cmp ax, 0
jne ROTULO601
jmp ROTULO602
ROTULO601:
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
je ROTULO605
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
;     ---=== System.Memory.hcb:44:21 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-10]
jmp ROTULO608
ROTULO604:
;     ---=== System.Memory.hcb:46:21 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-12], 0
ROTULO608:
jmp ROTULO609
ROTULO602:
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
je ROTULO612
jmp ROTULO613
ROTULO612:
mov ax, 65535
jmp ROTULO614
ROTULO613:
xor ax, ax
ROTULO614:
cmp ax, 0
jne ROTULO610
jmp ROTULO611
ROTULO610:
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
ROTULO611:
ROTULO609:
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
jae ROTULO617
jmp ROTULO618
ROTULO617:
mov ax, 65535
jmp ROTULO619
ROTULO618:
xor ax, ax
ROTULO619:
cmp ax, 0
jne ROTULO615
jmp ROTULO616
ROTULO615:
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
ROTULO620:
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
jbe ROTULO623
jmp ROTULO624
ROTULO623:
mov ax, 65535
jmp ROTULO625
ROTULO624:
xor ax, ax
ROTULO625:
cmp ax, 0
jne ROTULO621
jmp ROTULO622
ROTULO621:
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
je ROTULO628
jmp ROTULO629
ROTULO628:
mov ax, 65535
jmp ROTULO630
ROTULO629:
xor ax, ax
ROTULO630:
cmp ax, 0
jne ROTULO626
jmp ROTULO627
ROTULO626:
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
jmp ROTULO634
ROTULO627:
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
ROTULO634:
;     ---=== System.Memory.hcb:65:22 ===---
; ACAO INC - Incrementa variavel
cs inc word [_globalmemory_mapptr]
;     ---=== System.Memory.hcb:59:30 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-6]
jmp ROTULO620
ROTULO622:
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
jmp ROTULO584
ROTULO616:
;     ---=== System.Memory.hcb:70:14 ===---
; ACAO INC - Incrementa variavel
cs inc word [_globalmemory_mapptr]
;     ---=== System.Memory.hcb:41:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-6]
jmp ROTULO595
ROTULO597:
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
ROTULO584:
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
ROTULO636:
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
jbe ROTULO639
jmp ROTULO640
ROTULO639:
mov ax, 65535
jmp ROTULO641
ROTULO640:
xor ax, ax
ROTULO641:
cmp ax, 0
jne ROTULO637
jmp ROTULO638
ROTULO637:
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
je ROTULO644
jmp ROTULO645
ROTULO644:
mov ax, 65535
jmp ROTULO646
ROTULO645:
xor ax, ax
ROTULO646:
cmp ax, 0
jne ROTULO642
jmp ROTULO643
ROTULO642:
;     ---=== System.Memory.hcb:83:33 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-2]
ROTULO643:
;     ---=== System.Memory.hcb:84:14 ===---
; ACAO INC - Incrementa variavel
cs inc word [_globalmemory_mapptr]
;     ---=== System.Memory.hcb:82:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-4]
jmp ROTULO636
ROTULO638:
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
jmp ROTULO635
ROTULO635:
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
ROTULO648:
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
jbe ROTULO651
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
jne ROTULO656
jmp ROTULO657
ROTULO656:
mov ax, 65535
jmp ROTULO658
ROTULO657:
xor ax, ax
ROTULO658:
cmp ax, 0
jne ROTULO654
jmp ROTULO655
ROTULO654:
;     ---=== System.Memory.hcb:97:33 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-2]
ROTULO655:
;     ---=== System.Memory.hcb:98:14 ===---
; ACAO INC - Incrementa variavel
cs inc word [_globalmemory_mapptr]
;     ---=== System.Memory.hcb:96:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-4]
jmp ROTULO648
ROTULO650:
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
jmp ROTULO647
ROTULO647:
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
ROTULO659:
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
ROTULO661:
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
jae ROTULO664
jmp ROTULO665
ROTULO664:
mov ax, 65535
jmp ROTULO666
ROTULO665:
xor ax, ax
ROTULO666:
cmp ax, 0
jne ROTULO662
jmp ROTULO663
ROTULO662:
;     ---=== System.Threading.hcb:36:13 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _thread_yield
jmp ROTULO661
ROTULO663:
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
jae ROTULO669
jmp ROTULO670
ROTULO669:
mov ax, 65535
jmp ROTULO671
ROTULO670:
xor ax, ax
ROTULO671:
cmp ax, 0
jne ROTULO667
jmp ROTULO668
ROTULO667:
;     ---=== System.Threading.hcb:41:17 ===---
popf
;     ---=== System.Threading.hcb:42:18 ===---
jmp waiting
ROTULO668:
;     ---=== System.Threading.hcb:44:9 ===---
; ACAO STRUCTURE - Incremento de ponteiro
es inc word [di+0]
;     ---=== System.Threading.hcb:45:13 ===---
popf
ROTULO660:
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
ja ROTULO675
jmp ROTULO676
ROTULO675:
mov ax, 65535
jmp ROTULO677
ROTULO676:
xor ax, ax
ROTULO677:
cmp ax, 0
jne ROTULO673
jmp ROTULO674
ROTULO673:
;     ---=== System.Threading.hcb:52:29 ===---
; ACAO STRUCTURE - Decremento de Ponteiro
es dec word [di+0]
ROTULO674:
;     ---=== System.Threading.hcb:53:13 ===---
popf
ROTULO672:
mov sp, bp
pop bp
FIM_semaphore_release:
retf
; MODULO FIM: semaphore
;     ---=== System.Threading.hcb:217:8 ===---
; MODULO: thread
_thread:
db 20
db 83,121,115,116,101,109,46,84,104,114,101,97,100,105,110,103,46,104,99,98
db 0
;     ---=== System.Threading.hcb:219:21 ===---
_thread_requestnew:
;     ---=== System.Threading.hcb:220:9 ===---
;     ---=== System.Threading.hcb:220:16 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _multithreading_requestnew
jmp ROTULO678
ROTULO678:
FIM_thread_requestnew:
retf
;     ---=== System.Threading.hcb:224:16 ===---
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
;     ---=== System.Threading.hcb:224:22 ===---
;     ---=== System.Threading.hcb:224:35 ===---
;     ---=== System.Threading.hcb:224:59 ===---
;     ---=== System.Threading.hcb:225:13 ===---
;     ---=== System.Threading.hcb:226:13 ===---
;     ---=== System.Threading.hcb:227:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:227:23 ===---
xor ax, ax
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov [di+4], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Threading.hcb:228:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.Threading.hcb:228:17 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Threading.hcb:228:42 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
push ax
;     ---=== System.Threading.hcb:228:39 ===---
; ACAO LEITURA - Le ponteiro
push es
push di
push cs
call _globalmemory_allockib
add sp, 6
push es
pop word [bp+-4+2]
mov [bp+-4], di
;     ---=== System.Threading.hcb:229:10 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.Threading.hcb:229:40 ===---
;     ---=== System.Threading.hcb:229:42 ===---
mov ax, 2
push ax
;     ---=== System.Threading.hcb:229:32 ===---
;     ---=== System.Threading.hcb:229:34 ===---
mov ax, 1024
push ax
;     ---=== System.Threading.hcb:229:19 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
pop bx
mul bx
pop bx
sub ax, bx
mov [bp+-4], ax
;     ---=== System.Threading.hcb:230:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:230:27 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov [di+16], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Threading.hcb:231:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:231:27 ===---
; ACAO LEITURA - Le segmento em variavel
mov ax, [bp+-4+2]
es mov [di+14], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Threading.hcb:232:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:232:22 ===---
mov ax, 1
es mov [di+6], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Threading.hcb:233:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:233:20 ===---
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
;     ---=== System.Threading.hcb:234:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Threading.hcb:234:36 ===---
; ACAO LEITURA - Le ponteiro
push es
push di
push cs
call _multithreading_startthread
add sp, 4
ROTULO679:
mov sp, bp
pop bp
FIM_thread_start:
retf
;     ---=== System.Threading.hcb:238:9 ===---
_thread_endthread:
push bp
mov bp, sp
sub sp, 4
push cs
call _os_stackcheck
; ARG: t TAM: 4 POS: BP--4 
;     ---=== System.Threading.hcb:239:13 ===---
;     ---=== System.Threading.hcb:240:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.Threading.hcb:240:13 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _thread_current
push es
pop word [bp+-4+2]
mov [bp+-4], di
;     ---=== System.Threading.hcb:241:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:241:20 ===---
xor ax, ax
es mov [di+2], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Threading.hcb:242:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:242:23 ===---
mov ax, 1
es mov [di+4], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Threading.hcb:243:9 ===---
ROTULO681:
;     ---=== System.Threading.hcb:243:15 ===---
mov ax, 1
cmp ax, 0
jne ROTULO682
jmp ROTULO683
ROTULO682:
;     ---=== System.Threading.hcb:243:17 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _thread_yield
jmp ROTULO681
ROTULO683:
ROTULO680:
mov sp, bp
pop bp
FIM_thread_endthread:
retf
;     ---=== System.Threading.hcb:247:16 ===---
_thread_abort:
push bp
mov bp, sp
; ARG: t TAM: 4 POS: BP+6 
;     ---=== System.Threading.hcb:247:22 ===---
;     ---=== System.Threading.hcb:248:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:248:23 ===---
mov ax, 1
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov [di+4], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Threading.hcb:249:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:249:20 ===---
xor ax, ax
es mov [di+2], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
ROTULO684:
mov sp, bp
pop bp
FIM_thread_abort:
retf
;     ---=== System.Threading.hcb:253:21 ===---
_thread_current:
;     ---=== System.Threading.hcb:254:9 ===---
;     ---=== System.Threading.hcb:254:16 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_multithreading_current+2]
pop es
cs mov di, [_multithreading_current]
jmp ROTULO685
ROTULO685:
FIM_thread_current:
retf
;     ---=== System.Threading.hcb:258:16 ===---
_thread_yield:
;     ---=== System.Threading.hcb:259:13 ===---
sti
;     ---=== System.Threading.hcb:260:9 ===---
;     ---=== System.Threading.hcb:260:38 ===---
;     ---=== System.Threading.hcb:260:12 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _multithreading_isactive
push ax
;     ---=== System.Threading.hcb:260:41 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO689
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
;     ---=== System.Threading.hcb:260:48 ===---
;     ---=== System.Threading.hcb:260:53 ===---
xor ax, ax
jmp ROTULO686
ROTULO688:
;     ---=== System.Threading.hcb:261:13 ===---
int 0x81
ROTULO686:
FIM_thread_yield:
retf
;     ---=== System.Threading.hcb:265:16 ===---
_thread_sleep:
push bp
mov bp, sp
sub sp, 4
push cs
call _os_stackcheck
; ARG: miliseconds TAM: 2 POS: BP+6 
; ARG: oldmili TAM: 2 POS: BP--2 
; ARG: diff TAM: 2 POS: BP--4 
;     ---=== System.Threading.hcb:265:22 ===---
;     ---=== System.Threading.hcb:266:13 ===---
;     ---=== System.Threading.hcb:267:13 ===---
;     ---=== System.Threading.hcb:268:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.Threading.hcb:268:19 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_clock_timermiliseconds]
mov [bp+-2], ax
;     ---=== System.Threading.hcb:269:9 ===---
ROTULO693:
;     ---=== System.Threading.hcb:269:15 ===---
mov ax, 1
cmp ax, 0
jne ROTULO694
jmp ROTULO695
ROTULO694:
;     ---=== System.Threading.hcb:270:13 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.Threading.hcb:270:43 ===---
;     ---=== System.Threading.hcb:270:45 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== System.Threading.hcb:270:20 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_clock_timermiliseconds]
pop bx
sub ax, bx
mov [bp+-4], ax
;     ---=== System.Threading.hcb:271:13 ===---
;     ---=== System.Threading.hcb:271:21 ===---
;     ---=== System.Threading.hcb:271:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
push ax
;     ---=== System.Threading.hcb:271:24 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
mov bx, ax
pop ax
cmp ax, bx
jae ROTULO698
jmp ROTULO699
ROTULO698:
mov ax, 65535
jmp ROTULO700
ROTULO699:
xor ax, ax
ROTULO700:
cmp ax, 0
jne ROTULO696
jmp ROTULO697
ROTULO696:
;     ---=== System.Threading.hcb:271:41 ===---
;     ---=== System.Threading.hcb:271:46 ===---
xor ax, ax
jmp ROTULO692
ROTULO697:
;     ---=== System.Threading.hcb:272:13 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _thread_yield
jmp ROTULO693
ROTULO695:
ROTULO692:
mov sp, bp
pop bp
FIM_thread_sleep:
retf
;     ---=== System.Threading.hcb:277:16 ===---
_thread_sleepseconds:
push bp
mov bp, sp
sub sp, 4
push cs
call _os_stackcheck
; ARG: seconds TAM: 2 POS: BP+6 
; ARG: oldsec TAM: 2 POS: BP--2 
; ARG: diff TAM: 2 POS: BP--4 
;     ---=== System.Threading.hcb:277:29 ===---
;     ---=== System.Threading.hcb:278:13 ===---
;     ---=== System.Threading.hcb:279:13 ===---
;     ---=== System.Threading.hcb:280:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.Threading.hcb:280:18 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_clock_timerseconds]
mov [bp+-2], ax
;     ---=== System.Threading.hcb:281:9 ===---
ROTULO702:
;     ---=== System.Threading.hcb:281:15 ===---
mov ax, 1
cmp ax, 0
jne ROTULO703
jmp ROTULO704
ROTULO703:
;     ---=== System.Threading.hcb:282:13 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.Threading.hcb:282:39 ===---
;     ---=== System.Threading.hcb:282:41 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== System.Threading.hcb:282:20 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_clock_timerseconds]
pop bx
sub ax, bx
mov [bp+-4], ax
;     ---=== System.Threading.hcb:283:13 ===---
;     ---=== System.Threading.hcb:283:21 ===---
;     ---=== System.Threading.hcb:283:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
push ax
;     ---=== System.Threading.hcb:283:24 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
mov bx, ax
pop ax
cmp ax, bx
jae ROTULO707
jmp ROTULO708
ROTULO707:
mov ax, 65535
jmp ROTULO709
ROTULO708:
xor ax, ax
ROTULO709:
cmp ax, 0
jne ROTULO705
jmp ROTULO706
ROTULO705:
;     ---=== System.Threading.hcb:283:37 ===---
;     ---=== System.Threading.hcb:283:42 ===---
xor ax, ax
jmp ROTULO701
ROTULO706:
;     ---=== System.Threading.hcb:284:13 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _thread_yield
jmp ROTULO702
ROTULO704:
ROTULO701:
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
ROTULO710:
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
jb ROTULO714
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
;     ---=== System.Timer.hcb:29:32 ===---
jmp end_ajust
ROTULO713:
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
jb ROTULO719
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
;     ---=== System.Timer.hcb:32:31 ===---
jmp end_ajust
ROTULO718:
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
jae ROTULO724
jmp ROTULO725
ROTULO724:
mov ax, 65535
jmp ROTULO726
ROTULO725:
xor ax, ax
ROTULO726:
cmp ax, 0
jne ROTULO722
jmp ROTULO723
ROTULO722:
;     ---=== System.Timer.hcb:33:32 ===---
jmp calc_month
ROTULO723:
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
je ROTULO729
jmp ROTULO730
ROTULO729:
mov ax, 65535
jmp ROTULO731
ROTULO730:
xor ax, ax
ROTULO731:
cmp ax, 0
jne ROTULO727
jmp ROTULO728
ROTULO727:
;     ---=== System.Timer.hcb:34:33 ===---
jmp calc_month
ROTULO728:
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
jb ROTULO734
jmp ROTULO735
ROTULO734:
mov ax, 65535
jmp ROTULO736
ROTULO735:
xor ax, ax
ROTULO736:
cmp ax, 0
jne ROTULO732
jmp ROTULO733
ROTULO732:
;     ---=== System.Timer.hcb:35:31 ===---
jmp end_ajust
ROTULO733:
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
;     ---=== System.Timer.hcb:36:33 ===---
jmp calc_month
ROTULO738:
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
je ROTULO744
jmp ROTULO745
ROTULO744:
mov ax, 65535
jmp ROTULO746
ROTULO745:
xor ax, ax
ROTULO746:
cmp ax, 0
jne ROTULO742
jmp ROTULO743
ROTULO742:
;     ---=== System.Timer.hcb:37:33 ===---
jmp calc_month
ROTULO743:
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
je ROTULO749
jmp ROTULO750
ROTULO749:
mov ax, 65535
jmp ROTULO751
ROTULO750:
xor ax, ax
ROTULO751:
cmp ax, 0
jne ROTULO747
jmp ROTULO748
ROTULO747:
;     ---=== System.Timer.hcb:38:33 ===---
jmp calc_month
ROTULO748:
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
je ROTULO754
jmp ROTULO755
ROTULO754:
mov ax, 65535
jmp ROTULO756
ROTULO755:
xor ax, ax
ROTULO756:
cmp ax, 0
jne ROTULO752
jmp ROTULO753
ROTULO752:
;     ---=== System.Timer.hcb:39:34 ===---
jmp calc_month
ROTULO753:
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
ja ROTULO762
jmp ROTULO763
ROTULO762:
mov ax, 65535
jmp ROTULO764
ROTULO763:
xor ax, ax
ROTULO764:
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
je ROTULO765
jmp ROTULO766
ROTULO765:
mov ax, 65535
jmp ROTULO767
ROTULO766:
xor ax, ax
ROTULO767:
mov bx, ax
pop ax
or ax, bx
cmp ax, 0
jne ROTULO757
jmp ROTULO758
ROTULO757:
;     ---=== System.Timer.hcb:43:13 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_clock_month], 1
;     ---=== System.Timer.hcb:44:13 ===---
; ACAO INC - Incrementa variavel
cs inc word [_clock_year]
ROTULO758:
;     ---=== System.Timer.hcb:46:9 ===---
end_ajust:
ROTULO711:
FIM_clock_autoajust:
retf
; MODULO FIM: clock
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
ROTULO768:
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
;     ---=== System.Timer.hcb:102:13 ===---
mov ax, 0x20
;     ---=== System.Timer.hcb:103:13 ===---
out 0x20, al
ROTULO769:
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
;     ---=== System.IO.Disk.hcb:41:8 ===---
; MODULO: disk
_disk:
db 18
db 83,121,115,116,101,109,46,73,79,46,68,105,115,107,46,104,99,98
db 0
;     ---=== System.IO.Disk.hcb:42:9 ===---
_disk_disks:
times 16 db 0
;     ---=== System.IO.Disk.hcb:44:16 ===---
_disk_initialize:
;     ---=== System.IO.Disk.hcb:45:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.hcb:45:32 ===---
; ACAO CHAMADA - Calcula tamanho de item
mov ax, 71
push ax
;     ---=== System.IO.Disk.hcb:45:25 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_disk_disks+2]
pop es
cs mov di, [_disk_disks]
push es
push di
push cs
call _list_initialize
add sp, 6
ROTULO770:
FIM_disk_initialize:
retf
;     ---=== System.IO.Disk.hcb:48:21 ===---
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
;     ---=== System.IO.Disk.hcb:48:33 ===---
;     ---=== System.IO.Disk.hcb:48:49 ===---
;     ---=== System.IO.Disk.hcb:48:71 ===---
;     ---=== System.IO.Disk.hcb:48:92 ===---
;     ---=== System.IO.Disk.hcb:48:109 ===---
;     ---=== System.IO.Disk.hcb:48:128 ===---
;     ---=== System.IO.Disk.hcb:49:13 ===---
;     ---=== System.IO.Disk.hcb:50:13 ===---
;     ---=== System.IO.Disk.hcb:51:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.IO.Disk.hcb:51:15 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.hcb:51:24 ===---
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
;     ---=== System.IO.Disk.hcb:52:10 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO GRAVACAO - Grava segmento em variavel
;     ---=== System.IO.Disk.hcb:52:18 ===---
; ACAO LEITURA - Le segmento em variavel
mov ax, [bp+-8+2]
mov word [bp+-4+2], ax
;     ---=== System.IO.Disk.hcb:53:10 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.IO.Disk.hcb:53:18 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-8]
mov [bp+-4], ax
;     ---=== System.IO.Disk.hcb:54:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.IO.Disk.hcb:54:21 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-4+2]
pop es
mov di, [bp+-4]
push es
push di
es pop word [di+33]
es pop word [di+33+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.IO.Disk.hcb:55:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.IO.Disk.hcb:55:27 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
es mov [di+37], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.IO.Disk.hcb:56:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.IO.Disk.hcb:56:26 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+12]
es mov [di+39], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.IO.Disk.hcb:57:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.IO.Disk.hcb:57:22 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+14]
es mov [di+41], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.IO.Disk.hcb:58:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.IO.Disk.hcb:58:24 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+16]
es mov [di+43], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.IO.Disk.hcb:59:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.IO.Disk.hcb:59:26 ===---
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
;     ---=== System.IO.Disk.hcb:60:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.IO.Disk.hcb:60:27 ===---
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
;     ---=== System.IO.Disk.hcb:61:9 ===---
; ACAO GRAVACAO - Gravacao de numero em ponteiro
push word [bp+-8+2]
pop es
mov di, [bp+-8]
es mov byte [di+0], 32
;     ---=== System.IO.Disk.hcb:62:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.hcb:62:32 ===---
push cs
pop es
mov di, ROTULO773
jmp ROTULO772
ROTULO773:
db 0
times 1 db 0
ROTULO772:
push es
push di
;     ---=== System.IO.Disk.hcb:62:21 ===---
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
;     ---=== System.IO.Disk.hcb:63:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.hcb:63:32 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
;     ---=== System.IO.Disk.hcb:63:21 ===---
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
;     ---=== System.IO.Disk.hcb:64:9 ===---
;     ---=== System.IO.Disk.hcb:64:16 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-4+2]
pop es
mov di, [bp+-4]
jmp ROTULO771
ROTULO771:
mov sp, bp
pop bp
FIM_disk_registernew:
retf
;     ---=== System.IO.Disk.hcb:67:16 ===---
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
;     ---=== System.IO.Disk.hcb:67:29 ===---
;     ---=== System.IO.Disk.hcb:67:48 ===---
;     ---=== System.IO.Disk.hcb:67:63 ===---
;     ---=== System.IO.Disk.hcb:67:85 ===---
;     ---=== System.IO.Disk.hcb:68:13 ===---
;     ---=== System.IO.Disk.hcb:69:9 ===---
;     ---=== System.IO.Disk.hcb:69:24 ===---
;     ---=== System.IO.Disk.hcb:69:12 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+16]
push ax
;     ---=== System.IO.Disk.hcb:69:27 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
jne ROTULO777
jmp ROTULO778
ROTULO777:
mov ax, 65535
jmp ROTULO779
ROTULO778:
xor ax, ax
ROTULO779:
cmp ax, 0
jne ROTULO775
jmp ROTULO776
ROTULO775:
;     ---=== System.IO.Disk.hcb:69:40 ===---
mov ax, _disk
mov [bp+-8], ax
mov ax, 69
mov [bp+-10], ax
mov ax, 4
cs jmp word [_os_trycode]
ROTULO776:
;     ---=== System.IO.Disk.hcb:70:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.IO.Disk.hcb:70:29 ===---
;     ---=== System.IO.Disk.hcb:70:31 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 41
push word [bp+10+2]
pop es
mov di, [bp+10]
es mov ax, [di+41]
push ax
;     ---=== System.IO.Disk.hcb:70:19 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 43
es mov ax, [di+43]
pop bx
mul bx
mov [bp+-2], ax
;     ---=== System.IO.Disk.hcb:71:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.IO.Disk.hcb:71:35 ===---
;     ---=== System.IO.Disk.hcb:71:24 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+14]
push ax
;     ---=== System.IO.Disk.hcb:71:37 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
cmp ax, 0
jne ROTULO780
;     ---=== System.IO.Disk.hcb:71:37 ===---
mov ax, _disk
mov [bp+-8], ax
mov ax, 71
mov [bp+-10], ax
mov ax, 1
cs jmp word [_os_trycode]
ROTULO780:
mov bx, ax
pop ax
xor dx, dx
div bx
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov [di+0], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.IO.Disk.hcb:72:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.IO.Disk.hcb:72:45 ===---
;     ---=== System.IO.Disk.hcb:72:32 ===---
;     ---=== System.IO.Disk.hcb:72:21 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+14]
push ax
;     ---=== System.IO.Disk.hcb:72:36 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
cmp ax, 0
jne ROTULO781
;     ---=== System.IO.Disk.hcb:72:36 ===---
mov ax, _disk
mov [bp+-8], ax
mov ax, 72
mov [bp+-10], ax
mov ax, 1
cs jmp word [_os_trycode]
ROTULO781:
mov bx, ax
pop ax
xor dx, dx
div bx
mov ax, dx
push ax
;     ---=== System.IO.Disk.hcb:72:47 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 43
push word [bp+10+2]
pop es
mov di, [bp+10]
es mov ax, [di+43]
cmp ax, 0
jne ROTULO782
;     ---=== System.IO.Disk.hcb:72:47 ===---
mov ax, _disk
mov [bp+-8], ax
mov ax, 72
mov [bp+-10], ax
mov ax, 1
cs jmp word [_os_trycode]
ROTULO782:
mov bx, ax
pop ax
xor dx, dx
div bx
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov [di+2], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.IO.Disk.hcb:73:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.IO.Disk.hcb:73:63 ===---
;     ---=== System.IO.Disk.hcb:73:65 ===---
mov ax, 1
push ax
;     ---=== System.IO.Disk.hcb:73:48 ===---
;     ---=== System.IO.Disk.hcb:73:35 ===---
;     ---=== System.IO.Disk.hcb:73:24 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+14]
push ax
;     ---=== System.IO.Disk.hcb:73:39 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
cmp ax, 0
jne ROTULO783
;     ---=== System.IO.Disk.hcb:73:39 ===---
mov ax, _disk
mov [bp+-8], ax
mov ax, 73
mov [bp+-10], ax
mov ax, 1
cs jmp word [_os_trycode]
ROTULO783:
mov bx, ax
pop ax
xor dx, dx
div bx
mov ax, dx
push ax
;     ---=== System.IO.Disk.hcb:73:52 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 43
push word [bp+10+2]
pop es
mov di, [bp+10]
es mov ax, [di+43]
cmp ax, 0
jne ROTULO784
;     ---=== System.IO.Disk.hcb:73:52 ===---
mov ax, _disk
mov [bp+-8], ax
mov ax, 73
mov [bp+-10], ax
mov ax, 1
cs jmp word [_os_trycode]
ROTULO784:
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
ROTULO774:
mov sp, bp
pop bp
FIM_disk_converttochs:
retf
;     ---=== System.IO.Disk.hcb:76:9 ===---
_disk_genericreadblock:
push bp
mov bp, sp
; ARG: info TAM: 4 POS: BP+6 
; ARG: data TAM: 4 POS: BP+10 
; ARG: addresslow TAM: 2 POS: BP+14 
; ARG: addresshigh TAM: 2 POS: BP+16 
;     ---=== System.IO.Disk.hcb:76:26 ===---
;     ---=== System.IO.Disk.hcb:76:44 ===---
;     ---=== System.IO.Disk.hcb:76:66 ===---
;     ---=== System.IO.Disk.hcb:76:88 ===---
;     ---=== System.IO.Disk.hcb:77:15 ===---
mov ax, _disk
mov [bp+-8], ax
mov ax, 77
mov [bp+-10], ax
mov ax, 7
cs jmp word [_os_trycode]
ROTULO785:
mov sp, bp
pop bp
FIM_disk_genericreadblock:
retf
;     ---=== System.IO.Disk.hcb:80:9 ===---
_disk_genericwriteblock:
push bp
mov bp, sp
; ARG: info TAM: 4 POS: BP+6 
; ARG: data TAM: 4 POS: BP+10 
; ARG: addresslow TAM: 2 POS: BP+14 
; ARG: addresshigh TAM: 2 POS: BP+16 
;     ---=== System.IO.Disk.hcb:80:27 ===---
;     ---=== System.IO.Disk.hcb:80:45 ===---
;     ---=== System.IO.Disk.hcb:80:67 ===---
;     ---=== System.IO.Disk.hcb:80:89 ===---
;     ---=== System.IO.Disk.hcb:81:15 ===---
mov ax, _disk
mov [bp+-8], ax
mov ax, 81
mov [bp+-10], ax
mov ax, 7
cs jmp word [_os_trycode]
ROTULO786:
mov sp, bp
pop bp
FIM_disk_genericwriteblock:
retf
;     ---=== System.IO.Disk.hcb:84:14 ===---
_disk_exist:
push bp
mov bp, sp
sub sp, 6
push cs
call _os_stackcheck
; ARG: name TAM: 4 POS: BP+6 
; ARG: i TAM: 2 POS: BP--2 
; ARG: d TAM: 4 POS: BP--6 
;     ---=== System.IO.Disk.hcb:84:20 ===---
;     ---=== System.IO.Disk.hcb:85:13 ===---
;     ---=== System.IO.Disk.hcb:87:17 ===---
;     ---=== System.IO.Disk.hcb:86:38 ===---
;     ---=== System.IO.Disk.hcb:86:38 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-2], 1
ROTULO788:
;     ---=== System.IO.Disk.hcb:86:38 ===---
;     ---=== System.IO.Disk.hcb:86:38 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== System.IO.Disk.hcb:86:22 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.hcb:86:33 ===---
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
jbe ROTULO791
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
;     ---=== System.IO.Disk.hcb:88:13 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.IO.Disk.hcb:88:17 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.hcb:88:34 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== System.IO.Disk.hcb:88:27 ===---
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
;     ---=== System.IO.Disk.hcb:89:13 ===---
;     ---=== System.IO.Disk.hcb:89:16 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.hcb:89:38 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
;     ---=== System.IO.Disk.hcb:89:30 ===---
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
jne ROTULO794
jmp ROTULO795
ROTULO794:
;     ---=== System.IO.Disk.hcb:90:17 ===---
;     ---=== System.IO.Disk.hcb:90:24 ===---
mov ax, 65535
jmp ROTULO787
ROTULO795:
;     ---=== System.IO.Disk.hcb:86:38 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-2]
jmp ROTULO788
ROTULO790:
;     ---=== System.IO.Disk.hcb:93:9 ===---
;     ---=== System.IO.Disk.hcb:93:16 ===---
xor ax, ax
jmp ROTULO787
ROTULO787:
mov sp, bp
pop bp
FIM_disk_exist:
retf
;     ---=== System.IO.Disk.hcb:96:14 ===---
_disk_item:
push bp
mov bp, sp
sub sp, 6
push cs
call _os_stackcheck
; ARG: name TAM: 4 POS: BP+6 
; ARG: i TAM: 2 POS: BP--2 
; ARG: d TAM: 4 POS: BP--6 
;     ---=== System.IO.Disk.hcb:96:19 ===---
;     ---=== System.IO.Disk.hcb:97:13 ===---
;     ---=== System.IO.Disk.hcb:99:17 ===---
;     ---=== System.IO.Disk.hcb:98:38 ===---
;     ---=== System.IO.Disk.hcb:98:38 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-2], 1
ROTULO797:
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
jbe ROTULO800
jmp ROTULO801
ROTULO800:
mov ax, 65535
jmp ROTULO802
ROTULO801:
xor ax, ax
ROTULO802:
cmp ax, 0
jne ROTULO798
jmp ROTULO799
ROTULO798:
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
jne ROTULO803
jmp ROTULO804
ROTULO803:
;     ---=== System.IO.Disk.hcb:101:49 ===---
;     ---=== System.IO.Disk.hcb:101:56 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-6+2]
pop es
mov di, [bp+-6]
jmp ROTULO796
ROTULO804:
;     ---=== System.IO.Disk.hcb:98:38 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-2]
jmp ROTULO797
ROTULO799:
;     ---=== System.IO.Disk.hcb:103:15 ===---
mov ax, _disk
mov [bp+-8], ax
mov ax, 103
mov [bp+-10], ax
mov ax, 5
cs jmp word [_os_trycode]
ROTULO796:
mov sp, bp
pop bp
FIM_disk_item:
retf
;     ---=== System.IO.Disk.hcb:106:14 ===---
_disk_count:
;     ---=== System.IO.Disk.hcb:107:9 ===---
;     ---=== System.IO.Disk.hcb:107:16 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.hcb:107:27 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_disk_disks+2]
pop es
cs mov di, [_disk_disks]
push es
push di
push cs
call _list_count
add sp, 4
jmp ROTULO805
ROTULO805:
FIM_disk_count:
retf
;     ---=== System.IO.Disk.hcb:110:14 ===---
_disk_getblocksize:
push bp
mov bp, sp
sub sp, 6
push cs
call _os_stackcheck
; ARG: name TAM: 4 POS: BP+6 
; ARG: i TAM: 2 POS: BP--2 
; ARG: d TAM: 4 POS: BP--6 
;     ---=== System.IO.Disk.hcb:110:27 ===---
;     ---=== System.IO.Disk.hcb:111:13 ===---
;     ---=== System.IO.Disk.hcb:113:17 ===---
;     ---=== System.IO.Disk.hcb:112:38 ===---
;     ---=== System.IO.Disk.hcb:112:38 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-2], 1
ROTULO807:
;     ---=== System.IO.Disk.hcb:112:38 ===---
;     ---=== System.IO.Disk.hcb:112:38 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== System.IO.Disk.hcb:112:22 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.hcb:112:33 ===---
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
jbe ROTULO810
jmp ROTULO811
ROTULO810:
mov ax, 65535
jmp ROTULO812
ROTULO811:
xor ax, ax
ROTULO812:
cmp ax, 0
jne ROTULO808
jmp ROTULO809
ROTULO808:
;     ---=== System.IO.Disk.hcb:114:13 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.IO.Disk.hcb:114:17 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.hcb:114:34 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== System.IO.Disk.hcb:114:27 ===---
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
;     ---=== System.IO.Disk.hcb:115:13 ===---
;     ---=== System.IO.Disk.hcb:115:16 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.hcb:115:38 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
;     ---=== System.IO.Disk.hcb:115:30 ===---
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
jne ROTULO813
jmp ROTULO814
ROTULO813:
;     ---=== System.IO.Disk.hcb:115:49 ===---
;     ---=== System.IO.Disk.hcb:115:56 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 45
push word [bp+-6+2]
pop es
mov di, [bp+-6]
es mov ax, [di+45]
jmp ROTULO806
ROTULO814:
;     ---=== System.IO.Disk.hcb:112:38 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-2]
jmp ROTULO807
ROTULO809:
;     ---=== System.IO.Disk.hcb:117:15 ===---
mov ax, _disk
mov [bp+-8], ax
mov ax, 117
mov [bp+-10], ax
mov ax, 5
cs jmp word [_os_trycode]
ROTULO806:
mov sp, bp
pop bp
FIM_disk_getblocksize:
retf
;     ---=== System.IO.Disk.hcb:120:9 ===---
_disk_readblock:
push bp
mov bp, sp
; ARG: d TAM: 4 POS: BP+6 
; ARG: data TAM: 4 POS: BP+10 
; ARG: addresslow TAM: 2 POS: BP+14 
; ARG: addresshigh TAM: 2 POS: BP+16 
;     ---=== System.IO.Disk.hcb:120:19 ===---
;     ---=== System.IO.Disk.hcb:120:34 ===---
;     ---=== System.IO.Disk.hcb:120:56 ===---
;     ---=== System.IO.Disk.hcb:120:78 ===---
;     ---=== System.IO.Disk.hcb:121:9 ===---
; ACAO CHAMADA - Chama indiretamente usando Invoke
;     ---=== System.IO.Disk.hcb:121:46 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+16]
push ax
;     ---=== System.IO.Disk.hcb:121:34 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+14]
push ax
;     ---=== System.IO.Disk.hcb:121:28 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+10+2]
pop es
mov di, [bp+10]
push es
push di
;     ---=== System.IO.Disk.hcb:121:9 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
es call far [di+47]
add sp, 12
ROTULO815:
mov sp, bp
pop bp
FIM_disk_readblock:
retf
;     ---=== System.IO.Disk.hcb:124:9 ===---
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
;     ---=== System.IO.Disk.hcb:124:25 ===---
;     ---=== System.IO.Disk.hcb:124:41 ===---
;     ---=== System.IO.Disk.hcb:124:63 ===---
;     ---=== System.IO.Disk.hcb:124:85 ===---
;     ---=== System.IO.Disk.hcb:125:13 ===---
;     ---=== System.IO.Disk.hcb:127:17 ===---
;     ---=== System.IO.Disk.hcb:126:38 ===---
;     ---=== System.IO.Disk.hcb:126:38 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-2], 1
ROTULO817:
;     ---=== System.IO.Disk.hcb:126:38 ===---
;     ---=== System.IO.Disk.hcb:126:38 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== System.IO.Disk.hcb:126:22 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.hcb:126:33 ===---
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
jbe ROTULO820
jmp ROTULO821
ROTULO820:
mov ax, 65535
jmp ROTULO822
ROTULO821:
xor ax, ax
ROTULO822:
cmp ax, 0
jne ROTULO818
jmp ROTULO819
ROTULO818:
;     ---=== System.IO.Disk.hcb:128:13 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.IO.Disk.hcb:128:17 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.hcb:128:34 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== System.IO.Disk.hcb:128:27 ===---
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
;     ---=== System.IO.Disk.hcb:129:13 ===---
;     ---=== System.IO.Disk.hcb:129:16 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.hcb:129:38 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
;     ---=== System.IO.Disk.hcb:129:30 ===---
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
jne ROTULO823
jmp ROTULO824
ROTULO823:
;     ---=== System.IO.Disk.hcb:130:17 ===---
; ACAO CHAMADA - Chama indiretamente usando Invoke
;     ---=== System.IO.Disk.hcb:130:54 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+16]
push ax
;     ---=== System.IO.Disk.hcb:130:42 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+14]
push ax
;     ---=== System.IO.Disk.hcb:130:36 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+10+2]
pop es
mov di, [bp+10]
push es
push di
;     ---=== System.IO.Disk.hcb:130:17 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-6+2]
pop es
mov di, [bp+-6]
push es
push di
es call far [di+47]
add sp, 12
;     ---=== System.IO.Disk.hcb:131:17 ===---
;     ---=== System.IO.Disk.hcb:131:22 ===---
xor ax, ax
jmp ROTULO816
ROTULO824:
;     ---=== System.IO.Disk.hcb:126:38 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-2]
jmp ROTULO817
ROTULO819:
;     ---=== System.IO.Disk.hcb:134:15 ===---
mov ax, _disk
mov [bp+-8], ax
mov ax, 134
mov [bp+-10], ax
mov ax, 5
cs jmp word [_os_trycode]
ROTULO816:
mov sp, bp
pop bp
FIM_disk_readblockbyname:
retf
; MODULO FIM: disk
;     ---=== System.hcb:179:8 ===---
; MODULO: string
_string:
db 10
db 83,121,115,116,101,109,46,104,99,98
db 0
;     ---=== System.hcb:180:21 ===---
_string_length:
push bp
mov bp, sp
sub sp, 2
push cs
call _os_stackcheck
; ARG: text TAM: 4 POS: BP+6 
; ARG: i TAM: 2 POS: BP--2 
;     ---=== System.hcb:180:28 ===---
;     ---=== System.hcb:181:13 ===---
;     ---=== System.hcb:182:13 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-2], 0
;     ---=== System.hcb:184:14 ===---
; ACAO INC - Incrementa variavel
inc word [bp+6]
;     ---=== System.hcb:185:9 ===---
ROTULO826:
;     ---=== System.hcb:185:20 ===---
;     ---=== System.hcb:185:15 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== System.hcb:185:22 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
ja ROTULO829
jmp ROTULO830
ROTULO829:
mov ax, 65535
jmp ROTULO831
ROTULO830:
xor ax, ax
ROTULO831:
cmp ax, 0
jne ROTULO827
jmp ROTULO828
ROTULO827:
;     ---=== System.hcb:186:17 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-2]
;     ---=== System.hcb:187:18 ===---
; ACAO INC - Incrementa variavel
inc word [bp+6]
jmp ROTULO826
ROTULO828:
;     ---=== System.hcb:189:9 ===---
;     ---=== System.hcb:189:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
jmp ROTULO825
ROTULO825:
mov sp, bp
pop bp
FIM_string_length:
retf
;     ---=== System.hcb:192:21 ===---
_string_equals:
push bp
mov bp, sp
; ARG: txt1 TAM: 4 POS: BP+6 
; ARG: txt2 TAM: 4 POS: BP+10 
;     ---=== System.hcb:192:28 ===---
;     ---=== System.hcb:192:50 ===---
;     ---=== System.hcb:193:10 ===---
; ACAO INC - Incrementa variavel
inc word [bp+6]
;     ---=== System.hcb:194:10 ===---
; ACAO INC - Incrementa variavel
inc word [bp+10]
;     ---=== System.hcb:195:9 ===---
ROTULO833:
;     ---=== System.hcb:195:20 ===---
;     ---=== System.hcb:195:15 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== System.hcb:195:23 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+10+2]
pop es
mov di, [bp+10]
xor ax, ax
es mov al, [di+0]
mov bx, ax
pop ax
cmp ax, bx
je ROTULO836
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
;     ---=== System.hcb:196:13 ===---
;     ---=== System.hcb:196:21 ===---
;     ---=== System.hcb:196:16 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
xor ax, ax
es mov al, [di+0]
push ax
;     ---=== System.hcb:196:24 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO841
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
;     ---=== System.hcb:196:31 ===---
;     ---=== System.hcb:196:38 ===---
mov ax, 1
jmp ROTULO832
ROTULO840:
;     ---=== System.hcb:197:14 ===---
; ACAO INC - Incrementa variavel
inc word [bp+6]
;     ---=== System.hcb:198:14 ===---
; ACAO INC - Incrementa variavel
inc word [bp+10]
jmp ROTULO833
ROTULO835:
;     ---=== System.hcb:200:9 ===---
;     ---=== System.hcb:200:16 ===---
xor ax, ax
jmp ROTULO832
ROTULO832:
mov sp, bp
pop bp
FIM_string_equals:
retf
;     ---=== System.hcb:203:21 ===---
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
;     ---=== System.hcb:203:28 ===---
;     ---=== System.hcb:203:50 ===---
;     ---=== System.hcb:204:13 ===---
;     ---=== System.hcb:205:13 ===---
;     ---=== System.hcb:206:13 ===---
;     ---=== System.hcb:207:13 ===---
;     ---=== System.hcb:208:13 ===---
;     ---=== System.hcb:209:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.hcb:209:20 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.hcb:209:34 ===---
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
;     ---=== System.hcb:210:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.hcb:210:25 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
xor ax, ax
es mov al, [di+0]
mov [bp+-4], ax
;     ---=== System.hcb:211:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.hcb:211:35 ===---
;     ---=== System.hcb:211:37 ===---
mov ax, 1
push ax
;     ---=== System.hcb:211:15 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.hcb:211:29 ===---
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
;     ---=== System.hcb:212:9 ===---
;     ---=== System.hcb:212:34 ===---
;     ---=== System.hcb:212:29 ===---
;     ---=== System.hcb:212:31 ===---
mov ax, 1
push ax
;     ---=== System.hcb:212:17 ===---
;     ---=== System.hcb:212:20 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== System.hcb:212:13 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-6]
pop bx
add ax, bx
pop bx
add ax, bx
push ax
;     ---=== System.hcb:212:37 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
mov bx, ax
pop ax
cmp ax, bx
ja ROTULO847
jmp ROTULO848
ROTULO847:
mov ax, 65535
jmp ROTULO849
ROTULO848:
xor ax, ax
ROTULO849:
cmp ax, 0
jne ROTULO845
jmp ROTULO846
ROTULO845:
;     ---=== System.hcb:212:62 ===---
mov ax, _string
mov [bp+-8], ax
mov ax, 212
mov [bp+-10], ax
mov ax, 9
cs jmp word [_os_trycode]
ROTULO846:
;     ---=== System.hcb:213:10 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.hcb:213:27 ===---
;     ---=== System.hcb:213:29 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== System.hcb:213:23 ===---
;     ---=== System.hcb:213:25 ===---
mov ax, 1
push ax
;     ---=== System.hcb:213:18 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
pop bx
add ax, bx
pop bx
add ax, bx
mov [bp+6], ax
;     ---=== System.hcb:214:10 ===---
; ACAO INC - Incrementa variavel
inc word [bp+10]
;     ---=== System.hcb:215:22 ===---
;     ---=== System.hcb:215:22 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-8], 1
ROTULO850:
;     ---=== System.hcb:215:22 ===---
;     ---=== System.hcb:215:22 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-8]
push ax
;     ---=== System.hcb:215:22 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-6]
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
;     ---=== System.hcb:216:13 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.hcb:216:19 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+10+2]
pop es
mov di, [bp+10]
xor ax, ax
es mov al, [di+0]
mov [bp+-10], ax
;     ---=== System.hcb:217:13 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.hcb:217:20 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-10]
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov [di+0], al
;     ---=== System.hcb:218:14 ===---
; ACAO INC - Incrementa variavel
inc word [bp+6]
;     ---=== System.hcb:219:14 ===---
; ACAO INC - Incrementa variavel
inc word [bp+10]
;     ---=== System.hcb:215:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-8]
jmp ROTULO850
ROTULO852:
;     ---=== System.hcb:221:9 ===---
; ACAO GRAVACAO - Gravacao de numero em ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov byte [di+0], 0
;     ---=== System.hcb:222:9 ===---
;     ---=== System.hcb:222:16 ===---
mov ax, 1
jmp ROTULO844
ROTULO844:
mov sp, bp
pop bp
FIM_string_concat:
retf
;     ---=== System.hcb:225:21 ===---
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
;     ---=== System.hcb:225:26 ===---
;     ---=== System.hcb:225:48 ===---
;     ---=== System.hcb:226:13 ===---
;     ---=== System.hcb:227:13 ===---
;     ---=== System.hcb:228:13 ===---
;     ---=== System.hcb:229:13 ===---
;     ---=== System.hcb:230:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.hcb:230:25 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
xor ax, ax
es mov al, [di+0]
mov [bp+-2], ax
;     ---=== System.hcb:231:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.hcb:231:40 ===---
;     ---=== System.hcb:231:42 ===---
mov ax, 1
push ax
;     ---=== System.hcb:231:20 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.hcb:231:34 ===---
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
;     ---=== System.hcb:232:10 ===---
; ACAO INC - Incrementa variavel
inc word [bp+6]
;     ---=== System.hcb:233:10 ===---
; ACAO INC - Incrementa variavel
inc word [bp+10]
;     ---=== System.hcb:234:9 ===---
; ACAO GRAVACAO - Gravacao de numero em ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov byte [di+0], 0
;     ---=== System.hcb:235:9 ===---
;     ---=== System.hcb:235:26 ===---
;     ---=== System.hcb:235:12 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== System.hcb:235:38 ===---
;     ---=== System.hcb:235:40 ===---
mov ax, 1
push ax
;     ---=== System.hcb:235:29 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
pop bx
add ax, bx
mov bx, ax
pop ax
cmp ax, bx
jb ROTULO859
jmp ROTULO860
ROTULO859:
mov ax, 65535
jmp ROTULO861
ROTULO860:
xor ax, ax
ROTULO861:
cmp ax, 0
jne ROTULO857
jmp ROTULO858
ROTULO857:
;     ---=== System.hcb:235:54 ===---
mov ax, _string
mov [bp+-8], ax
mov ax, 235
mov [bp+-10], ax
mov ax, 9
cs jmp word [_os_trycode]
ROTULO858:
;     ---=== System.hcb:236:22 ===---
;     ---=== System.hcb:236:22 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-6], 1
ROTULO862:
;     ---=== System.hcb:236:22 ===---
;     ---=== System.hcb:236:22 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-6]
push ax
;     ---=== System.hcb:236:22 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
mov bx, ax
pop ax
cmp ax, bx
jbe ROTULO865
jmp ROTULO866
ROTULO865:
mov ax, 65535
jmp ROTULO867
ROTULO866:
xor ax, ax
ROTULO867:
cmp ax, 0
jne ROTULO863
jmp ROTULO864
ROTULO863:
;     ---=== System.hcb:237:13 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.hcb:237:19 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+10+2]
pop es
mov di, [bp+10]
xor ax, ax
es mov al, [di+0]
mov [bp+-8], ax
;     ---=== System.hcb:238:13 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.hcb:238:20 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-8]
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov [di+0], al
;     ---=== System.hcb:239:14 ===---
; ACAO INC - Incrementa variavel
inc word [bp+10]
;     ---=== System.hcb:240:14 ===---
; ACAO INC - Incrementa variavel
inc word [bp+6]
;     ---=== System.hcb:236:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-6]
jmp ROTULO862
ROTULO864:
;     ---=== System.hcb:242:9 ===---
; ACAO GRAVACAO - Gravacao de numero em ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov byte [di+0], 0
;     ---=== System.hcb:243:9 ===---
;     ---=== System.hcb:243:16 ===---
mov ax, 1
jmp ROTULO856
ROTULO856:
mov sp, bp
pop bp
FIM_string_copy:
retf
; MODULO FIM: string
;     ---=== System.IO.FileSystem.hcb:28:8 ===---
; MODULO: filesystem
_filesystem:
db 24
db 83,121,115,116,101,109,46,73,79,46,70,105,108,101,83,121,115,116,101,109,46,104,99,98
db 0
;     ---=== System.IO.FileSystem.hcb:29:9 ===---
_filesystem_fslist:
times 16 db 0
;     ---=== System.IO.FileSystem.hcb:30:9 ===---
_filesystem_mountlist:
times 16 db 0
;     ---=== System.IO.FileSystem.hcb:31:9 ===---
_filesystem_root:
times 133 db 0
;     ---=== System.IO.FileSystem.hcb:32:9 ===---
_filesystem_rootismounted:
times 2 db 0
;     ---=== System.IO.FileSystem.hcb:34:16 ===---
_filesystem_initialize:
;     ---=== System.IO.FileSystem.hcb:35:9 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_filesystem_rootismounted], 0
;     ---=== System.IO.FileSystem.hcb:36:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.FileSystem.hcb:36:33 ===---
; ACAO CHAMADA - Calcula tamanho de item
mov ax, 45
push ax
;     ---=== System.IO.FileSystem.hcb:36:25 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_filesystem_fslist+2]
pop es
cs mov di, [_filesystem_fslist]
push es
push di
push cs
call _list_initialize
add sp, 6
;     ---=== System.IO.FileSystem.hcb:37:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.FileSystem.hcb:37:36 ===---
; ACAO CHAMADA - Calcula tamanho de item
mov ax, 129
push ax
;     ---=== System.IO.FileSystem.hcb:37:25 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_filesystem_mountlist+2]
pop es
cs mov di, [_filesystem_mountlist]
push es
push di
push cs
call _list_initialize
add sp, 6
ROTULO868:
FIM_filesystem_initialize:
retf
;     ---=== System.IO.FileSystem.hcb:40:16 ===---
_filesystem_getroot:
push bp
mov bp, sp
; ARG: output TAM: 4 POS: BP+6 
;     ---=== System.IO.FileSystem.hcb:40:24 ===---
;     ---=== System.IO.FileSystem.hcb:41:9 ===---
;     ---=== System.IO.FileSystem.hcb:41:12 ===---
;     ---=== System.IO.FileSystem.hcb:41:16 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_filesystem_rootismounted]
not ax
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
;     ---=== System.IO.FileSystem.hcb:41:41 ===---
mov ax, _filesystem
mov [bp+-8], ax
mov ax, 41
mov [bp+-10], ax
mov ax, 5
cs jmp word [_os_trycode]
ROTULO871:
;     ---=== System.IO.FileSystem.hcb:42:9 ===---
; ACAO CHAMADA - Chama indiretamente usando Invoke
;     ---=== System.IO.FileSystem.hcb:42:29 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
;     ---=== System.IO.FileSystem.hcb:42:9 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_filesystem_root+2]
pop es
cs mov di, [_filesystem_root]
push es
push di
es call far [di+125]
add sp, 8
ROTULO869:
mov sp, bp
pop bp
FIM_filesystem_getroot:
retf
;     ---=== System.IO.FileSystem.hcb:45:21 ===---
_filesystem_getdirectoryinfo:
push bp
mov bp, sp
; ARG: parent TAM: 4 POS: BP+6 
; ARG: position TAM: 2 POS: BP+10 
; ARG: output TAM: 4 POS: BP+12 
;     ---=== System.IO.FileSystem.hcb:45:38 ===---
;     ---=== System.IO.FileSystem.hcb:45:63 ===---
;     ---=== System.IO.FileSystem.hcb:45:83 ===---
;     ---=== System.IO.FileSystem.hcb:46:9 ===---
;     ---=== System.IO.FileSystem.hcb:46:16 ===---
; ACAO CHAMADA - Chama indiretamente usando Invoke
;     ---=== System.IO.FileSystem.hcb:46:57 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+12+2]
pop es
mov di, [bp+12]
push es
push di
;     ---=== System.IO.FileSystem.hcb:46:47 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
push ax
;     ---=== System.IO.FileSystem.hcb:46:16 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
es call far [di+47]
add sp, 10
jmp ROTULO875
ROTULO875:
mov sp, bp
pop bp
FIM_filesystem_getdirectoryinfo:
retf
;     ---=== System.IO.FileSystem.hcb:49:21 ===---
_filesystem_getfileinfo:
push bp
mov bp, sp
; ARG: parent TAM: 4 POS: BP+6 
; ARG: position TAM: 2 POS: BP+10 
; ARG: output TAM: 4 POS: BP+12 
;     ---=== System.IO.FileSystem.hcb:49:33 ===---
;     ---=== System.IO.FileSystem.hcb:49:58 ===---
;     ---=== System.IO.FileSystem.hcb:49:78 ===---
;     ---=== System.IO.FileSystem.hcb:50:9 ===---
;     ---=== System.IO.FileSystem.hcb:50:16 ===---
; ACAO CHAMADA - Chama indiretamente usando Invoke
;     ---=== System.IO.FileSystem.hcb:50:52 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+12+2]
pop es
mov di, [bp+12]
push es
push di
;     ---=== System.IO.FileSystem.hcb:50:42 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
push ax
;     ---=== System.IO.FileSystem.hcb:50:16 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
es call far [di+43]
add sp, 10
jmp ROTULO876
ROTULO876:
mov sp, bp
pop bp
FIM_filesystem_getfileinfo:
retf
;     ---=== System.IO.FileSystem.hcb:53:14 ===---
_filesystem_exist:
push bp
mov bp, sp
sub sp, 6
push cs
call _os_stackcheck
; ARG: name TAM: 4 POS: BP+6 
; ARG: i TAM: 2 POS: BP--2 
; ARG: fs TAM: 4 POS: BP--6 
;     ---=== System.IO.FileSystem.hcb:53:20 ===---
;     ---=== System.IO.FileSystem.hcb:54:13 ===---
;     ---=== System.IO.FileSystem.hcb:56:17 ===---
;     ---=== System.IO.FileSystem.hcb:55:39 ===---
;     ---=== System.IO.FileSystem.hcb:55:39 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-2], 1
ROTULO878:
;     ---=== System.IO.FileSystem.hcb:55:39 ===---
;     ---=== System.IO.FileSystem.hcb:55:39 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== System.IO.FileSystem.hcb:55:22 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.FileSystem.hcb:55:33 ===---
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
jbe ROTULO881
jmp ROTULO882
ROTULO881:
mov ax, 65535
jmp ROTULO883
ROTULO882:
xor ax, ax
ROTULO883:
cmp ax, 0
jne ROTULO879
jmp ROTULO880
ROTULO879:
;     ---=== System.IO.FileSystem.hcb:57:13 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.IO.FileSystem.hcb:57:18 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.FileSystem.hcb:57:36 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== System.IO.FileSystem.hcb:57:28 ===---
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
;     ---=== System.IO.FileSystem.hcb:58:13 ===---
;     ---=== System.IO.FileSystem.hcb:58:16 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.FileSystem.hcb:58:39 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
;     ---=== System.IO.FileSystem.hcb:58:30 ===---
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
jne ROTULO884
jmp ROTULO885
ROTULO884:
;     ---=== System.IO.FileSystem.hcb:59:17 ===---
;     ---=== System.IO.FileSystem.hcb:59:24 ===---
mov ax, 65535
jmp ROTULO877
ROTULO885:
;     ---=== System.IO.FileSystem.hcb:55:39 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-2]
jmp ROTULO878
ROTULO880:
;     ---=== System.IO.FileSystem.hcb:62:9 ===---
;     ---=== System.IO.FileSystem.hcb:62:16 ===---
xor ax, ax
jmp ROTULO877
ROTULO877:
mov sp, bp
pop bp
FIM_filesystem_exist:
retf
;     ---=== System.IO.FileSystem.hcb:65:14 ===---
_filesystem_item:
push bp
mov bp, sp
sub sp, 6
push cs
call _os_stackcheck
; ARG: name TAM: 4 POS: BP+6 
; ARG: i TAM: 2 POS: BP--2 
; ARG: fs TAM: 4 POS: BP--6 
;     ---=== System.IO.FileSystem.hcb:65:19 ===---
;     ---=== System.IO.FileSystem.hcb:66:13 ===---
;     ---=== System.IO.FileSystem.hcb:68:17 ===---
;     ---=== System.IO.FileSystem.hcb:67:39 ===---
;     ---=== System.IO.FileSystem.hcb:67:39 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-2], 1
ROTULO887:
;     ---=== System.IO.FileSystem.hcb:67:39 ===---
;     ---=== System.IO.FileSystem.hcb:67:39 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== System.IO.FileSystem.hcb:67:22 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.FileSystem.hcb:67:33 ===---
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
jbe ROTULO890
jmp ROTULO891
ROTULO890:
mov ax, 65535
jmp ROTULO892
ROTULO891:
xor ax, ax
ROTULO892:
cmp ax, 0
jne ROTULO888
jmp ROTULO889
ROTULO888:
;     ---=== System.IO.FileSystem.hcb:69:13 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.IO.FileSystem.hcb:69:18 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.FileSystem.hcb:69:36 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== System.IO.FileSystem.hcb:69:28 ===---
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
;     ---=== System.IO.FileSystem.hcb:70:13 ===---
;     ---=== System.IO.FileSystem.hcb:70:16 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.FileSystem.hcb:70:39 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
;     ---=== System.IO.FileSystem.hcb:70:30 ===---
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
jne ROTULO893
jmp ROTULO894
ROTULO893:
;     ---=== System.IO.FileSystem.hcb:70:50 ===---
;     ---=== System.IO.FileSystem.hcb:70:57 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-6+2]
pop es
mov di, [bp+-6]
jmp ROTULO886
ROTULO894:
;     ---=== System.IO.FileSystem.hcb:67:39 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-2]
jmp ROTULO887
ROTULO889:
;     ---=== System.IO.FileSystem.hcb:72:15 ===---
mov ax, _filesystem
mov [bp+-8], ax
mov ax, 72
mov [bp+-10], ax
mov ax, 5
cs jmp word [_os_trycode]
ROTULO886:
mov sp, bp
pop bp
FIM_filesystem_item:
retf
;     ---=== System.IO.FileSystem.hcb:75:14 ===---
_filesystem_count:
;     ---=== System.IO.FileSystem.hcb:76:9 ===---
;     ---=== System.IO.FileSystem.hcb:76:16 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.FileSystem.hcb:76:27 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_filesystem_fslist+2]
pop es
cs mov di, [_filesystem_fslist]
push es
push di
push cs
call _list_count
add sp, 4
jmp ROTULO895
ROTULO895:
FIM_filesystem_count:
retf
;     ---=== System.IO.FileSystem.hcb:79:21 ===---
_filesystem_registernew:
push bp
mov bp, sp
sub sp, 8
push cs
call _os_stackcheck
; ARG: name TAM: 4 POS: BP+6 
; ARG: ret TAM: 4 POS: BP--4 
; ARG: ptr TAM: 4 POS: BP--8 
;     ---=== System.IO.FileSystem.hcb:79:33 ===---
;     ---=== System.IO.FileSystem.hcb:80:13 ===---
;     ---=== System.IO.FileSystem.hcb:81:13 ===---
;     ---=== System.IO.FileSystem.hcb:82:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.IO.FileSystem.hcb:82:15 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.FileSystem.hcb:82:24 ===---
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
;     ---=== System.IO.FileSystem.hcb:83:10 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO GRAVACAO - Grava segmento em variavel
;     ---=== System.IO.FileSystem.hcb:83:17 ===---
; ACAO LEITURA - Le segmento em variavel
mov ax, [bp+-8+2]
mov word [bp+-4+2], ax
;     ---=== System.IO.FileSystem.hcb:84:10 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.IO.FileSystem.hcb:84:17 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-8]
mov [bp+-4], ax
;     ---=== System.IO.FileSystem.hcb:85:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.IO.FileSystem.hcb:85:20 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-4+2]
pop es
mov di, [bp+-4]
push es
push di
es pop word [di+33]
es pop word [di+33+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.IO.FileSystem.hcb:86:9 ===---
; ACAO GRAVACAO - Gravacao de numero em ponteiro
push word [bp+-8+2]
pop es
mov di, [bp+-8]
es mov byte [di+0], 32
;     ---=== System.IO.FileSystem.hcb:87:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.FileSystem.hcb:87:31 ===---
push cs
pop es
mov di, ROTULO898
jmp ROTULO897
ROTULO898:
db 0
times 1 db 0
ROTULO897:
push es
push di
;     ---=== System.IO.FileSystem.hcb:87:21 ===---
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
;     ---=== System.IO.FileSystem.hcb:88:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.FileSystem.hcb:88:31 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
;     ---=== System.IO.FileSystem.hcb:88:21 ===---
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
;     ---=== System.IO.FileSystem.hcb:89:10 ===---
; ACAO GRAVACAO - Grava segmento em variavel
mov word [bp+-8+2], 0
;     ---=== System.IO.FileSystem.hcb:90:10 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-8], 0
;     ---=== System.IO.FileSystem.hcb:91:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.IO.FileSystem.hcb:91:21 ===---
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
;     ---=== System.IO.FileSystem.hcb:92:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.IO.FileSystem.hcb:92:27 ===---
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
;     ---=== System.IO.FileSystem.hcb:93:9 ===---
;     ---=== System.IO.FileSystem.hcb:93:16 ===---
; ACAO LEITURA - Le ponteiro
jmp ROTULO896
ROTULO896:
mov sp, bp
pop bp
FIM_filesystem_registernew:
retf
;     ---=== System.IO.FileSystem.hcb:96:16 ===---
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
;     ---=== System.IO.FileSystem.hcb:96:22 ===---
;     ---=== System.IO.FileSystem.hcb:96:42 ===---
;     ---=== System.IO.FileSystem.hcb:96:60 ===---
;     ---=== System.IO.FileSystem.hcb:97:13 ===---
;     ---=== System.IO.FileSystem.hcb:98:13 ===---
;     ---=== System.IO.FileSystem.hcb:99:13 ===---
;     ---=== System.IO.FileSystem.hcb:100:13 ===---
;     ---=== System.IO.FileSystem.hcb:101:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.IO.FileSystem.hcb:101:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.FileSystem.hcb:101:23 ===---
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
;     ---=== System.IO.FileSystem.hcb:102:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.IO.FileSystem.hcb:102:14 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.FileSystem.hcb:102:19 ===---
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
;     ---=== System.IO.FileSystem.hcb:103:9 ===---
;     ---=== System.IO.FileSystem.hcb:103:28 ===---
;     ---=== System.IO.FileSystem.hcb:103:13 ===---
; ACAO STRUCTURE - Leitura de Segmento de Ponteiro
es mov ax, [di+43]
push ax
;     ---=== System.IO.FileSystem.hcb:103:31 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO902
jmp ROTULO903
ROTULO902:
mov ax, 65535
jmp ROTULO904
ROTULO903:
xor ax, ax
ROTULO904:
cmp ax, 0
jne ROTULO900
jmp ROTULO901
ROTULO900:
;     ---=== System.IO.FileSystem.hcb:103:44 ===---
mov ax, _filesystem
mov [bp+-8], ax
mov ax, 103
mov [bp+-10], ax
mov ax, 7
cs jmp word [_os_trycode]
ROTULO901:
;     ---=== System.IO.FileSystem.hcb:104:9 ===---
;     ---=== System.IO.FileSystem.hcb:104:22 ===---
;     ---=== System.IO.FileSystem.hcb:104:13 ===---
; ACAO STRUCTURE - Leitura de Segmento de Ponteiro
es mov ax, [di+39]
push ax
;     ---=== System.IO.FileSystem.hcb:104:25 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO907
jmp ROTULO908
ROTULO907:
mov ax, 65535
jmp ROTULO909
ROTULO908:
xor ax, ax
ROTULO909:
cmp ax, 0
jne ROTULO905
jmp ROTULO906
ROTULO905:
;     ---=== System.IO.FileSystem.hcb:104:38 ===---
mov ax, _filesystem
mov [bp+-8], ax
mov ax, 104
mov [bp+-10], ax
mov ax, 7
cs jmp word [_os_trycode]
ROTULO906:
;     ---=== System.IO.FileSystem.hcb:105:9 ===---
;     ---=== System.IO.FileSystem.hcb:105:37 ===---
;     ---=== System.IO.FileSystem.hcb:105:12 ===---
; ACAO CHAMADA - Chama indiretamente usando Invoke
;     ---=== System.IO.FileSystem.hcb:105:34 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-4+2]
pop es
mov di, [bp+-4]
push es
push di
;     ---=== System.IO.FileSystem.hcb:105:12 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-8+2]
pop es
mov di, [bp+-8]
push es
push di
es call far [di+41]
add sp, 8
push ax
;     ---=== System.IO.FileSystem.hcb:105:40 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO912
jmp ROTULO913
ROTULO912:
mov ax, 65535
jmp ROTULO914
ROTULO913:
xor ax, ax
ROTULO914:
cmp ax, 0
jne ROTULO910
jmp ROTULO911
ROTULO910:
;     ---=== System.IO.FileSystem.hcb:105:53 ===---
mov ax, _filesystem
mov [bp+-8], ax
mov ax, 105
mov [bp+-10], ax
mov ax, 12
cs jmp word [_os_trycode]
ROTULO911:
;     ---=== System.IO.FileSystem.hcb:106:9 ===---
;     ---=== System.IO.FileSystem.hcb:106:12 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.FileSystem.hcb:106:38 ===---
push cs
pop es
mov di, ROTULO918
jmp ROTULO917
ROTULO918:
db 1
db 47
times 1 db 0
ROTULO917:
push es
push di
;     ---=== System.IO.FileSystem.hcb:106:26 ===---
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
jne ROTULO915
jmp ROTULO916
ROTULO915:
;     ---=== System.IO.FileSystem.hcb:107:13 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_filesystem_rootismounted], 1
;     ---=== System.IO.FileSystem.hcb:108:13 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.IO.FileSystem.hcb:108:21 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_filesystem_root+2]
pop es
cs mov di, [_filesystem_root]
push es
pop word [bp+-12+2]
mov [bp+-12], di
jmp ROTULO919
ROTULO916:
;     ---=== System.IO.FileSystem.hcb:110:13 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.IO.FileSystem.hcb:110:21 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.FileSystem.hcb:110:30 ===---
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
ROTULO919:
;     ---=== System.IO.FileSystem.hcb:112:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.IO.FileSystem.hcb:112:28 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-12+2]
pop es
mov di, [bp+-12]
push es
push di
es pop word [di+97]
es pop word [di+97+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.IO.FileSystem.hcb:113:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.IO.FileSystem.hcb:113:15 ===---
; ACAO LEITURA - Le ponteiro
push es
pop word [bp+-16+2]
mov [bp+-16], di
;     ---=== System.IO.FileSystem.hcb:114:9 ===---
; ACAO GRAVACAO - Gravacao de numero em ponteiro
es mov byte [di+0], 96
;     ---=== System.IO.FileSystem.hcb:115:10 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-16]
;     ---=== System.IO.FileSystem.hcb:116:9 ===---
; ACAO GRAVACAO - Gravacao de numero em ponteiro
push word [bp+-16+2]
pop es
mov di, [bp+-16]
es mov byte [di+0], 0
;     ---=== System.IO.FileSystem.hcb:117:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.FileSystem.hcb:117:39 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+14+2]
pop es
mov di, [bp+14]
push es
push di
;     ---=== System.IO.FileSystem.hcb:117:21 ===---
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
;     ---=== System.IO.FileSystem.hcb:118:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.IO.FileSystem.hcb:118:28 ===---
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
;     ---=== System.IO.FileSystem.hcb:119:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.IO.FileSystem.hcb:119:26 ===---
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
;     ---=== System.IO.FileSystem.hcb:120:9 ===---
; ACAO CHAMADA - Chama indiretamente usando Invoke
;     ---=== System.IO.FileSystem.hcb:120:25 ===---
; ACAO LEITURA - Le ponteiro
push es
push di
;     ---=== System.IO.FileSystem.hcb:120:9 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-8+2]
pop es
mov di, [bp+-8]
push es
push di
es call far [di+37]
add sp, 8
ROTULO899:
mov sp, bp
pop bp
FIM_filesystem_mount:
retf
; MODULO FIM: filesystem
;     ---=== ConfigDefault.hcb:7:8 ===---
; MODULO: configdefault
_configdefault:
db 17
db 67,111,110,102,105,103,68,101,102,97,117,108,116,46,104,99,98
db 0
;     ---=== ConfigDefault.hcb:8:16 ===---
_configdefault_initialize:
;     ---=== ConfigDefault.hcb:9:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _biosdisk_initialize
;     ---=== ConfigDefault.hcb:10:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _minixfs_initialize
ROTULO920:
FIM_configdefault_initialize:
retf
; MODULO FIM: configdefault
;     ---=== BIOSDisk.hcb:6:8 ===---
; MODULO: biosdisk
_biosdisk:
db 12
db 66,73,79,83,68,105,115,107,46,104,99,98
db 0
;     ---=== BIOSDisk.hcb:7:17 ===---
_biosdisk_floppya360:
times 4 db 0
;     ---=== BIOSDisk.hcb:8:17 ===---
_biosdisk_floppya720:
times 4 db 0
;     ---=== BIOSDisk.hcb:9:17 ===---
_biosdisk_floppya1200:
times 4 db 0
;     ---=== BIOSDisk.hcb:10:17 ===---
_biosdisk_floppya1440:
times 4 db 0
;     ---=== BIOSDisk.hcb:11:17 ===---
_biosdisk_floppyb360:
times 4 db 0
;     ---=== BIOSDisk.hcb:12:17 ===---
_biosdisk_floppyb720:
times 4 db 0
;     ---=== BIOSDisk.hcb:13:17 ===---
_biosdisk_floppyb1200:
times 4 db 0
;     ---=== BIOSDisk.hcb:14:17 ===---
_biosdisk_floppyb1440:
times 4 db 0
;     ---=== BIOSDisk.hcb:15:9 ===---
_biosdisk_buffer:
times 516 db 0
;     ---=== BIOSDisk.hcb:16:9 ===---
_biosdisk_inuse:
times 8 db 0
;     ---=== BIOSDisk.hcb:18:16 ===---
_biosdisk_initialize:
;     ---=== BIOSDisk.hcb:19:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== BIOSDisk.hcb:19:37 ===---
mov ax, 1
push ax
;     ---=== BIOSDisk.hcb:19:30 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_biosdisk_inuse+2]
pop es
cs mov di, [_biosdisk_inuse]
push es
push di
push cs
call _semaphore_initialize
add sp, 6
;     ---=== BIOSDisk.hcb:20:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== BIOSDisk.hcb:20:23 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== BIOSDisk.hcb:20:72 ===---
mov ax, 512
push ax
;     ---=== BIOSDisk.hcb:20:69 ===---
mov ax, 9
push ax
;     ---=== BIOSDisk.hcb:20:66 ===---
mov ax, 2
push ax
;     ---=== BIOSDisk.hcb:20:62 ===---
mov ax, 40
push ax
;     ---=== BIOSDisk.hcb:20:59 ===---
xor ax, ax
push ax
;     ---=== BIOSDisk.hcb:20:40 ===---
push cs
pop es
mov di, ROTULO923
jmp ROTULO922
ROTULO923:
db 15
db 66,73,79,83,68,105,115,107,48,48,48,95,51,54,48
times 1 db 0
ROTULO922:
push es
push di
push cs
call _disk_registernew
add sp, 14
push es
cs pop word [_biosdisk_floppya360+2]
cs mov [_biosdisk_floppya360], di
;     ---=== BIOSDisk.hcb:21:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== BIOSDisk.hcb:21:32 ===---
push cs
pop es
mov di, _biosdisk_readblock
push es
push di
cs push word [_biosdisk_floppya360+2]
pop es
cs mov di, [_biosdisk_floppya360]
es pop word [di+47]
es pop word [di+47+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== BIOSDisk.hcb:22:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== BIOSDisk.hcb:22:33 ===---
push cs
pop es
mov di, _biosdisk_writeblock
push es
push di
cs push word [_biosdisk_floppya360+2]
pop es
cs mov di, [_biosdisk_floppya360]
es pop word [di+51]
es pop word [di+51+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== BIOSDisk.hcb:23:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== BIOSDisk.hcb:23:23 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== BIOSDisk.hcb:23:73 ===---
mov ax, 512
push ax
;     ---=== BIOSDisk.hcb:23:69 ===---
mov ax, 18
push ax
;     ---=== BIOSDisk.hcb:23:66 ===---
mov ax, 2
push ax
;     ---=== BIOSDisk.hcb:23:62 ===---
mov ax, 40
push ax
;     ---=== BIOSDisk.hcb:23:59 ===---
xor ax, ax
push ax
;     ---=== BIOSDisk.hcb:23:40 ===---
push cs
pop es
mov di, ROTULO925
jmp ROTULO924
ROTULO925:
db 15
db 66,73,79,83,68,105,115,107,48,48,48,95,55,50,48
times 1 db 0
ROTULO924:
push es
push di
push cs
call _disk_registernew
add sp, 14
push es
cs pop word [_biosdisk_floppya720+2]
cs mov [_biosdisk_floppya720], di
;     ---=== BIOSDisk.hcb:24:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== BIOSDisk.hcb:24:32 ===---
push cs
pop es
mov di, _biosdisk_readblock
push es
push di
cs push word [_biosdisk_floppya720+2]
pop es
cs mov di, [_biosdisk_floppya720]
es pop word [di+47]
es pop word [di+47+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== BIOSDisk.hcb:25:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== BIOSDisk.hcb:25:33 ===---
push cs
pop es
mov di, _biosdisk_writeblock
push es
push di
cs push word [_biosdisk_floppya720+2]
pop es
cs mov di, [_biosdisk_floppya720]
es pop word [di+51]
es pop word [di+51+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== BIOSDisk.hcb:26:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== BIOSDisk.hcb:26:23 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== BIOSDisk.hcb:26:74 ===---
mov ax, 512
push ax
;     ---=== BIOSDisk.hcb:26:70 ===---
mov ax, 15
push ax
;     ---=== BIOSDisk.hcb:26:67 ===---
mov ax, 2
push ax
;     ---=== BIOSDisk.hcb:26:63 ===---
mov ax, 80
push ax
;     ---=== BIOSDisk.hcb:26:60 ===---
xor ax, ax
push ax
;     ---=== BIOSDisk.hcb:26:40 ===---
push cs
pop es
mov di, ROTULO927
jmp ROTULO926
ROTULO927:
db 16
db 66,73,79,83,68,105,115,107,48,48,48,95,49,50,48,48
times 1 db 0
ROTULO926:
push es
push di
push cs
call _disk_registernew
add sp, 14
push es
cs pop word [_biosdisk_floppya1200+2]
cs mov [_biosdisk_floppya1200], di
;     ---=== BIOSDisk.hcb:27:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== BIOSDisk.hcb:27:33 ===---
push cs
pop es
mov di, _biosdisk_readblock
push es
push di
cs push word [_biosdisk_floppya1200+2]
pop es
cs mov di, [_biosdisk_floppya1200]
es pop word [di+47]
es pop word [di+47+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== BIOSDisk.hcb:28:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== BIOSDisk.hcb:28:34 ===---
push cs
pop es
mov di, _biosdisk_writeblock
push es
push di
cs push word [_biosdisk_floppya1200+2]
pop es
cs mov di, [_biosdisk_floppya1200]
es pop word [di+51]
es pop word [di+51+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== BIOSDisk.hcb:29:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== BIOSDisk.hcb:29:23 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== BIOSDisk.hcb:29:74 ===---
mov ax, 512
push ax
;     ---=== BIOSDisk.hcb:29:70 ===---
mov ax, 18
push ax
;     ---=== BIOSDisk.hcb:29:67 ===---
mov ax, 2
push ax
;     ---=== BIOSDisk.hcb:29:63 ===---
mov ax, 80
push ax
;     ---=== BIOSDisk.hcb:29:60 ===---
xor ax, ax
push ax
;     ---=== BIOSDisk.hcb:29:40 ===---
push cs
pop es
mov di, ROTULO929
jmp ROTULO928
ROTULO929:
db 16
db 66,73,79,83,68,105,115,107,48,48,48,95,49,52,52,48
times 1 db 0
ROTULO928:
push es
push di
push cs
call _disk_registernew
add sp, 14
push es
cs pop word [_biosdisk_floppya1440+2]
cs mov [_biosdisk_floppya1440], di
;     ---=== BIOSDisk.hcb:30:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== BIOSDisk.hcb:30:33 ===---
push cs
pop es
mov di, _biosdisk_readblock
push es
push di
cs push word [_biosdisk_floppya1440+2]
pop es
cs mov di, [_biosdisk_floppya1440]
es pop word [di+47]
es pop word [di+47+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== BIOSDisk.hcb:31:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== BIOSDisk.hcb:31:34 ===---
push cs
pop es
mov di, _biosdisk_writeblock
push es
push di
cs push word [_biosdisk_floppya1440+2]
pop es
cs mov di, [_biosdisk_floppya1440]
es pop word [di+51]
es pop word [di+51+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== BIOSDisk.hcb:32:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== BIOSDisk.hcb:32:23 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== BIOSDisk.hcb:32:72 ===---
mov ax, 512
push ax
;     ---=== BIOSDisk.hcb:32:69 ===---
mov ax, 9
push ax
;     ---=== BIOSDisk.hcb:32:66 ===---
mov ax, 2
push ax
;     ---=== BIOSDisk.hcb:32:62 ===---
mov ax, 40
push ax
;     ---=== BIOSDisk.hcb:32:59 ===---
mov ax, 1
push ax
;     ---=== BIOSDisk.hcb:32:40 ===---
push cs
pop es
mov di, ROTULO931
jmp ROTULO930
ROTULO931:
db 15
db 66,73,79,83,68,105,115,107,48,48,49,95,51,54,48
times 1 db 0
ROTULO930:
push es
push di
push cs
call _disk_registernew
add sp, 14
push es
cs pop word [_biosdisk_floppyb360+2]
cs mov [_biosdisk_floppyb360], di
;     ---=== BIOSDisk.hcb:33:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== BIOSDisk.hcb:33:32 ===---
push cs
pop es
mov di, _biosdisk_readblock
push es
push di
cs push word [_biosdisk_floppyb360+2]
pop es
cs mov di, [_biosdisk_floppyb360]
es pop word [di+47]
es pop word [di+47+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== BIOSDisk.hcb:34:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== BIOSDisk.hcb:34:33 ===---
push cs
pop es
mov di, _biosdisk_writeblock
push es
push di
cs push word [_biosdisk_floppyb360+2]
pop es
cs mov di, [_biosdisk_floppyb360]
es pop word [di+51]
es pop word [di+51+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== BIOSDisk.hcb:35:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== BIOSDisk.hcb:35:23 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== BIOSDisk.hcb:35:73 ===---
mov ax, 512
push ax
;     ---=== BIOSDisk.hcb:35:69 ===---
mov ax, 18
push ax
;     ---=== BIOSDisk.hcb:35:66 ===---
mov ax, 2
push ax
;     ---=== BIOSDisk.hcb:35:62 ===---
mov ax, 40
push ax
;     ---=== BIOSDisk.hcb:35:59 ===---
mov ax, 1
push ax
;     ---=== BIOSDisk.hcb:35:40 ===---
push cs
pop es
mov di, ROTULO933
jmp ROTULO932
ROTULO933:
db 15
db 66,73,79,83,68,105,115,107,48,48,49,95,55,50,48
times 1 db 0
ROTULO932:
push es
push di
push cs
call _disk_registernew
add sp, 14
push es
cs pop word [_biosdisk_floppyb720+2]
cs mov [_biosdisk_floppyb720], di
;     ---=== BIOSDisk.hcb:36:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== BIOSDisk.hcb:36:32 ===---
push cs
pop es
mov di, _biosdisk_readblock
push es
push di
cs push word [_biosdisk_floppyb720+2]
pop es
cs mov di, [_biosdisk_floppyb720]
es pop word [di+47]
es pop word [di+47+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== BIOSDisk.hcb:37:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== BIOSDisk.hcb:37:33 ===---
push cs
pop es
mov di, _biosdisk_writeblock
push es
push di
cs push word [_biosdisk_floppyb720+2]
pop es
cs mov di, [_biosdisk_floppyb720]
es pop word [di+51]
es pop word [di+51+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== BIOSDisk.hcb:38:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== BIOSDisk.hcb:38:23 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== BIOSDisk.hcb:38:74 ===---
mov ax, 512
push ax
;     ---=== BIOSDisk.hcb:38:70 ===---
mov ax, 15
push ax
;     ---=== BIOSDisk.hcb:38:67 ===---
mov ax, 2
push ax
;     ---=== BIOSDisk.hcb:38:63 ===---
mov ax, 80
push ax
;     ---=== BIOSDisk.hcb:38:60 ===---
mov ax, 1
push ax
;     ---=== BIOSDisk.hcb:38:40 ===---
push cs
pop es
mov di, ROTULO935
jmp ROTULO934
ROTULO935:
db 16
db 66,73,79,83,68,105,115,107,48,48,49,95,49,50,48,48
times 1 db 0
ROTULO934:
push es
push di
push cs
call _disk_registernew
add sp, 14
push es
cs pop word [_biosdisk_floppyb1200+2]
cs mov [_biosdisk_floppyb1200], di
;     ---=== BIOSDisk.hcb:39:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== BIOSDisk.hcb:39:33 ===---
push cs
pop es
mov di, _biosdisk_readblock
push es
push di
cs push word [_biosdisk_floppyb1200+2]
pop es
cs mov di, [_biosdisk_floppyb1200]
es pop word [di+47]
es pop word [di+47+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== BIOSDisk.hcb:40:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== BIOSDisk.hcb:40:34 ===---
push cs
pop es
mov di, _biosdisk_writeblock
push es
push di
cs push word [_biosdisk_floppyb1200+2]
pop es
cs mov di, [_biosdisk_floppyb1200]
es pop word [di+51]
es pop word [di+51+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== BIOSDisk.hcb:41:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== BIOSDisk.hcb:41:23 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== BIOSDisk.hcb:41:74 ===---
mov ax, 512
push ax
;     ---=== BIOSDisk.hcb:41:70 ===---
mov ax, 18
push ax
;     ---=== BIOSDisk.hcb:41:67 ===---
mov ax, 2
push ax
;     ---=== BIOSDisk.hcb:41:63 ===---
mov ax, 80
push ax
;     ---=== BIOSDisk.hcb:41:60 ===---
mov ax, 1
push ax
;     ---=== BIOSDisk.hcb:41:40 ===---
push cs
pop es
mov di, ROTULO937
jmp ROTULO936
ROTULO937:
db 16
db 66,73,79,83,68,105,115,107,48,48,49,95,49,52,52,48
times 1 db 0
ROTULO936:
push es
push di
push cs
call _disk_registernew
add sp, 14
push es
cs pop word [_biosdisk_floppyb1440+2]
cs mov [_biosdisk_floppyb1440], di
;     ---=== BIOSDisk.hcb:42:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== BIOSDisk.hcb:42:33 ===---
push cs
pop es
mov di, _biosdisk_readblock
push es
push di
cs push word [_biosdisk_floppyb1440+2]
pop es
cs mov di, [_biosdisk_floppyb1440]
es pop word [di+47]
es pop word [di+47+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== BIOSDisk.hcb:43:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== BIOSDisk.hcb:43:34 ===---
push cs
pop es
mov di, _biosdisk_writeblock
push es
push di
cs push word [_biosdisk_floppyb1440+2]
pop es
cs mov di, [_biosdisk_floppyb1440]
es pop word [di+51]
es pop word [di+51+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
ROTULO921:
FIM_biosdisk_initialize:
retf
;     ---=== BIOSDisk.hcb:46:14 ===---
_biosdisk_callbios:
push bp
mov bp, sp
; ARG: ax TAM: 2 POS: BP+6 
; ARG: bx TAM: 2 POS: BP+8 
; ARG: cx TAM: 2 POS: BP+10 
; ARG: dx TAM: 2 POS: BP+12 
; ARG: es TAM: 2 POS: BP+14 
;     ---=== BIOSDisk.hcb:46:23 ===---
;     ---=== BIOSDisk.hcb:46:37 ===---
;     ---=== BIOSDisk.hcb:46:51 ===---
;     ---=== BIOSDisk.hcb:46:65 ===---
;     ---=== BIOSDisk.hcb:46:79 ===---
;     ---=== BIOSDisk.hcb:47:13 ===---
push bp
;     ---=== BIOSDisk.hcb:48:13 ===---
mov ax, [bp+6]
;     ---=== BIOSDisk.hcb:49:13 ===---
mov bx, [bp+8]
;     ---=== BIOSDisk.hcb:50:13 ===---
mov cx, [bp+10]
;     ---=== BIOSDisk.hcb:51:13 ===---
mov dx, [bp+12]
;     ---=== BIOSDisk.hcb:52:13 ===---
push word [bp+14]
;     ---=== BIOSDisk.hcb:53:13 ===---
pop es
;     ---=== BIOSDisk.hcb:54:13 ===---
int 0x13
;     ---=== BIOSDisk.hcb:55:13 ===---
jnc .ok
;     ---=== BIOSDisk.hcb:56:13 ===---
neg ax
;     ---=== BIOSDisk.hcb:57:13 ===---
.ok:
;     ---=== BIOSDisk.hcb:58:13 ===---
pop bp
ROTULO938:
mov sp, bp
pop bp
FIM_biosdisk_callbios:
retf
;     ---=== BIOSDisk.hcb:61:9 ===---
_biosdisk_readblock:
push bp
mov bp, sp
sub sp, 6
push cs
call _os_stackcheck
; ARG: disk TAM: 4 POS: BP+6 
; ARG: block TAM: 4 POS: BP+10 
; ARG: positionlow TAM: 2 POS: BP+14 
; ARG: positionhigh TAM: 2 POS: BP+16 
; ARG: chs TAM: 4 POS: BP--4 
; ARG: ret TAM: 2 POS: BP--6 
;     ---=== BIOSDisk.hcb:61:19 ===---
;     ---=== BIOSDisk.hcb:61:37 ===---
;     ---=== BIOSDisk.hcb:61:60 ===---
;     ---=== BIOSDisk.hcb:61:83 ===---
;     ---=== BIOSDisk.hcb:62:13 ===---
;     ---=== BIOSDisk.hcb:64:13 ===---
;     ---=== BIOSDisk.hcb:63:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== BIOSDisk.hcb:63:51 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+16]
push ax
;     ---=== BIOSDisk.hcb:63:38 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+14]
push ax
;     ---=== BIOSDisk.hcb:63:32 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
;     ---=== BIOSDisk.hcb:63:27 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-4+2]
pop es
mov di, [bp+-4]
push es
push di
push cs
call _disk_converttochs
add sp, 12
;     ---=== BIOSDisk.hcb:65:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== BIOSDisk.hcb:65:27 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_biosdisk_inuse+2]
pop es
cs mov di, [_biosdisk_inuse]
push es
push di
push cs
call _semaphore_waitone
add sp, 4
;     ---=== BIOSDisk.hcb:66:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _multithreading_suspend
;     ---=== BIOSDisk.hcb:67:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== BIOSDisk.hcb:67:15 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== BIOSDisk.hcb:67:114 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO LEITURA - Le segmento em variavel
cs mov ax, [_biosdisk_buffer+2]
push ax
;     ---=== BIOSDisk.hcb:67:94 ===---
;     ---=== BIOSDisk.hcb:67:96 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 37
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+37]
push ax
;     ---=== BIOSDisk.hcb:67:87 ===---
;     ---=== BIOSDisk.hcb:67:78 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 2
push word [bp+-4+2]
pop es
mov di, [bp+-4]
es mov ax, [di+2]
push ax
;     ---=== BIOSDisk.hcb:67:91 ===---
mov ax, 8
mov cx, ax
pop ax
shl ax, cl
pop bx
add ax, bx
push ax
;     ---=== BIOSDisk.hcb:67:61 ===---
;     ---=== BIOSDisk.hcb:67:64 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 4
es mov ax, [di+4]
push ax
;     ---=== BIOSDisk.hcb:67:54 ===---
;     ---=== BIOSDisk.hcb:67:41 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 0
es mov ax, [di+0]
push ax
;     ---=== BIOSDisk.hcb:67:58 ===---
mov ax, 8
mov cx, ax
pop ax
shl ax, cl
pop bx
add ax, bx
push ax
;     ---=== BIOSDisk.hcb:67:32 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO LEITURA - Le variavel
cs mov ax, [_biosdisk_buffer]
push ax
;     ---=== BIOSDisk.hcb:67:24 ===---
mov ax, 513
push ax
push cs
call _biosdisk_callbios
add sp, 10
mov [bp+-6], ax
;     ---=== BIOSDisk.hcb:68:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _multithreading_resume
;     ---=== BIOSDisk.hcb:69:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== BIOSDisk.hcb:69:27 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_biosdisk_inuse+2]
pop es
cs mov di, [_biosdisk_inuse]
push es
push di
push cs
call _semaphore_release
add sp, 4
;     ---=== BIOSDisk.hcb:70:9 ===---
;     ---=== BIOSDisk.hcb:70:16 ===---
;     ---=== BIOSDisk.hcb:70:12 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-6]
push ax
;     ---=== BIOSDisk.hcb:70:18 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
jl ROTULO942
jmp ROTULO943
ROTULO942:
mov ax, 65535
jmp ROTULO944
ROTULO943:
xor ax, ax
ROTULO944:
cmp ax, 0
jne ROTULO940
jmp ROTULO941
ROTULO940:
;     ---=== BIOSDisk.hcb:70:31 ===---
mov ax, _biosdisk
mov [bp+-8], ax
mov ax, 70
mov [bp+-10], ax
mov ax, 12
cs jmp word [_os_trycode]
ROTULO941:
;     ---=== BIOSDisk.hcb:71:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== BIOSDisk.hcb:71:36 ===---
mov ax, 512
push ax
;     ---=== BIOSDisk.hcb:71:28 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_biosdisk_buffer+2]
pop es
cs mov di, [_biosdisk_buffer]
push es
push di
;     ---=== BIOSDisk.hcb:71:21 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+10+2]
pop es
mov di, [bp+10]
push es
push di
push cs
call _memory_copy
add sp, 10
ROTULO939:
mov sp, bp
pop bp
FIM_biosdisk_readblock:
retf
;     ---=== BIOSDisk.hcb:74:9 ===---
_biosdisk_writeblock:
push bp
mov bp, sp
sub sp, 6
push cs
call _os_stackcheck
; ARG: disk TAM: 4 POS: BP+6 
; ARG: block TAM: 4 POS: BP+10 
; ARG: positionlow TAM: 2 POS: BP+14 
; ARG: positionhigh TAM: 2 POS: BP+16 
; ARG: chs TAM: 4 POS: BP--4 
; ARG: ret TAM: 2 POS: BP--6 
;     ---=== BIOSDisk.hcb:74:20 ===---
;     ---=== BIOSDisk.hcb:74:38 ===---
;     ---=== BIOSDisk.hcb:74:61 ===---
;     ---=== BIOSDisk.hcb:74:84 ===---
;     ---=== BIOSDisk.hcb:75:13 ===---
;     ---=== BIOSDisk.hcb:77:13 ===---
;     ---=== BIOSDisk.hcb:76:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== BIOSDisk.hcb:76:51 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+16]
push ax
;     ---=== BIOSDisk.hcb:76:38 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+14]
push ax
;     ---=== BIOSDisk.hcb:76:32 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
;     ---=== BIOSDisk.hcb:76:27 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-4+2]
pop es
mov di, [bp+-4]
push es
push di
push cs
call _disk_converttochs
add sp, 12
;     ---=== BIOSDisk.hcb:78:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== BIOSDisk.hcb:78:27 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_biosdisk_inuse+2]
pop es
cs mov di, [_biosdisk_inuse]
push es
push di
push cs
call _semaphore_waitone
add sp, 4
;     ---=== BIOSDisk.hcb:79:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _multithreading_suspend
;     ---=== BIOSDisk.hcb:80:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== BIOSDisk.hcb:80:15 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== BIOSDisk.hcb:80:114 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO LEITURA - Le segmento em variavel
cs mov ax, [_biosdisk_buffer+2]
push ax
;     ---=== BIOSDisk.hcb:80:94 ===---
;     ---=== BIOSDisk.hcb:80:96 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 37
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+37]
push ax
;     ---=== BIOSDisk.hcb:80:87 ===---
;     ---=== BIOSDisk.hcb:80:78 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 2
push word [bp+-4+2]
pop es
mov di, [bp+-4]
es mov ax, [di+2]
push ax
;     ---=== BIOSDisk.hcb:80:91 ===---
mov ax, 8
mov cx, ax
pop ax
shl ax, cl
pop bx
add ax, bx
push ax
;     ---=== BIOSDisk.hcb:80:61 ===---
;     ---=== BIOSDisk.hcb:80:64 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 4
es mov ax, [di+4]
push ax
;     ---=== BIOSDisk.hcb:80:54 ===---
;     ---=== BIOSDisk.hcb:80:41 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 0
es mov ax, [di+0]
push ax
;     ---=== BIOSDisk.hcb:80:58 ===---
mov ax, 8
mov cx, ax
pop ax
shl ax, cl
pop bx
add ax, bx
push ax
;     ---=== BIOSDisk.hcb:80:32 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO LEITURA - Le variavel
cs mov ax, [_biosdisk_buffer]
push ax
;     ---=== BIOSDisk.hcb:80:24 ===---
mov ax, 769
push ax
push cs
call _biosdisk_callbios
add sp, 10
mov [bp+-6], ax
;     ---=== BIOSDisk.hcb:81:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _multithreading_resume
;     ---=== BIOSDisk.hcb:82:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== BIOSDisk.hcb:82:27 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_biosdisk_inuse+2]
pop es
cs mov di, [_biosdisk_inuse]
push es
push di
push cs
call _semaphore_release
add sp, 4
;     ---=== BIOSDisk.hcb:83:9 ===---
;     ---=== BIOSDisk.hcb:83:16 ===---
;     ---=== BIOSDisk.hcb:83:12 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-6]
push ax
;     ---=== BIOSDisk.hcb:83:18 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
jl ROTULO948
jmp ROTULO949
ROTULO948:
mov ax, 65535
jmp ROTULO950
ROTULO949:
xor ax, ax
ROTULO950:
cmp ax, 0
jne ROTULO946
jmp ROTULO947
ROTULO946:
;     ---=== BIOSDisk.hcb:83:31 ===---
mov ax, _biosdisk
mov [bp+-8], ax
mov ax, 83
mov [bp+-10], ax
mov ax, 12
cs jmp word [_os_trycode]
ROTULO947:
;     ---=== BIOSDisk.hcb:84:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== BIOSDisk.hcb:84:36 ===---
mov ax, 512
push ax
;     ---=== BIOSDisk.hcb:84:28 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_biosdisk_buffer+2]
pop es
cs mov di, [_biosdisk_buffer]
push es
push di
;     ---=== BIOSDisk.hcb:84:21 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+10+2]
pop es
mov di, [bp+10]
push es
push di
push cs
call _memory_copy
add sp, 10
ROTULO945:
mov sp, bp
pop bp
FIM_biosdisk_writeblock:
retf
; MODULO FIM: biosdisk
;     ---=== MinixFS.hcb:23:8 ===---
; MODULO: minixfs
_minixfs:
db 11
db 77,105,110,105,120,70,83,46,104,99,98
db 0
;     ---=== MinixFS.hcb:24:16 ===---
_minixfs_initialize:
push bp
mov bp, sp
sub sp, 4
push cs
call _os_stackcheck
; ARG: fs TAM: 4 POS: BP--4 
;     ---=== MinixFS.hcb:25:13 ===---
;     ---=== MinixFS.hcb:26:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== MinixFS.hcb:26:14 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== MinixFS.hcb:26:37 ===---
push cs
pop es
mov di, ROTULO953
jmp ROTULO952
ROTULO953:
db 7
db 77,105,110,105,120,70,83
times 1 db 0
ROTULO952:
push es
push di
push cs
call _filesystem_registernew
add sp, 4
push es
pop word [bp+-4+2]
mov [bp+-4], di
;     ---=== MinixFS.hcb:27:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== MinixFS.hcb:27:20 ===---
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
;     ---=== MinixFS.hcb:28:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== MinixFS.hcb:28:26 ===---
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
ROTULO951:
mov sp, bp
pop bp
FIM_minixfs_initialize:
retf
;     ---=== MinixFS.hcb:31:9 ===---
_minixfs_readblock:
push bp
mov bp, sp
; ARG: d TAM: 4 POS: BP+6 
; ARG: block TAM: 4 POS: BP+10 
; ARG: address TAM: 2 POS: BP+14 
;     ---=== MinixFS.hcb:31:19 ===---
;     ---=== MinixFS.hcb:31:34 ===---
;     ---=== MinixFS.hcb:31:57 ===---
;     ---=== MinixFS.hcb:32:9 ===---
;     ---=== MinixFS.hcb:32:20 ===---
;     ---=== MinixFS.hcb:32:12 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+14]
push ax
;     ---=== MinixFS.hcb:32:24 ===---
mov ax, 32768
mov bx, ax
pop ax
and ax, bx
cmp ax, 0
jne ROTULO955
jmp ROTULO956
ROTULO955:
;     ---=== MinixFS.hcb:32:42 ===---
mov ax, _minixfs
mov [bp+-8], ax
mov ax, 32
mov [bp+-10], ax
mov ax, 4
cs jmp word [_os_trycode]
ROTULO956:
;     ---=== MinixFS.hcb:33:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== MinixFS.hcb:33:49 ===---
xor ax, ax
push ax
;     ---=== MinixFS.hcb:33:42 ===---
;     ---=== MinixFS.hcb:33:34 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+14]
push ax
;     ---=== MinixFS.hcb:33:46 ===---
mov ax, 1
mov cx, ax
pop ax
shl ax, cl
push ax
;     ---=== MinixFS.hcb:33:27 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+10+2]
pop es
mov di, [bp+10]
push es
push di
;     ---=== MinixFS.hcb:33:24 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
push cs
call _disk_readblock
add sp, 12
ROTULO954:
mov sp, bp
pop bp
FIM_minixfs_readblock:
retf
;     ---=== MinixFS.hcb:36:14 ===---
_minixfs_ismountable:
push bp
mov bp, sp
sub sp, 12
push cs
call _os_stackcheck
; ARG: fs TAM: 4 POS: BP+6 
; ARG: d TAM: 4 POS: BP+10 
; ARG: buffer TAM: 4 POS: BP--4 
; ARG: ptr TAM: 4 POS: BP--8 
; ARG: index TAM: 4 POS: BP--12 
;     ---=== MinixFS.hcb:36:26 ===---
;     ---=== MinixFS.hcb:36:44 ===---
;     ---=== MinixFS.hcb:37:13 ===---
;     ---=== MinixFS.hcb:38:13 ===---
;     ---=== MinixFS.hcb:39:13 ===---
;     ---=== MinixFS.hcb:40:9 ===---
; ACAO STRUCTURE - Aloca estrutura na pilha
sub sp, 1024
push ss
pop es
mov di, sp
push es
pop word [bp+-4+2]
mov [bp+-4], di
;     ---=== MinixFS.hcb:41:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== MinixFS.hcb:41:15 ===---
; ACAO LEITURA - Le ponteiro
push es
pop word [bp+-8+2]
mov [bp+-8], di
;     ---=== MinixFS.hcb:42:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== MinixFS.hcb:42:17 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-4+2]
pop es
mov di, [bp+-4]
push es
pop word [bp+-12+2]
mov [bp+-12], di
;     ---=== MinixFS.hcb:43:9 ===---
;     ---=== MinixFS.hcb:43:24 ===---
;     ---=== MinixFS.hcb:43:12 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 45
push word [bp+10+2]
pop es
mov di, [bp+10]
es mov ax, [di+45]
push ax
;     ---=== MinixFS.hcb:43:27 ===---
mov ax, 512
mov bx, ax
pop ax
cmp ax, bx
jne ROTULO963
jmp ROTULO964
ROTULO963:
mov ax, 65535
jmp ROTULO965
ROTULO964:
xor ax, ax
ROTULO965:
cmp ax, 0
jne ROTULO961
jmp ROTULO962
ROTULO961:
;     ---=== MinixFS.hcb:43:36 ===---
;     ---=== MinixFS.hcb:43:43 ===---
xor ax, ax
jmp ROTULO960
ROTULO962:
;     ---=== MinixFS.hcb:44:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== MinixFS.hcb:44:27 ===---
mov ax, 1
push ax
;     ---=== MinixFS.hcb:44:22 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-8+2]
pop es
mov di, [bp+-8]
push es
push di
;     ---=== MinixFS.hcb:44:19 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+10+2]
pop es
mov di, [bp+10]
push es
push di
push cs
call _minixfs_readblock
add sp, 10
;     ---=== MinixFS.hcb:45:9 ===---
;     ---=== MinixFS.hcb:45:28 ===---
;     ---=== MinixFS.hcb:45:12 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 16
push word [bp+-12+2]
pop es
mov di, [bp+-12]
es mov ax, [di+16]
push ax
;     ---=== MinixFS.hcb:45:31 ===---
mov ax, 5007
mov bx, ax
pop ax
cmp ax, bx
jne ROTULO968
jmp ROTULO969
ROTULO968:
mov ax, 65535
jmp ROTULO970
ROTULO969:
xor ax, ax
ROTULO970:
cmp ax, 0
jne ROTULO966
jmp ROTULO967
ROTULO966:
;     ---=== MinixFS.hcb:45:41 ===---
;     ---=== MinixFS.hcb:45:48 ===---
xor ax, ax
jmp ROTULO960
ROTULO967:
;     ---=== MinixFS.hcb:46:9 ===---
;     ---=== MinixFS.hcb:46:25 ===---
;     ---=== MinixFS.hcb:46:12 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 0
es mov ax, [di+0]
push ax
;     ---=== MinixFS.hcb:46:28 ===---
mov ax, 32768
mov bx, ax
pop ax
cmp ax, bx
jae ROTULO973
jmp ROTULO974
ROTULO973:
mov ax, 65535
jmp ROTULO975
ROTULO974:
xor ax, ax
ROTULO975:
cmp ax, 0
jne ROTULO971
jmp ROTULO972
ROTULO971:
;     ---=== MinixFS.hcb:46:40 ===---
;     ---=== MinixFS.hcb:46:47 ===---
xor ax, ax
jmp ROTULO960
ROTULO972:
;     ---=== MinixFS.hcb:47:9 ===---
;     ---=== MinixFS.hcb:47:16 ===---
mov ax, 1
jmp ROTULO960
ROTULO960:
mov sp, bp
pop bp
FIM_minixfs_ismountable:
retf
;     ---=== MinixFS.hcb:50:9 ===---
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
;     ---=== MinixFS.hcb:50:15 ===---
;     ---=== MinixFS.hcb:50:33 ===---
;     ---=== MinixFS.hcb:51:13 ===---
;     ---=== MinixFS.hcb:52:13 ===---
;     ---=== MinixFS.hcb:53:13 ===---
;     ---=== MinixFS.hcb:54:9 ===---
; ACAO STRUCTURE - Aloca estrutura na pilha
sub sp, 1024
push ss
pop es
mov di, sp
push es
pop word [bp+-4+2]
mov [bp+-4], di
;     ---=== MinixFS.hcb:55:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== MinixFS.hcb:55:15 ===---
; ACAO LEITURA - Le ponteiro
push es
pop word [bp+-8+2]
mov [bp+-8], di
;     ---=== MinixFS.hcb:56:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== MinixFS.hcb:56:17 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-4+2]
pop es
mov di, [bp+-4]
push es
pop word [bp+-12+2]
mov [bp+-12], di
;     ---=== MinixFS.hcb:57:9 ===---
;     ---=== MinixFS.hcb:57:42 ===---
;     ---=== MinixFS.hcb:57:12 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== MinixFS.hcb:57:28 ===---
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
;     ---=== MinixFS.hcb:57:24 ===---
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
;     ---=== MinixFS.hcb:57:45 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO979
jmp ROTULO980
ROTULO979:
mov ax, 65535
jmp ROTULO981
ROTULO980:
xor ax, ax
ROTULO981:
cmp ax, 0
jne ROTULO977
jmp ROTULO978
ROTULO977:
;     ---=== MinixFS.hcb:57:58 ===---
mov ax, _minixfs
mov [bp+-8], ax
mov ax, 57
mov [bp+-10], ax
mov ax, 14
cs jmp word [_os_trycode]
ROTULO978:
;     ---=== MinixFS.hcb:58:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== MinixFS.hcb:58:38 ===---
mov ax, 1
push ax
;     ---=== MinixFS.hcb:58:33 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-8+2]
pop es
mov di, [bp+-8]
push es
push di
;     ---=== MinixFS.hcb:58:19 ===---
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
ROTULO976:
mov sp, bp
pop bp
FIM_minixfs_mount:
retf
; MODULO FIM: minixfs
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
dw 0
dw 0
dw 0
dw 0
END:
