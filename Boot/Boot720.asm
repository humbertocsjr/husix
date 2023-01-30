ConstCabecas: equ 2
ConstSetoresPorTrilha: equ 18
%include "Inicial.asm"

; Argumentos Extras
db "0_720", 13, 0

FimArgumento:
Tam_Argumento: equ $-Argumento-2
times 1024-($-$$) db 0
