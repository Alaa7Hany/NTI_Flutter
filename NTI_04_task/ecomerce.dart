import 'dart:io';

import 'category.dart';
import 'product.dart';

class Ecomerse {
  String name;
  List<Product> _products = [
    Product(
      name: 'Rice',
      category: Category.groceries,
      price: 20,
      quentity: 30,
    ),
    Product(
      name: 'Sugar',
      category: Category.groceries,
      price: 10,
      quentity: 23,
    ),
    Product(
      name: 'Charger',
      category: Category.electronics,
      price: 100,
      quentity: 2,
    ),
  ];

  Ecomerse(this.name);

  List<Product> get products => _products;

  void showMenuProducts() {
    int index = 0;
    print('Showing menu... 🥕🥔🍆');
    Category category = inputCategory();
    print('Showing products in category: ${category.name} 👇');
    for (var product in _products.where(
      (product) => product.category == category,
    )) {
      print(
        '${index + 1} - ${product.name} - ${product.price} - ${product.quentity}',
      );
      index++;
    }
  }

  void addProduct() {
    print('Adding product...');
    Category category = inputCategory();
    String name = inputName();
    double price = inputPrice();
    int quentity = inputQuentity();

    _products.add(
      Product(name: name, category: category, price: price, quentity: quentity),
    );
  }

  void removeProduct(int productId) {
    _products.removeAt(productId - 1);
  }

  void buyProduct() {
    print('Buying product...');
    Category category = inputCategory();
    int productID = inputProductId();

    Product product =
        _products
            .where((product) => product.category == category)
            .toList()[productID - 1];

    while (true) {
      int quantity = inputQuentity();
      if (quantity > 0) {
        product.quentity += quantity;
        print('You bought $quantity of ${product.name} ✅');
        break;
      } else {
        print('Not enough stock for ${product.name}');
      }
    }
  }

  void sellProduct() {
    print('Selling product...');
    Category category = inputCategory();

    int productID = inputProductId();
    Product product =
        _products
            .where((product) => product.category == category)
            .toList()[productID - 1];
    while (true) {
      int quantity = inputQuentity();
      if (product.quentity >= quantity) {
        product.quentity -= quantity;
        print('You sold $quantity of ${product.name} ✅');
        break;
      } else {
        print('Invalid quantity for ${product.name}');
      }
    }
  }

  T getInput<T>({
    required String label,
    required T? Function(String) validator,
  }) {
    while (true) {
      print('Please Enter Product $label: ');
      String? input = stdin.readLineSync()?.trim();

      if (input == null || input.isEmpty) {
        print("\n❌ Input cannot be empty! Try again.\n");
        continue;
      }

      T? validatedValue = validator(input);
      if (validatedValue != null) return validatedValue;

      print("\n❌ Invalid $label! Try again.\n");
    }
  }

  String inputName() {
    return getInput<String>(
      label: 'Name',
      validator: (input) {
        if (input.isNotEmpty) {
          return input;
        } else {
          print('❌ Invalid name!');
          return null;
        }
      },
    );
  }

  double inputPrice() {
    return getInput<double>(
      label: 'Price',
      validator: (input) {
        double? value = double.tryParse(input);
        if (value != null && value > 0) {
          return value;
        } else {
          return null;
        }
      },
    );
  }

  int inputQuentity() {
    return getInput<int>(
      label: 'Quantity',
      validator: (input) {
        int? value = int.tryParse(input);
        if (value != null && value > 0) {
          return value;
        } else {
          return null;
        }
      },
    );
  }

  int inputProductId() {
    return getInput<int>(
      label: 'ID',
      validator: (input) {
        int? value = int.tryParse(input);
        if (value != null && value > 0 && value <= _products.length) {
          return value;
        } else {
          return null;
        }
      },
    );
  }

  Category inputCategory() {
    print('-----------Available Categories 👇');
    for (int i = 0; i < Category.values.length; i++) {
      print('${i + 1} - ${Category.values[i].name}');
    }
    int categoryId = getInput<int>(
      label: 'Category',
      validator: (input) {
        int? value = int.tryParse(input);
        if (value != null && value > 0 && value <= Category.values.length) {
          return value;
        } else {
          return null;
        }
      },
    );
    return Category.values[categoryId - 1];
  }
}
