import 'package:dartz/dartz.dart';

abstract class PaymentMethod {}

/// Payment with cash.
///
/// Note that, as [_Cash] is a singleton type by itself, it carries no
/// additional info. Thus, we want all instances of [_Cash] to be the same. This
/// is why, instead of instantiating a [_Cash] everytime you want to use it, you
/// use the [Cash] const instead.
///
/// Both the class and constructor are private so they won't be referred outside
/// this file, forcing the user of the API to use the [Cash] constant.
class _Cash implements PaymentMethod {
  const _Cash._();
}

/// The only value for a cash payment.
const Cash = _Cash._();

/// Payment with cheque.
///
/// Here we are using [chequeCode] as [String] for sake of simplicity, but you
/// would probably wnat to constraint it as we are doing with other types.
class Cheque implements PaymentMethod {
  final String chequeCode;

  const Cheque._(this.chequeCode);
}

/// Creates a new [Cheque].
///
/// We would usually want to constrain our type here, but we are not doing this
/// for the sake of simplicity.
Option<Cheque> createCheque(String chequeCode) => Some(Cheque._(chequeCode));

/// Payment with credit card.
///
/// Create one with the [createCreditCard] function.
class CreditCard implements PaymentMethod {
  final CreditCardNumber cardNumber;
  final DateTime validDue;

  CreditCard._({
    required this.cardNumber,
    required this.validDue,
  });
}

/// Creates a new [CreditCard].
///
/// If the provided [validDue] is already expired, [None] is returned. Note,
/// however, that we have no need to check against [cardNumber], as the type
/// [CreditCardNumber] already guarantees us that it is a valid card number.
Option<CreditCard> createCreditCard({
  required CreditCardNumber cardNumber,
  required DateTime validDue,
}) =>
    validDue.isAfter(DateTime.now())
        ? Some(CreditCard._(
            cardNumber: cardNumber,
            validDue: validDue,
          ))
        : const None();

class CreditCardNumber {
  final String number;

  const CreditCardNumber._(this.number);
}

/// Creates a new [CreditCardNumber].
///
/// If the provided [number] is not a valid string for credit card number,
/// [None] is returned.
Option<CreditCardNumber> createCreditCardNumber(String number) {
  final cleanNumber = number.replaceAll(r'\D', '');

  return cleanNumber.length == 16 && isValidLuhnNumber(cleanNumber)
      ? Some(CreditCardNumber._(number))
      : const None();
}

/// Checks if the given [number] is a valid Luhn number.
///
/// In our case here, we are providing a stub value for the sake of simplicity.
bool isValidLuhnNumber(String number) => true;
