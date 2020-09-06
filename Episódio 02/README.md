## Episódio 02: Tipos e semântica: modelando um domínio funcional

Link do estudo: https://www.youtube.com/watch?v=2Tf_kkF4Y-o

### Estrutura do estudo:

#### Seção 1: O que é semântica?
* Semântica é um ramo da linguística “que se dedica ao estudo do significado das palavras e da interpretação das frases ou dos enunciados.”
* Em uma palavra: significado.
* O seu código tem que ter um significado:
    * Este significado deve estar intrinsicamente relacionado com o seu domínio.
    * No contexto funcional, tudo é modelado com tipos, funções e a composição entre eles.
        * Desta forma, estes elementos devem revelar o significado por trás do domínio.

#### Seção 2: A semântica da composição dos tipos
*  A semântica do tipo
    * Conjunto de coisas
    * Cada tipo deve ter uma semântica definida
        * Exemplo: unidades de medida
        * Exemplo:  operações não desejadas nos dados
* A semântica de uma função
    * Ação transformadora
    * Pega um valor que habite o conjunto domínio e transforma em um valor do conjunto contradomínio
* A semântica dos product types
    * A multiplicação de tipos tem o significado de um AND lógico
        * Exemplo: uma pessoa pode ser descrita como um nome *e* sua idade
        * Exemplo: a divisão de um inteiro deve resultar em um resultado *e* um resto
* A semântica dos sum types
    * A soma de tipos tem o significado de um OR lógico
        * Exemplo: Rating de um serviço
        * Exemplo: Raíz quadrada “segura”
    * Null e o problema semântico
        * Na versão atual do Dart, todo tipo `T` é um _sum type_ com `Null`.
        * Na feature _null-safety_ que estão implementando no Dart, este problema é mitigado.
        * `Either<Unit, T>` é uma alternativa ao `T?`.
        * `Option<T>` é isomórfico a `Either<Unit, T>`, com uma semântica mais clara de ausência de valor.

#### Seção 3: Ampliando os significados: compondo os nossos tipos manualmente
* Distinção entre tuplas e records
* Fazendo nossas próprias disjunções com subclasses
    * Classes devem possuir sua semântica
    * Tipos são imutáveis
    * Não possuem comportamento
    * Equidade com base em valor
    * Exemplo: Rating de um serviço
* Por que usar Tuple e Either se podemos fazer nossos próprios

#### Seção 4: Evitando os estados inválidos com o nossos sistema de tipos
* Vamos escrever aqui um domínio pequeno com o conhecimento que adquirimos até agora
* Algumas perguntas a se fazer acerca do domínio:
    * Quais dados são opcionais?
    * Quais limitações os modelos de dados devem ter?
    * Quais dados estão relacionados?
    * Quais regras governam os dados?
* Especificações no código.

