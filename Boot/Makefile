all:
	@nasm -f bin -o Boot360.bin Boot360.asm
	@nasm -f bin -o Boot720.bin Boot720.asm
	@nasm -f bin -o Boot1200.bin Boot1200.asm
	@nasm -f bin -o Boot1440.bin Boot1440.asm

clean:
	@(rm *.bin 2>> /dev/null) || true
