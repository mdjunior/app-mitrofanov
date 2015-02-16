# app-mitrofanov
Implementation of the Extended Rank Order Clustering Algorithm (ROC Extended) algorithm using Perl

Background
----------

This is an implementation of the algorithm proposed by [King, JR Nakornchai](http://dx.doi.org/10.1016/0360-8352(90)90055-Q), called Extended Rank Order Clustering Algorithm (ROC Extended) using Perl.

This implementation was made in 2012 for use in ENGATTI project at [UFRJ](http://www.ufrj.br), for analysis of large data volumes from INCA (National Cancer Hospital in Brazil).

Use
---

To use the program, install its dependencies:

    cpan Data::Table

Run

    ./mitrofanov.pl -i inputfile.csv

Run verbose (show more information about the data processing)

    ./mitrofanov.pl -i inputfile.csv --verbose

Run (force header detection)

    ./mitrofanov.pl -i inputfile.csv --has_header


Previous results
----------------

###### Engineering methods (translated to english)

"The first edition group during the step of preparation of flow charts to identify bottlenecks, raised an extremely important information through an analysis times. The that the initial examination of patients, now the average time of two months, could take two days, only with a drastic reduction in waiting times."

###### Engenharia de Métodos (original version in portuguese)

"O grupo da primeira edição, durante a etapa de elaboração dos fluxogramas para identificação dos gargalos, levantou uma informação extremamente importante, através de uma análise de tempos. A de que os exames iniciais dos pacientes, hoje com o tempo médio de 2 meses, poderia levar dois dias, apenas com uma redução drástica nos tempos de espera."


References
----------

[ENGATTI – ENGENHEIROS EM GRUPO AUTÔNOMO PARA TRANSFORMAR, TROCAR E INTEGRAR](http://monografias.poli.ufrj.br/monografias/monopoli10011162.pdf) (in portuguese)
[Sistema de Tecnologia de Grupo: Um Estudo de Caso Através de Análise do Fluxo da Produção](http://www.scielo.br/pdf/prod/v9n1/v9n1a07) (in portuguese)
[Machine-component group analysis versus the similarity coefficient method in cellular manufacturing applications](http://dx.doi.org/10.1016/0360-8352(90)90055-Q)
