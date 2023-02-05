#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <stdint.h>
#include <time.h>

int main(int argc, char * argv[])
{
    time_t hora;
    if(argc < 3)
    {
        ajuda:
        printf("Uso: gera_ver [Versao.hcb] [ALFA, BETA, PRE_PRODUCAO, PRODUCAO]");
        return 1;
    }
    time(&hora);
    struct tm * data = localtime(&hora);
    FILE * arq = fopen(argv[1], "w+");
    if(arq == NULL) goto ajuda;
    fprintf(arq, "' ARQUIVO GERADO AUTOMATICAMENTE - NAO MODIFICAR\n");
    fprintf(arq, "Imports System\n\n");
    fprintf(arq, "Structure Version\n");
    fprintf(arq, "    Dim Version as UInt16\n");
    fprintf(arq, "    Dim SubVersion as UInt16\n");
    fprintf(arq, "    Dim Revision as UInt16\n");
    fprintf(arq, "    Dim Release as PtrByteArray\n");
    fprintf(arq, "End\n\n");
    fprintf(arq, "Module HusixVersion\n");
    fprintf(arq, "    Public Sub GetVersion(ver as Version)\n");
    fprintf(arq, "        ' ARQUIVO GERADO AUTOMATICAMENTE - NAO MODIFICAR\n");
    fprintf(arq, "        ver.Version = %d\n", data->tm_year + 1900);
    fprintf(arq, "        ver.SubVersion = %d\n", data->tm_mon + 1);
    fprintf(arq, "        ver.Revision =  %d%02d\n", data->tm_yday, data->tm_hour);
    fprintf(arq, "        ver.Release = \"%s\"\n", argv[2]);
    fprintf(arq, "    End\n");
    fprintf(arq, "End\n\n");
    fflush(arq);
    fclose(arq);
}
