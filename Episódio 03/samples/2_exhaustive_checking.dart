import 'package:dartz/dartz.dart';

import 'complementary/payment_method.dart';
import 'complementary/user.dart';

// 2. Exhaustive checking

// Exhaustive checking is when we have, at compile-time, then
// guarantee that we are dealing with all possible options of
// our type.

// Example 1: Enums

// As we already saw, enums are a kind of sum type.

enum Rating {
  Excelent,
  Good,
  Regular,
  Bad,
  Terrible,
}

// Let's make our classic rating function, where we can rate
// a service based on our `Rating` enum.
Unit rate(Rating rating) {
  // Dart already provide exhaustive checking for enums when
  // using switch-case.

  switch (rating) {
    case Rating.Excelent:
    return unit;
    case Rating.Good:
    return unit;

    // If, for example, you remove the `default` case on
    // `switch`, the Dart linter is going to complain about
    // missing cases.
    default:
    return unit;
  }
}

// The problem is that Dart only do this kind of exhaustive
// checking with enums, and only with switch case. If, for
// example, you use if, Dart won't complain if you don't
// check for all cases.


// Example 2: Option and Either

// Both Option and Either can exaustively check for cases
// with the `fold` method.

// As we already saw in section 1, we pass to `fold` a function
// for each possible case of our type.
String getUserName(Option<User> maybeUser) => maybeUser.fold(
  // None case
  () => 'Visitante',
  // Some case
  (user) => user.name,
);

// Similarly, we can use `fold` on Either for Left and Right cases.
String notifyAction<T>(Either<Exception, T> action) => action.fold(
  // Left case
  (exception) => 'Error when executing action: ${exception}',
  // Right case
  (result) => 'The action result is: $result',
);

// Example 3: Custom sum types

// We can easily implement ou own `fold` method for our custom sum types.
// The process, however, is cumbersome and error-prone.

Unit payShoppingCart(PaymentMethod paymentMethod) =>
  // For sum types with more than two cases I prefer to use named parameters.
  // You can check the implementation of our custom `fold` in the file
  // `complementary/payment_method.dart`.
  paymentMethod.fold(
    cheque: (_) => unit,
    creditCard: (_, __) => unit,
    cash: () => unit,
  );

// Remember that you can always use some library to help with these things.
// For example, Freezed unions implement `when` for you, which is similar
// to `fold`.
