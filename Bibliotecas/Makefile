MAKE = make --no-print-directory

all:
	@echo -= Compilando Bibliotecas =-
	@$(MAKE) -C System.Drawing all
	@$(MAKE) -C System.Forms all

clean:
	@$(MAKE) -C System.Drawing clean
	@$(MAKE) -C System.Forms clean
	@-rm -f *.hsx
	@-rm -f *.dll
	@-rm -f *.tmp
