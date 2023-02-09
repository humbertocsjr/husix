# Executável HSX

Este é o tipo padrão de Executável do HUSIX, ele pode ser carregado e realocado dinamicamente.

# Cabeçalho - Versão 1

Tamanho do cabeçalho: 20 Bytes

| Posição | Tamanho | Descrição |
|---------|---------|-----------|
| 0 | 3 | Assinatura 'HSX' em ASCII |
| 3 | 1 | Tipo: 0=Aplicativo / 1=Biblioteca |
| 4 | 2 | Versão do Cabeçalho |
| 6 | 2 | Versão da API do HUSIX (0 ou maior) |
| 8 | 2 | Ponteiro para Rotina Start |
| 10 | 2 | Tamanho do Executável |
| 12 | 2 | Tamanho da Pilha necessária | 
| 14 | 2 | Ponteiro para Tabela de Realocações |
| 16 | 2 | Ponteiro para Tabela de Importações | 
| 18 | 2 | Ponteiro para Tabela de Exportações |

# Registro da Tabela de Realocações


# Tipos de Registros de Importação e Exportação

- 0 - Fim da Lista
- 1 - Arquivo (Usado apenas na Importação)
- 2 - Módulo
- 3 - Rotina (Sub-rotina/Função)

# Registro da Tabela de Importações

| Posição | Tamanho | Descrição |
|---------|---------|-----------|
| 0 | 1 | Tipo |
| 1 | 2 | Ponteiro Local para o Item |

## Formato do Item Tipo 1 - Importação

| Posição | Tamanho | Descrição |
|---------|---------|-----------|
| 0 | ? | String com o nome do arquivo |

## Formato do Item Tipo 2 - Módulo

| Posição | Tamanho | Descrição |
|---------|---------|-----------|
| 0 | ? | String com o nome do módulo |

## Formato do Item Tipo 3 - Rotina

| Posição | Tamanho | Descrição |
|---------|---------|-----------|
| 0 | 4 | Ponteiro usado pelo compilador após a importação, normalmente zerado |
| 4 | ? | String com o nome da rotina |

O primeiro campo é substituído pelo endereço do Ponteiro Local no registro de Exportação do arquivo importado

# Registro da Tabela de Exportações


| Posição | Tamanho | Descrição |
|---------|---------|-----------|
| 0 | 1 | Tipo |
| 1 | 2 | Ponteiro Local para o Item |

## Formato do Item Tipo 2 - Módulo

| Posição | Tamanho | Descrição |
|---------|---------|-----------|
| 0 | ? | String com o nome do módulo |

## Formato do Item Tipo 3 - Rotina

| Posição | Tamanho | Descrição |
|---------|---------|-----------|
| 0 | 3 | Pulo para a rotina |
| 3 | ? | String com o nome da rotina |