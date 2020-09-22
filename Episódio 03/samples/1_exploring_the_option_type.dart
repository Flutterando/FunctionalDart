import 'complementary/user.dart';

// 1: Exploring the Option type

// The Option type is a sum type that represents the possible ausence of value.
// In this sense, it's semantic is similar to the Null type.

// When we are dealing with Option however, we can't explicitly access the underlying value.

// Example:

// In this case, we are dealing with a nullable type (String?).
String getUserNameUnsafe() {
  final session = getSessionUnsafe();

  // In Dart current version (2.10), there's no guarantee that we
  // are checking for null or not. Thus, it's possible to simply
  // forget about this possibility, resulting in possible runtime errors.
  if (session != null) {
    return session.user.name;
  } else {
    return 'Visistante';
  }
}

// Although with null-safety the compiler does a rigorous flow analysis
// that guarantees null checking, when we are dealing with other sum types,
// like Either, there is no flow analysis.

// This is why `dartz` uses a exhaustive checking patter, as follows.

String getUserName() {
  // Here, our function returns Option<Session> instead of Session?.
  final session = getSession();

  // Instead of checking our possibilities with `if`, we use `fold` instead.
  // As `fold` is a function with required parameters, we have compile-time
  // guarantee that all our (two, in this case) options are checked.
  return session.fold(
    // First, the `None` case.
    () => 'Visitante',
    // Then, the `Some` case, with the value available as an argument to
    // the function we provide.
    (session) => session.user.name,
  );
}

// We will now explore a little better this exhaustive checking pattern.
