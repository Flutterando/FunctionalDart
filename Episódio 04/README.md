## Episódio 4: O poder da abstração, feat. Monoides

Link do estudo: https://www.youtube.com/watch?v=dwf2EfuT_9c

### Material adicional

A maior parte desse material foi adaptado de uma série de três artigos por Scott Wlaschin, no seu site.
Caso tenha interesse em se aprofundar sobre o assunto, os artigos delem são ainda mais detalhados e vão mais longe do que esse episódio.

Link: https://fsharpforfunandprofit.com/posts/monoids-without-tears/

### Estrutura do estudo:

#### Seção 1: O que são monoides?
* O termo monoide vem da álgebra abstrata
* Apesar do termo ser confuso, a ideia é muito simples
* Uma monoide é um conjunto M com um operador binário · com as seguintes propriedades:
    * Fechamento: M × M → M
        * M = elemento de um conjunto arbitrário
        * × = operação binária
    * Associatividade: a · (b · c) = (a · b) · c 
        * (Não é necessário ser comutativo)
    * Identidade: a · e = a = e · a
* Avaliação: quais desses casos são monóides?
    * Equidade: não é fechado (T → Bool)
    * String e concatenação: forma uma monoide ✔
    * Subtração de inteiros: não é associativo
    * Máximo de dois inteiros: forma uma monoide ✔
    * Adição de positivos: não possui identidade
    * Listas e concatenação: forma uma monoide ✔
* Prática: implementando monoides no Dart (bin/monoid.dart)

#### Seção 2: Checagem exaustiva
* As propriedades monóidicas nos permitem abstrair nosso código.
* Algumas ideias podem ser inferidas das propriedades na monoide:
    * Fechamento
        * Toda lista associada a uma monoide pode ser facilmente reduzida
    * Identidade
        * Fallback na redução de uma lista associada a uma monoide
        * Valor inicial caso necessário
    * Associatividade
        * Ordem de redução não importa
        * Incrementalismo
        * Divide and conquer
        * Paralelismo

#### [Seção 3: Contando palavras de um documento](bin/divide_and_conquer/algorithm.dart)
* Problema: contar palavras de um documento
* Faremos isso com base nos __whitespaces__ do texto
* Faremos uma monoide para nos ajudar a reduzir as partes do texto
* Homomorfismo
    * Homomorfismo é outra palavra difícil
        * Homo: ὁμός = mesmo
        * Morfé: μορφή = forma
        * Portanto, algo que tem a mesma forma
    * O homomorfismo, aliado à __chunkability__ de uma monoide nos permite utilizar a téquinica de __divide and conquer__ para otimizar nosso algoritmo!
