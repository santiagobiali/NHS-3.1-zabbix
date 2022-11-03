# NHS-3.1-zabbix
 
1. Importe `NHS Nobreak Monitor 3.1 scrapper.yaml` para o seu servidor Zabbix.
2. Adicione o template aos seus hosts.
3. Mude o IP do seu servidor Zabbix e do seu servidor NHS em `nhs.sh` e execute o script.

Itens:
- Estado Entrada
- Tensão de entrada
- Tensão de entrada mínima
- Tensão de entrada máxima
- Estado Saída
- Tensão de saída
- Carga do nobreak
- Estado Bateria
- Tensão da bateria

Triggers:
- Carga do Nobreak é maior que 90% nos últimos 5 minutos
- Estado Entrada não está OK
- Estado Saída não está Normal
- Tensão de Entrada Muito Alta
- Tensão de Entrada Muito Baixa