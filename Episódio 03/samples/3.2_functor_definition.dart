import 'package:dartz/dartz.dart';

import '3.1_the_fold_problem.dart';
import 'complementary/user.dart';

// 3.2: Functor definition

// In Category Theory, Functor is a mapping between categories.
// Attention to the word "mapping".

// In practice, a Functor has two main concepts.
// 1. It is like a container.
// 2. It has a mapping functions.

// The functor mapping function:
// Given a functor F a and a function a → b
// The result is F b

// Example 1: The simplest functor (Id)

// The simplest possible functor, the Id functor,
// is simply a value "wrapper".

// As we are dealing with containers, we use T
// as generic type parameter.
class Id<T> {
  // Here is our wrapped value.
  final T value;

  const Id(this.value);

  // Finally, our `map` function, the only
  // method of a functor.

  // When dealing with a functor `map` function
  // we will always receive a function as parameter.
  // This function will receive our wrapped value
  // as it's parameter, and return an arbitrary value,
  // in this case of type U.
  Id<U> map<U>(U Function(T) fn) {
    // Here, we apply fn to our unwrapped value.
    final newValue = fn(value);

    // Finally, we rewrap our value and return
    // our Id functor.
    return Id(newValue);
  }
}

// By generalizing our functor, we can pass
// the following functions to our `map` function

int somaDez(int a) => a + 10;

int double(int a) => a * 2;

int minusFive(int a) => a - 5;

void idFunctor() {
  // By defining our wrapped value in our
  // Id functor, we will be able to use
  // our `map` function.
  final num1 = Id(10);

  // Now we can chain the functions.
  num1.map(somaDez)
      .map(double)
      .map(double)
      .map(minusFive);

  // The result will be Id(75)
}

// Example 2: The Option functor

// Our option is also a functor. Being so,
// it has an `map` function. In Option,
// the `map` function will act on the
// case when the value is present (Some).
// Thus, our previous example could be
// simplified.

Option<int> getUserNameCount() {
  // First we get (or not) our session.
  final session = getSession();

  /// Counts the length of a [list].
  ///
  /// It's just a wrap around `.length`.
  int len<T>(List<T> list) => list.length;

  // By using the functoriality of Option
  // we can simply map the wrapped value.

  // If the session is None, nothing
  // will happen. If it is Some, the
  // function will be applied.
  return session.map(getUserName)
                .map(words)
                .map(len);
}

// Example 3: The Either functor

// Like Option, Either is also a functor.
// It is right-biased. This means that the
// function `map`ped will be applied to
// Right, and not to the Left
void eitherFunctor() {
  final Either<Exception, int> result = Right(10);

  // For example, here, if the result value
  // would be a Left (exception), nothing
  // would happen. As it is a Right, the
  // function `somaDez` will be applied
  // to 10.
  result.map(somaDez);

  // The result of the expression is,
  // thus, Right(20).
}

// Example 4: Stdlib Dart

// There are some cases of functoriality on
// the Dart stdlib.

void stdlibFunctors() {
  // Although List doesn't implement dartz Functor
  // interface, it is like a container and has
  // a map function.
  final list = [1, 2, 3, 4, 5, 6];
  list.map(double);

  // Other example is the Future type, that
  // represents a future computation. By
  // using the `then` function, which maps
  // the internal value, if it exists.
  final myFuture = Future.value(10);
  myFuture.then(double);
}
