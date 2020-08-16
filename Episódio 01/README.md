## Episódio 01: O que é programação funcional? Funções, tipos e composição

Link do estudo: https://www.youtube.com/watch?v=4EzUtx-Q58I

### Estrutura do estudo:

#### Seção 1: Um pouco de história

* Alonzo Church e o seu Lambda Calculus (1936)
    * É a base das linguagens de programação funcionais
* Alan Turing e sua Máquina de Turing (1936)
    * É a base das linguagens de programação imperativas
* A Tese Church-Turing
* Amostra prática: codificando booleanos apenas com funções

#### Seção 2: O que caracteriza uma linguagem funcional?

* Não há um consenso absoluto
* Algumas características distintivas:
    * High-order functions
    * Funções puras e transparência referencial
    * Recursão
* Pontos positivos
    * Previsibilidade e exatidão
        * Testes
    * Algumas otimizações
    * Paralelismo
* Pontos negativos:
    * Overhead de conversão de modelos computacionais
        * Lisp Machines
        * Reduceron
        * Isso tem diminuído com a evolução do hardware e técnicas de otimização
    * Dificuldade em representar estado e I/O
        * Isso pode ser resolvido de diversas formas:
            - Abordagem mista (linguagens impuras, multiparadigma)
            - Mônadas
            - Effect systems

Seção 3: Funções, Tipos e Composição

* Desenvolver programas de forma funcional se resume a três pontos principais:
    * Funções
    * Tipos
    * Composição
* Funções
    * Funções como no sentido matemático
    * Funções de apenas um parâmetro (e currying)
    * Funções são comuns como input, output 
    * Composição de funções
    * Functions in the small, functions in the large
* Tipos
    * Em POO, tipos representam (ou tentam) objetos da vida real
    * Em FP, tipos representam conjuntos (também no sentido matemático)
        * Bool
        * Inteiro
        * Real
        * String
        * Set
        * Conjunto vazio
        * Conjunto unitário (singleton)
        * Funções
    * Tipos não possuem comportamento (são delegados para as funções)
    * Plot-twist: assinaturas de funções são tipos (e isso é importante)
    * Composição de tipos
        * Multiplicação de tipos
        * Soma de tipos         
* Reflexões sobre funções e tipos:
    * Descrevem comportamento
    * Não podem mentir
