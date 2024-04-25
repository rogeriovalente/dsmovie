# language: pt
@gerarGuia
Funcionalidade: Gerar guia de arrecadação

    Cenário de Fundo:

        Dado que tenha a seguinte tabela de unidades gestoras cadastradas
            | Sequencial |  Codigo | Nome       |
            | 59         |  900003 | SEFAZ      |
            | 77         |  410512 | DETRAN-AL  |
            | 71         |  410017 | SEPLAG     |

        E que tenha as seguintes receitas cadastradas
            | Sequencial | Codigo | Digito | Nome                            | Inicio Vigencia |
            | 1270       | 1542   | 3      | ICMS CONVENIO GADO GORDO        | 24/08/2023      |
            | 1260       | 1350   | 1      | ICMS SUBSTITUICAO               | 24/08/2023      |
            | 1254       | 1321   | 8      | ICMS TRANSPORTES                | 24/08/2023      |
            | 1313       | 13323  | 0      | ICMS EXPORTACAO                 | 24/08/2023      |
            | 1316       | 13846  | 0      | ICMS INCENTIVADO PARCELADO      | 24/08/2023      |
            | 1320       | 15202  | 1      | ICMS PARCELAMENTO               | 24/08/2023      |
            | 1565       | 67130  | 1      | RESTITUIÇÕES                    | 24/08/2023      |
            | 1333       | 36650  | 1      | TAXA PREV. E COMBATE A INCENDIO | 24/08/2023      |
            | 1248       | 16012  | 1      | SIMPLES NACIONAL                | 24/08/2023      |

        E que tenha as seguintes receitas cadastradas da UG
            | Seq Receita Unidade Gestora | Seq Receita                          | Seq Unidade Gestora |
            | 1                           | 1270-ICMS CONVENIO GADO GORDO        | 59-SEFAZ            |
            | 2                           | 1260-ICMS SUBSTITUICAO               | 59-SEFAZ            |
            | 3                           | 1260-ICMS SUBSTITUICAO               | 77-DETRAN           |
            | 4                           | 1254-ICMS TRANSPORTES                | 59-SEFAZ            |
            | 5                           | 1313-ICMS EXPORTACAO                 | 71-SEFLAG           |
            | 6                           | 1316-ICMS INCENTIVADO PARCELADO      | 59-SEFAZ            |
            | 7                           | 1320-ICMS PARCELAMENTO               | 59-SEFAZ            |
            | 8                           | 1565-RESTITUIÇÕES                    | 59-SEFAZ            |
            | 9                           | 1333-TAXA PREV. E COMBATE A INCENDIO | 59-SEFAZ            |
            | 10                          | 1248-SIMPLES NACIONAL                | 59-SEFAZ            |

        E que tenha a seguinte tabela de tipo de guia
            | Codigo Guia | Nome Tipo Guia  |
            | 1           | GUIA SIMPLES    |
            | 2           | MULTI RECEITAS  |

        E que tenha a seguinte tabela de origem de guia
            | Codigo | Descricao              | Indicador Ativo |
            | D      | DETRAN                 | 1               |
            | M      | Modelo Guia DAR Único  | 1               |

        E que tenha os seguintes produtos cadastrados
            | Sequencial | Codigo | Produto                                                  |
            | 1          | 60     | Aguardente                                               |
            | 2          | 104    | Bicicletas e Peças                                       |
            | 3          | 101    | Agricultura                                              |
            | 4          | 10     | Veículos automotores                                     |
            | 5          | 99     | Outros Recolhimentos                                     |
            | 6          | 9      | Cervejas, refrigerantes, água mineral ou potável e gelo  |

        E que tenha as seguintes receitas UG produtos cadastradas
            | Seq Unidade Gestora Produto | Seq Receita Unidade Gestora | Seq Produto |
            | 3                           | 4                           | 4           |

        E que tenha as seguintes receitas cadastradas para os tipos de inscrições
           | Sequencia Receita | Receita                  | Codigo Tipo Inscricao | Tipo Inscricao |
           | 1270              | ICMS CONVENIO GADO GORDO | 1                     | CACEAL         |
           | 1270              | ICMS CONVENIO GADO GORDO | 3                     | CPF            |
           | 1270              | ICMS CONVENIO GADO GORDO | 4                     | CNPJ           |
           | 1254              | ICMS TRANSPORTES         | 1                     | CACEAL         |
           | 1254              | ICMS TRANSPORTES         | 2                     | RENAVAM        |
           | 1254              | ICMS TRANSPORTES         | 3                     | CPF            |
           | 1254              | ICMS TRANSPORTES         | 4                     | CNPJ           |
           | 1320              | ICMS PARCELAMENTO        | 1                     | CACEAL         |
           | 1320              | ICMS PARCELAMENTO        | 2                     | RENAVAM        |
           | 1320              | ICMS PARCELAMENTO        | 3                     | CPF            |
           | 1320              | ICMS PARCELAMENTO        | 4                     | CNPJ           |
           | 1313              | ICMS EXPORTACAO          | 1                     | CACEAL         |
           | 1313              | ICMS EXPORTACAO          | 2                     | RENAVAM        |
           | 1313              | ICMS EXPORTACAO          | 3                     | CPF            |
           | 1313              | ICMS EXPORTACAO          | 4                     | CNPJ           |
           | 1260              | ICMS SUBSTITUICAO        | 1                     | CACEAL         |
           | 1260              | ICMS SUBSTITUICAO        | 2                     | RENAVAM        |
           | 1260              | ICMS SUBSTITUICAO        | 3                     | CPF            |
           | 1260              | ICMS SUBSTITUICAO        | 4                     | CNPJ           |

        E que tenha os seguintes Tipos de Documento de Origem cadastrados:
            | Sequencial | Codigo | Descricao                | Ind Contb Destinatario |
            | 1          | 1      | NOTA FISCAL AVULSA       | Sim                    |
            | 10         | 10     | NOTA FISCAL              | Sim                    |
            | 61         | 61     | DAR (CORPO DE BOMBEIROS) | Sim                    |
            | 22         | 22     | CHAVE DA NFe             | Sim                    |
            | 4          | 4      | DI                       | Não                    |
            | 5          | 5      | DMI                      | Não                    |

        E que tenha os seguintes documentos de origem das receitas cadastrados
            | Seq Receita              | Seq Tipo Documento   |
            | 1320-ICMS PARCELAMENTO   | 1-NOTA FISCAL AVULSA |
            | 1320-ICMS PARCELAMENTO   | 22-CHAVE DA NFe      |

        E que tenha o seguinte contribuinte cadastrado
            | Caceal   | Digito | Cnpj           | Nome Contribuinte | Tipo Logradouro | Logradouro     | Numero | Bairro       | Cep      | Codigo Ibge | Numero Telefone |
            | 24400030 | 1      | 73528464000149 | CLAUDIO MARIA     | RUA             | SEM NOME       | 222    | DESCONHECIDO | 57000000 | 2704302     | 32214569        |
            | 24053557 | 0      | 46142209088    | ABCD LTDA         | AV              | FERNANDES LIMA | 471    |              | 57055000 | 2704302     | 999522232       |

        E que o usuário logado pertença a unidade gestora "900003-Sefaz"

        E que tenha a seguinte tabela da selic
          | Data Referencia | Percentual |
          | 01/06/2022      | 1,12       |
          | 01/07/2022      | 1,05       |
          | 01/08/2022      | 1,07       |
          | 01/09/2022      | 1,09       |

        E que tenha a seguinte tabela de juros
            | Sequencial | Juros Devido | Juros Pago | Indicador Selic | Indicador Base Calculo |
            | 1          | 1            | 1          | Sim             | Sim                    |
            | 2          | 1            | 1          | Sim             | Não                    |

        E que tenha a seguinte tabela de multa
            | Sequencial | Perceutual | Tipo Multa    |  Qtd dia minimo | Qtd dia maximo | Seq Porte | Indicador Simples Nacional |
            | 1          | 20         | Não se aplica |                 |                |           | Não                        |
            | 2          | 0,2        | Diária        |  1              | 30             |           | Não                        |
            | 3          | 9          | Não se aplica |  31             | 60             |           | Não                        |
            | 4          | 15         | Não se aplica |  61             |                |           | Não                        |

        E que tenha a seguinte tabela de receita UG juros e multas
            | Seq Receita Multa Juros | Seq Receita Unidade Gestora | Inicio Vigencia  |  Seq Multa | Seq Juros | Mes Carencia |
            | 1                       | 1                           | 24/05/2019       |  2         | 1         |              |
            | 2                       | 1                           | 24/05/2019       |  3         | 1         |              |
            | 3                       | 1                           | 24/05/2019       |  4         | 1         |              |

    Esquema do Cenário: 01 Com campos obrigatórios não informados
        Dado que não foi informado o seguinte campo <campo>
        Quando solicitar gerar a guia
        Então deveria retornar a seguinte lista de mensagens
            | item | nomeCampo | mensagem                                 |
            | 1    | <campo>   | Campo obrigatório <campo> não informado! |

        Exemplos:
            | campo                         |
            | Tipo de Inscrição             |
            | Número de Inscrição           |
            | Nome do Contribuinte          |
            | Data Limite Pagamento da Guia |
            | Versão                        |

    Cenário: 02 Sem adicionar nenhuma receita
        Dado que o tipo de inscrição informado foi "CACEAL"
        E que o número de inscrição informado foi "24400030"
        E a data limite para pagamento "10/07/2019"
        E que informada data atual "07/06/2019"
        E a observação "Guia gerada para pagamento das receitas listadas acima"
        E a quantidade de vias "2"
        E que não foi adicionada nenhuma receita
        Quando solicitar gerar a guia
        Então deveria exibir a mensagem "A Guia Arrecadação não possui receita adicionada."

    Cenário: 03 Adicionando receita já adicionada
        Dado que existem as seguintes receitas adicionadas
            | Receita                 |  Produto                      | Documento Origem     | Numero Documento Origem | Competencia | Vencimento Original | Valor Principal | Desconto | Multa | Juros |
            | 15202-ICMS PARCELAMENTO |  10-Veículo automotor 4 rodas | 1-Nota Fiscal Avulsa | 12345                   | 05/2019     | 07/06/2019          | 100,00          |          | 1,00  | 2,25  |
            | 15202-ICMS PARCELAMENTO |  10-Veículo automotor 4 rodas | 1-Nota Fiscal Avulsa | 12345                   | 05/2019     | 07/06/2019          | 100,00          |          | 1,00  | 2,25  |
        E que o tipo de inscrição informado foi "CACEAL"
        E que o número de inscrição informado foi "244000301"
        E a data limite para pagamento "10/07/2019"
        E que informada data atual "07/06/2019"
        E a observação "Guia gerada para pagamento das receitas listadas acima"
        E a quantidade de vias "2"
        Quando solicitar gerar a guia
        Então deveria exibir a mensagem "A Guia Arrecadação possui receitas duplicadas."

    Cenário: 04 Ultrapassando o limite máximo de 30 receitas por Guia Arrecadacao
        Dado que existem as seguintes receitas adicionadas
            | Receita                 | Produto                      | Documento Origem     | Numero Documento Origem | Competencia | Vencimento Original | Valor Principal | Desconto | Multa | Juros |
            | 15202-ICMS PARCELAMENTO | 10-Veículo automotor 4 rodas | 1-Nota Fiscal Avulsa | 1                       | 01/2019     | 07/06/2019          | 100,00          |          | 1,00  | 2,25  |
            | 15202-ICMS PARCELAMENTO | 10-Veículo automotor 4 rodas | 1-Nota Fiscal Avulsa | 2                       | 02/2019     | 07/06/2019          | 100,00          |          | 1,00  | 2,25  |
            | 1321-ICMS TRANSPORTES   |                              | 10-NOTA FISCAL       | 3                       | 02/2019     | 10/06/2019          | 150,00          |          |       |       |
            | 13323-ICMS EXPORTACAO   |                              | 4-DI                 | 4                       | 02/2019     | 10/06/2019          | 100,00          |          |       |       |
            | 15202-ICMS PARCELAMENTO | 10-Veículo automotor 4 rodas |                      |                         | 02/2019     | 15/06/2019          | 100,00          |          |       |       |
            | 13323-ICMS EXPORTACAO   |                              | 5-DIM                | 5                       | 02/2019     | 10/06/2019          | 200,00          |          |       |       |
            | 13323-ICMS EXPORTACAO   |                              | 5-DIM                | 6                       | 02/2019     | 10/06/2019          | 100,00          |          | 2,00  | 1,00  |
            | 15202-ICMS PARCELAMENTO | 10-Veículo automotor 4 rodas | 1-Nota Fiscal Avulsa | 7                       | 03/2019     | 07/06/2019          | 100,00          |          | 1,00  | 2,25  |
            | 1321-ICMS TRANSPORTES   |                              | 10-NOTA FISCAL       | 8                       | 03/2019     | 10/06/2019          | 150,00          |          |       |       |
            | 13323-ICMS EXPORTACAO   |                              | 4-DI                 | 9                       | 03/2019     | 10/06/2019          | 100,00          |          |       |       |
            | 15202-ICMS PARCELAMENTO | 10-Veículo automotor 4 rodas |                      |                         | 03/2019     | 15/06/2019          | 100,00          |          |       |       |
            | 13323-ICMS EXPORTACAO   |                              | 5-DMI                | 10                      | 03/2019     | 10/06/2019          | 200,00          |          |       |       |
            | 13323-ICMS EXPORTACAO   |                              | 5-DMI                | 11                      | 03/2019     | 10/06/2019          | 100,00          |          | 2,00  | 1,00  |
            | 15202-ICMS PARCELAMENTO | 10-Veículo automotor 4 rodas | 1-Nota Fiscal Avulsa | 12                      | 04/2019     | 07/06/2019          | 100,00          |          | 1,00  | 2,25  |
            | 1321-ICMS TRANSPORTES   |                              | 10-NOTA FISCAL       | 13                      | 04/2019     | 10/06/2019          | 150,00          |          |       |       |
            | 13323-ICMS EXPORTACAO   |                              | 4-DI                 | 14                      | 04/2019     | 10/06/2019          | 100,00          |          |       |       |
            | 15202-ICMS PARCELAMENTO | 10-Veículo automotor 4 rodas |                      |                         | 04/2019     | 15/06/2019          | 100,00          |          |       |       |
            | 13323-ICMS EXPORTACAO   |                              | 5-DMI                | 15                      | 04/2019     | 10/06/2019          | 200,00          |          |       |       |
            | 13323-ICMS EXPORTACAO   |                              | 5-DMI                | 16                      | 04/2019     | 10/06/2019          | 100,00          |          | 2,00  | 1,00  |
            | 15202-ICMS PARCELAMENTO | 10-Veículo automotor 4 rodas | 1-Nota Fiscal Avulsa | 17                      | 05/2019     | 07/06/2019          | 100,00          |          | 1,00  | 2,25  |
            | 1321-ICMS TRANSPORTES   |                              | 10-NOTA FISCAL       | 18                      | 05/2019     | 10/06/2019          | 150,00          |          |       |       |
            | 13323-ICMS EXPORTACAO   |                              | 4-DI                 | 19                      | 05/2019     | 10/06/2019          | 100,00          |          |       |       |
            | 15202-ICMS PARCELAMENTO | 10-Veículo automotor 4 rodas |                      |                         | 05/2019     | 15/06/2019          | 100,00          |          |       |       |
            | 13323-ICMS EXPORTACAO   |                              | 5-DMI                | 20                      | 05/2019     | 10/06/2019          | 200,00          |          |       |       |
            | 13323-ICMS EXPORTACAO   |                              | 5-DMI                | 12345                   | 05/2019     | 10/06/2019          | 100,00          |          | 2,00  | 1,00  |
            | 15202-ICMS PARCELAMENTO | 10-Veículo automotor 4 rodas | 1-Nota Fiscal Avulsa | 21                      | 06/2019     | 07/06/2019          | 100,00          |          | 1,00  | 2,25  |
            | 1321-ICMS TRANSPORTES   |                              | 10-NOTA FISCAL       | 22                      | 06/2019     | 10/06/2019          | 150,00          |          |       |       |
            | 13323-ICMS EXPORTACAO   |                              | 4-DI                 | 23                      | 06/2019     | 10/06/2019          | 100,00          |          |       |       |
            | 15202-ICMS PARCELAMENTO | 10-Veículo automotor 4 rodas |                      |                         | 06/2019     | 15/06/2019          | 100,00          |          |       |       |
            | 13323-ICMS EXPORTACAO   |                              | 5-DMI                | 24                      | 06/2019     | 10/06/2019          | 200,00          |          |       |       |
            | 13323-ICMS EXPORTACAO   |                              | 5-DMI                | 25                      | 06/2019     | 10/06/2019          | 100,00          |          | 2,00  | 1,00  |

        E que informada data atual "07/06/2019"
        Quando solicitar gerar a guia
        Então deveria exibir a mensagem "Utrapassado o limite de 30 Receitas por Guia Arrecadação."

    Cenário: 05 Data limite para pagamento deve ser igual ou maior do que a data atual
        E que existem as seguintes receitas adicionadas
            | Receita                 | Competencia | Vencimento Original | Valor Principal | Desconto | Multa | Juros |
            | 15202-ICMS PARCELAMENTO | 05/2019     | 07/07/2019          | 100,00          |          | 1,00  | 2,25  |
            | 1321-ICMS TRANSPORTES   | 05/2019     | 10/07/2019          | 150,00          |          |       |       |
            | 13323-ICMS EXPORTACAO   | 05/2019     | 15/07/2019          | 100,00          |          |       |       |
        E que o tipo de inscrição informado foi "CACEAL"
        E que o número de inscrição informado foi "24400030"
        E a data limite para pagamento "21/12/2022"
        E a observação "Guia gerada para pagamento das receitas listadas acima"
        E a quantidade de vias "2"
        E que informada data atual "22/12/2022"
        Quando solicitar gerar a guia
        Então deveria exibir a mensagem "Data Limite Pagamento da Guia não pode ser menor que a data atual."

    Cenário: 06 Com todas as informações adicionadas com sucesso e com contribuinte cadastrado
        Dado que existem as seguintes receitas adicionadas
            | Receita                 | Produto                      | Documento Origem | Numero Documento Origem | Competencia | Vencimento Original | Valor Principal | Desconto | Multa | Juros |
            | 1321-ICMS TRANSPORTES   | 10-Veículo automotor 4 rodas |                  |                         | 05/2019     | 07/06/2019          | 100,00          |          |       |       |
            | 15202-ICMS PARCELAMENTO |                              |                  |                         | 05/2019     | 10/06/2019          | 150,00          |          |       |       |
        E que o tipo de inscrição informado foi "CACEAL"
        E que o número de inscrição informado foi "240535570"
        E a data limite para pagamento "10/07/2019"
        E que informada data atual "07/06/2019"
        E a observação "Guia gerada para pagamento das receitas listadas acima"
        E a quantidade de vias "2"
        Quando solicitar gerar a guia
        Então deveria gerar guia arrecadação
            | Numero Guia | Qtd Via Emissao | Tipo Inscricao | Numero Inscricao | Nome Razao Social | Tipo Guia | Endereco                | Cep      | Municipio | Observacao                                             |
            | 2           | 2               | CACEAL         | 24053557         | ABCD LTDA         | 1         | AV FERNANDES LIMA,471.  | 57055000 | MACEIO    | Guia gerada para pagamento das receitas listadas acima |

    Cenário: 07 Com todas as informações adicionadas com sucesso e sem contribuinte cadastrado
        Dado que existem as seguintes receitas adicionadas
            | Receita                 | Produto | Documento Origem | Numero Documento Origem | Competencia | Vencimento Original | Valor Principal | Desconto | Multa | Juros |
            | 15202-ICMS PARCELAMENTO |         |                  |                         | 05/2019     | 10/06/2019          | 150,00          |          |       |       |
        E que o tipo de inscrição informado foi "CPF"
        E que o número de inscrição informado foi "64781288065"
        E que o nome do contribuinte informado foi "ABCD LTDA"
        E que o município informado foi "MACEIO"
        E que o endereço informado foi "Rua X"
        E que o número informado foi "99"
        E que o CEP informado foi "57000000"
        E a data limite para pagamento "10/07/2019"
        E que informada data atual "07/06/2019"
        E a observação "Guia gerada para pagamento da receita listada acima"
        E a quantidade de vias "1"
        Quando solicitar gerar a guia
        Então deveria gerar guia arrecadação
            | Numero Guia | Qtd Via Emissao | Tipo Inscricao | Numero Inscricao | Nome Razao Social | Tipo Guia | Endereco  | Cep      | Municipio | Observacao                                          | Codigo Modelo Guia |
            | 2           | 1               | CPF            | 64781288065      | ABCD LTDA         | 1         | Rua X, 99 | 57000000 | MACEIO    | Guia gerada para pagamento da receita listada acima | 2                  |

    Cenário: 08 Data limite para pagamento foi alterada e os valores de multa e juros serão recalculados

        Dado que existem as seguintes receitas adicionadas
            | Receita                       | Competencia | Vencimento Original | Valor Principal | Desconto | Multa | Juros | Produto                      |
            | 1542-ICMS CONVENIO GADO GORDO | 06/2022     | 07/06/2022          | 100,00          |          | 2,00  | 2,25  |                              |
            | 1321-ICMS TRANSPORTES         | 07/2022     | 10/07/2022          | 150,00          |          |       |       | 10-Veículo automotor 4 rodas |
            | 1350-ICMS SUBSTITUICAO        | 07/2022     | 15/07/2022          | 100,00          |          |       |       |                              |
        E que o tipo de inscrição informado foi "CACEAL"
        E que o número de inscrição informado foi "24400030"
        E a data limite para pagamento "15/08/2022"
        E a observação "Guia gerada para pagamento das receitas listadas acima"
        E a quantidade de vias "2"
        E que informada data atual "15/08/2022"
        Quando mudar a data limite de pagamento
        Então deveria apresentar os seguintes dados das receitas
            | Nome Receita                  | Competencia | Vencimento Original | Valor Principal | Desconto | Multa  | Juros | Produto                      |
            | 1542-ICMS CONVENIO GADO GORDO | 06/2022     | 07/06/2022          | 100,00          |          | 15,00  | 3,51  |                              |
            | 1321-ICMS TRANSPORTES         | 07/2022     | 10/07/2022          | 150,00          |          | 0,00   | 0,00  | 10-Veículo automotor 4 rodas |
            | 1350-ICMS SUBSTITUICAO        | 07/2022     | 15/07/2022          | 100,00          |          | 0,00   | 0,00  |                              |

    Cenário: 09 Se a data limite para pagamento for feriado, feriado bancário ou final de semana, a data de pagamento deve ser o próximo dia útil

        Dado que existem as seguintes receitas adicionadas
            | Receita                 | Produto  | Documento Origem | Numero Documento Origem | Competencia | Vencimento Original | Valor Principal | Desconto | Multa | Juros |
            | 15202-ICMS PARCELAMENTO |          |                  |                         | 05/2019     | 10/06/2019          | 150,00          |          |       |       |
        E que o tipo de inscrição informado foi "CACEAL"
        E que o número de inscrição informado foi "240535570"
        E a data limite para pagamento "08/06/2019"
        E que informada data atual "07/06/2019"
        E a observação "Guia gerada para pagamento das receitas listadas acima"
        E a quantidade de vias "2"
        Quando solicitar gerar a guia
        Então deveria gerar guia arrecadação
            | Numero Guia | Qtd Via Emissao | Tipo Inscricao | Numero Inscricao | Nome Razao Social | Tipo Guia | Endereco               | Cep      | Municipio | Observacao                                             |
            | 2           | 2               | CACEAL         | 24053557         | ABCD LTDA         | 1         | AV FERNANDES LIMA,471. | 57055000 | MACEIO    | Guia gerada para pagamento das receitas listadas acima |

    Cenário: 10 Com todas as informações adicionadas com sucesso e tipo inscrição RENAVAM

        Dado que existam os seguintes contribuintes cadastrados
            | nomeContribuinte          | numeroInscricao | renavam    | chassis           |
            | FRANCISCO ANTONIO RIBEIRO | 06264661000372  | 1046040925 | 9BD17201643068333 |
        E que existem as seguintes receitas adicionadas
            | Receita                 | Competencia | Vencimento Original | Valor Principal | Desconto | Multa | Juros |
            | 15202-ICMS PARCELAMENTO | 05/2019     | 07/06/2019          | 100,00          |          |       |       |
        E que o tipo de inscrição informado foi "RENAVAM"
        E que o número de inscrição informado foi "1046040925"
        E que o nome do contribuinte informado foi "FRANCISCO ANTONIO RIBEIRO"
        E a data limite para pagamento "10/07/2019"
        E que informada data atual "07/06/2019"
        E a observação "Guia gerada para pagamento da receita listada acima"
        E a quantidade de vias "1"
        Quando solicitar gerar a guia
        Então deveria gerar guia arrecadação
            | Numero Guia | Qtd Via Emissao | Tipo Inscricao | Numero Inscricao | Nome Razao Social         | Tipo Guia | Endereco | Cep | Municipio | Observacao                                          |
            | 2           | 1               | RENAVAM        | 1046040925       | FRANCISCO ANTONIO RIBEIRO | 1         |          |     |           | Guia gerada para pagamento da receita listada acima |

    Cenário: 11 Numnero de documento inválido
        E que existem as seguintes receitas adicionadas
            | Receita                 | Competencia | Vencimento Original | Valor Principal | Desconto | Multa | Juros |
            | 15202-ICMS PARCELAMENTO | 05/2019     | 07/07/2019          | 100,00          |          | 1,00  | 2,25  |
        E que o tipo de inscrição informado foi "CPF"
        E que o número de inscrição informado foi "1231495738123"
        E a data limite para pagamento "10/07/2019"
        E que informada data atual "07/06/2019"
        E a quantidade de vias "2"
        Quando solicitar gerar a guia
        Então deveria exibir a mensagem "CPF inválido"

    Cenário: 12 Numnero de CEP inválido
        E que existem as seguintes receitas adicionadas
            | Receita                 | Competencia | Vencimento Original | Valor Principal | Desconto | Multa | Juros |
            | 15202-ICMS PARCELAMENTO | 05/2019     | 07/07/2019          | 100,00          |          | 1,00  | 2,25  |
        E que o tipo de inscrição informado foi "CACEAL"
        E que o número de inscrição informado foi "240535570"
        E a data limite para pagamento "10/07/2019"
        E que informada data atual "07/06/2019"
        E que informado o cep "57099xxx"
        E a quantidade de vias "2"
        Quando solicitar gerar a guia
        Então deveria exibir a mensagem "Número de CEP inválido!"


    Cenário: 13 Guia multi documentos com documento,competência,vencimento e receita duplicados
        Dado que existem as seguintes receitas adicionadas
            | Receita               | Produto | Documento Origem  | Numero Documento Origem | Competencia | Vencimento Original | Valor Principal | Desconto | Multa | Juros |
            | 1321-ICMS TRANSPORTES |         | 10-Nota Fiscal    | 12345                   | 05/2019     | 10/06/2019          | 150,00          |          |       |       |
            | 1321-ICMS TRANSPORTES |         | 10-Nota Fiscal    | 12345                   | 05/2019     | 10/06/2019          | 150,00          |          |       |       |
        E que o tipo de inscrição informado foi "CPF"
        E que o número de inscrição informado foi "64781288065"
        E que o nome do contribuinte informado foi "ABCD LTDA"
        E que o município informado foi "MACEIO"
        E que o endereço informado foi "Rua X"
        E que o número informado foi "99"
        E que o CEP informado foi "57000000"
        E que foi informado o modelo de guia "1-Multi Documentos"
        E a data limite para pagamento "10/07/2019"
        E que informada data atual "07/06/2019"
        E a observação "Guia gerada para pagamento da receita listada acima"
        E a quantidade de vias "1"
        Quando solicitar gerar a guia
        Então deveria exibir a mensagem "A Guia Arrecadação possui documentos duplicados."


## tabelas envolvidas
## ADMARR001.ARR_TIPO_INSCRICAO
## ADMCAD001.VW_CONTRIBUINTE_ARR
## ADMARR001.ARR_RECEITA_UNIDADE_GESTORA
## ADMARR001.ARR_RECEITA
## ADMARR001.ARR_VENCIMENTO_RECEITA_UG_PROD
## ADMARR001.ARR_TIPO_DOCUMENTO_ORIGEM
## ADMARR001.ARR_DOCUMENTO_ORIGEM
## ADMARR001.ARR_GUIA_ARRECADACAO
## ADMARR001.ARR_GUIA_ARREC_CODIGO_BARRA
## ADMARR001.ARR_DETALHE_GUIA_ARRECADACAO
## ADMARR001.ARR_RECEITA_MULTA_JUROS
## ADMARR001.ARR_DETALHE_RECEITA
## ADMARR001.ARR_RECEITA_UG_PRODUTO
#
