import 'category.dart';

class Product {
  String name;
  Category category;
  double _price = 0;
  int _quentity = 0;

  Product({
    required this.name,
    required this.category,
    double price = 0,
    int quentity = 0,
  }) {
    this.price = price;
    this.quentity = quentity;
  }
  double get price => _price;
  int get quentity => _quentity;

  set price(double newPrice) {
    if (newPrice > 0) {
      _price = newPrice;
    }
  }

  set quentity(int newQuentity) {
    if (newQuentity > 0) {
      _quentity = newQuentity;
    }
  }

  void editProduct(double price, int quentity) {
    this.price = price;
    this.quentity = quentity;
  }
}
