import 'package:dartz/dartz.dart';

import 'email_string.dart';
import 'verification_code.dart';

/// A possible [Email] for an [User].
abstract class Email {}

/// An unverified email.
class UnverifiedEmail implements Email {
  final EmailString email;

  const UnverifiedEmail._(this.email);
}

/// A verified email.
class VerifiedEmail implements Email {
  final EmailString email;
  final VerificationCode verificationCode;

  const VerifiedEmail._({
    required this.email,
    required this.verificationCode,
  });
}

/// Send a verification code for the providede [unverifiedEmail].
///
/// Note that by using [UnverifiedEmail] as type we are constraining our system
/// to be semantically correct and preventing verification codes to be sent to
/// verified e-mails.
Unit sendVerificationCode(UnverifiedEmail unverifiedEmail) {
  // MailService.send(...)

  return unit;
}

/// Verify if the provided [unverifiedEmai] matches with the passed
/// [verificationCode].
///
/// If there's a match, a [VerifiedEmail] is returned with its
/// [VerificationCode] to be used on our domain.
VerifiedEmail verifyEmail(
  UnverifiedEmail unverifiedEmail,
  VerificationCode verificationCode,
) {
  // Check if the verification code is valid...

  return VerifiedEmail._(
    email: unverifiedEmail.email,
    verificationCode: verificationCode,
  );
}

/// Send a password reset e-mail to a [verifiedEmail].
///
/// Note, again, that we are constrained in our type system to be semantically
/// correct and only send password reset e-mails to verified e-mails.
Unit sendPasswordReset(VerifiedEmail verifiedEmail) {
  // MailService.send(...)

  return unit;
}
