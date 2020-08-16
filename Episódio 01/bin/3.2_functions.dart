// 3.2: Functions

// In functional programming, functions are the most fundamental element, along
// types.
//
// Purely speaking, functions should have exactly one parameter, like lambda
// calculus does. Chaining functions with one parameters is called "currying".
//
// Also, it is very common to have functions are input and output of other
// functions.

// Example of curried a function, that outputs a function:
int Function(int) add(int a) => (int b) => a + b;

void main() {
  const list = [1, 2, 3, 4];

  // With currying, we can easily do partial application:
  final add1 = add(1);

  // Functions as input are considerably noraml in Dart, as the standard library
  // already provides functions that takes another function as parameter, such
  // as List.map, List.reduce, List.fold, List.where etc.
  //
  // In this case, we are passing our partial applied add functions, which will
  // map each integer in [list] to it's next, resulting in:
  // => [2, 3, 4, 5]
  final mappedList = list.map(add1);

  print(mappedList);
}

// With one-parameter functions and partial applications, and with functions as
// input and outputs, it becomes easier and more expressive to compose
// functions.
