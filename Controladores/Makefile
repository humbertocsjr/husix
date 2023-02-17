MAKE = make --no-print-directory

all:
	@echo -= Compilando Controladores =-
	@$(MAKE) -C VGA all
	@$(MAKE) -C CGA all
	@$(MAKE) -C PS2 all
	@$(MAKE) -C Clock all

clean:
	@$(MAKE) -C VGA clean
	@$(MAKE) -C CGA clean
	@$(MAKE) -C PS2 clean
	@$(MAKE) -C Clock clean
	@-rm -f *.hsx
	@-rm -f *.dll
	@-rm -f *.tmp