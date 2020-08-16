// 2.3: Recursion

// (Concept) Recursive function: A recursive function is a function that calls
// itself in it's body.

// Additional references:
// - (Recommended) An introductory video: https://www.youtube.com/watch?v=Mv9NEXX1VHc
// - Loops vs Recursion: https://www.youtube.com/watch?v=HXNhEYqFo0o
// - Overview: https://en.wikipedia.org/wiki/Recursion_(computer_science)

// Example 1: Factorial

// Factorial: the product of all positive integers less than or equal to n.
// n! = n × (n - 1) × (n - 2) × ... × 2 × 1
//
// Examples:
// 3! = 3 * 2 * 1 = 6
// 4! = 4 * 3 * 2 * 1 = 24

// Here is the imperative approach for a factorial function.
//
// The imperative iteration approach uses a loop (for) to multiply the current
// value (var i) with the next one. It's a stateful approach.
int imperativeFactorial(int n) {
  var initial = 1;

  for (var i = 1; i <= n.clamp(0, n); i++) {
    initial = initial * i;
  }

  return initial;
}

// The functional approach uses recursion.
//
// For example, if we pass 4 as argument to our recursiveFactorial function,
// the evaluation happens like these steps:
//
// => recursiveFactorial(4)
// => 4 * recursiveFactorial(4 - 1)
// => 4 * recursiveFactorial(3)
// => 4 * 3 * recursiveFactorial(3 - 1)
// => 4 * 3 * recursiveFactorial(2)
// => 4 * 3 * 2 * recursiveFactorial(2 - 1)
// => 4 * 3 * 2 * recursiveFactorial(1)
// => 4 * 3 * 2 * 1
// => 24
int recursiveFactorial(int n) => //
    n <= 1 // If n is 1 (or less, since we must exclude negative and zero)...
        ? 1 // return 1, else...
        : n * recursiveFactorial(n - 1); // return n × (n - 1)

// Example 2: Iteration of a list

// Here is the imperative approach to iterate through a list.
//
// The imperative iteration approach uses a loop (for) to iterate through the
// list, and keeps a state (var i) to track the current iteration.
void imperativeIteration<T>(List<T> list) {
  for (var i = 0; i < list.length; i++) {
    print(list[i]);
  }
}

// The functional approach uses recursion.
//
// Instead of keeping a state to track the current item, this approach acts
// constantly in the head (first item of the list) and reapply the function on
// its tail (the rest of the list, excluding the head).
//
// When the list is empty, although, the recursion stops.
void recursiveIteration<T>(List<T> list) {
  print(list.first);
  if (list.length > 1) {
    recursiveIteration(list.sublist(1));
  }
}
