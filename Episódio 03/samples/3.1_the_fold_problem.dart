import 'package:dartz/dartz.dart';

import 'complementary/user.dart';

// 3.1: The fold problem

// Let's make a function that returns the name count of the logged user

// For example, if the user name is:
// - Jacob Moura, it returns 2
// - Mateus Felipe Cordeiro Caetano Pinto, it returns 5
// and so on...

// Let define some helper funtions

/// Extracts the name of the [session]'s user.
String getUserName(Session session) => session.user.name;

/// Splits a [string] into its words.
List<String> words(String string) => string.split(' ');

// This is our main function. Note that it retuns an option, as
// maybe there's no active session.
Option<int> getUserNameCount() {
  // First we get (or not) our session.
  final session = getSession();

  // Now we are using `fold` for exhaustive checking.
  return session.fold(
    // Here come the first problem. We are checking for the
    // None case simply to return None. Its redundant.
    () => const None(),
    // The second problem is that, by using all the functions
    // in the same place, it can became rather confusing.
    // Obviously, there are some workarounds to this, but
    // by using the functor property, we can do better.
    (session) => Some(words(getUserName(session)).length),
  );
}
