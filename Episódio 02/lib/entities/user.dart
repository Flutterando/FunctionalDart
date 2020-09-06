import 'package:dartz/dartz.dart';

import 'email/email.dart';

/// A user on our system.
class User {
  final Username name;
  final Email email;
  final Birthday birthday;

  const User({
    required this.name,
    required this.email,
    required this.birthday,
  });
}

/// A string that is a valid name in our domain.
///
/// Create one with the [createUsername] function.
class Username {
  final String name;

  Username._(this.name);
}

/// Creates a new [Username].
///
/// If the name has more than 700 characters, [None] is returned.
Option<Username> createUsername(String name) =>
    name.length > 700 ? None() : Some(Username._(name));

/// An user birthday.
///
/// Create one with the [createBirthday] function.
class Birthday {
  final DateTime birthday;

  Birthday._(this.birthday);
}

/// Creates a new [Birthday].
///
/// If the provided [birthday] indicates that the user may not be 18 yet, [None]
/// is returned.
Option<Birthday> createBirthday(DateTime birthday) =>
    DateTime.now().difference(birthday).inDays > 365 * 18
        ? Some(Birthday._(birthday))
        : None();
