// 2.1: High-order functions

// (Concept) High-order function: a function that either take or return
// function(s) as argument(s).

/// Add 1 to [a].
int add1(int a) => a + 1;

/// Halve [a].
///
/// This function uses [~/], so if the result would be a non-integer,
/// it will be floored.
int halve(int a) => a ~/ 2;

/// Apply [fn] to the integer 2.
int applyOn2(int Function(int) fn) => fn(2);

/// This is an clear example of High-order functions.
/// [applyOn2] is a function that requires another function as argument
/// with the specific signature int → int.
///
/// The received function [fn] will be applied on the integer 2.
void main() {
  // Applying [add1] with applyOn2, the evaluation happens like these steps:
  //
  // => applyOn2(add1)
  // => add1(2)
  // => 2 + 1
  // => 3
  print('applyOn2(add1): ${applyOn2(add1)}');

  // Applying [halve] with applyOn2, the evaluation happens like these steps:
  //
  // => applyOn2(halve)
  // => halve(2)
  // => 2 ~/ 2
  // => 1
  print('applyOn2(halve): ${applyOn2(halve)}');
}
