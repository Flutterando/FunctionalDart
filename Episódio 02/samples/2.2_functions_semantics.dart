// 2.2: Functions semantics

// Functions, in functional programming, are like in math. They TAKE an value of
// its DOMAIN and RETURN another value of its CODOMAIN.

// Thus, the semantics of functions are like a "transformer machine".

// Example: Let's have a definition of a fruits type.

enum Fruit {
  Banana,
  Strawberry,
  Kiwi,
  Peach,
  Lemon,
}

// Our MagicFruitTransformer type has the semantics like it's a machine that
// takes one fruit and transforms into another fruit.
typedef MagicFruitTransformer = Fruit Function(Fruit);

// A bananizer is a MagicFruitTransformer.
MagicFruitTransformer bananizer = (Fruit fruit) => Fruit.Banana;

// One common mistake is to make a function that doesn't correcly represent
// the transforming semantics of your domain. Take, as an example, the first
// example of the divide function on the first episode, section 4:
// https://github.com/Flutterando/FunctionalDart/blob/master/Episódio%2001/samples/4_reflections_on_functions_and_types.dart
