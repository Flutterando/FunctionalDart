import 'package:dartz/dartz.dart';

// 3.1: Tuples vs Records

// We've already seen that a product type has a AND semantic, but we only used
// tuple as example. It turns out, that sometimes tuple is not semantic enough.

// Example: let's assume that our system represents a person as the combination
// of three properties: name, birthday, and document.

final person = tuple3(
  'Mateus Felipe',
  DateTime(1997, 01, 24),
  '851.882.880-52',
);

// Similarly, an event is represented as the combination of a event name, the
// date that it will happen and a description.

final evento = tuple3(
  'Latan 2020 2',
  DateTime(2020, 10, 09),
  'O maior evento de Flutter da América Latina',
);

// Note, however, that within the context of our domain, a person and an event
// are different entities. Tuple3<String, DateTime, String> are, however, the
// same type.

// Not only this, if we use tuple for handling this kind of case we must always
// know the order of each type within the tuple.

// This is why we can use records. Records are another type of product type
// where we use labeled fields instead of indexed fields. It's like a sealed
// class with immutability and no behavior.

// In Dart, we can make records with classes, as long as all the fields are
// final, the class has no behavior and can't be extended.

// For example, we could better and more semantically represent our person model
// with the following record:

class Person {
  final String name;
  final DateTime birthday;
  final String document;

  Person._({
    required this.name,
    required this.birthday,
    required this.document,
  });
}
