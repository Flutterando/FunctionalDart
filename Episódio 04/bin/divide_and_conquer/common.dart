import '../monoid.dart';

/// A representation of a text in a document.
class Text {
  final String value;

  const Text(this.value);
}

/// A [Monoid] implementation for [Text].
///
/// This [Monoid] has sum as its binary operator and and empty string
/// [Text] as its identity element.
class TextConcat implements Monoid<Text> {
  @override
  Text append(Text a, Text b) => Text(a.value + b.value);

  @override
  Text get identity => const Text('');
}

/// Counts the number of words on [text].
int wordCount(Text text) {
  final words = text.value.split(' ');
  return words.length;
}

/// Calculates how many time has been spent on [fn].
///
/// The result is returned in milliseconds.
int time(void Function() fn) {
  final stopwatch = Stopwatch();
  stopwatch.start();
  fn();
  stopwatch.stop();
  return stopwatch.elapsedMilliseconds;
}
