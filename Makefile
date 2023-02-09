MAKE = make --no-print-directory

all: alfa_ptbr

distro:
	@-mv -f Nucleo/ConfigDefault.hcb Nucleo/ConfigDefault.old
	@TRADUCAO=ptbr $(MAKE) subdistro
	@TRADUCAO=enus $(MAKE) subdistro
	@-mv -f Nucleo/ConfigDefault.old Nucleo/ConfigDefault.hcb

subdistro:
	@echo -= Gerando Distibuicao para PC em $(TRADUCAO)
	@$(MAKE) $(TRADUCAO)
	@$(MAKE) clean
	@$(MAKE) config_pc
	@$(MAKE) producao_$(TRADUCAO)
	@$(MAKE) discos
	@mv -f Distro/360TEST.img Distro/$(TRADUCAO)360PC.img
	@mv -f Distro/720TEST.img Distro/$(TRADUCAO)720PC.img
	@mv -f Distro/1200TEST.img Distro/$(TRADUCAO)1200PC.img
	@mv -f Distro/1440TEST.img Distro/$(TRADUCAO)1440PC.img
	@$(MAKE) clean
	@$(MAKE) config_xt
	@$(MAKE) producao_$(TRADUCAO)
	@$(MAKE) discos
	@mv -f Distro/360TEST.img Distro/$(TRADUCAO)360XT.img
	@mv -f Distro/720TEST.img Distro/$(TRADUCAO)720XT.img
	@mv -f Distro/1200TEST.img Distro/$(TRADUCAO)1200XT.img
	@mv -f Distro/1440TEST.img Distro/$(TRADUCAO)1440XT.img
	@$(MAKE) clean
	@$(MAKE) config_at
	@$(MAKE) producao_$(TRADUCAO)
	@$(MAKE) discos
	@mv -f Distro/360TEST.img Distro/$(TRADUCAO)360AT.img
	@mv -f Distro/720TEST.img Distro/$(TRADUCAO)720AT.img
	@mv -f Distro/1200TEST.img Distro/$(TRADUCAO)1200AT.img
	@mv -f Distro/1440TEST.img Distro/$(TRADUCAO)1440AT.img
	@$(MAKE) clean
	@$(MAKE) config_custom
	@$(MAKE) producao_$(TRADUCAO)
	@$(MAKE) discos
	@mv -f Distro/360TEST.img Distro/$(TRADUCAO)360Custom.img
	@mv -f Distro/720TEST.img Distro/$(TRADUCAO)720Custom.img
	@mv -f Distro/1200TEST.img Distro/$(TRADUCAO)1200Custom.img
	@mv -f Distro/1440TEST.img Distro/$(TRADUCAO)1440Custom.img

config_pc:
	@-rm Nucleo/ConfigDefault.hcb >> /dev/null
	@ln -s ../ConfigPC.hcb Nucleo/ConfigDefault.hcb

config_xt:
	@-rm Nucleo/ConfigDefault.hcb >> /dev/null
	@ln -s ../ConfigXT.hcb Nucleo/ConfigDefault.hcb

config_at:
	@-rm Nucleo/ConfigDefault.hcb >> /dev/null
	@ln -s ../ConfigAT.hcb Nucleo/ConfigDefault.hcb

config_custom:
	@-rm Nucleo/ConfigDefault.hcb >> /dev/null
	@ln -s ../ConfigCustom.hcb Nucleo/ConfigDefault.hcb

ferramentas:
	@$(MAKE) -C Ferramentas

compilar:
	@$(MAKE) -C Inicial
	@$(MAKE) -C Nucleo
	@$(MAKE) -C Programas

