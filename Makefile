MAKE = make --no-print-directory

all: alfa

distro:
	@mv -f Kernel/ConfigDefault.hcb Kernel/ConfigDefault.old
	@$(MAKE) clean
	@$(MAKE) config_pc
	@$(MAKE) producao
	@$(MAKE) discos
	@mv -f Distro/360TEST.img Distro/360PC.img
	@mv -f Distro/720TEST.img Distro/720PC.img
	@mv -f Distro/1440TEST.img Distro/1440PC.img
	@$(MAKE) clean
	@$(MAKE) config_xt
	@$(MAKE) producao
	@$(MAKE) discos
	@mv -f Distro/360TEST.img Distro/360XT.img
	@mv -f Distro/720TEST.img Distro/720XT.img
	@mv -f Distro/1440TEST.img Distro/1440XT.img
	@mv -f Kernel/ConfigDefault.old Kernel/ConfigDefault.hcb

config_pc:
	@-rm Kernel/ConfigDefault.hcb >> /dev/null
	@ln -s ../ConfigPC.hcb Kernel/ConfigDefault.hcb

config_xt:
	@-rm Kernel/ConfigDefault.hcb >> /dev/null
	@ln -s ../ConfigXT.hcb Kernel/ConfigDefault.hcb

config_at:
	@-rm Kernel/ConfigDefault.hcb >> /dev/null
	@ln -s ../ConfigAT.hcb Kernel/ConfigDefault.hcb

ferramentas:
	@$(MAKE) -C DevTools

compilar:
	@$(MAKE) -C Boot
	@$(MAKE) -C Kernel

clean:
	@$(MAKE) -C DevTools clean
	@$(MAKE) -C Boot clean
	@$(MAKE) -C Kernel clean
	@(rm Distro/*TEST.img 2>> /dev/null) || true

alfa:
	@$(MAKE) ferramentas
	@DevTools/GeraVersao/gera_ver Kernel/Version.hcb Alfa
	@$(MAKE) compilar

beta:
	@$(MAKE) ferramentas
	@DevTools/GeraVersao/gera_ver Kernel/Version.hcb Beta
	@$(MAKE) compilar

preproducao:
	@$(MAKE) ferramentas
	@DevTools/GeraVersao/gera_ver Kernel/Version.hcb "Pré-Produção"
	@$(MAKE) compilar

producao:
	@$(MAKE) ferramentas
	@DevTools/GeraVersao/gera_ver Kernel/Version.hcb "Final"
	@$(MAKE) compilar

discos:
	@echo -= Gerando imagens para distribuição =-
	@echo -= 1440 KiB Floppy Disk =-
	@dd if=/dev/zero of=img.img bs=1024 count=1440 status=none
	@minixfs mkfs img.img -1 -n 30 -s 1440
	@dd if=Boot/Boot1440.bin of=img.img bs=1024 count=1 conv=notrunc status=none
	@$(MAKE) discos_copia
	@mv -f img.img Distro/1440TEST.img
	@echo -= 720 KiB Floppy Disk =-
	@dd if=/dev/zero of=img.img bs=1024 count=720 status=none
	@minixfs mkfs img.img -1 -n 30 -s 720
	@dd if=Boot/Boot720.bin of=img.img bs=1024 count=1 conv=notrunc status=none
	@$(MAKE) discos_copia
	@mv -f img.img Distro/720TEST.img
	@echo -= 360 KiB Floppy Disk =-
	@dd if=/dev/zero of=img.img bs=1024 count=360 status=none
	@minixfs mkfs img.img -1 -n 30 -s 360
	@dd if=Boot/Boot360.bin of=img.img bs=1024 count=1 conv=notrunc status=none
	@$(MAKE) discos_copia
	@mv -f img.img Distro/360TEST.img

discos_copia:
	@minixfs add img.img Kernel/husix.com /husix
	@minixfs mkdir img.img /Programs
	@minixfs mkdir img.img /Documents
	@minixfs mkdir img.img /Library
	@minixfs mkdir img.img /Config
	@minixfs mkdir img.img /System

teste-qemu:
	@$(MAKE) clean
	@$(MAKE) config_pc
	@$(MAKE) all
	@$(MAKE) discos
	@echo -= Iniciando emulacao [QEMU] =-
	@qemu-system-i386 -fda Distro/1440TEST.img -serial stdio

teste-bochs:
	@$(MAKE) clean
	@$(MAKE) config_pc
	@$(MAKE) all
	@$(MAKE) discos
	@echo -= Iniciando emulacao [Bochs] =-
	@bochs -q

teste-dosbox:
	@$(MAKE) clean
	@$(MAKE) config_pc
	@$(MAKE) all
	@$(MAKE) discos
	@echo -= Iniciando emulacao [DOSBox] =-
	@dosbox -C "BOOT Distro/1440TEST.img -l A" > /dev/null
