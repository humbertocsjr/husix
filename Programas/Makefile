MAKE = make --no-print-directory

all:
	@echo -= Compilando Programas =-
	@$(MAKE) -C Luzia all
	@$(MAKE) -C MarcoPolo all
	@$(MAKE) -C BandoDeDados all
	@$(MAKE) -C Sefudias all

ptbr:
	@$(MAKE) -C Luzia ptbr
	@$(MAKE) -C MarcoPolo ptbr
	@$(MAKE) -C Sefudias ptbr

enus:
	@$(MAKE) -C Luzia enus
	@$(MAKE) -C MarcoPolo enus
	@$(MAKE) -C Sefudias enus

clean:
	@$(MAKE) -C Luzia clean
	@$(MAKE) -C MarcoPolo clean
	@$(MAKE) -C BandoDeDados clean
	@$(MAKE) -C Sefudias clean
	@-rm -f *.hsx
	@-rm -f *.dll
	@-rm -f *.tmp