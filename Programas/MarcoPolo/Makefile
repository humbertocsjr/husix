

all:
	@echo -= Compilando Explorador de Arquivos Marco Polo =-
	@hcbasic MarcoPolo.hcb MarcoPolo.tmp ../../Incluir/
	@nasm -f bin -o ../MarcoPolo.hsx MarcoPolo.tmp

ptbr:
	@-rm Translation.hcb
	@ln -s TranslationPTBR.hcb Translation.hcb

enus:
	@-rm Translation.hcb
	@ln -s TranslationENUS.hcb Translation.hcb

clean:
	@-rm -f *.hsx
	@-rm -f *.tmp
