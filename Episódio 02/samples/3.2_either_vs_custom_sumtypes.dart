import 'package:dartz/dartz.dart';

// 3.2: Enum vs Either vs Custom Sumtypes

// Just as with product types may be represented in more than one way, the same
// goes for product types.

// The simplest way to make a sum type is with an enum. An enum however, is a
// uncomposable sumtype, and can't carry any data besides itself.

enum Rating {
  Excelent,
  Good,
  Regular,
  Bad,
  Terrible,
}

// I recommend you to only use enums when the options you are dealing with
// doesn't need any additional data associated with it, like the example above.
// For all othere cases, I recommend to use Either or a custom sum type.

// We already saw that we can use Either to make composable sumtypes.

// For example, an Either<String, String> could be used to represent an function
// that may return the description of the event or the name if the description
// is not available.

final event = tuple3(
  'Flutter LATAM Conf 2º Edição 2020',
  DateTime(2020, 9, 10),
  'O maior evento de Flutter da América Latina.',
);

Either<String, String> getDescriptionOrName(
  Tuple3<String, DateTime, String?> event,
) =>
    Right(event.value3) ?? Left(event.value1);

// The problem with Either is that, like tuple, it often is not semantic like
// enum is, and many times it won't have a well defined enough semantig for the
// purposes of our domain. The usage of Either in the example above is
// reasonable, but when your type needs both semantic and composability you will
// want to make your custom sumtypes.

abstract class Document {}

class RG implements Document {
  final String number;

  RG._(this.number);
}

class CPF implements Document {
  final String number;

  CPF._(this.number);
}

class CNH implements Document {
  final String registerNumber;
  final DateTime issuedOn;

  CNH._({
    required this.registerNumber,
    required this.issuedOn,
  });
}

// Finally, the issue with custom sum types is that they usually has a lot of
// boilerplate. For example, usually you will want to have a copyWith function,
// as sum types are imutable, or a matching function so you can safely check
// for values. Implementing these functions everytime you want a custom sum type
// may be burdensome.

// There are packages that help you making sum types easily with generators.
// For instance:
// - Freezed (refer to Union/Sealed classes): https://pub.dev/packages/freezed
// - Super Enum: https://pub.dev/packages/super_enum
