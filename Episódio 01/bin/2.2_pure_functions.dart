// 2.2: Pure functions & referential transparency
import 'dart:math';

// (Concept) Pure Functions: a function that (1) has the same output given the
// same input and (2) has no side-effects. Pure functions are computational
// analogues for mathematical functions.

// (Concept) Referential transparency: An expression is called referentially
// transparent if it can be replaced with its corresponding value without
// changing the program's behavior.

// Additional references:
// - Overview on Pure Functions: https://en.wikipedia.org/wiki/Function_(mathematics)
// - Overview on Referential Transparency: https://en.wikipedia.org/wiki/Referential_transparency

/// Doubles [n].
///
/// Here, [double] is a pure function and referntially transparent, as it has
/// not side-effects, and every occurrence of it in any program can be replaced
/// with `n * 2` with no consequences.
int double(int n) => n * 2;

/// Generate a possibly negative integer from -[max] to [max].
///
/// [randomIntWithNegative], on the other side, is clearly neither pure nor
/// referentially transparent. Its output depends to external elements, so that
/// givin the same input will not, necessarily, produce the same output.
int randomIntWithNegative(int max) =>
    Random().nextInt(max) * (Random().nextBool() ? 1 : -1);
