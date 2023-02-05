

all:
	@hcbasic husix.hcb husix.tmp
	@nasm -f bin -o husix.com husix.tmp

ptbr:
	@-rm Translation.hcb
	@ln -s TranslationPTBR.hcb Translation.hcb

enus:
	@-rm Translation.hcb
	@ln -s TranslationENUS.hcb Translation.hcb

clean:
	@-rm -f *.com
	@-rm -f *.tmp
