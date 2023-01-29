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
jmp ROTULO1
_os_trystack:
times 2 db 0
ROTULO1:
;     ---=== System.OS.hcb:3:9 ===---
jmp ROTULO2
_os_trycode:
times 2 db 0
ROTULO2:
;     ---=== System.OS.hcb:4:9 ===---
jmp ROTULO3
_os_trybase:
times 2 db 0
ROTULO3:
;     ---=== System.OS.hcb:5:9 ===---
jmp ROTULO4
_os_tryfatal:
times 2 db 0
ROTULO4:
;     ---=== System.OS.hcb:6:9 ===---
jmp ROTULO5
_os_minstackptr:
times 2 db 0
ROTULO5:
;     ---=== System.OS.hcb:8:9 ===---
;     ---=== System.OS.hcb:17:9 ===---
_os_stackcheck:
ROTULO6:
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
ROTULO8:
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
jne ROTULO11
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
ROTULO15:
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
ROTULO20:
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
je ROTULO26
jmp ROTULO27
ROTULO26:
mov ax, 65535
jmp ROTULO28
ROTULO27:
xor ax, ax
ROTULO28:
cmp ax, 0
jne ROTULO24
jmp ROTULO25
ROTULO24:
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
ROTULO25:
jmp ROTULO8
ROTULO10:
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
mov ax, ROTULO29
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
jmp ROTULO30
ROTULO29:
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
je ROTULO31
jmp ROTULO32
ROTULO31:
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
mov di, ROTULO34
jmp ROTULO33
ROTULO34:
db 17
db 68,105,118,105,115,195,163,111,32,112,111,114,32,122,101,114,111
times 1 db 0
ROTULO33:
push es
push di
push cs
call _program_fatalerror
add sp, 10
jmp ROTULO30
ROTULO32:
mov bx, 2
cmp ax, bx
je ROTULO35
jmp ROTULO36
ROTULO35:
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
mov di, ROTULO38
jmp ROTULO37
ROTULO38:
db 16
db 69,115,116,111,117,114,111,32,100,101,32,112,105,108,104,97
times 1 db 0
ROTULO37:
push es
push di
push cs
call _program_fatalerror
add sp, 10
jmp ROTULO30
ROTULO36:
mov bx, 3
cmp ax, bx
je ROTULO39
jmp ROTULO40
ROTULO39:
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
mov di, ROTULO42
jmp ROTULO41
ROTULO42:
db 12
db 83,101,109,32,109,101,109,195,179,114,105,97
times 1 db 0
ROTULO41:
push es
push di
push cs
call _program_fatalerror
add sp, 10
jmp ROTULO30
ROTULO40:
mov bx, 4
cmp ax, bx
je ROTULO43
jmp ROTULO44
ROTULO43:
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
mov di, ROTULO46
jmp ROTULO45
ROTULO46:
db 22
db 86,97,108,111,114,32,102,111,114,97,32,100,111,115,32,108,105,109,105,116,101,115
times 1 db 0
ROTULO45:
push es
push di
push cs
call _program_fatalerror
add sp, 10
jmp ROTULO30
ROTULO44:
mov bx, 5
cmp ax, bx
je ROTULO47
jmp ROTULO48
ROTULO47:
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
mov di, ROTULO50
jmp ROTULO49
ROTULO50:
db 15
db 78,195,163,111,32,101,110,99,111,110,116,114,97,100,111
times 1 db 0
ROTULO49:
push es
push di
push cs
call _program_fatalerror
add sp, 10
jmp ROTULO30
ROTULO48:
mov bx, 6
cmp ax, bx
je ROTULO51
jmp ROTULO52
ROTULO51:
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
mov di, ROTULO54
jmp ROTULO53
ROTULO54:
db 15
db 73,116,101,109,32,106,195,161,32,101,120,105,115,116,101
times 1 db 0
ROTULO53:
push es
push di
push cs
call _program_fatalerror
add sp, 10
jmp ROTULO30
ROTULO52:
mov bx, 7
cmp ax, bx
je ROTULO55
jmp ROTULO56
ROTULO55:
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
mov di, ROTULO58
jmp ROTULO57
ROTULO58:
db 17
db 78,195,163,111,32,105,109,112,108,101,109,101,110,116,97,100,111
times 1 db 0
ROTULO57:
push es
push di
push cs
call _program_fatalerror
add sp, 10
jmp ROTULO30
ROTULO56:
mov bx, 8
cmp ax, bx
je ROTULO59
jmp ROTULO60
ROTULO59:
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
mov di, ROTULO62
jmp ROTULO61
ROTULO62:
db 18
db 70,97,108,104,97,32,100,101,115,99,111,110,104,101,99,105,100,97
times 1 db 0
ROTULO61:
push es
push di
push cs
call _program_fatalerror
add sp, 10
jmp ROTULO30
ROTULO60:
mov bx, 9
cmp ax, bx
je ROTULO63
jmp ROTULO64
ROTULO63:
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
mov di, ROTULO66
jmp ROTULO65
ROTULO66:
db 21
db 69,115,116,111,117,114,111,32,100,97,32,67,97,112,97,99,105,100,97,100,101
times 1 db 0
ROTULO65:
push es
push di
push cs
call _program_fatalerror
add sp, 10
jmp ROTULO30
ROTULO64:
mov bx, 10
cmp ax, bx
je ROTULO67
jmp ROTULO68
ROTULO67:
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
mov di, ROTULO70
jmp ROTULO69
ROTULO70:
db 12
db 83,101,109,32,114,101,115,112,111,115,116,97
times 1 db 0
ROTULO69:
push es
push di
push cs
call _program_fatalerror
add sp, 10
jmp ROTULO30
ROTULO68:
mov bx, 11
cmp ax, bx
je ROTULO71
jmp ROTULO72
ROTULO71:
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
mov di, ROTULO74
jmp ROTULO73
ROTULO74:
db 23
db 69,115,116,111,117,114,111,32,100,111,32,116,101,109,112,111,32,108,105,109,105,116,101
times 1 db 0
ROTULO73:
push es
push di
push cs
call _program_fatalerror
add sp, 10
jmp ROTULO30
ROTULO72:
mov bx, 12
cmp ax, bx
je ROTULO75
jmp ROTULO76
ROTULO75:
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
mov di, ROTULO78
jmp ROTULO77
ROTULO78:
db 15
db 86,97,108,111,114,32,105,110,118,195,161,108,105,100,111
times 1 db 0
ROTULO77:
push es
push di
push cs
call _program_fatalerror
add sp, 10
jmp ROTULO30
ROTULO76:
mov bx, 13
cmp ax, bx
je ROTULO79
jmp ROTULO80
ROTULO79:
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
mov di, ROTULO82
jmp ROTULO81
ROTULO82:
db 13
db 65,99,101,115,115,111,32,110,101,103,97,100,111
times 1 db 0
ROTULO81:
push es
push di
push cs
call _program_fatalerror
add sp, 10
jmp ROTULO30
ROTULO80:
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
mov di, ROTULO86
jmp ROTULO85
ROTULO86:
db 28
db 79,99,111,114,114,101,117,32,117,109,32,101,114,114,111,32,110,195,163,111,32,116,114,97,116,97,100,111
times 1 db 0
ROTULO85:
push es
push di
push cs
call _program_fatalerror
add sp, 10
jmp ROTULO30
ROTULO84:
cs jmp word [_os_tryfatal]
ROTULO30:
mov ax, [bp+-6]
cs mov [_os_trybase], ax
mov ax, [bp+-4]
cs mov [_os_trystack], ax
mov ax, [bp+-2]
cs mov [_os_trycode], ax
;     ---=== System.OS.hcb:105:9 ===---
ROTULO87:
;     ---=== System.OS.hcb:105:15 ===---
mov ax, 1
cmp ax, 0
jne ROTULO88
jmp ROTULO89
ROTULO88:
;     ---=== System.OS.hcb:106:17 ===---
hlt
jmp ROTULO87
ROTULO89:
ROTULO7:
mov sp, bp
pop bp
FIM_os_start2:
retf
;     ---=== System.OS.hcb:110:21 ===---
_os_codesegment:
;     ---=== System.OS.hcb:111:13 ===---
mov ax, cs
ROTULO90:
FIM_os_codesegment:
retf
;     ---=== System.OS.hcb:114:21 ===---
_os_stacksegment:
;     ---=== System.OS.hcb:115:13 ===---
mov ax, ss
ROTULO91:
FIM_os_stacksegment:
retf
;     ---=== System.OS.hcb:118:21 ===---
_os_realoctable:
;     ---=== System.OS.hcb:119:13 ===---
mov ax, REALOC_TABLE
ROTULO92:
FIM_os_realoctable:
retf
;     ---=== System.OS.hcb:122:21 ===---
_os_consoleavail:
ROTULO93:
FIM_os_consoleavail:
retf
;     ---=== System.OS.hcb:126:21 ===---
_os_consolereadchar:
ROTULO94:
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
ROTULO95:
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
sub sp, 8
push cs
call _os_stackcheck
; ARG: args TAM: 4 POS: BP+6 
; ARG: ptr TAM: 4 POS: BP--4 
; ARG: ver TAM: 4 POS: BP--8 
;     ---=== husix.hcb:17:21 ===---
;     ---=== husix.hcb:18:13 ===---
;     ---=== husix.hcb:19:13 ===---
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
mov di, ROTULO98
jmp ROTULO97
ROTULO98:
db 22
db 72,85,83,73,88,32,79,112,101,114,97,116,105,110,103,32,83,121,115,116,101,109
times 1 db 0
ROTULO97:
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
mov di, ROTULO100
jmp ROTULO99
ROTULO100:
db 8
db 75,101,114,110,101,108,32,118
times 1 db 0
ROTULO99:
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
mov di, ROTULO104
jmp ROTULO103
ROTULO104:
db 2
db 32,82
times 1 db 0
ROTULO103:
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
mov di, ROTULO106
jmp ROTULO105
ROTULO106:
db 3
db 32,45,32
times 1 db 0
ROTULO105:
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
mov di, ROTULO108
jmp ROTULO107
ROTULO108:
db 12
db 73,110,105,116,105,97,108,105,122,105,110,103
times 1 db 0
ROTULO107:
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
;     ---=== husix.hcb:35:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _globalmemory_initialize
;     ---=== husix.hcb:36:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:36:23 ===---
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
;     ---=== husix.hcb:37:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _memory_initialize
;     ---=== husix.hcb:38:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:38:23 ===---
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
;     ---=== husix.hcb:39:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _multithreading_initialize
;     ---=== husix.hcb:40:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:40:23 ===---
push cs
pop es
mov di, ROTULO116
jmp ROTULO115
ROTULO116:
db 1
db 46
times 1 db 0
ROTULO115:
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
mov di, ROTULO118
jmp ROTULO117
ROTULO118:
db 1
db 46
times 1 db 0
ROTULO117:
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
mov di, ROTULO120
jmp ROTULO119
ROTULO120:
db 1
db 46
times 1 db 0
ROTULO119:
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
mov di, ROTULO122
jmp ROTULO121
ROTULO122:
db 8
db 46,32,91,32,79,75,32,93
times 1 db 0
ROTULO121:
push es
push di
push cs
call _console_writeline
add sp, 4
;     ---=== husix.hcb:48:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _configdefault_initialize
;     ---=== husix.hcb:50:9 ===---
ROTULO123:
;     ---=== husix.hcb:50:15 ===---
mov ax, 1
cmp ax, 0
jne ROTULO124
jmp ROTULO125
ROTULO124:
;     ---=== husix.hcb:51:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:51:31 ===---
mov ax, 13
push ax
push cs
call _console_writechar
add sp, 2
;     ---=== husix.hcb:52:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:52:33 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_clock_minute]
push ax
push cs
call _console_writeuint16
add sp, 2
;     ---=== husix.hcb:53:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:53:27 ===---
push cs
pop es
mov di, ROTULO127
jmp ROTULO126
ROTULO127:
db 1
db 58
times 1 db 0
ROTULO126:
push es
push di
push cs
call _console_write
add sp, 4
;     ---=== husix.hcb:54:13 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:54:33 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_clock_second]
push ax
push cs
call _console_writeuint16
add sp, 2
;     ---=== husix.hcb:55:13 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _thread_yield
jmp ROTULO123
ROTULO125:
ROTULO96:
mov sp, bp
pop bp
FIM_program_main:
retf
;     ---=== husix.hcb:59:16 ===---
_program_fatalerror:
push bp
mov bp, sp
; ARG: msg TAM: 4 POS: BP+6 
; ARG: file TAM: 4 POS: BP+10 
; ARG: line TAM: 2 POS: BP+14 
;     ---=== husix.hcb:59:27 ===---
;     ---=== husix.hcb:59:42 ===---
;     ---=== husix.hcb:59:58 ===---
;     ---=== husix.hcb:60:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _console_mode80x25x4
;     ---=== husix.hcb:61:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:61:27 ===---
push cs
pop es
mov di, ROTULO130
jmp ROTULO129
ROTULO130:
db 12
db 70,65,84,65,76,32,69,82,82,79,82,58
times 1 db 0
ROTULO129:
push es
push di
push cs
call _console_writeline
add sp, 4
;     ---=== husix.hcb:62:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:62:23 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+10+2]
pop es
mov di, [bp+10]
push es
push di
push cs
call _console_write
add sp, 4
;     ---=== husix.hcb:63:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:63:23 ===---
push cs
pop es
mov di, ROTULO132
jmp ROTULO131
ROTULO132:
db 1
db 58
times 1 db 0
ROTULO131:
push es
push di
push cs
call _console_write
add sp, 4
;     ---=== husix.hcb:64:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:64:29 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+14]
push ax
push cs
call _console_writeuint16
add sp, 2
;     ---=== husix.hcb:65:9 ===---
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
call _console_writeline
add sp, 4
;     ---=== husix.hcb:66:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:66:27 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
push es
push di
push cs
call _console_writeline
add sp, 4
;     ---=== husix.hcb:67:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:67:27 ===---
push cs
pop es
mov di, ROTULO136
jmp ROTULO135
ROTULO136:
db 0
times 1 db 0
ROTULO135:
push es
push di
push cs
call _console_writeline
add sp, 4
;     ---=== husix.hcb:68:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== husix.hcb:68:27 ===---
push cs
pop es
mov di, ROTULO138
jmp ROTULO137
ROTULO138:
db 15
db 60,83,89,83,84,69,77,32,72,65,76,84,69,68,62
times 1 db 0
ROTULO137:
push es
push di
push cs
call _console_writeline
add sp, 4
;     ---=== husix.hcb:69:9 ===---
ROTULO139:
;     ---=== husix.hcb:69:15 ===---
mov ax, 1
cmp ax, 0
jne ROTULO140
jmp ROTULO141
ROTULO140:
;     ---=== husix.hcb:70:17 ===---
cli
;     ---=== husix.hcb:71:17 ===---
hlt
jmp ROTULO139
ROTULO141:
ROTULO128:
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
mov ax, 2820
es mov [di+4], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== Version.hcb:17:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== Version.hcb:17:23 ===---
push cs
pop es
mov di, ROTULO144
jmp ROTULO143
ROTULO144:
db 5
db 70,105,110,97,108
times 1 db 0
ROTULO143:
push es
push di
push word [bp+6+2]
pop es
mov di, [bp+6]
es pop word [di+6]
es pop word [di+6+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
ROTULO142:
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
ROTULO145:
FIM_console_mode80x25x4:
retf
;     ---=== System.IO.Console.hcb:11:21 ===---
_console_readchar:
;     ---=== System.IO.Console.hcb:12:9 ===---
;     ---=== System.IO.Console.hcb:12:16 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _os_consolereadchar
jmp ROTULO146
ROTULO146:
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
ROTULO148:
;     ---=== System.IO.Console.hcb:23:15 ===---
mov ax, 1
cmp ax, 0
jne ROTULO149
jmp ROTULO150
ROTULO149:
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
je ROTULO153
jmp ROTULO154
ROTULO153:
mov ax, 65535
jmp ROTULO155
ROTULO154:
xor ax, ax
ROTULO155:
cmp ax, 0
jne ROTULO151
jmp ROTULO152
ROTULO151:
;     ---=== System.IO.Console.hcb:25:34 ===---
jmp done
ROTULO152:
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
je ROTULO158
jmp ROTULO159
ROTULO158:
mov ax, 65535
jmp ROTULO160
ROTULO159:
xor ax, ax
ROTULO160:
cmp ax, 0
jne ROTULO156
jmp ROTULO157
ROTULO156:
;     ---=== System.IO.Console.hcb:26:34 ===---
jmp done
ROTULO157:
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
je ROTULO163
jmp ROTULO164
ROTULO163:
mov ax, 65535
jmp ROTULO165
ROTULO164:
xor ax, ax
ROTULO165:
cmp ax, 0
jne ROTULO161
jmp ROTULO162
ROTULO161:
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
ja ROTULO168
jmp ROTULO169
ROTULO168:
mov ax, 65535
jmp ROTULO170
ROTULO169:
xor ax, ax
ROTULO170:
cmp ax, 0
jne ROTULO166
jmp ROTULO167
ROTULO166:
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
ROTULO167:
jmp ROTULO171
ROTULO162:
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
jb ROTULO174
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
ROTULO173:
ROTULO171:
jmp ROTULO148
ROTULO150:
;     ---=== System.IO.Console.hcb:45:9 ===---
done:
;     ---=== System.IO.Console.hcb:46:9 ===---
; ACAO GRAVACAO - Gravacao de numero em ponteiro
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov byte [di+0], 0
ROTULO147:
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
ROTULO177:
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
ROTULO179:
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
ja ROTULO182
jmp ROTULO183
ROTULO182:
mov ax, 65535
jmp ROTULO184
ROTULO183:
xor ax, ax
ROTULO184:
cmp ax, 0
jne ROTULO180
jmp ROTULO181
ROTULO180:
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
jmp ROTULO179
ROTULO181:
ROTULO178:
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
ROTULO185:
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
jne ROTULO187
;     ---=== System.IO.Console.hcb:71:27 ===---
mov ax, _console
mov [bp+-8], ax
mov ax, 71
mov [bp+-10], ax
mov ax, 1
cs jmp word [_os_trycode]
ROTULO187:
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
jne ROTULO188
;     ---=== System.IO.Console.hcb:72:26 ===---
mov ax, _console
mov [bp+-8], ax
mov ax, 72
mov [bp+-10], ax
mov ax, 1
cs jmp word [_os_trycode]
ROTULO188:
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
ja ROTULO191
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
;     ---=== System.IO.Console.hcb:73:26 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Console.hcb:73:38 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
push ax
push cs
call _console_writeuint16
add sp, 2
ROTULO190:
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
ROTULO186:
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
jl ROTULO197
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
ROTULO196:
;     ---=== System.IO.Console.hcb:81:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Console.hcb:81:21 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
push ax
push cs
call _console_writeuint16
add sp, 2
ROTULO194:
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
ROTULO200:
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
ROTULO201:
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
jb ROTULO205
jmp ROTULO206
ROTULO205:
mov ax, 65535
jmp ROTULO207
ROTULO206:
xor ax, ax
ROTULO207:
cmp ax, 0
jne ROTULO203
jmp ROTULO204
ROTULO203:
;     ---=== System.Text.hcb:4:25 ===---
;     ---=== System.Text.hcb:4:32 ===---
mov ax, 1
jmp ROTULO202
ROTULO204:
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
jae ROTULO213
jmp ROTULO214
ROTULO213:
mov ax, 65535
jmp ROTULO215
ROTULO214:
xor ax, ax
ROTULO215:
cmp ax, 0
je ROTULO211
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
jbe ROTULO216
jmp ROTULO217
ROTULO216:
mov ax, 65535
jmp ROTULO218
ROTULO217:
xor ax, ax
ROTULO218:
cmp ax, 0
je ROTULO211
ROTULO210:
mov ax, 65535
jmp ROTULO212
ROTULO211:
xor ax, ax
ROTULO212:
cmp ax, 0
jne ROTULO208
jmp ROTULO209
ROTULO208:
;     ---=== System.Text.hcb:5:45 ===---
;     ---=== System.Text.hcb:5:52 ===---
mov ax, 2
jmp ROTULO202
ROTULO209:
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
jae ROTULO224
jmp ROTULO225
ROTULO224:
mov ax, 65535
jmp ROTULO226
ROTULO225:
xor ax, ax
ROTULO226:
cmp ax, 0
je ROTULO222
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
jbe ROTULO227
jmp ROTULO228
ROTULO227:
mov ax, 65535
jmp ROTULO229
ROTULO228:
xor ax, ax
ROTULO229:
cmp ax, 0
je ROTULO222
ROTULO221:
mov ax, 65535
jmp ROTULO223
ROTULO222:
xor ax, ax
ROTULO223:
cmp ax, 0
jne ROTULO219
jmp ROTULO220
ROTULO219:
;     ---=== System.Text.hcb:6:45 ===---
;     ---=== System.Text.hcb:6:52 ===---
mov ax, 3
jmp ROTULO202
ROTULO220:
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
jae ROTULO235
jmp ROTULO236
ROTULO235:
mov ax, 65535
jmp ROTULO237
ROTULO236:
xor ax, ax
ROTULO237:
cmp ax, 0
je ROTULO233
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
jbe ROTULO238
jmp ROTULO239
ROTULO238:
mov ax, 65535
jmp ROTULO240
ROTULO239:
xor ax, ax
ROTULO240:
cmp ax, 0
je ROTULO233
ROTULO232:
mov ax, 65535
jmp ROTULO234
ROTULO233:
xor ax, ax
ROTULO234:
cmp ax, 0
jne ROTULO230
jmp ROTULO231
ROTULO230:
;     ---=== System.Text.hcb:7:45 ===---
;     ---=== System.Text.hcb:7:52 ===---
mov ax, 4
jmp ROTULO202
ROTULO231:
;     ---=== System.Text.hcb:8:9 ===---
;     ---=== System.Text.hcb:8:16 ===---
mov ax, 1
jmp ROTULO202
ROTULO202:
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
jb ROTULO244
jmp ROTULO245
ROTULO244:
mov ax, 65535
jmp ROTULO246
ROTULO245:
xor ax, ax
ROTULO246:
cmp ax, 0
jne ROTULO242
jmp ROTULO243
ROTULO242:
;     ---=== System.Text.hcb:12:25 ===---
;     ---=== System.Text.hcb:12:32 ===---
; ACAO LEITURA - Le ponteiro
xor ax, ax
es mov al, [di+0]
jmp ROTULO241
ROTULO243:
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
je ROTULO249
jmp ROTULO250
ROTULO249:
mov ax, 65535
jmp ROTULO251
ROTULO250:
xor ax, ax
ROTULO251:
cmp ax, 0
jne ROTULO247
jmp ROTULO248
ROTULO247:
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
je ROTULO254
jmp ROTULO255
ROTULO254:
mov ax, 65535
jmp ROTULO256
ROTULO255:
xor ax, ax
ROTULO256:
cmp ax, 0
jne ROTULO252
jmp ROTULO253
ROTULO252:
;     ---=== System.Text.hcb:15:31 ===---
;     ---=== System.Text.hcb:15:38 ===---
mov ax, 128
jmp ROTULO241
ROTULO253:
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
je ROTULO259
jmp ROTULO260
ROTULO259:
mov ax, 65535
jmp ROTULO261
ROTULO260:
xor ax, ax
ROTULO261:
cmp ax, 0
jne ROTULO257
jmp ROTULO258
ROTULO257:
;     ---=== System.Text.hcb:16:31 ===---
;     ---=== System.Text.hcb:16:38 ===---
mov ax, 135
jmp ROTULO241
ROTULO258:
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
je ROTULO264
jmp ROTULO265
ROTULO264:
mov ax, 65535
jmp ROTULO266
ROTULO265:
xor ax, ax
ROTULO266:
cmp ax, 0
jne ROTULO262
jmp ROTULO263
ROTULO262:
;     ---=== System.Text.hcb:17:31 ===---
;     ---=== System.Text.hcb:17:38 ===---
mov ax, 65
jmp ROTULO241
ROTULO263:
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
je ROTULO269
jmp ROTULO270
ROTULO269:
mov ax, 65535
jmp ROTULO271
ROTULO270:
xor ax, ax
ROTULO271:
cmp ax, 0
jne ROTULO267
jmp ROTULO268
ROTULO267:
;     ---=== System.Text.hcb:18:31 ===---
;     ---=== System.Text.hcb:18:38 ===---
mov ax, 97
jmp ROTULO241
ROTULO268:
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
je ROTULO274
jmp ROTULO275
ROTULO274:
mov ax, 65535
jmp ROTULO276
ROTULO275:
xor ax, ax
ROTULO276:
cmp ax, 0
jne ROTULO272
jmp ROTULO273
ROTULO272:
;     ---=== System.Text.hcb:19:31 ===---
;     ---=== System.Text.hcb:19:38 ===---
mov ax, 79
jmp ROTULO241
ROTULO273:
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
je ROTULO279
jmp ROTULO280
ROTULO279:
mov ax, 65535
jmp ROTULO281
ROTULO280:
xor ax, ax
ROTULO281:
cmp ax, 0
jne ROTULO277
jmp ROTULO278
ROTULO277:
;     ---=== System.Text.hcb:20:31 ===---
;     ---=== System.Text.hcb:20:38 ===---
mov ax, 162
jmp ROTULO241
ROTULO278:
ROTULO248:
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
je ROTULO284
jmp ROTULO285
ROTULO284:
mov ax, 65535
jmp ROTULO286
ROTULO285:
xor ax, ax
ROTULO286:
cmp ax, 0
jne ROTULO282
jmp ROTULO283
ROTULO282:
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
je ROTULO289
jmp ROTULO290
ROTULO289:
mov ax, 65535
jmp ROTULO291
ROTULO290:
xor ax, ax
ROTULO291:
cmp ax, 0
jne ROTULO287
jmp ROTULO288
ROTULO287:
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
je ROTULO294
jmp ROTULO295
ROTULO294:
mov ax, 65535
jmp ROTULO296
ROTULO295:
xor ax, ax
ROTULO296:
cmp ax, 0
jne ROTULO292
jmp ROTULO293
ROTULO292:
;     ---=== System.Text.hcb:26:35 ===---
;     ---=== System.Text.hcb:26:42 ===---
mov ax, 1
jmp ROTULO241
ROTULO293:
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
je ROTULO299
jmp ROTULO300
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
;     ---=== System.Text.hcb:27:35 ===---
;     ---=== System.Text.hcb:27:42 ===---
mov ax, 2
jmp ROTULO241
ROTULO298:
ROTULO288:
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
je ROTULO304
jmp ROTULO305
ROTULO304:
mov ax, 65535
jmp ROTULO306
ROTULO305:
xor ax, ax
ROTULO306:
cmp ax, 0
jne ROTULO302
jmp ROTULO303
ROTULO302:
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
je ROTULO309
jmp ROTULO310
ROTULO309:
mov ax, 65535
jmp ROTULO311
ROTULO310:
xor ax, ax
ROTULO311:
cmp ax, 0
jne ROTULO307
jmp ROTULO308
ROTULO307:
;     ---=== System.Text.hcb:31:35 ===---
;     ---=== System.Text.hcb:31:42 ===---
mov ax, 3
jmp ROTULO241
ROTULO308:
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
je ROTULO314
jmp ROTULO315
ROTULO314:
mov ax, 65535
jmp ROTULO316
ROTULO315:
xor ax, ax
ROTULO316:
cmp ax, 0
jne ROTULO312
jmp ROTULO313
ROTULO312:
;     ---=== System.Text.hcb:32:35 ===---
;     ---=== System.Text.hcb:32:42 ===---
mov ax, 4
jmp ROTULO241
ROTULO313:
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
je ROTULO319
jmp ROTULO320
ROTULO319:
mov ax, 65535
jmp ROTULO321
ROTULO320:
xor ax, ax
ROTULO321:
cmp ax, 0
jne ROTULO317
jmp ROTULO318
ROTULO317:
;     ---=== System.Text.hcb:33:35 ===---
;     ---=== System.Text.hcb:33:42 ===---
mov ax, 5
jmp ROTULO241
ROTULO318:
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
je ROTULO324
jmp ROTULO325
ROTULO324:
mov ax, 65535
jmp ROTULO326
ROTULO325:
xor ax, ax
ROTULO326:
cmp ax, 0
jne ROTULO322
jmp ROTULO323
ROTULO322:
;     ---=== System.Text.hcb:34:35 ===---
;     ---=== System.Text.hcb:34:42 ===---
mov ax, 6
jmp ROTULO241
ROTULO323:
ROTULO303:
ROTULO283:
;     ---=== System.Text.hcb:37:9 ===---
;     ---=== System.Text.hcb:37:16 ===---
mov ax, 63
jmp ROTULO241
ROTULO241:
mov sp, bp
pop bp
FIM_utf8_convertchartocp437:
retf
; MODULO FIM: utf8
;     ---=== System.Threading.hcb:52:8 ===---
; MODULO: multithreading
_multithreading:
db 20
db 83,121,115,116,101,109,46,84,104,114,101,97,100,105,110,103,46,104,99,98
db 0
;     ---=== System.Threading.hcb:53:9 ===---
jmp ROTULO327
_multithreading_active:
times 2 db 0
ROTULO327:
;     ---=== System.Threading.hcb:54:9 ===---
jmp ROTULO328
_multithreading_list:
times 4 db 0
ROTULO328:
;     ---=== System.Threading.hcb:55:24 ===---
jmp ROTULO329
_multithreading_current:
times 4 db 0
ROTULO329:
;     ---=== System.Threading.hcb:56:16 ===---
jmp ROTULO330
_multithreading_kernelthread:
times 30 db 0
ROTULO330:
;     ---=== System.Threading.hcb:57:9 ===---
jmp ROTULO331
_multithreading_inuse:
times 8 db 0
ROTULO331:
;     ---=== System.Threading.hcb:93:9 ===---
jmp ROTULO332
_multithreading_int81temp:
times 4 db 0
ROTULO332:
;     ---=== System.Threading.hcb:59:16 ===---
_multithreading_preinitialize:
;     ---=== System.Threading.hcb:61:9 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_multithreading_active], 0
;     ---=== System.Threading.hcb:62:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:62:27 ===---
mov ax, 1
cs push word [_multithreading_kernelthread+2]
pop es
cs mov di, [_multithreading_kernelthread]
es mov [di+0], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
ROTULO333:
FIM_multithreading_preinitialize:
retf
;     ---=== System.Threading.hcb:65:16 ===---
_multithreading_initialize:
push bp
mov bp, sp
sub sp, 10
push cs
call _os_stackcheck
; ARG: i TAM: 2 POS: BP--2 
; ARG: ptr TAM: 4 POS: BP--6 
; ARG: t TAM: 4 POS: BP--10 
;     ---=== System.Threading.hcb:67:13 ===---
;     ---=== System.Threading.hcb:68:13 ===---
;     ---=== System.Threading.hcb:69:13 ===---
;     ---=== System.Threading.hcb:66:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.Threading.hcb:66:16 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Threading.hcb:66:44 ===---
;     ---=== System.Threading.hcb:66:46 ===---
mov ax, 128
push ax
;     ---=== System.Threading.hcb:66:29 ===---
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
;     ---=== System.Threading.hcb:70:22 ===---
;     ---=== System.Threading.hcb:70:22 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-2], 1
ROTULO335:
;     ---=== System.Threading.hcb:70:22 ===---
;     ---=== System.Threading.hcb:70:22 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== System.Threading.hcb:70:22 ===---
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
;     ---=== System.Threading.hcb:71:13 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.Threading.hcb:71:19 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Threading.hcb:71:24 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
push cs
call _multithreading_item
add sp, 2
push es
pop word [bp+-6+2]
mov [bp+-6], di
;     ---=== System.Threading.hcb:72:13 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.Threading.hcb:72:17 ===---
; ACAO LEITURA - Le ponteiro
push es
pop word [bp+-10+2]
mov [bp+-10], di
;     ---=== System.Threading.hcb:73:13 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:73:20 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
es mov [di+0], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Threading.hcb:74:13 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:74:24 ===---
xor ax, ax
es mov [di+2], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Threading.hcb:75:13 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:75:27 ===---
mov ax, 1
es mov [di+4], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Threading.hcb:76:13 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:76:26 ===---
xor ax, ax
es mov [di+6], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Threading.hcb:77:13 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:77:22 ===---
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
;     ---=== System.Threading.hcb:78:13 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:78:26 ===---
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
;     ---=== System.Threading.hcb:79:13 ===---
;     ---=== System.Threading.hcb:79:18 ===---
;     ---=== System.Threading.hcb:79:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== System.Threading.hcb:79:21 ===---
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
;     ---=== System.Threading.hcb:80:18 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO GRAVACAO - Grava segmento em variavel
;     ---=== System.Threading.hcb:80:34 ===---
; ACAO LEITURA - Le segmento em variavel
mov ax, [bp+-6+2]
cs mov [_multithreading_kernelthread+2], ax
;     ---=== System.Threading.hcb:81:18 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.Threading.hcb:81:34 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-6]
cs mov [_multithreading_kernelthread], ax
;     ---=== System.Threading.hcb:82:18 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO GRAVACAO - Grava segmento em variavel
;     ---=== System.Threading.hcb:82:29 ===---
; ACAO LEITURA - Le segmento em variavel
mov ax, [bp+-6+2]
cs mov [_multithreading_current+2], ax
;     ---=== System.Threading.hcb:83:18 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.Threading.hcb:83:29 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-6]
cs mov [_multithreading_current], ax
ROTULO342:
;     ---=== System.Threading.hcb:70:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-2]
jmp ROTULO335
ROTULO337:
;     ---=== System.Threading.hcb:86:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Threading.hcb:86:37 ===---
mov ax, 1
push ax
;     ---=== System.Threading.hcb:86:30 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_multithreading_inuse+2]
pop es
cs mov di, [_multithreading_inuse]
push es
push di
push cs
call _semaphore_initialize
add sp, 6
;     ---=== System.Threading.hcb:87:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:87:31 ===---
mov ax, 1
cs push word [_multithreading_kernelthread+2]
pop es
cs mov di, [_multithreading_kernelthread]
es mov [di+2], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Threading.hcb:88:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:88:34 ===---
xor ax, ax
es mov [di+4], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Threading.hcb:89:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Threading.hcb:89:34 ===---
push cs
pop es
mov di, _multithreading_int81
push es
push di
;     ---=== System.Threading.hcb:89:28 ===---
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
;     ---=== System.Threading.hcb:95:9 ===---
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
;     ---=== System.Threading.hcb:95:15 ===---
;     ---=== System.Threading.hcb:95:29 ===---
;     ---=== System.Threading.hcb:97:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:97:32 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+2]
cs push word [_multithreading_current+2]
pop es
cs mov di, [_multithreading_current]
es mov [di+14], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Threading.hcb:98:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:98:32 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+4]
es mov [di+16], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Threading.hcb:99:9 ===---
find_next:
;     ---=== System.Threading.hcb:100:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.Threading.hcb:100:21 ===---
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
;     ---=== System.Threading.hcb:101:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.Threading.hcb:101:19 ===---
; ACAO LEITURA - Le ponteiro
push es
cs pop word [_multithreading_current+2]
cs mov [_multithreading_current], di
;     ---=== System.Threading.hcb:102:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.Threading.hcb:102:14 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 14
es mov ax, [di+14]
mov [bp+2], ax
;     ---=== System.Threading.hcb:103:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.Threading.hcb:103:14 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 16
es mov ax, [di+16]
mov [bp+4], ax
;     ---=== System.Threading.hcb:104:9 ===---
;     ---=== System.Threading.hcb:104:12 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 4
es mov ax, [di+4]
cmp ax, 0
jne ROTULO347
jmp ROTULO348
ROTULO347:
;     ---=== System.Threading.hcb:104:40 ===---
jmp find_next
ROTULO348:
;     ---=== System.Threading.hcb:105:9 ===---
;     ---=== System.Threading.hcb:105:12 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 6
es mov ax, [di+6]
cmp ax, 0
jne ROTULO349
jmp ROTULO350
ROTULO349:
;     ---=== System.Threading.hcb:106:13 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:106:32 ===---
xor ax, ax
es mov [di+6], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Threading.hcb:107:13 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.Threading.hcb:107:25 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - Ponteiro Byte - Desvio 10
es push word [di+10+2]
es push word [di+10]
pop di
pop es
push es
cs pop word [_multithreading_int81temp+2]
cs mov [_multithreading_int81temp], di
;     ---=== System.Threading.hcb:108:17 ===---
mov ax, [bp+2]
;     ---=== System.Threading.hcb:109:17 ===---
mov bx, [bp+4]
;     ---=== System.Threading.hcb:110:17 ===---
cli
;     ---=== System.Threading.hcb:111:17 ===---
mov ss, ax
;     ---=== System.Threading.hcb:112:17 ===---
mov sp, ax
;     ---=== System.Threading.hcb:113:17 ===---
sti
;     ---=== System.Threading.hcb:114:17 ===---
push cs
;     ---=== System.Threading.hcb:115:17 ===---
mov ax, _thread_endthread
;     ---=== System.Threading.hcb:116:17 ===---
push ax
;     ---=== System.Threading.hcb:117:17 ===---
pushf
;     ---=== System.Threading.hcb:118:17 ===---
cs push word [_multithreading_int81temp+2]
;     ---=== System.Threading.hcb:119:17 ===---
cs push word [_multithreading_int81temp]
;     ---=== System.Threading.hcb:120:17 ===---
mov ax, ss
;     ---=== System.Threading.hcb:121:17 ===---
mov es, ax
;     ---=== System.Threading.hcb:122:17 ===---
mov ds, ax
;     ---=== System.Threading.hcb:123:17 ===---
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
;     ---=== System.Threading.hcb:127:21 ===---
_multithreading_requestnew:
push bp
mov bp, sp
sub sp, 10
push cs
call _os_stackcheck
; ARG: ptr TAM: 4 POS: BP--4 
; ARG: t TAM: 4 POS: BP--8 
; ARG: i TAM: 2 POS: BP--10 
;     ---=== System.Threading.hcb:128:13 ===---
;     ---=== System.Threading.hcb:129:13 ===---
;     ---=== System.Threading.hcb:130:13 ===---
;     ---=== System.Threading.hcb:131:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Threading.hcb:131:27 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_multithreading_inuse+2]
pop es
cs mov di, [_multithreading_inuse]
push es
push di
push cs
call _semaphore_waitone
add sp, 4
;     ---=== System.Threading.hcb:132:22 ===---
;     ---=== System.Threading.hcb:132:22 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-10], 1
ROTULO352:
;     ---=== System.Threading.hcb:132:22 ===---
;     ---=== System.Threading.hcb:132:22 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-10]
push ax
;     ---=== System.Threading.hcb:132:22 ===---
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
;     ---=== System.Threading.hcb:133:13 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.Threading.hcb:133:17 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Threading.hcb:133:22 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-10]
push ax
push cs
call _multithreading_item
add sp, 2
push es
pop word [bp+-8+2]
mov [bp+-8], di
;     ---=== System.Threading.hcb:134:13 ===---
;     ---=== System.Threading.hcb:134:25 ===---
;     ---=== System.Threading.hcb:134:16 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 2
es mov ax, [di+2]
push ax
;     ---=== System.Threading.hcb:134:28 ===---
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
;     ---=== System.Threading.hcb:135:17 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:135:28 ===---
mov ax, 1
es mov [di+2], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Threading.hcb:136:17 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:136:31 ===---
mov ax, 1
es mov [di+4], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Threading.hcb:137:17 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:137:31 ===---
xor ax, ax
es mov [di+8], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Threading.hcb:138:17 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Threading.hcb:138:35 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_multithreading_inuse+2]
pop es
cs mov di, [_multithreading_inuse]
push es
push di
push cs
call _semaphore_release
add sp, 4
;     ---=== System.Threading.hcb:139:17 ===---
;     ---=== System.Threading.hcb:139:24 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-8+2]
pop es
mov di, [bp+-8]
jmp ROTULO351
ROTULO359:
;     ---=== System.Threading.hcb:132:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-10]
jmp ROTULO352
ROTULO354:
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
call _semaphore_release
add sp, 4
;     ---=== System.Threading.hcb:143:15 ===---
mov ax, _multithreading
mov [bp+-8], ax
mov ax, 143
mov [bp+-10], ax
mov ax, 9
cs jmp word [_os_trycode]
ROTULO351:
mov sp, bp
pop bp
FIM_multithreading_requestnew:
retf
;     ---=== System.Threading.hcb:146:21 ===---
_multithreading_item:
push bp
mov bp, sp
sub sp, 4
push cs
call _os_stackcheck
; ARG: i TAM: 2 POS: BP+6 
; ARG: ptr TAM: 4 POS: BP--4 
;     ---=== System.Threading.hcb:146:26 ===---
;     ---=== System.Threading.hcb:147:13 ===---
;     ---=== System.Threading.hcb:148:9 ===---
; ACAO DEC - Decrementa variavel
dec word [bp+6]
;     ---=== System.Threading.hcb:149:9 ===---
;     ---=== System.Threading.hcb:149:14 ===---
;     ---=== System.Threading.hcb:149:12 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
push ax
;     ---=== System.Threading.hcb:149:17 ===---
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
;     ---=== System.Threading.hcb:149:32 ===---
mov ax, _multithreading
mov [bp+-8], ax
mov ax, 149
mov [bp+-10], ax
mov ax, 5
cs jmp word [_os_trycode]
ROTULO365:
;     ---=== System.Threading.hcb:150:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.Threading.hcb:150:15 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_multithreading_list+2]
pop es
cs mov di, [_multithreading_list]
push es
pop word [bp+-4+2]
mov [bp+-4], di
;     ---=== System.Threading.hcb:151:10 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.Threading.hcb:151:21 ===---
;     ---=== System.Threading.hcb:151:26 ===---
;     ---=== System.Threading.hcb:151:28 ===---
; ACAO CHAMADA - Calcula tamanho de item
mov ax, 26
push ax
;     ---=== System.Threading.hcb:151:24 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
pop bx
mul bx
push ax
;     ---=== System.Threading.hcb:151:17 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
pop bx
add ax, bx
mov [bp+-4], ax
;     ---=== System.Threading.hcb:152:9 ===---
;     ---=== System.Threading.hcb:152:16 ===---
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
;     ---=== System.Threading.hcb:155:21 ===---
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
;     ---=== System.Threading.hcb:156:13 ===---
;     ---=== System.Threading.hcb:157:13 ===---
;     ---=== System.Threading.hcb:158:13 ===---
;     ---=== System.Threading.hcb:159:13 ===---
;     ---=== System.Threading.hcb:160:9 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-12], 0
;     ---=== System.Threading.hcb:161:22 ===---
;     ---=== System.Threading.hcb:161:22 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-10], 1
ROTULO370:
;     ---=== System.Threading.hcb:161:22 ===---
;     ---=== System.Threading.hcb:161:22 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-10]
push ax
;     ---=== System.Threading.hcb:161:22 ===---
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
;     ---=== System.Threading.hcb:162:13 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.Threading.hcb:162:19 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Threading.hcb:162:24 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-10]
push ax
push cs
call _multithreading_item
add sp, 2
push es
pop word [bp+-4+2]
mov [bp+-4], di
;     ---=== System.Threading.hcb:163:14 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO GRAVACAO - Grava segmento em variavel
;     ---=== System.Threading.hcb:163:19 ===---
; ACAO LEITURA - Le segmento em variavel
mov ax, [bp+-4+2]
mov word [bp+-8+2], ax
;     ---=== System.Threading.hcb:164:14 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.Threading.hcb:164:19 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
mov [bp+-8], ax
;     ---=== System.Threading.hcb:165:13 ===---
;     ---=== System.Threading.hcb:165:25 ===---
;     ---=== System.Threading.hcb:165:16 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 2
push word [bp+-8+2]
pop es
mov di, [bp+-8]
es mov ax, [di+2]
push ax
;     ---=== System.Threading.hcb:165:28 ===---
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
;     ---=== System.Threading.hcb:165:35 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-12]
ROTULO377:
;     ---=== System.Threading.hcb:161:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-10]
jmp ROTULO370
ROTULO372:
;     ---=== System.Threading.hcb:167:9 ===---
;     ---=== System.Threading.hcb:167:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-12]
jmp ROTULO369
ROTULO369:
mov sp, bp
pop bp
FIM_multithreading_count:
retf
;     ---=== System.Threading.hcb:170:16 ===---
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
;     ---=== System.Threading.hcb:170:28 ===---
;     ---=== System.Threading.hcb:171:13 ===---
;     ---=== System.Threading.hcb:172:13 ===---
;     ---=== System.Threading.hcb:173:13 ===---
;     ---=== System.Threading.hcb:174:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.Threading.hcb:174:18 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _multithreading_isactive
mov [bp+-2], ax
;     ---=== System.Threading.hcb:175:9 ===---
;     ---=== System.Threading.hcb:175:12 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
cmp ax, 0
jne ROTULO382
jmp ROTULO383
ROTULO382:
;     ---=== System.Threading.hcb:175:24 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _multithreading_suspend
ROTULO383:
;     ---=== System.Threading.hcb:176:10 ===---
; ACAO GRAVACAO - Grava segmento em variavel
;     ---=== System.Threading.hcb:176:18 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO LEITURA - Le segmento em variavel
mov ax, [bp+6+2]
mov word [bp+-10+2], ax
;     ---=== System.Threading.hcb:177:10 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.Threading.hcb:177:18 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
mov [bp+-10], ax
;     ---=== System.Threading.hcb:178:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.Threading.hcb:178:16 ===---
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
;     ---=== System.Threading.hcb:179:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:179:24 ===---
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
;     ---=== System.Threading.hcb:180:10 ===---
; ACAO GRAVACAO - Grava segmento em variavel
;     ---=== System.Threading.hcb:180:18 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO LEITURA - Le segmento em variavel
cs mov ax, [_multithreading_current+2]
mov word [bp+-10+2], ax
;     ---=== System.Threading.hcb:181:10 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.Threading.hcb:181:18 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO LEITURA - Le variavel
cs mov ax, [_multithreading_current]
mov [bp+-10], ax
;     ---=== System.Threading.hcb:182:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:182:22 ===---
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
;     ---=== System.Threading.hcb:183:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:183:18 ===---
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
;     ---=== System.Threading.hcb:184:9 ===---
;     ---=== System.Threading.hcb:184:12 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
cmp ax, 0
jne ROTULO384
jmp ROTULO385
ROTULO384:
;     ---=== System.Threading.hcb:184:24 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _multithreading_resume
ROTULO385:
ROTULO381:
mov sp, bp
pop bp
FIM_multithreading_startthread:
retf
;     ---=== System.Threading.hcb:187:21 ===---
_multithreading_isactive:
;     ---=== System.Threading.hcb:188:9 ===---
;     ---=== System.Threading.hcb:188:16 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_multithreading_active]
jmp ROTULO386
ROTULO386:
FIM_multithreading_isactive:
retf
;     ---=== System.Threading.hcb:191:16 ===---
_multithreading_suspend:
;     ---=== System.Threading.hcb:192:9 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_multithreading_active], 0
ROTULO387:
FIM_multithreading_suspend:
retf
;     ---=== System.Threading.hcb:195:16 ===---
_multithreading_resume:
;     ---=== System.Threading.hcb:196:9 ===---
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
jmp ROTULO489
_memory_firstblockptr:
times 4 db 0
ROTULO489:
;     ---=== System.Memory.hcb:108:9 ===---
jmp ROTULO490
_memory_inuse:
times 8 db 0
ROTULO490:
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
ROTULO491:
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
jne ROTULO493
;     ---=== System.Memory.hcb:124:25 ===---
mov ax, _memory
mov [bp+-8], ax
mov ax, 124
mov [bp+-10], ax
mov ax, 1
cs jmp word [_os_trycode]
ROTULO493:
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
jne ROTULO496
;     ---=== System.Memory.hcb:125:21 ===---
mov ax, _memory
mov [bp+-8], ax
mov ax, 125
mov [bp+-10], ax
mov ax, 1
cs jmp word [_os_trycode]
ROTULO496:
mov bx, ax
pop ax
xor dx, dx
div bx
mov ax, dx
cmp ax, 0
jne ROTULO494
jmp ROTULO495
ROTULO494:
;     ---=== System.Memory.hcb:125:29 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-2]
ROTULO495:
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
ja ROTULO499
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
jne ROTULO502
;     ---=== System.Memory.hcb:127:28 ===---
mov ax, _memory
mov [bp+-8], ax
mov ax, 127
mov [bp+-10], ax
mov ax, 1
cs jmp word [_os_trycode]
ROTULO502:
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
jne ROTULO505
;     ---=== System.Memory.hcb:128:25 ===---
mov ax, _memory
mov [bp+-8], ax
mov ax, 128
mov [bp+-10], ax
mov ax, 1
cs jmp word [_os_trycode]
ROTULO505:
mov bx, ax
pop ax
xor dx, dx
div bx
mov ax, dx
cmp ax, 0
jne ROTULO503
jmp ROTULO504
ROTULO503:
;     ---=== System.Memory.hcb:128:35 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-20]
ROTULO504:
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
jmp ROTULO492
ROTULO498:
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
ROTULO506:
;     ---=== System.Memory.hcb:138:15 ===---
mov ax, 1
cmp ax, 0
jne ROTULO507
jmp ROTULO508
ROTULO507:
;     ---=== System.Memory.hcb:139:14 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-16], 4
;     ---=== System.Memory.hcb:140:26 ===---
;     ---=== System.Memory.hcb:140:26 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-4], 1
ROTULO509:
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
jbe ROTULO512
jmp ROTULO513
ROTULO512:
mov ax, 65535
jmp ROTULO514
ROTULO513:
xor ax, ax
ROTULO514:
cmp ax, 0
jne ROTULO510
jmp ROTULO511
ROTULO510:
;     ---=== System.Memory.hcb:141:17 ===---
;     ---=== System.Memory.hcb:141:20 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-8]
cmp ax, 0
jne ROTULO515
jmp ROTULO516
ROTULO515:
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
;     ---=== System.Memory.hcb:143:25 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-18]
jmp ROTULO522
ROTULO518:
;     ---=== System.Memory.hcb:145:25 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-8], 0
ROTULO522:
jmp ROTULO523
ROTULO516:
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
je ROTULO526
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
ROTULO525:
ROTULO523:
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
ROTULO534:
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
;     ---=== System.Memory.hcb:161:29 ===---
; ACAO GRAVACAO - Gravacao de numero em ponteiro
push word [bp+-16+2]
pop es
mov di, [bp+-16]
es mov word [di+0], 1
jmp ROTULO545
ROTULO541:
;     ---=== System.Memory.hcb:163:29 ===---
; ACAO GRAVACAO - Gravacao de numero em ponteiro
push word [bp+-16+2]
pop es
mov di, [bp+-16]
es mov word [di+0], 2
ROTULO545:
;     ---=== System.Memory.hcb:165:26 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-16]
;     ---=== System.Memory.hcb:166:26 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-16]
;     ---=== System.Memory.hcb:159:34 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-4]
jmp ROTULO534
ROTULO536:
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
jmp ROTULO492
ROTULO530:
;     ---=== System.Memory.hcb:171:18 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-16]
;     ---=== System.Memory.hcb:172:18 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-16]
;     ---=== System.Memory.hcb:140:26 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-4]
jmp ROTULO509
ROTULO511:
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
je ROTULO548
jmp ROTULO549
ROTULO548:
mov ax, 65535
jmp ROTULO550
ROTULO549:
xor ax, ax
ROTULO550:
cmp ax, 0
jne ROTULO546
jmp ROTULO547
ROTULO546:
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
jmp ROTULO551
ROTULO547:
;     ---=== System.Memory.hcb:179:18 ===---
; ACAO GRAVACAO - Grava segmento em variavel
;     ---=== System.Memory.hcb:179:26 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-16+2]
pop es
mov di, [bp+-16]
es mov ax, [di+0]
mov word [bp+-16+2], ax
ROTULO551:
jmp ROTULO506
ROTULO508:
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
ROTULO492:
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
ROTULO552:
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
ROTULO553:
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
ROTULO554:
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
jmp ROTULO555
_globalmemory_memorysizekib:
times 2 db 0
ROTULO555:
;     ---=== System.Memory.hcb:7:9 ===---
jmp ROTULO556
_globalmemory_mapptr:
times 4 db 0
ROTULO556:
;     ---=== System.Memory.hcb:8:9 ===---
jmp ROTULO557
_globalmemory_inuse:
times 8 db 0
ROTULO557:
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
ROTULO559:
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
jbe ROTULO562
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
jb ROTULO567
jmp ROTULO568
ROTULO567:
mov ax, 65535
jmp ROTULO569
ROTULO568:
xor ax, ax
ROTULO569:
cmp ax, 0
jne ROTULO565
jmp ROTULO566
ROTULO565:
;     ---=== System.Memory.hcb:21:33 ===---
; ACAO GRAVACAO - Gravacao de numero em ponteiro
cs push word [_globalmemory_mapptr+2]
pop es
cs mov di, [_globalmemory_mapptr]
es mov byte [di+0], 129
jmp ROTULO570
ROTULO566:
;     ---=== System.Memory.hcb:21:51 ===---
; ACAO GRAVACAO - Gravacao de numero em ponteiro
cs push word [_globalmemory_mapptr+2]
pop es
cs mov di, [_globalmemory_mapptr]
es mov byte [di+0], 0
ROTULO570:
;     ---=== System.Memory.hcb:22:14 ===---
; ACAO INC - Incrementa variavel
cs inc word [_globalmemory_mapptr]
;     ---=== System.Memory.hcb:20:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-4]
jmp ROTULO559
ROTULO561:
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
ROTULO558:
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
;     ---=== System.Memory.hcb:35:34 ===---
mov ax, _globalmemory
mov [bp+-8], ax
mov ax, 35
mov [bp+-10], ax
mov ax, 4
cs jmp word [_os_trycode]
ROTULO573:
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
ja ROTULO579
jmp ROTULO580
ROTULO579:
mov ax, 65535
jmp ROTULO581
ROTULO580:
xor ax, ax
ROTULO581:
cmp ax, 0
jne ROTULO577
jmp ROTULO578
ROTULO577:
;     ---=== System.Memory.hcb:36:36 ===---
mov ax, _globalmemory
mov [bp+-8], ax
mov ax, 36
mov [bp+-10], ax
mov ax, 12
cs jmp word [_os_trycode]
ROTULO578:
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
ROTULO582:
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
jbe ROTULO585
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
;     ---=== System.Memory.hcb:42:13 ===---
;     ---=== System.Memory.hcb:42:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-12]
cmp ax, 0
jne ROTULO588
jmp ROTULO589
ROTULO588:
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
;     ---=== System.Memory.hcb:44:21 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-10]
jmp ROTULO595
ROTULO591:
;     ---=== System.Memory.hcb:46:21 ===---
; ACAO GRAVACAO - Grava em variavel
mov word [bp+-12], 0
ROTULO595:
jmp ROTULO596
ROTULO589:
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
je ROTULO599
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
ROTULO598:
ROTULO596:
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
jae ROTULO604
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
ROTULO607:
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
jbe ROTULO610
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
je ROTULO615
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
jmp ROTULO621
ROTULO614:
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
ROTULO621:
;     ---=== System.Memory.hcb:65:22 ===---
; ACAO INC - Incrementa variavel
cs inc word [_globalmemory_mapptr]
;     ---=== System.Memory.hcb:59:30 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-6]
jmp ROTULO607
ROTULO609:
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
jmp ROTULO571
ROTULO603:
;     ---=== System.Memory.hcb:70:14 ===---
; ACAO INC - Incrementa variavel
cs inc word [_globalmemory_mapptr]
;     ---=== System.Memory.hcb:41:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-6]
jmp ROTULO582
ROTULO584:
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
ROTULO571:
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
ROTULO623:
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
jbe ROTULO626
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
je ROTULO631
jmp ROTULO632
ROTULO631:
mov ax, 65535
jmp ROTULO633
ROTULO632:
xor ax, ax
ROTULO633:
cmp ax, 0
jne ROTULO629
jmp ROTULO630
ROTULO629:
;     ---=== System.Memory.hcb:83:33 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-2]
ROTULO630:
;     ---=== System.Memory.hcb:84:14 ===---
; ACAO INC - Incrementa variavel
cs inc word [_globalmemory_mapptr]
;     ---=== System.Memory.hcb:82:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-4]
jmp ROTULO623
ROTULO625:
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
jmp ROTULO622
ROTULO622:
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
ROTULO635:
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
jbe ROTULO638
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
jne ROTULO643
jmp ROTULO644
ROTULO643:
mov ax, 65535
jmp ROTULO645
ROTULO644:
xor ax, ax
ROTULO645:
cmp ax, 0
jne ROTULO641
jmp ROTULO642
ROTULO641:
;     ---=== System.Memory.hcb:97:33 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-2]
ROTULO642:
;     ---=== System.Memory.hcb:98:14 ===---
; ACAO INC - Incrementa variavel
cs inc word [_globalmemory_mapptr]
;     ---=== System.Memory.hcb:96:22 ===---
; ACAO INC - Incrementa variavel
inc word [bp+-4]
jmp ROTULO635
ROTULO637:
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
jmp ROTULO634
ROTULO634:
mov sp, bp
pop bp
FIM_globalmemory_getusedkib:
retf
; MODULO FIM: globalmemory
;     ---=== System.Threading.hcb:23:8 ===---
; MODULO: semaphore
_semaphore:
db 20
db 83,121,115,116,101,109,46,84,104,114,101,97,100,105,110,103,46,104,99,98
db 0
;     ---=== System.Threading.hcb:24:16 ===---
_semaphore_initialize:
push bp
mov bp, sp
; ARG: s TAM: 4 POS: BP+6 
; ARG: limit TAM: 2 POS: BP+10 
;     ---=== System.Threading.hcb:24:27 ===---
;     ---=== System.Threading.hcb:24:43 ===---
;     ---=== System.Threading.hcb:25:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:25:19 ===---
xor ax, ax
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov [di+0], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Threading.hcb:26:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:26:19 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
es mov [di+2], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
ROTULO646:
mov sp, bp
pop bp
FIM_semaphore_initialize:
retf
;     ---=== System.Threading.hcb:29:16 ===---
_semaphore_waitone:
push bp
mov bp, sp
; ARG: s TAM: 4 POS: BP+6 
;     ---=== System.Threading.hcb:29:24 ===---
;     ---=== System.Threading.hcb:30:9 ===---
waiting:
;     ---=== System.Threading.hcb:31:9 ===---
ROTULO648:
;     ---=== System.Threading.hcb:31:23 ===---
;     ---=== System.Threading.hcb:31:15 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 0
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+0]
push ax
;     ---=== System.Threading.hcb:31:26 ===---
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
;     ---=== System.Threading.hcb:32:13 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _thread_yield
jmp ROTULO648
ROTULO650:
;     ---=== System.Threading.hcb:34:13 ===---
pushf
;     ---=== System.Threading.hcb:35:13 ===---
cli
;     ---=== System.Threading.hcb:36:9 ===---
;     ---=== System.Threading.hcb:36:20 ===---
;     ---=== System.Threading.hcb:36:12 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 0
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+0]
push ax
;     ---=== System.Threading.hcb:36:23 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 2
es mov ax, [di+2]
mov bx, ax
pop ax
cmp ax, bx
jae ROTULO656
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
;     ---=== System.Threading.hcb:37:17 ===---
popf
;     ---=== System.Threading.hcb:38:18 ===---
jmp waiting
ROTULO655:
;     ---=== System.Threading.hcb:40:9 ===---
; ACAO STRUCTURE - Incremento de ponteiro
es inc word [di+0]
;     ---=== System.Threading.hcb:41:13 ===---
popf
ROTULO647:
mov sp, bp
pop bp
FIM_semaphore_waitone:
retf
;     ---=== System.Threading.hcb:44:16 ===---
_semaphore_release:
push bp
mov bp, sp
; ARG: s TAM: 4 POS: BP+6 
;     ---=== System.Threading.hcb:44:24 ===---
;     ---=== System.Threading.hcb:45:13 ===---
pushf
;     ---=== System.Threading.hcb:46:13 ===---
cli
;     ---=== System.Threading.hcb:47:9 ===---
;     ---=== System.Threading.hcb:47:20 ===---
;     ---=== System.Threading.hcb:47:12 ===---
; ACAO STRUCTURE - Leitura de Ponteiro - (U)Int16 - Desvio 0
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov ax, [di+0]
push ax
;     ---=== System.Threading.hcb:47:22 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
ja ROTULO662
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
;     ---=== System.Threading.hcb:47:29 ===---
; ACAO STRUCTURE - Decremento de Ponteiro
es dec word [di+0]
ROTULO661:
;     ---=== System.Threading.hcb:48:13 ===---
popf
ROTULO659:
mov sp, bp
pop bp
FIM_semaphore_release:
retf
; MODULO FIM: semaphore
;     ---=== System.Threading.hcb:200:8 ===---
; MODULO: thread
_thread:
db 20
db 83,121,115,116,101,109,46,84,104,114,101,97,100,105,110,103,46,104,99,98
db 0
;     ---=== System.Threading.hcb:201:21 ===---
_thread_requestnew:
;     ---=== System.Threading.hcb:202:9 ===---
;     ---=== System.Threading.hcb:202:16 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _multithreading_requestnew
jmp ROTULO665
ROTULO665:
FIM_thread_requestnew:
retf
;     ---=== System.Threading.hcb:205:16 ===---
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
;     ---=== System.Threading.hcb:205:22 ===---
;     ---=== System.Threading.hcb:205:35 ===---
;     ---=== System.Threading.hcb:205:59 ===---
;     ---=== System.Threading.hcb:206:13 ===---
;     ---=== System.Threading.hcb:207:13 ===---
;     ---=== System.Threading.hcb:208:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:208:23 ===---
xor ax, ax
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov [di+4], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Threading.hcb:209:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.Threading.hcb:209:17 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Threading.hcb:209:42 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
push ax
;     ---=== System.Threading.hcb:209:39 ===---
; ACAO LEITURA - Le ponteiro
push es
push di
push cs
call _globalmemory_allockib
add sp, 6
push es
pop word [bp+-4+2]
mov [bp+-4], di
;     ---=== System.Threading.hcb:210:10 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.Threading.hcb:210:40 ===---
;     ---=== System.Threading.hcb:210:42 ===---
mov ax, 2
push ax
;     ---=== System.Threading.hcb:210:32 ===---
;     ---=== System.Threading.hcb:210:34 ===---
mov ax, 1024
push ax
;     ---=== System.Threading.hcb:210:19 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
pop bx
mul bx
pop bx
sub ax, bx
mov [bp+-4], ax
;     ---=== System.Threading.hcb:211:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:211:27 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov [di+16], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Threading.hcb:212:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:212:27 ===---
; ACAO LEITURA - Le segmento em variavel
mov ax, [bp+-4+2]
es mov [di+14], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Threading.hcb:213:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:213:22 ===---
mov ax, 1
es mov [di+6], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Threading.hcb:214:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:214:20 ===---
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
;     ---=== System.Threading.hcb:215:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Threading.hcb:215:36 ===---
; ACAO LEITURA - Le ponteiro
push es
push di
push cs
call _multithreading_startthread
add sp, 4
ROTULO666:
mov sp, bp
pop bp
FIM_thread_start:
retf
;     ---=== System.Threading.hcb:218:9 ===---
_thread_endthread:
;     ---=== System.Threading.hcb:219:9 ===---
ROTULO668:
;     ---=== System.Threading.hcb:219:15 ===---
mov ax, 1
cmp ax, 0
jne ROTULO669
jmp ROTULO670
ROTULO669:
;     ---=== System.Threading.hcb:219:17 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _thread_yield
jmp ROTULO668
ROTULO670:
ROTULO667:
FIM_thread_endthread:
retf
;     ---=== System.Threading.hcb:222:16 ===---
_thread_abort:
push bp
mov bp, sp
; ARG: t TAM: 4 POS: BP+6 
;     ---=== System.Threading.hcb:222:22 ===---
;     ---=== System.Threading.hcb:223:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:223:23 ===---
mov ax, 1
push word [bp+6+2]
pop es
mov di, [bp+6]
es mov [di+4], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.Threading.hcb:224:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.Threading.hcb:224:20 ===---
xor ax, ax
es mov [di+2], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
ROTULO671:
mov sp, bp
pop bp
FIM_thread_abort:
retf
;     ---=== System.Threading.hcb:227:21 ===---
_thread_current:
;     ---=== System.Threading.hcb:228:9 ===---
;     ---=== System.Threading.hcb:228:16 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_multithreading_current+2]
pop es
cs mov di, [_multithreading_current]
jmp ROTULO672
ROTULO672:
FIM_thread_current:
retf
;     ---=== System.Threading.hcb:231:16 ===---
_thread_yield:
;     ---=== System.Threading.hcb:232:9 ===---
;     ---=== System.Threading.hcb:232:38 ===---
;     ---=== System.Threading.hcb:232:12 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _multithreading_isactive
push ax
;     ---=== System.Threading.hcb:232:41 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO676
jmp ROTULO677
ROTULO676:
mov ax, 65535
jmp ROTULO678
ROTULO677:
xor ax, ax
ROTULO678:
cmp ax, 0
jne ROTULO674
jmp ROTULO675
ROTULO674:
;     ---=== System.Threading.hcb:232:48 ===---
;     ---=== System.Threading.hcb:232:53 ===---
xor ax, ax
jmp ROTULO673
ROTULO675:
;     ---=== System.Threading.hcb:233:13 ===---
int 0x81
ROTULO673:
FIM_thread_yield:
retf
;     ---=== System.Threading.hcb:236:16 ===---
_thread_sleep:
push bp
mov bp, sp
sub sp, 4
push cs
call _os_stackcheck
; ARG: miliseconds TAM: 2 POS: BP+6 
; ARG: oldmili TAM: 2 POS: BP--2 
; ARG: diff TAM: 2 POS: BP--4 
;     ---=== System.Threading.hcb:236:22 ===---
;     ---=== System.Threading.hcb:237:13 ===---
;     ---=== System.Threading.hcb:238:13 ===---
;     ---=== System.Threading.hcb:239:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.Threading.hcb:239:19 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_clock_timermiliseconds]
mov [bp+-2], ax
;     ---=== System.Threading.hcb:240:9 ===---
ROTULO680:
;     ---=== System.Threading.hcb:240:15 ===---
mov ax, 1
cmp ax, 0
jne ROTULO681
jmp ROTULO682
ROTULO681:
;     ---=== System.Threading.hcb:241:13 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.Threading.hcb:241:43 ===---
;     ---=== System.Threading.hcb:241:45 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== System.Threading.hcb:241:20 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_clock_timermiliseconds]
pop bx
sub ax, bx
mov [bp+-4], ax
;     ---=== System.Threading.hcb:242:13 ===---
;     ---=== System.Threading.hcb:242:21 ===---
;     ---=== System.Threading.hcb:242:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
push ax
;     ---=== System.Threading.hcb:242:24 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
mov bx, ax
pop ax
cmp ax, bx
jae ROTULO685
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
;     ---=== System.Threading.hcb:242:41 ===---
;     ---=== System.Threading.hcb:242:46 ===---
xor ax, ax
jmp ROTULO679
ROTULO684:
;     ---=== System.Threading.hcb:243:13 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _thread_yield
jmp ROTULO680
ROTULO682:
ROTULO679:
mov sp, bp
pop bp
FIM_thread_sleep:
retf
;     ---=== System.Threading.hcb:247:16 ===---
_thread_sleepseconds:
push bp
mov bp, sp
sub sp, 4
push cs
call _os_stackcheck
; ARG: seconds TAM: 2 POS: BP+6 
; ARG: oldsec TAM: 2 POS: BP--2 
; ARG: diff TAM: 2 POS: BP--4 
;     ---=== System.Threading.hcb:247:29 ===---
;     ---=== System.Threading.hcb:248:13 ===---
;     ---=== System.Threading.hcb:249:13 ===---
;     ---=== System.Threading.hcb:250:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.Threading.hcb:250:18 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_clock_timerseconds]
mov [bp+-2], ax
;     ---=== System.Threading.hcb:251:9 ===---
ROTULO689:
;     ---=== System.Threading.hcb:251:15 ===---
mov ax, 1
cmp ax, 0
jne ROTULO690
jmp ROTULO691
ROTULO690:
;     ---=== System.Threading.hcb:252:13 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.Threading.hcb:252:39 ===---
;     ---=== System.Threading.hcb:252:41 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-2]
push ax
;     ---=== System.Threading.hcb:252:20 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_clock_timerseconds]
pop bx
sub ax, bx
mov [bp+-4], ax
;     ---=== System.Threading.hcb:253:13 ===---
;     ---=== System.Threading.hcb:253:21 ===---
;     ---=== System.Threading.hcb:253:16 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
push ax
;     ---=== System.Threading.hcb:253:24 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
mov bx, ax
pop ax
cmp ax, bx
jae ROTULO694
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
;     ---=== System.Threading.hcb:253:37 ===---
;     ---=== System.Threading.hcb:253:42 ===---
xor ax, ax
jmp ROTULO688
ROTULO693:
;     ---=== System.Threading.hcb:254:13 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _thread_yield
jmp ROTULO689
ROTULO691:
ROTULO688:
mov sp, bp
pop bp
FIM_thread_sleepseconds:
retf
; MODULO FIM: thread
;     ---=== System.Timer.hcb:5:8 ===---
; MODULO: clock
_clock:
db 16
db 83,121,115,116,101,109,46,84,105,109,101,114,46,104,99,98
db 0
;     ---=== System.Timer.hcb:6:16 ===---
jmp ROTULO697
_clock_timermiliseconds:
times 2 db 0
ROTULO697:
;     ---=== System.Timer.hcb:7:16 ===---
jmp ROTULO698
_clock_timerseconds:
times 2 db 0
ROTULO698:
;     ---=== System.Timer.hcb:8:16 ===---
jmp ROTULO699
_clock_milisecond:
times 2 db 0
ROTULO699:
;     ---=== System.Timer.hcb:9:16 ===---
jmp ROTULO700
_clock_second:
times 2 db 0
ROTULO700:
;     ---=== System.Timer.hcb:10:16 ===---
jmp ROTULO701
_clock_minute:
times 2 db 0
ROTULO701:
;     ---=== System.Timer.hcb:11:16 ===---
jmp ROTULO702
_clock_hour:
times 2 db 0
ROTULO702:
;     ---=== System.Timer.hcb:12:16 ===---
jmp ROTULO703
_clock_day:
times 2 db 0
ROTULO703:
;     ---=== System.Timer.hcb:13:16 ===---
jmp ROTULO704
_clock_month:
times 2 db 0
ROTULO704:
;     ---=== System.Timer.hcb:14:16 ===---
jmp ROTULO705
_clock_year:
times 2 db 0
ROTULO705:
;     ---=== System.Timer.hcb:16:16 ===---
_clock_initialize:
;     ---=== System.Timer.hcb:17:9 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_clock_year], 2023
;     ---=== System.Timer.hcb:18:9 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_clock_month], 1
;     ---=== System.Timer.hcb:19:9 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_clock_day], 1
;     ---=== System.Timer.hcb:20:9 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_clock_hour], 0
;     ---=== System.Timer.hcb:21:9 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_clock_minute], 0
;     ---=== System.Timer.hcb:22:9 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_clock_second], 0
;     ---=== System.Timer.hcb:23:9 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_clock_milisecond], 0
;     ---=== System.Timer.hcb:24:9 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_clock_timerseconds], 0
ROTULO706:
FIM_clock_initialize:
retf
;     ---=== System.Timer.hcb:27:16 ===---
_clock_autoajust:
;     ---=== System.Timer.hcb:28:9 ===---
;     ---=== System.Timer.hcb:28:17 ===---
;     ---=== System.Timer.hcb:28:12 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_clock_hour]
push ax
;     ---=== System.Timer.hcb:28:19 ===---
mov ax, 24
mov bx, ax
pop ax
cmp ax, bx
jb ROTULO710
jmp ROTULO711
ROTULO710:
mov ax, 65535
jmp ROTULO712
ROTULO711:
xor ax, ax
ROTULO712:
cmp ax, 0
jne ROTULO708
jmp ROTULO709
ROTULO708:
;     ---=== System.Timer.hcb:28:32 ===---
jmp end_ajust
ROTULO709:
;     ---=== System.Timer.hcb:29:9 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_clock_hour], 0
;     ---=== System.Timer.hcb:30:9 ===---
; ACAO INC - Incrementa variavel
cs inc word [_clock_day]
;     ---=== System.Timer.hcb:31:9 ===---
;     ---=== System.Timer.hcb:31:16 ===---
;     ---=== System.Timer.hcb:31:12 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_clock_day]
push ax
;     ---=== System.Timer.hcb:31:18 ===---
mov ax, 28
mov bx, ax
pop ax
cmp ax, bx
jb ROTULO715
jmp ROTULO716
ROTULO715:
mov ax, 65535
jmp ROTULO717
ROTULO716:
xor ax, ax
ROTULO717:
cmp ax, 0
jne ROTULO713
jmp ROTULO714
ROTULO713:
;     ---=== System.Timer.hcb:31:31 ===---
jmp end_ajust
ROTULO714:
;     ---=== System.Timer.hcb:32:9 ===---
;     ---=== System.Timer.hcb:32:16 ===---
;     ---=== System.Timer.hcb:32:12 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_clock_day]
push ax
;     ---=== System.Timer.hcb:32:19 ===---
mov ax, 32
mov bx, ax
pop ax
cmp ax, bx
jae ROTULO720
jmp ROTULO721
ROTULO720:
mov ax, 65535
jmp ROTULO722
ROTULO721:
xor ax, ax
ROTULO722:
cmp ax, 0
jne ROTULO718
jmp ROTULO719
ROTULO718:
;     ---=== System.Timer.hcb:32:32 ===---
jmp calc_month
ROTULO719:
;     ---=== System.Timer.hcb:33:9 ===---
;     ---=== System.Timer.hcb:33:18 ===---
;     ---=== System.Timer.hcb:33:12 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_clock_month]
push ax
;     ---=== System.Timer.hcb:33:21 ===---
mov ax, 2
mov bx, ax
pop ax
cmp ax, bx
je ROTULO725
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
;     ---=== System.Timer.hcb:33:33 ===---
jmp calc_month
ROTULO724:
;     ---=== System.Timer.hcb:34:9 ===---
;     ---=== System.Timer.hcb:34:16 ===---
;     ---=== System.Timer.hcb:34:12 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_clock_day]
push ax
;     ---=== System.Timer.hcb:34:18 ===---
mov ax, 30
mov bx, ax
pop ax
cmp ax, bx
jb ROTULO730
jmp ROTULO731
ROTULO730:
mov ax, 65535
jmp ROTULO732
ROTULO731:
xor ax, ax
ROTULO732:
cmp ax, 0
jne ROTULO728
jmp ROTULO729
ROTULO728:
;     ---=== System.Timer.hcb:34:31 ===---
jmp end_ajust
ROTULO729:
;     ---=== System.Timer.hcb:35:9 ===---
;     ---=== System.Timer.hcb:35:18 ===---
;     ---=== System.Timer.hcb:35:12 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_clock_month]
push ax
;     ---=== System.Timer.hcb:35:21 ===---
mov ax, 4
mov bx, ax
pop ax
cmp ax, bx
je ROTULO735
jmp ROTULO736
ROTULO735:
mov ax, 65535
jmp ROTULO737
ROTULO736:
xor ax, ax
ROTULO737:
cmp ax, 0
jne ROTULO733
jmp ROTULO734
ROTULO733:
;     ---=== System.Timer.hcb:35:33 ===---
jmp calc_month
ROTULO734:
;     ---=== System.Timer.hcb:36:9 ===---
;     ---=== System.Timer.hcb:36:18 ===---
;     ---=== System.Timer.hcb:36:12 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_clock_month]
push ax
;     ---=== System.Timer.hcb:36:21 ===---
mov ax, 6
mov bx, ax
pop ax
cmp ax, bx
je ROTULO740
jmp ROTULO741
ROTULO740:
mov ax, 65535
jmp ROTULO742
ROTULO741:
xor ax, ax
ROTULO742:
cmp ax, 0
jne ROTULO738
jmp ROTULO739
ROTULO738:
;     ---=== System.Timer.hcb:36:33 ===---
jmp calc_month
ROTULO739:
;     ---=== System.Timer.hcb:37:9 ===---
;     ---=== System.Timer.hcb:37:18 ===---
;     ---=== System.Timer.hcb:37:12 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_clock_month]
push ax
;     ---=== System.Timer.hcb:37:21 ===---
mov ax, 9
mov bx, ax
pop ax
cmp ax, bx
je ROTULO745
jmp ROTULO746
ROTULO745:
mov ax, 65535
jmp ROTULO747
ROTULO746:
xor ax, ax
ROTULO747:
cmp ax, 0
jne ROTULO743
jmp ROTULO744
ROTULO743:
;     ---=== System.Timer.hcb:37:33 ===---
jmp calc_month
ROTULO744:
;     ---=== System.Timer.hcb:38:9 ===---
;     ---=== System.Timer.hcb:38:18 ===---
;     ---=== System.Timer.hcb:38:12 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_clock_month]
push ax
;     ---=== System.Timer.hcb:38:21 ===---
mov ax, 11
mov bx, ax
pop ax
cmp ax, bx
je ROTULO750
jmp ROTULO751
ROTULO750:
mov ax, 65535
jmp ROTULO752
ROTULO751:
xor ax, ax
ROTULO752:
cmp ax, 0
jne ROTULO748
jmp ROTULO749
ROTULO748:
;     ---=== System.Timer.hcb:38:34 ===---
jmp calc_month
ROTULO749:
;     ---=== System.Timer.hcb:39:14 ===---
jmp end_ajust
;     ---=== System.Timer.hcb:40:9 ===---
calc_month:
;     ---=== System.Timer.hcb:41:9 ===---
;     ---=== System.Timer.hcb:41:25 ===---
;     ---=== System.Timer.hcb:41:19 ===---
;     ---=== System.Timer.hcb:41:13 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_clock_month]
push ax
;     ---=== System.Timer.hcb:41:21 ===---
mov ax, 13
mov bx, ax
pop ax
cmp ax, bx
ja ROTULO758
jmp ROTULO759
ROTULO758:
mov ax, 65535
jmp ROTULO760
ROTULO759:
xor ax, ax
ROTULO760:
push ax
;     ---=== System.Timer.hcb:41:35 ===---
;     ---=== System.Timer.hcb:41:29 ===---
; ACAO LEITURA - Le variavel
cs mov ax, [_clock_month]
push ax
;     ---=== System.Timer.hcb:41:38 ===---
xor ax, ax
mov bx, ax
pop ax
cmp ax, bx
je ROTULO761
jmp ROTULO762
ROTULO761:
mov ax, 65535
jmp ROTULO763
ROTULO762:
xor ax, ax
ROTULO763:
mov bx, ax
pop ax
or ax, bx
cmp ax, 0
jne ROTULO753
jmp ROTULO754
ROTULO753:
;     ---=== System.Timer.hcb:42:13 ===---
; ACAO GRAVACAO - Grava em variavel
cs mov word [_clock_month], 1
;     ---=== System.Timer.hcb:43:13 ===---
; ACAO INC - Incrementa variavel
cs inc word [_clock_year]
ROTULO754:
;     ---=== System.Timer.hcb:45:9 ===---
end_ajust:
ROTULO707:
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
ROTULO764:
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
ROTULO765:
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
ROTULO766:
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
ROTULO767:
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
ROTULO768:
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
jmp ROTULO769
ROTULO769:
mov sp, bp
pop bp
FIM_io_gethandler:
retf
; MODULO FIM: io
;     ---=== System.Timer.hcb:49:8 ===---
; MODULO: systemtimer
_systemtimer:
db 16
db 83,121,115,116,101,109,46,84,105,109,101,114,46,104,99,98
db 0
;     ---=== System.Timer.hcb:50:9 ===---
jmp ROTULO770
_systemtimer_biosint8cs:
times 2 db 0
ROTULO770:
;     ---=== System.Timer.hcb:51:9 ===---
jmp ROTULO771
_systemtimer_biosint8ip:
times 2 db 0
ROTULO771:
;     ---=== System.Timer.hcb:52:16 ===---
jmp ROTULO772
_systemtimer_ticklow:
times 2 db 0
ROTULO772:
;     ---=== System.Timer.hcb:53:16 ===---
jmp ROTULO773
_systemtimer_tickhigh:
times 2 db 0
ROTULO773:
;     ---=== System.Timer.hcb:54:16 ===---
jmp ROTULO774
_systemtimer_defaultflags:
times 2 db 0
ROTULO774:
;     ---=== System.Timer.hcb:56:16 ===---
_systemtimer_initialize:
push bp
mov bp, sp
sub sp, 4
push cs
call _os_stackcheck
; ARG: ptr TAM: 4 POS: BP--4 
;     ---=== System.Timer.hcb:57:13 ===---
;     ---=== System.Timer.hcb:58:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.Timer.hcb:58:15 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Timer.hcb:58:29 ===---
mov ax, 8
push ax
push cs
call _io_gethandler
add sp, 2
push es
pop word [bp+-4+2]
mov [bp+-4], di
;     ---=== System.Timer.hcb:59:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.Timer.hcb:59:23 ===---
; ACAO LEITURA - Le segmento em variavel
mov ax, [bp+-4+2]
cs mov [_systemtimer_biosint8cs], ax
;     ---=== System.Timer.hcb:60:9 ===---
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.Timer.hcb:60:23 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-4]
cs mov [_systemtimer_biosint8ip], ax
;     ---=== System.Timer.hcb:61:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.Timer.hcb:61:31 ===---
push cs
pop es
mov di, _systemtimer_inttick
push es
push di
;     ---=== System.Timer.hcb:61:28 ===---
mov ax, 8
push ax
push cs
call _io_registerhandler
add sp, 6
;     ---=== System.Timer.hcb:62:13 ===---
sti
;     ---=== System.Timer.hcb:63:13 ===---
pushf
;     ---=== System.Timer.hcb:64:13 ===---
cs pop word [_systemtimer_defaultflags]
ROTULO775:
mov sp, bp
pop bp
FIM_systemtimer_initialize:
retf
;     ---=== System.Timer.hcb:68:9 ===---
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
;     ---=== System.Timer.hcb:69:13 ===---
cs add word [_systemtimer_ticklow], 1
;     ---=== System.Timer.hcb:70:13 ===---
cs adc word [_systemtimer_tickhigh], 0
;     ---=== System.Timer.hcb:72:13 ===---
pushf
;     ---=== System.Timer.hcb:73:13 ===---
push cs
;     ---=== System.Timer.hcb:74:13 ===---
mov ax, .return
;     ---=== System.Timer.hcb:75:13 ===---
push ax
;     ---=== System.Timer.hcb:76:13 ===---
cs push word [_systemtimer_biosint8cs]
;     ---=== System.Timer.hcb:77:13 ===---
cs push word [_systemtimer_biosint8ip]
;     ---=== System.Timer.hcb:78:13 ===---
retf
;     ---=== System.Timer.hcb:79:13 ===---
.return:
;     ---=== System.Timer.hcb:80:13 ===---
cs add word [_clock_milisecond], 55
;     ---=== System.Timer.hcb:81:13 ===---
cs add word [_clock_timermiliseconds], 55
;     ---=== System.Timer.hcb:82:13 ===---
cs cmp word [_clock_milisecond], 990
;     ---=== System.Timer.hcb:83:13 ===---
jb .end_clock
;     ---=== System.Timer.hcb:84:13 ===---
cs mov word [_clock_milisecond], 0
;     ---=== System.Timer.hcb:85:13 ===---
cs add word [_clock_timermiliseconds], 10
;     ---=== System.Timer.hcb:86:13 ===---
cs inc word [_clock_second]
;     ---=== System.Timer.hcb:87:13 ===---
cs inc word [_clock_timerseconds]
;     ---=== System.Timer.hcb:88:13 ===---
cs cmp word [_clock_second], 60
;     ---=== System.Timer.hcb:89:13 ===---
jb .end_clock
;     ---=== System.Timer.hcb:90:13 ===---
cs mov word [_clock_second], 0
;     ---=== System.Timer.hcb:91:13 ===---
cs inc word [_clock_minute]
;     ---=== System.Timer.hcb:92:13 ===---
cs cmp word [_clock_minute], 60
;     ---=== System.Timer.hcb:93:13 ===---
jb .end_clock
;     ---=== System.Timer.hcb:94:13 ===---
cs mov word [_clock_minute], 0
;     ---=== System.Timer.hcb:95:13 ===---
cs inc word [_clock_hour]
;     ---=== System.Timer.hcb:96:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _clock_autoajust
;     ---=== System.Timer.hcb:97:13 ===---
.end_clock:
;     ---=== System.Timer.hcb:98:9 ===---
; ACAO CHAMADA - Chama rotina
push cs
call _thread_yield
ROTULO776:
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
;     ---=== System.IO.Disk.hcb:25:8 ===---
; MODULO: disk
_disk:
db 18
db 83,121,115,116,101,109,46,73,79,46,68,105,115,107,46,104,99,98
db 0
;     ---=== System.IO.Disk.hcb:26:9 ===---
jmp ROTULO777
_disk_disks:
times 16 db 0
ROTULO777:
;     ---=== System.IO.Disk.hcb:28:16 ===---
_disk_initialize:
;     ---=== System.IO.Disk.hcb:29:9 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.hcb:29:32 ===---
; ACAO CHAMADA - Calcula tamanho de item
mov ax, 18
push ax
;     ---=== System.IO.Disk.hcb:29:25 ===---
; ACAO LEITURA - Le ponteiro
cs push word [_disk_disks+2]
pop es
cs mov di, [_disk_disks]
push es
push di
push cs
call _list_initialize
add sp, 6
ROTULO778:
FIM_disk_initialize:
retf
;     ---=== System.IO.Disk.hcb:32:21 ===---
_disk_registernew:
push bp
mov bp, sp
sub sp, 8
push cs
call _os_stackcheck
; ARG: internalid TAM: 2 POS: BP+6 
; ARG: cilinders TAM: 2 POS: BP+8 
; ARG: heads TAM: 2 POS: BP+10 
; ARG: sectors TAM: 2 POS: BP+12 
; ARG: blocksize TAM: 2 POS: BP+14 
; ARG: info TAM: 4 POS: BP--4 
; ARG: ptr TAM: 4 POS: BP--8 
;     ---=== System.IO.Disk.hcb:32:33 ===---
;     ---=== System.IO.Disk.hcb:32:55 ===---
;     ---=== System.IO.Disk.hcb:32:76 ===---
;     ---=== System.IO.Disk.hcb:32:93 ===---
;     ---=== System.IO.Disk.hcb:32:112 ===---
;     ---=== System.IO.Disk.hcb:33:13 ===---
;     ---=== System.IO.Disk.hcb:34:13 ===---
;     ---=== System.IO.Disk.hcb:35:9 ===---
; ACAO GRAVACAO - Gravacao em ponteiro
;     ---=== System.IO.Disk.hcb:35:15 ===---
; ACAO CHAMADA - Chama rotina
;     ---=== System.IO.Disk.hcb:35:24 ===---
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
;     ---=== System.IO.Disk.hcb:36:10 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO GRAVACAO - Grava segmento em variavel
;     ---=== System.IO.Disk.hcb:36:18 ===---
; ACAO LEITURA - Le segmento em variavel
mov ax, [bp+-8+2]
mov word [bp+-4+2], ax
;     ---=== System.IO.Disk.hcb:37:10 ===---
; ACAO STRUCTURE - Define Segmento/desvio de estrutura
; ACAO GRAVACAO - Grava em variavel
;     ---=== System.IO.Disk.hcb:37:18 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+-8]
mov [bp+-4], ax
;     ---=== System.IO.Disk.hcb:38:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.IO.Disk.hcb:38:27 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+6]
push word [bp+-4+2]
pop es
mov di, [bp+-4]
es mov [di+0], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.IO.Disk.hcb:39:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.IO.Disk.hcb:39:26 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+8]
es mov [di+2], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.IO.Disk.hcb:40:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.IO.Disk.hcb:40:22 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+10]
es mov [di+4], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.IO.Disk.hcb:41:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.IO.Disk.hcb:41:24 ===---
; ACAO LEITURA - Le variavel
mov ax, [bp+12]
es mov [di+6], ax
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.IO.Disk.hcb:42:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.IO.Disk.hcb:42:26 ===---
push cs
pop es
mov di, _disk_genericreadblock
push es
push di
push word [bp+-4+2]
pop es
mov di, [bp+-4]
es pop word [di+10]
es pop word [di+10+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.IO.Disk.hcb:43:9 ===---
; ACAO STRUCTURE - Gravacao de Ponteiro- Prepara
;     ---=== System.IO.Disk.hcb:43:27 ===---
push cs
pop es
mov di, _disk_genericwriteblock
push es
push di
push word [bp+-4+2]
pop es
mov di, [bp+-4]
es pop word [di+14]
es pop word [di+14+2]
; ACAO STRUCTURE - Gravacao de Ponteiro - Fim
;     ---=== System.IO.Disk.hcb:44:9 ===---
;     ---=== System.IO.Disk.hcb:44:16 ===---
; ACAO LEITURA - Le ponteiro
push word [bp+-8+2]
pop es
mov di, [bp+-8]
jmp ROTULO779
ROTULO779:
mov sp, bp
pop bp
FIM_disk_registernew:
retf
;     ---=== System.IO.Disk.hcb:47:9 ===---
_disk_genericreadblock:
push bp
mov bp, sp
; ARG: info TAM: 4 POS: BP+6 
; ARG: data TAM: 4 POS: BP+10 
; ARG: addresslow TAM: 2 POS: BP+14 
; ARG: addresshigh TAM: 2 POS: BP+16 
;     ---=== System.IO.Disk.hcb:47:26 ===---
;     ---=== System.IO.Disk.hcb:47:44 ===---
;     ---=== System.IO.Disk.hcb:47:66 ===---
;     ---=== System.IO.Disk.hcb:47:88 ===---
;     ---=== System.IO.Disk.hcb:48:15 ===---
mov ax, _disk
mov [bp+-8], ax
mov ax, 48
mov [bp+-10], ax
mov ax, 7
cs jmp word [_os_trycode]
ROTULO780:
mov sp, bp
pop bp
FIM_disk_genericreadblock:
retf
;     ---=== System.IO.Disk.hcb:51:9 ===---
_disk_genericwriteblock:
push bp
mov bp, sp
; ARG: info TAM: 4 POS: BP+6 
; ARG: data TAM: 4 POS: BP+10 
; ARG: addresslow TAM: 2 POS: BP+14 
; ARG: addresshigh TAM: 2 POS: BP+16 
;     ---=== System.IO.Disk.hcb:51:27 ===---
;     ---=== System.IO.Disk.hcb:51:45 ===---
;     ---=== System.IO.Disk.hcb:51:67 ===---
;     ---=== System.IO.Disk.hcb:51:89 ===---
;     ---=== System.IO.Disk.hcb:52:15 ===---
mov ax, _disk
mov [bp+-8], ax
mov ax, 52
mov [bp+-10], ax
mov ax, 7
cs jmp word [_os_trycode]
ROTULO781:
mov sp, bp
pop bp
FIM_disk_genericwriteblock:
retf
; MODULO FIM: disk
;     ---=== ConfigDefault.hcb:2:8 ===---
; MODULO: configdefault
_configdefault:
db 17
db 67,111,110,102,105,103,68,101,102,97,117,108,116,46,104,99,98
db 0
;     ---=== ConfigDefault.hcb:3:16 ===---
_configdefault_initialize:
ROTULO782:
FIM_configdefault_initialize:
retf
; MODULO FIM: configdefault
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
dw 0
dw 0
dw 0
dw 0
END:
