import 'package:dartz/dartz.dart';

/// An string that represents a valid e-mail.
///
/// Create by using [createEmail] and you will have guaranteed at both
/// compile-time and runtime that every instance of [EmailString] has a string
/// that represents a valid e-mail.
class EmailString {
  final String email;

  EmailString._(this.email);
}

/// Creates a new [EmailString].
///
/// If the provided [email] is not a valid string for an e-mail, [None] is
/// returned.
Option<EmailString> createEmail(String email) =>
    email.isEmpty || !_validEmail(email)
        ? const None()
        : Some(EmailString._(email));

final _validEmail = RegExp(_emailRegex).hasMatch;

/// A email Regex that is supposed to match 99.9% of all email addresses in
/// actual use today.
///
/// Note that there's no perfect e-mail validation thorugh Regex. Also, RFC 5322
/// is a little bit overwhelming for this case, as it's way bigger and will
/// include things like IP addresses.
const _emailRegex =
    r"^[a-z0-9!#$%&'*+/=?^_‘{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_‘{|}~-]+)*@"
    r'(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$';
