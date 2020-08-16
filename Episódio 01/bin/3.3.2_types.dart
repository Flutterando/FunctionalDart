import 'dart:math';

import 'package:dartz/dartz.dart';

// 3.3.2: Types in Functional Programming

// In Functional Programming languages, a type represents a set (in the
// mathematical sense) of it's inhabited values. Differently from OOP, types
// in this sense does not carry any behavior.

// Additional references:
// - Overview: https://en.wikipedia.org/wiki/Set_(mathematics)

// Here are some examples:

// bool: The bool type represents a set with only two inhabited values (𝔹).
// Example: {0, 1} or {False, True}
const True = true;
const False = false;

// int: The int type represents a set with all possible integers (ℤ).
// {-∞, …, -3, -2, -1, 0, 1, 2, 3, …, ∞}
const inteiro = (1 << 63) - 1;

// double: the double type represents a set with all possible real numbers (ℝ).
// Example: {-∞, …, -1.5, …, 1.012401506234890412, …, -1, …, 0.7, …, √2 , …, π, …, ∞}
const raizDeDois = sqrt2;

// String: the String type represents a set with all possible strings.
// {'', 'a', 'b', …, 'ba', …, 'Lorem ipsum', …, conteúdo de um livro, …, texto infinito }
const texto = 'Lorem ipsum dolor sit amet';

// Set: the Set type is parametrized by a type parameter T, and represents the
// powerset of T, which is, a set with all the subsets of the set that T
// represents.
//
// Example: Set<bool> = 𝒫(bool) = {{}, {true}, {false}, {true, false}}
const boolSet = {true, false};

// The empty set ({}) has no inhabited values. This means that it is impossible
// to provide a value of this type. In Dart, this is represent by the type
// Never.

// In this example, never will never have any value, as an exception is being
// thrown.
final never = throw const Object();

// Similarly, it's impossible to call the following function, absurd.
void absurd(Never never) {
  print('This will never happen!');
}

// The singleton set, or the set 1, have is inhabited by a single value. This
// means this value carries no information.

// In Dart, the Null type is a singleton type, as it has a single value,
// given by the [null] keyword. The semantics of null are a little different,
// although, as it is embedded as a sumtype of all types in Dart, until the
// null-safety feature.
const Null nullSingleton = null;

// Similarly, the void function should be a singleton type. However, it has a
// lot of inconsistencies.
void voidSingleton = 'a';

// Finally, dartz provide a consistent and precise singleton type, Unit. It has
// a single possible value, the constant [unit].
Unit unitSingleton = unit;

// Functions are also types. The following type IntMapper, for example,
// represents a set of all possible functions that takes an integer and returns
// another integer (int -> int).
//
// [double] and [halve] are examples of values for IntMapper.
typedef IntMapper = int Function(int);

int double(int a) => a * 2;
int halve(int a) => a ~/ 2;
