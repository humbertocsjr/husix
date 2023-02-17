

all:
	@echo -= Compilando Bando de Dados =-
	@hcbasic BandoDeDados.hcb BandoDeDados.tmp ../../Incluir/
	@nasm -f bin -o ../BandoDeDados.hsx BandoDeDados.tmp

clean:
	@-rm -f *.hsx
	@-rm -f *.tmp
