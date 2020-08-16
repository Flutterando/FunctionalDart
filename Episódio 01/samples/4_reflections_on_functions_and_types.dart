import 'package:dartz/dartz.dart';

// 4. Reflection on types and functions

// Types and functions, together, should describe the behavior of your program
// precisely. This doesn't always happens when dealing with non-functional
// approaches.
//
// For example, let's see the tentative of making a function that must divide
// and integer and return its result and rest.

// The following function is a lie, as it doesn't correctly represent the
// intended behavior of our program.
//
// Turns out that, if we try to pass 0 as our divisor, an
// [IntegerDivisionByZeroException] will be thrown. However, our function states
// that it WILL return a tuple of (int, int). It is, thus, a lie.

Tuple2<int, int> divide(
  int dividendo,
  int divisor,
) =>
    tuple2(
      dividendo ~/ divisor,
      dividendo % divisor,
    );

// By using more specific typing, we can correctly represent our desired
// behavior. The following function states that, it will return either an
// IntegerDivisionByZeroException or our expected result, a tuple of (int, int).
//
// Thus, the following function correctly tells the program what is going to
// happen. This makes the program more previsible and truthful.
Either<IntegerDivisionByZeroException, Tuple2<int, int>> trulyDivide(
  int dividendo,
  int divisor,
) =>
    divisor == 0
        ? Left(const IntegerDivisionByZeroException())
        : Right(
            tuple2(
              dividendo ~/ divisor,
              dividendo % divisor,
            ),
          );
