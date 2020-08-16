// ignore_for_file: always_declare_return_types

// 1: Lambda Calculus

// Additional references:
// - (Recommended) An introductory video: https://www.youtube.com/watch?v=eis11j_iGMs
// - Overview: https://en.wikipedia.org/wiki/Lambda_calculus
// - Stanford Encyclopedia of Philosophy: https://plato.stanford.edu/entries/lambda-calculus/

// Here we define, in terms of functions, our boolean types
// We are using dynamic everywhere because we are using the
// untyped lambda-calculus approach
dynamic True(dynamic x, dynamic _) => x;
dynamic False(dynamic _, dynamic x) => x;

// Some operations examples that act on our boolean types
dynamic not(dynamic a) => a(False, True) as dynamic;
dynamic and(dynamic a, dynamic b) => a(b, False) as dynamic;
dynamic or(dynamic a, dynamic b) => a(True, b) as dynamic;

/// Returns a readable string for [_bool].
///
/// [bs] stands for "bool string".
///
/// If a [_bool] different of [True] or [False] is passed, an [ArgumentError]
/// will be thrown.
String bs(dynamic _bool) => _bool == True
    ? 'True'
    : _bool == False
        ? 'False'
        : throw ArgumentError.value(
            _bool,
            '_bool',
            'The passed argument MUST be either the functions True or False.',
          );

// Let's proof our types and operations!
void main() {
  print('Making our own `bool` type with only functions! 😱');

  // Printing our bools
  print('\nBools:');
  print(bs(True));
  print(bs(False));

  // Negating our bools
  print('\nNegating our bools:');
  print('not(True): ${bs(not(True))}'); // Should print 'False'
  print('not(False): ${bs(not(False))}'); // Should print 'True'

  // Conjoining (AND) our bools
  print('\nConjoining our bools:');
  print('and(True, True): ${bs(and(True, True))}'); // Should print 'True'
  print('and(True, False): ${bs(and(True, False))}'); // Should print 'False'
  print('and(False, True): ${bs(and(False, True))}'); // Should print 'False'
  print('and(False, False): ${bs(and(False, False))}'); // Should print 'False'

  // Disjointing (OR) our bools
  print('\nDisjointing our bools:');
  print('or(True, True): ${bs(or(True, True))}'); // Should print 'True'
  print('or(True, False): ${bs(or(True, False))}'); // Should print 'True'
  print('or(False, True): ${bs(or(False, True))}'); // Should print 'True'
  print('or(False, False): ${bs(or(False, False))}'); // Should print 'False'
}
