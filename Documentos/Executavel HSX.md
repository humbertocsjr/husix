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



# Registro da Tabela de Importações



# Registro da Tabela de Exportações

