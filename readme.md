# Sistema Operacional HUSIX

Este projeto está em fase protótipo, e é direcionado em criar um Framework próximo ao .Net Framework porém 16bits, usando a linguagem [HCBasic](https://github.com/humbertocsjr/hcbasic)

[Suporte para Visual Code](https://github.com/humbertocsjr/hcbasic_syntax) Copiar conteúdo para pasta .vscode/extensions/hcbasic_syntax

Por enquanto estou montando o framework que está embutido no Kernel, já é bootável porém ainda não tem os recursos necessários para ler o disco e carregar outros executáveis

# Requisitos mínimos

- IBM PC 5150 ou Compatível
- 256 KiB de RAM
- Leitor de Disquete de 360 KiB
- Placa de Vídeo CGA

# Recomendável

- IBM PC 5160 ou Compatível
- 512 KiB de RAM
- Leitor de Disquete de 360 KiB
- Disco Rígido de 10 MiB
- Placa de Vídeo VGA

# Requisitos mínimos para Desenvolvimento

- Linux / Windows com WSL (Estou desenvolvendo em LinuxMint)
- [MinixFS Tool](https://github.com/humbertocsjr/minixfs)
    - Deve ser compilado com os comandos:
    ```sh
    make clean
    chmod +x configure
    ./configure
    make
    sudo make install
    ```
- NASM
    - Deve se instalar 
    - Deve ter instalado com os comandos abaixo: (Exemplo em Debian/Ubuntu/LinuxMint)
    ```sh
    sudo apt install build-essentials nasm
    ```
- DotNET 7.0 SDK
    - Deve-se instalar seguindo o passo a passo do [Site da Microsoft](https://learn.microsoft.com/pt-br/dotnet/core/install/linux?WT.mc_id=dotnet-35129-website)
- [HCBasic](https://github.com/humbertocsjr/)
    - Deve-se baixar/clonar o repositório, e executar os comandos:
    ```sh
    make clean
    make all
    sudo make install
    ```
- QEMU / DOSBOX para testes
    - Para instalar basta executar os comandos abaixo: 

    Debian:
    ```sh
    sudo apt install qemu qemu-system-i386 dosbox
    ```

    Ubuntu:
    ```sh
    sudo apt install qemu-system-x86 dosbox
    ```

# Modo de Uso

Estou desenvolvendo em Linux então as instruções básicas esperam os requisitos instalados, e algum Shell linux, podendo ser usado o WSL do Windows no Modo Ubuntu.

## Arquivos de Configuração

Como os módulos são compilados conforme uso e referência, se padronizou o uso de um arquivo de configuração do Kernel, que inicia os módulos que serão usados por aquela compilação, para simplificar separei os arquivos por máquina:

- PC - Carrega o mínimo de Drivers, mais focado em Disquete
- XT - Carrega os drivers do PC + Drivers de Disco Rígido
- AT - Carrega os drivers do XT + Drivers de componentes "modernos" como CMOS/Relógio
- Custom - Livre para customização do usuário, no futuro deve se criar um sistema simples de menus para facilitar a configuração

**Chaveando entre as configurações**

Deve ser usado antes de compilar:

```sh
make config_pc
make config_xt
make config_at
make config_custom
```

Ao gerar os discos de distribuição, é gerado automaticamente uma versão para cada uma das configurações.

## Gerando uma distribuição

A Distribuição gera uma versão final no estado atual do repositório, gerando para as seguintes configurações:

- PC - Focado em IBM PC 5150 ou Compatíveis, sistemas mais simples com menos memória e apenas unidades de disquete
- XT - Focado em IBM PC 5160 ou Compatíveis, sistemas intermediários com Disco Rígido instalado.
- AT - Focado em IBM PC 5170 ou Compatíveis, sistemas mais avançados com relógios, CMOS, CD-ROM etc.
- Custom - Configuração customizável pelo usuário

Os nomes PC, XT e AT foram usados apenas por representar o estado destas maquinas em seus respectivos lançamentos, uma configuração AT rodaria em uma maquina PC normalmente, porém seu Kernel é mais pesado o que faz demorar mais para carregar, por conter mais componentes.

Em cada uma das configurações são gerados discos de diversos formatos:

- Disquete de 5 e 1/4 Polegadas - 360 Quibioctetos(KiB) (Por mais ridículo que pareca o nome é esse em PT-BR, não reclame comigo)
- Disquete de 5 e 1/4 Polegadas - 1200 Quibioctetos(KiB)
- Disquete de 3 e 1/2 Polegadas - 720 Quibioctetos(KiB)
- Disquete de 3 e 1/2 Polegadas - 1440 Quibioctetos(KiB)

## Compilando e testando no DOSBOX

```sh
make teste-dosbox
```

## Compilando e testando no QEMU

```sh
make teste-qemu
```
## Gerando os Disquetes de Distribuição

```sh
make distro
```