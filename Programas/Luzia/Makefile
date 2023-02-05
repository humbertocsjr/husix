

all:
	@hcbasic Luzia.hcb Luzia.tmp ../../Incluir/
	@nasm -f bin -o Luzia.hsx Luzia.tmp

ptbr:
	@-rm Translation.hcb
	@ln -s TranslationPTBR.hcb Translation.hcb

enus:
	@-rm Translation.hcb
	@ln -s TranslationENUS.hcb Translation.hcb

clean:
	@-rm -f *.hsx
	@-rm -f *.tmp
