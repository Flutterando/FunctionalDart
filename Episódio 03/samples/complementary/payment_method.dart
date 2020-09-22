abstract class PaymentMethod {
  const PaymentMethod();

  // Our custom `fold` implementation.

  // To implement a custom `fold` method, we need the following:
  // 1. For each type case (cash, cheque, credit card) we need
  //    a function.
  // 2. All functions must be required.
  // 3. We pass our types values as arguments to these functions.
  T fold<T>({
    required T Function() cash,
    required T Function(String chequeCode) cheque,
    required T Function(String cardNumber, DateTime validDue) creditCard,
  }) {
    final _this = this;

    if (_this is _Cash) {
      return cash();
    } else if (_this is Cheque) {
      return cheque(_this.chequeCode);
    } else {
      _this as CreditCard;
      return creditCard(
        _this.cardNumber,
        _this.validDue,
      );
    }
  }
}


// Our payment methods types have been borrowed from
// Function Dart 02. Check this episode for more
// details.
class _Cash extends PaymentMethod {
  const _Cash._();
}

const Cash = _Cash._();

class Cheque extends PaymentMethod {
  final String chequeCode;

  const Cheque._(this.chequeCode);
}

class CreditCard extends PaymentMethod {
  final String cardNumber;
  final DateTime validDue;

  CreditCard._({
    required this.cardNumber,
    required this.validDue,
  });
}
