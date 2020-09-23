## Episódio 3: Functor: os contêineres mágicos funcionais

Link do estudo: https://www.youtube.com/watch?v=i3yHzxT_Oj8

### Estrutura do estudo:

#### [Seção 1: Explorando o Option](samples/1_exploring_the_option_type.dart)
* Como vimos no último estudo, o Option é um sum type que representa a possibilidade de ausência de um valor.
* Desta forma, ele tem uma semântica parecida com a do `Null`.
* Vamos ver um caso de uso:
    * Dentro da nossa aplicação, queremos imprimir o nome do usuário da sessão ativa.
    * Podemos usar a função `getSession()`, que retorna um `Option<Session>`.
    * Problema: acessar o valor “interno” do Option.
    * O Option “esconde” o valor interno por segurança.
    * Principal solução: checagem exaustiva

#### [Seção 2: Checagem exaustiva](samples/2_exhaustive_checking.dart)
* Checagem exaustiva é uma característica dos sum types em linguagens funcionais.
* Checagem exaustiva é quando somos forçados em tempo de compilação a chegar todos as possibilidades de um sum type.
* Exemplo: Enum
    * Enums, do Dart, possuem checagem exaustiva quando usados em um `switch-case`.
    * Para os casos de `if`, no entanto, não.
* Exemplo: Option e Either
    * O dartz disponibiliza checagem exaustiva de seus sum types através do método `fold`.
* Exemplo: custom sum types
    * Podemos, sem dificuldade, implementar um `fold` para os nossos sum types.
    * Apesar de ser um processo fácil, é chato e pode tender a erros.
        * Por exemplo, você pode alterar o sum type e esquecer de atualizar o método.
    * Lembre-se sempre que você pode usar bibliotecas que te auxiliem na criação de sum types. Por exemplo, os unions do [Freezed](https://pub.dev/packages/freezed) possuem o método `when`.

#### Seção 3: Functors
* [O problema do `fold`](samples/3.1_the_fold_problem.dart)
    * Vamos implementar uma função que obtém a quantidade de nomes do usuário.
    * Podemos usar `fold`, como vimos antes, mas o resultado fica complexo e confuso.
    * Como solução, vamos usar outra função que existe no Option: `map`.
* [Functors](samples/3.2_functor_definition.dart)
    * Em Teoria das Categorias, um functor, é um mapeamento entre categorias.
        * Destaque no termo “mapeamento”.
    * Na prática, functors possuem dois conceitos principais:
        * Eles são como contêineres.
        * Eles possuem uma função de mapeamento.
    * Mapeamento:
        * Dado um functor `F` sobre um tipo `a` (`F a`) e uma função `a → b`, retorna o mesmo functor sobre o tipo `b` (`F b`).
    * Exemplo 1: o functor mais simples (Id)
    * Exemplo 2: o functor Option.
    * Exemplo 3: o functor Either.
    * Exemplo 4: functors na stdlib.

### Material adicional

* [Proof by exhaustion](https://en.wikipedia.org/wiki/Proof_by_exhaustion): o fundamento por trás do exhaustive checking.
* [Functors (Overview)](https://en.wikipedia.org/wiki/Functor_(functional_programming))
* [Functors (Teoria da Categoria)](https://bartoszmilewski.com/2015/01/20/functors/)
