dw 7 ; Corpo
dw 3 ; Acima
dw 3 ; Abaixo
dw 1 ; Entre
dw nome
dw autor
; Dados
dw desconhecido
dw espaco
dw n0 ; 2
dw n1 ; 3
dw n2 ; 4
dw n3 ; 5
dw n4 ; 6
dw n5 ; 7
dw n6 ; 8
dw n7 ; 9
dw n8 ; 10
dw n9 ; 11
dw amai ; 12
dw bmai ; 13
dw cmai ; 14
dw dmai ; 15
dw emai ; 16
dw fmai ; 17
dw gmai ; 18
dw hmai ; 19
dw imai ; 20
dw jmai ; 21
dw kmai ; 22
dw lmai ; 23
dw mmai ; 24
dw nmai ; 25
dw omai ; 26
dw pmai ; 27
dw qmai ; 28
dw rmai ; 29
dw smai ; 30
dw tmai ; 31
dw umai ; 32
dw vmai ; 33
dw wmai ; 34
dw xmai ; 35
dw ymai ; 36
dw zmai ; 37
dw amai ; 38
dw bmai ; 39
dw cmai ; 40
dw dmai ; 41
dw emai ; 42
dw fmai ; 43
dw gmai ; 44
dw hmai ; 45
dw imai ; 46
dw jmai ; 47
dw kmai ; 48
dw lmai ; 49
dw mmai ; 50
dw nmai ; 51
dw omai ; 52
dw pmai ; 53
dw qmai ; 54
dw rmai ; 55
dw smai ; 56
dw tmai ; 57
dw umai ; 58
dw vmai ; 59
dw wmai ; 60
dw xmai ; 61
dw ymai ; 62
dw zmai ; 63
dw agudo ; 64
dw grave ; 65
dw agudo_duplo ; 66
dw grave_duplo ; 67
dw til ; 68
dw circunflexo ; 69
dw macron ; 70
dw braquia ; 71
dw braquia_invertida ; 72
dw caron ; 73
dw trema ; 74
dw anel ; 75
dw cedilha ; 76
dw gancho_polaco ; 77

nome:
    db .fim - $ 
    db "Sistema",0
    .fim:
autor: 
    db .fim - $ 
    db "Humberto Costa dos Santos Junior",0
    .fim:


desconhecido:
db 5, 0
db 0b00000000
db 0b00000000
db 0b00000000
db 0b00000000
db 0b00000000
db 0b00000000
db 0b00000000

espaco:
db 3, 0
db 0b00000000
db 0b00000000
db 0b00000000
db 0b00000000
db 0b00000000
db 0b00000000
db 0b00000000

n0:
db 6, 0
db 0b00110000
db 0b01001000
db 0b10010100
db 0b10100100
db 0b10100100
db 0b01001000
db 0b00110000

n1:
db 3, 0
db 0b00100000
db 0b01100000
db 0b10100000
db 0b00100000
db 0b00100000
db 0b00100000
db 0b00100000

n2:
db 5, 0
db 0b01110000
db 0b10001000
db 0b00001000
db 0b00010000
db 0b00100000
db 0b01000000
db 0b11111000

n3:
db 5, 0
db 0b11111000
db 0b00001000
db 0b00110000
db 0b00001000
db 0b00001000
db 0b00001000
db 0b11110000

n4:
db 5, 0
db 0b10001000
db 0b10001000
db 0b10001000
db 0b11111000
db 0b00001000
db 0b00001000
db 0b00001000

n5:
db 5, 0
db 0b11111000
db 0b10000000
db 0b11110000
db 0b00001000
db 0b00001000
db 0b00001000
db 0b11110000

n6:
db 5, 0
db 0b01110000
db 0b10001000
db 0b10000000
db 0b11110000
db 0b10001000
db 0b10001000
db 0b01110000

n7:
db 5, 0
db 0b11111000
db 0b00001000
db 0b00001000
db 0b00010000
db 0b00100000
db 0b01000000
db 0b10000000

n8:
db 5, 0
db 0b01110000
db 0b10001000
db 0b10001000
db 0b01110000
db 0b10001000
db 0b10001000
db 0b01110000

n9:
db 5, 0
db 0b01110000
db 0b10001000
db 0b10001000
db 0b01111000
db 0b00001000
db 0b10001000
db 0b01110000

amai:
db 7, 0
db 0b00111000
db 0b01000100
db 0b10000010
db 0b11111110
db 0b10000010
db 0b10000010
db 0b10000010

bmai:
db 6, 0
db 0b11111000
db 0b10000100
db 0b10000100
db 0b11111000
db 0b10000100
db 0b10000100
db 0b11111000

cmai:
db 6, 0
db 0b00111000
db 0b01000100
db 0b10000000
db 0b10000000
db 0b10000000
db 0b01000100
db 0b00111000

dmai:
db 7, 0
db 0b11111000
db 0b10000100
db 0b10000010
db 0b10000010
db 0b10000010
db 0b10000100
db 0b11111000

