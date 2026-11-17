# Gestão de Clínica - SQL

## Sobre o projeto
Esse projeto foi criado para praticar SQL e desenvolver um banco de dados que simula o funcionamento de uma clínica. O banco disponibilizado possui apenas dados fictícios, criados para preservar a privacidade e seguir os princípios da LGPD.
A ideia foi organizar informações de pacientes, profissionais, procedimentos, convênios, atendimentos e também a parte financeira, incluindo faturamentos, recebimentos e despesas.
Fui construindo o banco aos poucos, criando as tabelas, relacionando as informações e inserindo dados fictícios para conseguir praticar consultas e entender melhor como tudo funciona na prática.

## Ferramentas utilizadas

- PostgreSQL
- DBeaver
- SQL

## Tabelas do banco
O banco possui 13 tabelas:

- Pacientes
- Profissionais
- Atividades
- Profissional_atividades
- Procedimentos
- Atendimentos
- Atendimento_procedimentos
- Convênios
- Convenio_procedimentos
- Faturamentos
- Recebimentos
- Despesas
- Categoria_despesas

## Algumas regras consideradas no projeto

- Toda consulta precisa ter uma pré-consulta, com bioimpedância, glicose e oximetria.
- Cada procedimento é relacionado ao profissional responsável.
- Os valores dos procedimentos podem mudar de acordo com o convênio.
- Os atendimentos particulares utilizam valores próprios.
- Cada convênio possui seus códigos e valores de procedimentos.
- Os curativos possuem categorias diferentes: simples, intermediário e complexo.
- Os faturamentos são vinculados aos atendimentos realizados.
- Os recebimentos podem ser integrais ou parciais.
- As despesas são separadas por categorias, incluindo salários, encargos, materiais de curativos e materiais para injetáveis.

## O que pratiquei com SQL

Durante o projeto, pratiquei:
- SELECT, WHERE e ORDER BY
- DISTINCT e LIKE
- INNER JOIN e LEFT JOIN
- GROUP BY e HAVING
- COUNT e SUM
- CASE WHEN
- COALESCE
- Subconsultas e NOT EXISTS
- Relacionamentos entre tabelas
- Consultas para conferir valores e identificar informações

## Dados cadastrados

Até o momento, o banco possui:
| Informação | Quantidade |
|---|---:|
| Pacientes | 20 |
| Profissionais | 15 |
| Atividades | 12 |
| Procedimentos | 14 |
| Convênios | 45 |
| Preços por convênio e procedimento | 649 |
| Atendimentos | 100 |
| Procedimentos vinculados | 180 |
| Categorias de despesas | 12 |
| Despesas | 14 |
| Faturamentos | 81 |
| Recebimentos | 81 |

## Resultados das consultas

Com os dados cadastrados, consegui consultar os valores de faturamento, recebimentos e despesas da clínica.

| Descrição | Valor |
|---|---:|
| Total faturado | R$ 24.671,02 |
| Total recebido | R$ 22.006,82 |
| Valor a receber | R$ 2.664,20 |
| Total de despesas | R$ 33.950,00 |
| Despesas pagas | R$ 7.270,00 |
| Despesas pendentes | R$ 26.680,00 |
Todos os dados utilizados são fictícios e foram criados para desenvolver o projeto e praticar SQL.

## Testes e validação

Após a criação das tabelas e inserção dos dados, foi realizado um teste em um novo banco de dados para verificar se os scripts funcionavam corretamente desde o início.
Também foram realizadas consultas utilizando `JOIN` para conferir os relacionamentos entre as tabelas, como:

- Pacientes e atendimentos;
- Atendimentos e faturamentos;
- Faturamentos e recebimentos;
- Profissionais e atividades.

As 13 tabelas foram verificadas e apresentaram as quantidades de registros esperadas.

## Aprendizado

Esse projeto tem me ajudado no dia a dia do trabalho e é uma forma de colocar em prática o que venho estudando sobre banco de dados.

Além de aprender a criar tabelas e fazer consultas, estou entendendo melhor como relacionar informações, trabalhar com regras de negócio e utilizar SQL para conferir dados e gerar informações que podem ajudar no acompanhamento de uma empresa.
