KEY_INSERT:         equ 0xff00
KEY_HOME:           equ 0xff01
KEY_PG_UP:          equ 0xff03
KEY_PG_DOWN:        equ 0xff04
KEY_DELETE:         equ 0xff05
KEY_END:            equ 0xff06
KEY_NUM:            equ 0xff07
KEY_ARROW_UP:       equ 0xff08
KEY_ARROW_DOWN:     equ 0xff09
KEY_ARROW_LEFT:     equ 0xff0a
KEY_ARROW_RIGHT:    equ 0xff0b
KEY_CAPS:           equ 0xff0c
KEY_PRINT_SCR:      equ 0xff0d
KEY_KEYPAD:         equ 0xff0e
KEY_SCROLL:         equ 0xff0f
KEY_PAUSE:          equ 0xff10
KEY_L_SHIFT:        equ 0xff11
KEY_R_SHIFT:        equ 0xff12
KEY_L_CTRL:         equ 0xff13
KEY_R_CTRL:         equ 0xff14
KEY_L_ALT:          equ 0xff15
KEY_R_ALT:          equ 0xff16
KEY_L_GUI:          equ 0xff17
KEY_R_GUI:          equ 0xff18
KEY_APPS:           equ 0xff19
KEY_F1:             equ 0xff1a
KEY_F2:             equ 0xff1b
KEY_F3:             equ 0xff1c
KEY_F4:             equ 0xff1d
KEY_F5:             equ 0xff1e
KEY_F6:             equ 0xff1f
KEY_F7:             equ 0xff20
KEY_F8:             equ 0xff21
KEY_F9:             equ 0xff22
KEY_F10:            equ 0xff23
KEY_F11:            equ 0xff24
KEY_F12:            equ 0xff25
KEY_POWER:          equ 0xff26
KEY_SLEEP:          equ 0xff27
KEY_WAKE:           equ 0xff28
KEY_NEXT_TRACK:     equ 0xff29
KEY_PREV_TRACK:     equ 0xff2a
KEY_STOP:           equ 0xff2b
KEY_PLAY:           equ 0xff2c
KEY_MUTE:           equ 0xff2d
KEY_VOLUME_UP:      equ 0xff2e
KEY_VOLUME_DOWN:    equ 0xff2f
KEY_MEDIA_SELECT:   equ 0xff30
KEY_EMAIL:          equ 0xff31
KEY_CALC:           equ 0xff32
KEY_MY_COMPUTER:    equ 0xff33
KEY_WWW_SEARCH:     equ 0xff34
KEY_WWW_HOME:       equ 0xff35
KEY_WWW_FORWARD:    equ 0xff36
KEY_WWW_STOP:       equ 0xff37
KEY_WWW_REFRESH:    equ 0xff38
KEY_WWW_BACK:       equ 0xff39
KEY_WWW_FAVORITES:  equ 0xff3a

; Normal
;    x0    x1    x2    x3    x4    x5    x6    x7    x8    x9    xA    xB    xC    xD    xE    xF
dd   0 ,   27,  '1',  '2',  '3',  '4',  '5',  '6',  '7',  '8',  '9',  '0',  '-',  '=',   9 ,   8  ;0x
dd  'q',  'w',  'e',  'r',  't',  'y',  'u',  'i',  'o',  'p',  '[',  ']',   13,   0 ,  'a',  's' ;1x
dd  'd',  'f',  'g',  'h',  'j',  'k',  'l',   59,   39,   96,   0 ,   92,  'z',  'x',  'c',  'v' ;2x
dd  'b',  'n',  'm',  ',',  '.',  '/',   0 ,  '*',   0 ,  ' ',   0 ,   0 ,   0 ,   0 ,   0 ,   0  ;3x
dd   0 ,   0 ,   0 ,   0 ,   0 ,   0 ,   0 ,  '7',  '8',  '9',  '-',  '4',  '5',  '6',  '+',  '1' ;4x
dd  '2',  '3',  '0',  '.',   0 ,   0 ,   0 ,   0 ,   0 ,   0 ,   0 ,   0 ,   0 ,   0 ,   0 ,   0  ;5x
dd   0 ,   0 ,   0 ,   0 ,   0 ,   0 ,   0 ,   0 ,   0 ,   0 ,   0 ,   0 ,   0 ,   0 ,   0 ,   0  ;6x
dd   0 ,   0 ,   0 ,   0 ,   0 ,   0 ,   0 ,   0 ,   0 ,   0 ,   0 ,   0 ,   0 ,   0 ,   0 ,   0  ;7x
; Shift
;    x0    x1    x2    x3    x4    x5    x6    x7    x8    x9    xA    xB    xC    xD    xE    xF
dd   0 ,   27,  '!',  '@',  '#',  '$',  '%',  '^',  '&',  '*',  '(',  ')',  '_',  '+',   9 ,   8  ;0x
dd  'Q',  'W',  'E',  'R',  'T',  'Y',  'U',  'I',  'O',  'P',  '{',  '}',   13,   0 ,  'A',  'S' ;1x
dd  'D',  'F',  'G',  'H',  'J',  'K',  'L',  ':',  '"',  '~',   0 ,  '|',  'Z',  'X',  'C',  'V' ;2x
dd  'B',  'N',  'M',  '<',  '>',  '?',   0 ,  '*',   0 ,  ' ',   0 ,   0 ,   0 ,   0 ,   0 ,   0  ;3x
dd   0 ,   0 ,   0 ,   0 ,   0 ,   0 ,   0 ,  '7',  '8',  '9',  '-',  '4',  '5',  '6',  '+',  '1' ;4x
dd  '2',  '3',  '0',  '.',   0 ,   0 ,   0 ,   0 ,   0 ,   0 ,   0 ,   0 ,   0 ,   0 ,   0 ,   0  ;5x
dd   0 ,   0 ,   0 ,   0 ,   0 ,   0 ,   0 ,   0 ,   0 ,   0 ,   0 ,   0 ,   0 ,   0 ,   0 ,   0  ;6x
dd   0 ,   0 ,   0 ,   0 ,   0 ,   0 ,   0 ,   0 ,   0 ,   0 ,   0 ,   0 ,   0 ,   0 ,   0 ,   0  ;7x
; E0
;      x0     x1     x2     x3     x4     x5     x6     x7     x8     x9     xA     xB     xC     xD     xE     xF
dd     0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0  ;0x
dd     0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0  ;1x
dd     0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0  ;2x
dd     0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0  ;3x
dd     0 ,    0 ,    0 ,    0 ,    0 ,0xff07,    0 ,0xff01,0xff08,0xff03,    0 ,0xff0a,    0 ,0xff0b,    0 ,0xff06 ;4x
dd 0xff09,0xff04,0xff00,0xff05,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0  ;5x
dd     0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0  ;6x
dd     0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0  ;7x
; E1
;      x0     x1     x2     x3     x4     x5     x6     x7     x8     x9     xA     xB     xC     xD     xE     xF
dd     0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0  ;0x
dd     0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0  ;1x
dd     0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0  ;2x
dd     0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0  ;3x
dd     0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0  ;4x
dd     0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0  ;5x
dd     0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0  ;6x
dd     0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0  ;7x