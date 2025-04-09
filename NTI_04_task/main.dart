import 'dart:io';

import 'ecomerce.dart';

void main() {
  print('Wlcome to our Store 👋');
  Ecomerse ecomerse = Ecomerse('My Store');

  while (true) {
    print('-------🗒️--------');
    print('1. Show Menu');
    print('2. Add Product');
    print('3. Edit Product');
    print('4. Buy');
    print('5. Sell');
    print('6. Exit');

    print('----------------');
    print('👉Enter your choice: ');
    String? choice = stdin.readLineSync();
    if (choice == '1') {
      ecomerse.showMenuProducts();
      print('----------------');
    } else if (choice == '2') {
      ecomerse.addProduct();
      print('Product added successfully!');
    } else if (choice == '3') {
      int id = ecomerse.inputProductId();
      print('Enter new price: ');
      double price = ecomerse.inputPrice();
      print('Enter new quantity: ');
      int quantity = ecomerse.inputQuentity();
      ecomerse.products[id - 1].editProduct(price, quantity);
    } else if (choice == '4') {
      ecomerse.buyProduct();
    } else if (choice == '5') {
      ecomerse.sellProduct();
    } else if (choice == '6') {
      print('Exiting...');
      print('Thank you for using our store!');
      break;
    } else {
      print('Invalid choice, please try again.');
    }
  }
}
