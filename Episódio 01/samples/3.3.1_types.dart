// 3.3.1: Types - Object Oriented Programming

// Types in OOP are classes, and tends to represent real world objects through
// hierarchy and shared behavior.

// Example of an Animal class and a Dog class that extends Animal.

class Animal {
  final bool furry;
  final int legsNumber;

  const Animal({
    required this.furry,
    required this.legsNumber,
  });
}

class Dog extends Animal {
  final String name;
  final String breed;

  const Dog({
    required this.name,
    required this.breed,
  }) : super(furry: true, legsNumber: 4);

  void bark() {
    print('$name barked! Woof! Woof!');
  }

  void walk() {
    print('$name is walking on his $legsNumber legs!');
  }
}
