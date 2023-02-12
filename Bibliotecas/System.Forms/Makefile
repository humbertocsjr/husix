

all:
	@echo -= Compilando Biblioteca System.Forms =-
	@hcbasic System.Forms.hcb System.Forms.tmp ../../Incluir/
	@nasm -f bin -o ../System.Forms.dll System.Forms.tmp

clean:
	@-rm -f *.hsx
	@-rm -f *.dll
	@-rm -f *.tmp
