import '../monoid.dart';
import 'common.dart';

// Our divide and conquer example is based on the following problem:
// Given a document, I want to count the number of words written in this
// document.
//
// The definition of a word will be given in terms of the empty spaces (' ')
// between words.

/// Creates a page for the document.
List<Text> page() => List.generate(
      1000,
      (_) => const Text('Hello '),
    );

/// Creates a document.
List<Text> document() =>
    List.generate(30, (_) => page()).expand((element) => element).toList();

/// Reduce our document into a single [Text] and the count it.
///
/// We use our predefined [TextConcat] monoid and [MonoidReduce] extension to
/// render this algorithm.
int reduceAndCount() {
  final reduction = document().reduceM(TextConcat());
  return wordCount(reduction);
}

/// Map each [Text] to its word count, and then reduce it.
///
/// It's important to note that, as [TextConcat] and [IntSum] are homomorphic,
/// we can use this chunckability to greatly improve our algorithm.
int countAndReduce() {
  final map = document().map(wordCount).toList();
  return map.reduceM(IntSum());
}

// The main function shows clearly the difference between our first and second
// implementations. Using the divide and conquer technique leveraged by the
// monoids homomorphisms, we could make a substantial optimization.
void main() {
  final _time = time(reduceAndCount);
  print('Reduce and count: $_time ms');

  final _time2 = time(countAndReduce);
  print('Count and reduce: $_time2 ms');
}
