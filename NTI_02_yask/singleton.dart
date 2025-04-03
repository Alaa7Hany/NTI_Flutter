import 'dart:math';

class MySingleton {
  static final MySingleton instance = MySingleton._internal();
  int x = Random().nextInt(1000);

  MySingleton._internal();

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
