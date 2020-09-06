import 'package:dartz/dartz.dart';

/// An e-mail verification code.
///
/// Create by using [createVerificationCode] and you will have guaranteed at
/// both compile-time and runtime that every instance of [VerificationCode] has
/// a string that can be a verification code.
class VerificationCode {
  final String code;

  VerificationCode._(this.code);
}

/// Checks if the provided [String] is in hexadecimal format.
final isHexadecimal = RegExp(r'^[0-9a-fA-F]+$').hasMatch;

/// Creates a new [VerificationCode].
///
/// If the provided [code] is not a valid a possible verification code, [None]
/// is returned.
Option<VerificationCode> createVerificationCode(String code) =>
    code.length == 40 && isHexadecimal(code)
        ? Some(VerificationCode._(code))
        : None();
