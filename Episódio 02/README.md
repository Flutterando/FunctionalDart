## Episódio 02: Tipos e semântica: modelando um domínio funcional

Link do estudo: https://www.youtube.com/watch?v=2Tf_kkF4Y-o

### Material adicional
* [Dart e semântica](https://medium.com/flutterando/semantica-6245d550c14b)
* [Dart e null-safety: uma alternativa funcional](https://medium.com/flutterando/dart-e-nnbd-9810aae37de7)
* [Making Invalid State Unrepresentable](https://hugotunius.se/2020/05/16/making-invalid-state-unrepresentable.html)
* [Domain Modeling Made Functional](https://fsharpforfunandprofit.com/ddd/)

### Estrutura do estudo:

#### Seção 1: O que é semântica?
* Semântica é um ramo da linguística “que se dedica ao estudo do significado das palavras e da interpretação das frases ou dos enunciados.”
* Em uma palavra: significado.
* O seu código tem que ter um significado:
    * Este significado deve estar intrinsicamente relacionado com o seu domínio.
    * No contexto funcional, tudo é modelado com tipos, funções e a composição entre eles.
        * Desta forma, estes elementos devem revelar o significado por trás do domínio.

#### Seção 2: A semântica da composição dos tipos
*  [A semântica do tipo](samples/2.1_types_semantics.dart)
    * Conjunto de coisas
    * Cada tipo deve ter uma semântica definida
        * Exemplo: unidades de medida
        * Exemplo:  operações não desejadas nos dados
* [A semântica de uma função](samples/2.2_functions_semantics.dart)
    * Ação transformadora
    * Pega um valor que habite o conjunto domínio e transforma em um valor do conjunto contradomínio
* [A semântica dos product types](samples/2.3_product_types_semantics.dart)
    * A multiplicação de tipos tem o significado de um AND lógico
        * Exemplo: uma pessoa pode ser descrita como um nome *e* sua idade
        * Exemplo: a divisão de um inteiro deve resultar em um resultado *e* um resto
* [A semântica dos sum types](samples/2.4.1_sum_types_semantics.dart)
    * A soma de tipos tem o significado de um OR lógico
        * Exemplo: Rating de um serviço
        * Exemplo: Raíz quadrada “segura”
    * [Null e o problema semântico](samples/2.4.2_the_null_problem.dart)
        * Na versão atual do Dart, todo tipo `T` é um _sum type_ com `Null`.
        * Na feature _null-safety_ que estão implementando no Dart, este problema é mitigado.
        * `Either<Unit, T>` é uma alternativa ao `T?`.
        * `Option<T>` é isomórfico a `Either<Unit, T>`, com uma semântica mais clara de ausência de valor.

#### Seção 3: Ampliando os significados: compondo os nossos tipos manualmente
* [Distinção entre tuplas e records](samples/3.1_tuples_vs_records.dart)
* [Fazendo nossas próprias disjunções com subclasses](samples/3.2_either_vs_custom_sumtypes.dart)
    * Classes devem possuir sua semântica
    * Tipos são imutáveis
    * Não possuem comportamento
    * Equidade com base em valor
    * Exemplo: Rating de um serviço

#### Seção 4: Evitando os estados inválidos com o nossos sistema de tipos
* Vamos escrever aqui um domínio pequeno com o conhecimento que adquirimos até agora
* Algumas perguntas a se fazer acerca do domínio:
    * Quais dados são opcionais?
    * Quais limitações os modelos de dados devem ter?
    * Quais dados estão relacionados?
    * Quais regras governam os dados?
* [Especificações do domínio](lib/specifications.dart)
* [Implementação do domínio](lib/entities)

