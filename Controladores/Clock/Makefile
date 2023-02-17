

all:
	@echo -= Compilando Relógio =-
	@hcbasic Clock.hcb Clock.tmp ../../Incluir/
	@nasm -f bin -o ../Clock.hsx Clock.tmp

clean:
	@-rm -f *.hsx
	@-rm -f *.tmp
