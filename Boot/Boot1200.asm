ConstCabecas: equ 2
ConstSetoresPorTrilha: equ 15
%include "Inicial.asm"

; Argumentos Extras
db "_1200 DebugSerial=Serial1 Video=EGA", 13, 0

FimArgumento:
Tam_Argumento: equ $-Argumento-2
times 1024-($-$$) db 0
