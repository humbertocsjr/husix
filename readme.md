# Sistema Operacional HUSIX

Este projeto está em fase protótipo, e é direcionado em criar um Sistema Operacional Gráfico para IBM PC e aproveitar e Framework próximo ao .Net Framework porém 16bits, usando a linguagem [HCBasic](https://github.com/humbertocsjr/hcbasic).

O objetivo geral é criar um sistema operacional como se fosse o um macOS atual, que unem a leveza de um unix porém com facilidade, simplicidade e organização voltados para um usuário leigo, porém usando a estética da Apple e estilo dos anos 80, principalmente do ecosistema do Mac 128/Mac Plus. 

Então quero montar algo simples de usar, focado na interface gráfica, preto e branco, afinal manipular cores no IBM PC é uma loucura rodando com um bus de 8 bits a 4 mhz, só ver a loucura que é usar Windows 2.0-3.0 em EGA rodando num PC original, então quero manter o mais leve possível, para isso sacrificar a cor ja economiza muitos ciclos de processamento e que podem ser usados para outras coisas como audio

Para testar este projeto sem compilar basa usar um disquete com o nome terminado em TEST.IMG no diretorio Distro

# Objetivos para Versão 1.0

- [ ] Implementar Interpretação dos Argumentos passados pelo BootLoader para o Kernel
    - [ ] Definir o Disco inicial
    - [ ] Definir o Arquivo que deve ser executado primeiro
    - [ ] Definir o Controlador de Vídeo que deve ser carregado
- [ ] Implementar System.Collections List
    - [x] Criação de Lista
    - [x] Adição de itens
    - [ ] Remoção de Itens
    - [ ] Inclusão em qualquer posicao
- [ ] Implementar Strings / UTF-8
    - [x] Implementar Conversão mínima de UTF-8 para CP437, suficiente para ler ASCII basico
    - [ ] Implementar Conversão de todos os caracteres focados em texto ou emojis suportados no CP437
- [x] Implementar System.Console
    - [x] Implementar Suporte Minimo a Teclado (Usando BIOS e layout padrão da BIOS)
    - [x] Implementar Video Texto via CGA ou Superior, usando a BIOS (Ignorar MDA)
    - [x] Detectar automaticamente tipo de placa de video (MDA/CGA/EGA/VGA)
- [x] Implementar System.IO.Stream
    - [x] Implementar criação de Stream
    - [x] Implementar rotinas genéricas de Read/Write para manipular strings
- [x] Implementar System.IO.Disk
    - [x] Implementar rotinas básicas para alocação de unidades de disco
- [x] Implementar Disco usando BIOS (BIOSDisk)
    - [x] Ler da BIOS qual a configuração dos discos
- [x] Implementar System.IO.FileSystem
    - [x] Implementar rotinas básicas para criação e montagem de sistema de arquivos
- [ ] Implementar MinixFS
    - [x] Listagem de Diretorios/Arquivos
    - [x] Implementar a Abertura de Arquivos (Open)
    - [x] Implementar ReadRaw/Read
    - [ ] Implementar ReadLine
    - [ ] Implementar WriteRaw/Write
    - [ ] Implementar SeekCurrent/SeekEnd/SeekBegin
    - [ ] Implementar Close
- [ ] Implementar System.IO.File
    - [ ] Usando System.IO.FileSystem, implementar abertura de Arquivos
- [ ] Implementar System.Reflection para carregar e executar arquivos
    - [ ] Implementar no compilador lista de modulos/rotinas públicas
    - [ ] Implementar bibliotecas externas (Criar .DLL)
    - [ ] Implementar carregamento de bibliotecas externas automaticamente
    - [ ] Implementar chamada dinamica de uma rotina
- [ ] Implementar System.IO.SerialPort (Basear no .NET) para comunicação binária
- [ ] Implementar System.Net.Sockets (Basear no .NET) para comunicação via pacotes (Apenas o essencial)
- [ ] Implementar Protocolo OBEX (System.Net.OBEX)
    - [ ] Permitir envio de arquivos via Serial
    - [ ] Permitir recebimento de arquivos via Serial
- [ ] Implementar Protocolo XModem (System.Net.XModem)
    - [ ] Permitir envio de arquivos via Serial
    - [ ] Permitir recebimento de arquivos via Serial
- [ ] Implementar Interface Gráfica
    - [ ] Implementar System.Drawing/System.Forms Minimo
    - [ ] Criar Controlador de Mouse Serial usando biblioteca System.IO.SerialPort
    - [ ] Criar Aplicativo Explorador (Gerenciador de Arquivos)
    - [ ] Criar Aplicativo Escrivaninha (Mesa/Desktop)
    - [ ] Implementar Suporte a CGA Monocromático
    - [ ] Implementar Suporte a VGA Monocromático
    - [ ] Implementar Suporte a Hercules
    - [ ] Implementar Mecanismo de carregamento de traduções do programa
- [ ] Criar uma linguagem simples de scripts baseado em GWBasic para automatizar a inicialização
- [ ] Implementar Suporte a Leitura e Gravação de Fitas Cassete via Porta Cassete do IBM PC 5150/PCjr
- [x] Internacionalização
    - [x] Suporte a Internacionalização Embutida no binario através do arquivo Translation

# Objetivos futuros

- [ ] Suporte a Internacionalização Dinamica onde o Translation carrega um arquivo externo ao iniciar lendo as traduções
- [ ] Implementar Suporte a MarkDown no System.Forms para usar como um tipo de RichTextBox
- [ ] Implementar Layouts de Teclado
- [ ] Implementar Teclado/Mouse PS/2
- [ ] Implementar Controlador ATA/ATAPI para Discos
    - [ ] Suporte a CD-ROM
    - [ ] Suporte a ZIP Drive via IDE
- [ ] Implementar Controlador ZIP Drive via Paralela
- [ ] Implementar Pilha mínima de IPX (System.Net.IPX)
- [ ] Implementar Pilha mínima de IP (System.Net.IP)
- [ ] Implementar Protocolo TFTP (System.Net.TFTP)
- [ ] Implementar HTTP WebRequest (System.Net.HTTP)
- [ ] Implementar SLIP/PLIP
    - [ ] Implementar Controlador para Wifi232 para se conectar a conexão SLIP via Telnet
    - [ ] Implementar Controlador para Plipbox
    - [ ] Implementar Controlador para Plip2Slip usando Arduino
- [ ] Implementar Suporte a Wifi usando Placas Externas Via Serial/Paralela
    - [ ] Implementar Controlador para RetroWifiModem com SLIP via Telnet
    - [ ] Implementar Controlador para ESP_SLIP_ROUTER que suporte a configuração via TCP/IP
        - [ ] Testar equipamento usando ESP_SLIP_ROUTER + Plip2Slip para maior desempenho
- [ ] Implementar Suporte a ISA PnP
- [ ] Implementar Suporte a Áudio
    - [ ] Implementar Controlador AdLib
    - [ ] Implementar Controlador SoundBlaster 1.0/1.5/2.0/Pro
    - [ ] Implementar Controlador SoundBlaster 16/Vibra ISA PnP
    - [ ] Implementar Controlador Resound 2 OPL3
- [ ] Implementar Suporte a Lo-tech 2MB EMS Board
- [ ] Implementar Controlador para Lo-tech ISA USB Adapter / Adaptador Genérico ISA USB
- [ ] Implementar Memoria virtual, onde realoca blocos de memória para o HD ou EMS

# Este projeto é tem como inspiração:

- QuickBASIC/Visual BASIC (Onde eu aprendi a programar nos anos 2000-2003)
- .NET Framework (Inspiração pra criar a organização das bibliotecas do sistema)
- Apple System 1.0-6.0 (Aparencia e características)
- macOS X (Hierarquia de arquivos e organizacao, talvez a dock, mas ainda nem cheguei a parte gráfica)
- SymbOS (Ideia de criar algo voltado a retrocomputação)
- Serenity OS (Ideia de fazer algo com a estética antiga (Este foca nos anos 90 e o meu nos anos 80))
- Retrocomputaria/Retropolis (Inspiração em manter minha coleção de computadores clássicos funcionais e tentar ajudar a comunidade com alguns projetinhos)
- SmallerC (Compilador que adaptei pro 8086(Aparentemente o autor original abandonou o projeto então se precisarem usar na prática peguem do meu repositório), que quero no final portar pro HUSIX para fazer algo mais compatível com POSIX)

[Suporte para Visual Code para a linguagem HCBasic](https://github.com/humbertocsjr/hcbasic_syntax) Copiar conteúdo para pasta ~/.vscode/extensions/hcbasic_syntax (No caso do Linux/macOS)

Por enquanto estou montando o framework que está embutido no Kernel, já é bootável porém ainda não tem os recursos necessários para carregar outros executáveis do disco

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