clean:
	@$(MAKE) -C Ferramentas clean
	@$(MAKE) -C Inicial clean
	@$(MAKE) -C Nucleo clean
	@$(MAKE) -C Programas clean
	@(rm Distro/*TEST.img 2>> /dev/null) || true

alfa_ptbr:
	@$(MAKE) ferramentas
	@Ferramentas/GeraVersao/gera_ver Nucleo/Version.hcb Alfa
	@$(MAKE) compilar

beta_ptbr:
	@$(MAKE) ferramentas
	@Ferramentas/GeraVersao/gera_ver Nucleo/Version.hcb Beta
	@$(MAKE) compilar

preproducao_ptbr:
	@$(MAKE) ferramentas
	@Ferramentas/GeraVersao/gera_ver Nucleo/Version.hcb "Pré-Produção"
	@$(MAKE) compilar

producao_ptbr:
	@$(MAKE) ferramentas
	@Ferramentas/GeraVersao/gera_ver Nucleo/Version.hcb "Final"
	@$(MAKE) compilar

alfa_enus:
	@$(MAKE) ferramentas
	@Ferramentas/GeraVersao/gera_ver Nucleo/Version.hcb Alpha
	@$(MAKE) compilar

beta_enus:
	@$(MAKE) ferramentas
	@Ferramentas/GeraVersao/gera_ver Nucleo/Version.hcb Beta
	@$(MAKE) compilar

preproducao_enus:
	@$(MAKE) ferramentas
	@Ferramentas/GeraVersao/gera_ver Nucleo/Version.hcb "Pre-Release"
	@$(MAKE) compilar

producao_enus:
	@$(MAKE) ferramentas
	@Ferramentas/GeraVersao/gera_ver Nucleo/Version.hcb "Final"
	@$(MAKE) compilar

discos:
	@echo -= Gerando imagens para distribuição =-
	@echo -= Disquete 1440 KiB =-
	@dd if=/dev/zero of=img.img bs=1024 count=1440 status=none
	@minixfs mkfs img.img -1 -n 30 -s 1440
	@dd if=Inicial/Inicial1440.bin of=img.img bs=1024 count=1 conv=notrunc status=none
	@$(MAKE) discos_copia_$(TRADUCAO)
	@mv -f img.img Distro/1440TEST.img
	@echo -= Disquete 720 KiB =-
	@dd if=/dev/zero of=img.img bs=1024 count=720 status=none
	@minixfs mkfs img.img -1 -n 30 -s 720
	@dd if=Inicial/Inicial720.bin of=img.img bs=1024 count=1 conv=notrunc status=none
	@$(MAKE) discos_copia_$(TRADUCAO)
	@mv -f img.img Distro/720TEST.img
	@echo -= Disquete 1200 KiB =-
	@dd if=/dev/zero of=img.img bs=1024 count=1200 status=none
	@minixfs mkfs img.img -1 -n 30 -s 1200
	@dd if=Inicial/Inicial1200.bin of=img.img bs=1024 count=1 conv=notrunc status=none
	@$(MAKE) discos_copia_$(TRADUCAO)
	@mv -f img.img Distro/1200TEST.img
	@echo -= Disquete 360 KiB =-
	@dd if=/dev/zero of=img.img bs=1024 count=360 status=none
	@minixfs mkfs img.img -1 -n 30 -s 360
	@dd if=Inicial/Inicial360.bin of=img.img bs=1024 count=1 conv=notrunc status=none
	@$(MAKE) discos_copia_$(TRADUCAO)
	@mv -f img.img Distro/360TEST.img

discos_copia_ptbr:
	@minixfs add img.img Nucleo/husix.com /husix
	@minixfs mkdir img.img /Programas
	@minixfs mkdir img.img /Documentos
	@minixfs mkdir img.img /Bibliotecas
	@minixfs mkdir img.img /Config
	@minixfs mkdir img.img /Sistema
	@minixfs add img.img Programas/Luzia/Luzia.hsx /Sistema/Luzia.hsx
	@minixfs add img.img Programas/BandoDeDados/BandoDeDados.hsx /Sistema/BandoDeDados.hsx
	@minixfs add img.img Programas/Sefudias/Sefudias.hsx /Programas/Sefudias.hsx
	@minixfs add img.img LICENSE /Licença

discos_copia_enus:
	@minixfs add img.img Nucleo/husix.com /husix
	@minixfs mkdir img.img /Programs
	@minixfs mkdir img.img /Documents
	@minixfs mkdir img.img /Librarys
	@minixfs mkdir img.img /Config
	@minixfs mkdir img.img /System
	@minixfs add img.img Programas/Luzia/Luzia.hsx /System/Luzia.hsx
	@minixfs add img.img Programas/BandoDeDados/BandoDeDados.hsx /System/BandoDeDados.hsx
	@minixfs add img.img Programas/Sefudias/Sefudias.hsx /Programs/Sefudias.hsx
	@minixfs add img.img LICENSE /License

teste-qemu:
	@$(MAKE) clean
	@$(MAKE) ptbr
	@$(MAKE) config_pc
	@$(MAKE) alfa_ptbr
	@TRADUCAO=ptbr $(MAKE) discos
	@echo -= Iniciando emulacao [QEMU] =-
	@qemu-system-i386 -fda Distro/1440TEST.img -serial stdio

teste-qemu-enus:
	@$(MAKE) clean
	@$(MAKE) enus
	@$(MAKE) config_pc
	@$(MAKE) alfa_enus
	@TRADUCAO=enus $(MAKE) discos
	@echo -= Iniciando emulacao [QEMU] =-
	@qemu-system-i386 -fda Distro/1440TEST.img -serial stdio

teste-bochs:
	@$(MAKE) clean
	@$(MAKE) ptbr
	@$(MAKE) config_pc
	@$(MAKE) alfa_ptbr
	@TRADUCAO=ptbr $(MAKE) discos
	@echo -= Iniciando emulacao [Bochs] =-
	@bochs -q

teste-dosbox:
	@$(MAKE) clean
	@$(MAKE) ptbr
	@$(MAKE) config_pc
	@$(MAKE) alfa_ptbr
	@TRADUCAO=ptbr $(MAKE) discos
	@echo -= Iniciando emulacao [DOSBox] =-
	@dosbox -C "IMGMOUNT 0 Distro/1440TEST.img -size 512,18,2,80 -fs none -t floppy" -C "MOUNT C: ./Nucleo"  -C "c:\husix Mode=DOS Disk=BIOSDisk000" > /dev/null

ptbr:
	@echo -= Aplicando Tradução PT-BR =-
	@$(MAKE) -C Nucleo ptbr
	@$(MAKE) -C Programas ptbr

enus:
	@echo -= Aplicando Tradução EN-US =-
	@$(MAKE) -C Nucleo enus
	@$(MAKE) -C Programas enus