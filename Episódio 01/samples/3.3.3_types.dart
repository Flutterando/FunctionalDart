import 'package:dartz/dartz.dart';

// 3.3.3: Types composition

// In functional programming, types are composable. As they are like
// mathematical sets, they are subject to multiplication (cartesian product)
// and sum (disjoint union).
//
// For this reason, these types are called Algebraic Data Types, and enables
// another level of type expressivity.

// Additional references:
// - (Recommended, article) The algebra (and calculus!) of algebraic data types: https://codewords.recurse.com/issues/three/algebra-and-calculus-of-algebraic-data-types
// - Cartesian product (product types): https://en.wikipedia.org/wiki/Cartesian_product
// - Disjoint union (sum types): https://en.wikipedia.org/wiki/Disjoint_union

// Multiplying types
//
// For product types we are going to use the type Tuple, from dartz. There's
// Tuple2 to Tuple20, where TupleN represents the product of N types.

// Bool = 2 (true or false)
bool m1() {
  const possibilities = [false, true];

  return possibilities.first;
}

// Bool × Bool = 2 × 2 = 4
Tuple2<bool, bool> m2() {
  const possibilities = [
    Tuple2(true, true),
    Tuple2(true, false),
    Tuple2(false, true),
    Tuple2(false, false),
  ];

  return possibilities.first;
}

// Bool ×  Bool ×  Bool = 2 ×  2 ×  2 = 8
Tuple3<bool, bool, bool> m3() {
  const possibilities = [
    Tuple3(true, true, true),
    Tuple3(true, true, false),
    Tuple3(true, false, true),
    Tuple3(true, false, false),
    Tuple3(false, true, true),
    Tuple3(false, true, false),
    Tuple3(false, false, true),
    Tuple3(false, false, false),
  ];

  return possibilities.first;
}

// Bool ×  Unit = 2 ×  1 = 2
Tuple2<bool, Unit> m4() {
  const possibilities = [
    Tuple2(true, unit),
    Tuple2(false, unit),
  ];

  return possibilities.first;
}

// Bool ×  Unit ×  Never = 2 ×  1 ×  0 = 0
Tuple3<bool, Unit, Never> m5() {
  const possibilities = <Tuple3<bool, Unit, Never>>[];

  return possibilities.first;
}

// Summing types
//
// For sum types we are going to use the type Either, from dartz.
// It represents the sum of two types.

// Bool = 2 (true ou false)
bool s1() {
  const possibilities = [false, true];

  return possibilities.first;
}

// Bool + Bool = 2 + 2 = 4
Either<bool, bool> s2() {
  const possibilities = <Either<bool, bool>>[
    Left(true),
    Left(false),
    Right(true),
    Right(false),
  ];

  return possibilities.first;
}

// Unit + Unit = 1 + 1 = 2
Either<Unit, Unit> s3() {
  const possibilities = <Either<Unit, Unit>>[
    Left(unit),
    Right(unit),
  ];

  return possibilities.first;
}

// Unit + Bool = 1 + 2 = 3
Either<Unit, bool> s4() {
  const possibilities = <Either<Unit, bool>>[
    Left(unit),
    Right(true),
    Right(false),
  ];

  return possibilities.first;
}

// Bool + Never = 2 + 0 = 2
Either<bool, Never> s5() {
  const possibilities = <Either<bool, Never>>[
    Left(true),
    Left(false),
  ];

  return possibilities.first;
}
