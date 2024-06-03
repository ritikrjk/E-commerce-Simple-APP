import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/products.dart';

class Shop extends ChangeNotifier {
  //products for sale
  final List<Product> _shop = [
    Product(
      name: 'Product 1',
      price: 99.99,
      description:
          " Item description it is the info and details of the product",
      imagePath: 'assets/camera.png',
    ),
    Product(
        name: 'Product 2',
        price: 320.03,
        description:
            "Item description it is the info and details of the product",
        imagePath: 'assets/nike.png'),
    Product(
        name: 'Product 3',
        price: 420.03,
        description:
            "Item description it is the info and details of the product",
        imagePath: 'assets/headphone.png'),
    Product(
        name: 'Product 4',
        price: 520.03,
        description:
            "Item description it is the info and details of the product",
        imagePath: 'assets/watch.png'),
  ];

  //user cart
  final List<Product> _cart = [];

  //get product list
  List<Product> get shop => _shop;

  //get user cart
  List<Product> get cart => _cart;

  //add item to cart
  void addToCart(Product item, BuildContext context) {
    _cart.add(item);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        'Product added to Cart Succesfully',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      duration: Duration(milliseconds: 2000),
    ));
    notifyListeners();
  }

  //remove item from cart
  void removeFromCart(Product item, BuildContext context) {
    _cart.remove(item);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.red,
      content: Text(
        'Product removed from Cart Succesfully',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      duration: Duration(milliseconds: 2000),
    ));
    notifyListeners();
  }
}
