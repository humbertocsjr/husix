

all:
	@echo -= Compilando Jogo - Sefudias O Aventureiro =-
	@hcbasic Sefudias.hcb Sefudias.tmp ../../Incluir/
	@nasm -f bin -o ../Sefudias.hsx Sefudias.tmp

ptbr:
	@-rm Translation.hcb
	@ln -s TranslationPTBR.hcb Translation.hcb

enus:
	@-rm Translation.hcb
	@ln -s TranslationPTBR.hcb Translation.hcb

clean:
	@-rm -f *.hsx
	@-rm -f *.tmp
