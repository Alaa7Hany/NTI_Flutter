import 'dart:math';

class MySingleton {
  // make it static to access it in factory
  static final MySingleton instance = MySingleton._internal();
  int x = Random().nextInt(1000);
// private named constructor 
// prevent anyone from taking objects outside the class
  MySingleton._internal();
// add factory to control what the constructors return every time it's used
  factory MySingleton() {
    return instance;
  }

  void writeRandomNumber() {
    print(x);
  }
}

void main() {
  var singleton1 = MySingleton();
  var singleton2 = MySingleton();

  print(identical(singleton1, singleton2));

  singleton1.writeRandomNumber();
  singleton1.writeRandomNumber();
}
