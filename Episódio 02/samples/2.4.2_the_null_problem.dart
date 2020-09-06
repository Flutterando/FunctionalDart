import 'package:dartz/dartz.dart';

// 2.4.2: The null semantic problem

// The current stable version of Dart (2.9.2) has a problem. Every type T is
// actually a sum type of T and Null. This means that ALL types may be null.

// For example, If you disable null-safety on analysis_options.yaml, the
// following commented code will work:

// final String maybeString = null;

// However, we said to our program that we want a String and nothing else.
// This is a semantic problem present in Dart.

// However, it's being solved with the upcoming null-safety feature. Actually,
// this repository has null-safety enabled in analysis_options.yaml.

// This means that you can only assign String to a String. Try changing the
// following line with a null instead and the compiler/linter will complain.

final String string = 'Not null';

// Now, if you want to explicitly tell Dart that you want a sum type of T and
// Null, you can append a question mark to T.

final String? maybeString = null;

// In functional languages, however, we usually don't use Null. Instead, we use
// the power of composition in our favor. For example, if we want to represent
// the possible absence of a value of T, we can use Either<Unit, T>.

// Remember that Unit has a value of 1. That means that if we sum it with any
// other type, we are saying that our type can have 1 more value, that is, the
// value that represents absence.

// For example, this is isomorphic to Null, as both Null and Unit have at most
// 1 value.
final Either<Unit, String> absentEitherString = Left(unit);

// In the same fashion, this is isomorphic to a non-null time.
final Either<Unit, String> presentEitherString = Right('Not null');

// As the absence of value is a common problem in programming, functional
// programming usually have a syntax sugar for using Either<Unit, T>. The
// Option<T> is isomorphic to Either<Unit, T>, but more semantic.

// Option is like Either, but instead of a Left and Right value, it has None
// and Some as possibilites.

// As an example equivalent to the previous one, here is Option<String> with
// both absent and present values.
const Option<String> noneOptionString = None();
const Option<String> someOptionString = Some('Not null');

// Besides semantics, another reason tu use Option instead of the in-language
// null-safety is because it is a monad and functor. This is will be explained
// in detail in another episode.
