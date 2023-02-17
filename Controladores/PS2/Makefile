

all:
	@echo -= Compilando PS/2 Mouse e Teclado =-
	@nasm -f bin -o USIntl.keymap USIntl.asm
	@hcbasic PS2.hcb PS2.tmp ../../Incluir/
	@nasm -f bin -o ../PS2.hsx PS2.tmp

clean:
	@-rm -f *.hsx
	@-rm -f *.tmp
