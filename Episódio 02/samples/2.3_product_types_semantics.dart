import 'package:dartz/dartz.dart';

// 2.3 Product types semantics

// Product types are the MULTIPLICATION of types.
// The semantics of a product type is of an AND.

// Thus, when a model on your domain have joined properties, a product type is
// a good choice to model it.

// Example 1: A person may be described as a name AND age.
const mateus = Tuple2('Mateus Felipe', 23);

// Example 2: Dividing an integer will result in a result AND a rest.
Tuple2<int, int> divide(
  int dividend,
  int divisor,
) =>
    tuple2(
      dividend ~/ divisor,
      dividend % divisor,
    );
