/// The representation of a monoid.
///
/// This data structure provides implementation for the following properties
/// necessary for a monoid:
/// * Closure upon a type, which is [T];
/// * A binary operator [append];
/// * An identity [T] element.
///
/// Although a monoid also requires associativity, this propertie can't be
/// expressed only with the Dart type system. If you want to guarantee this,
/// you will have to write tests for each monoid implementation.
abstract class Monoid<T> {
  /// The monoid binary operator.
  ///
  /// It requires two [T] elements and returns another [T].
  T append(T a, T b);

  /// The monoid identity element.
  ///
  /// Must be an element such that, when applied with `append(a, identity)`,
  /// the result is `a`.
  T get identity;
}

/// The monoid of integers on sum.
class IntSum implements Monoid<int> {
  @override
  int append(int a, int b) => a + b;

  @override
  int get identity => 0;
}

/// The monoid of integers on product.
class IntProduct implements Monoid<int> {
  @override
  int append(int a, int b) => a * b;

  @override
  int get identity => 1;
}

/// An extension to reduce a monoidal list into a single value.
extension MonoidReduce<T> on List<T> {
  /// Reduces a collection to a single value by iteratively combining elements
  /// of the collection using the provided function.
  ///
  /// This function uses [monoid] as a basis for the reduction. This means that
  /// [Monoid.append] will be used as the combiner, and [Monoid.identity] will
  /// be used in case where the list is empty.
  T reduceM<M>(Monoid<T> monoid) => reduce(monoid.append);
}
