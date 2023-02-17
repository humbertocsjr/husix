

all:
	@echo -= Compilando Controlador CGA =-
	@hcbasic CGA.hcb CGA.tmp ../../Incluir/
	@nasm -f bin -o ../CGA.hsx CGA.tmp

clean:
	@-rm -f *.hsx
	@-rm -f *.tmp
