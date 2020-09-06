import 'dart:math';

import 'package:dartz/dartz.dart';

// 2.4.1: Sum types semantics

// Sum types are the SUM of types.
// The semantics of a sum type is of an OR.

// Thus, when a model on your domain is represented as different possibilities,
// a sum type is a good choice to model it.

// Example 1: rating the service provided by your application may be
// represented as a sum type of the possible ratings.
enum Rating {
  Excelent,
  Good,
  Regular,
  Bad,
  Terrible,
}

// As seem above, Dart enums are a kind of sum types. However, they are
// UNCOMPOSABLE with other types.

// Example 2: error handling

// Let's make a function that returns the square root of an number. By
// definition, you can't have an root of a negative or infinite number, much
// less a not-number (NaN). Thus, our function may return the square root of the
// given input OR an ArgumentError if the input is invalid.

// As we are using Either here, our result is composable with ArgumentError and
// double.
Either<ArgumentError, double> raiz(num x) =>
    x.isNaN || x.isInfinite || x.isNegative
        ? Left(ArgumentError())
        : Right(sqrt(x));
