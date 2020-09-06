import 'package:dartz/dartz.dart';

// 2.1: Types semantics

// Types, in functional programming, represents SETS OF THINGS.

// int: The int type represents a set with all possible integers (ℤ).
// {-∞, …, -3, -2, -1, 0, 1, 2, 3, …, ∞}

const integer = 0;

// Question: what are the semantics of `int`?

// Answer: The semantics of `int` are that of mathematics. Thus, it is
// not always proper to represent your domain.

// When we use primitives to model our domain, we are often creating semantic
// problems. Our types don't correctly represent our domain, and carry some
// other issues with them.

// Example 1: temperature measuring units

// If I modelate a Celcius temperature as a double, I am disregarding the
// sematincs specific to what Celcius mean.

// The following function, thus, is semantic invalid. I can, for example,
// call this function and pass the return as input to it again. This would be,
// if we consider semantics, like we are passing a Kelvin temperature to our
// function that is supposed to receive Celcius as input.

double celciusToKelvin(double temperature) => temperature + 273.15;

// When modeling our domain types they have to semantically represent our
// domain.

// In our example above, we could make this way:

class Kelvin {
  final double temperature;

  Kelvin._(this.temperature);
}

// By making a separate creation method I can guarantee that, in compile time,
// all Kelvin values are going to have correct constraints. In this case, for
// example, we are guaranteed that we won't ever have a Kelvin with a
// temperature below zero (0).
Option<Kelvin> createKelvin(double temperature) =>
    temperature < 0.0 ? None() : Some(Kelvin._(temperature));

class Celcius {
  final double temperature;

  Celcius._(this.temperature);
}

// Similarly, we don't want our Celcius temperatures to be below -273.15.
Option<Celcius> createCelcius(double temperature) =>
    temperature < -273.15 ? const None() : Some(Celcius._(temperature));

// Now our function has correct semantics. We can't pass a Kelvin temperature to
// our function that expects a Celcius.
Kelvin semanticCelciusToKelvin(Celcius temperatureInCelcius) =>
    Kelvin._(temperatureInCelcius.temperature + 273.15);

// Example 2: operating on undesired data

// Let's have a model where we use the `int` primitive to represent our user ID.
class User {
  final int id;
  final String name;

  const User({
    required this.id,
    required this.name,
  });
}

// Now, let's make two constant users, only for the sake of example.
const user1 = User(id: 1, name: 'Jacob Moura');
const user2 = User(id: 2, name: 'Jonny Borges X');

// The following code is valid at compile-time:
void main() {
  final idSum = user1.id + user2.id;
  print(idSum);
}

// However, the concept of sum is not something that IDs should have, as it
// doesn't belong to the semantics of what an ID is.

// One possible solution would be to make, like we did in Example 1, a
// ID type derived from `int`,  but with the correct semantics and constraints.
