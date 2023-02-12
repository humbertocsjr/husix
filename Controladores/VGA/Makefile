

all:
	@echo -= Compilando Controlador VGA =-
	@hcbasic VGA.hcb VGA.tmp ../../Incluir/
	@nasm -f bin -o VGA.hsx VGA.tmp

clean:
	@-rm -f *.hsx
	@-rm -f *.tmp
