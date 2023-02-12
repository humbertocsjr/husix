

all:
	@echo -= Compilando Biblioteca System.Drawing =-
	@nasm -f bin -o Font.hfn Font.asm
	@hcbasic System.Drawing.hcb System.Drawing.tmp ../../Incluir/
	@nasm -f bin -o ../System.Drawing.dll System.Drawing.tmp

clean:
	@-rm -f *.hsx
	@-rm -f *.dll
	@-rm -f *.tmp