emai:
db 6, 0
db 0b11111100
db 0b10000000
db 0b10000000
db 0b11110000
db 0b10000000
db 0b10000000
db 0b11111100

fmai:
db 6, 0
db 0b11111100
db 0b10000000
db 0b10000000
db 0b11110000
db 0b10000000
db 0b10000000
db 0b10000000

gmai:
db 6, 0
db 0b01111000
db 0b10000100
db 0b10000000
db 0b10011100
db 0b10000100
db 0b10000100
db 0b01111000

hmai:
db 6, 0
db 0b10000100
db 0b10000100
db 0b10000100
db 0b11111100
db 0b10000100
db 0b10000100
db 0b10000100

imai:
db 1, 0
db 0b10000000
db 0b10000000
db 0b10000000
db 0b10000000
db 0b10000000
db 0b10000000
db 0b10000000

jmai:
db 5, 0
db 0b00001000
db 0b00001000
db 0b00001000
db 0b00001000
db 0b00001000
db 0b10001000
db 0b01110000

kmai:
db 6, 0
db 0b10000100
db 0b10000100
db 0b10001000
db 0b11110000
db 0b10001000
db 0b10000100
db 0b10000100

lmai:
db 5, 0
db 0b10000000
db 0b10000000
db 0b10000000
db 0b10000000
db 0b10000000
db 0b10000000
db 0b11111000

mmai:
db 7, 0
db 0b10000010
db 0b11000110
db 0b10101010
db 0b10010010
db 0b10000010
db 0b10000010
db 0b10000010

nmai:
db 7, 0
db 0b10000010
db 0b11000010
db 0b10100010
db 0b10010010
db 0b10001010
db 0b10000110
db 0b10000010

omai:
db 7, 0
db 0b01111100
db 0b10000010
db 0b10000010
db 0b10000010
db 0b10000010
db 0b10000010
db 0b01111100

pmai:
db 6, 0
db 0b11111000
db 0b10000100
db 0b10000100
db 0b11111000
db 0b10000000
db 0b10000000
db 0b10000000

qmai:
db 8, 0
db 0b01111100
db 0b10000010
db 0b10000010
db 0b10000010
db 0b10001010
db 0b10000100
db 0b01111011

rmai:
db 7, 0
db 0b11111000
db 0b10000100
db 0b10000100
db 0b11111000
db 0b10000100
db 0b10000100
db 0b10000010

smai:
db 6, 0
db 0b01111000
db 0b10000100
db 0b10000000
db 0b01111000
db 0b00000100
db 0b10000100
db 0b01111000

tmai:
db 7, 0
db 0b11111110
db 0b00010000
db 0b00010000
db 0b00010000
db 0b00010000
db 0b00010000
db 0b00010000

umai:
db 7, 0
db 0b10000010
db 0b10000010
db 0b10000010
db 0b10000010
db 0b10000010
db 0b10000010
db 0b01111100

vmai:
db 7, 0
db 0b10000010
db 0b10000010
db 0b10000010
db 0b10000010
db 0b01000100
db 0b00101000
db 0b00010000

wmai:
db 7, 0
db 0b10000010
db 0b10000010
db 0b10000010
db 0b10010010
db 0b10101010
db 0b11000110
db 0b10000010

xmai:
db 7, 0
db 0b10000010
db 0b01000100
db 0b00101000
db 0b00010000
db 0b00101000
db 0b01000100
db 0b10000010

ymai:
db 7, 0
db 0b10000010
db 0b01000100
db 0b00101000
db 0b00010000
db 0b00100000
db 0b01000000
db 0b10000000

zmai:
db 7, 0
db 0b11111110
db 0b00000100
db 0b00001000
db 0b00010000
db 0b00100000
db 0b01000000
db 0b11111110


agudo:
db 2, 0
db 0b01000000
db 0b10000000
db 0b00000000

grave:
db 2, 0
db 0b10000000
db 0b01000000
db 0b00000000

agudo_duplo:
db 5, 0
db 0b01001000
db 0b10010000
db 0b00000000

grave_duplo:
db 5, 0
db 0b10010000
db 0b01001000
db 0b00000000

til:
db 5, 0
db 0b01001000
db 0b10110000
db 0b00000000

circunflexo:
db 3, 0
db 0b01000000
db 0b10100000
db 0b00000000

macron:
db 3, 0
db 0b00000000
db 0b11100000
db 0b00000000

braquia:
db 4, 0
db 0b10010000
db 0b01100000
db 0b00000000

braquia_invertida:
db 4, 0
db 0b01100000
db 0b10010000
db 0b00000000

caron:
db 3, 0
db 0b10100000
db 0b01000000
db 0b00000000

trema:
db 3, 0
db 0b00000000
db 0b10100000
db 0b00000000

anel:
db 4, 0
db 0b01100000
db 0b10010000
db 0b01100000

cedilha:
db 3, 0
db 0b00100000
db 0b10010000
db 0b01100000

gancho_polaco:
db 3, 0
db 0b01000000
db 0b10010000
db 0b01100000