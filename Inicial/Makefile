all:
	@nasm -f bin -o Inicial360.bin Inicial360.asm
	@nasm -f bin -o Inicial720.bin Inicial720.asm
	@nasm -f bin -o Inicial1200.bin Inicial1200.asm
	@nasm -f bin -o Inicial1440.bin Inicial1440.asm

clean:
	@(rm *.bin 2>> /dev/null) || true
