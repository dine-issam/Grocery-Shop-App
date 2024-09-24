import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  // list of items on sale
  final List _shopItems = const [
    // [ itemName, itemPrice, imagePath, color ]
    ["Avocado", "4.00", "assets/images/avocado.png", Colors.green],
    ["Banana", "2.50", "assets/images/banana.png", Colors.yellow],
    ["Chicken", "12.80", "assets/images/chicken.png", Colors.brown],
    ["Water", "1.00", "assets/images/water.png", Colors.blue],
  ];

  final List<Map<String, dynamic>> _cartItems = [];
  final List<Map<String, dynamic>> _historyCartItems = [];

  get shopItems => _shopItems;
  get cartItems => _cartItems;
  get historyCartItems => _historyCartItems;

  void addToCart(int index) {
    var item = _shopItems[index];
    // Check if the item is already in the cart
    int existingIndex =
        _cartItems.indexWhere((cartItem) => cartItem['item'][0] == item[0]);
    if (existingIndex != -1) {
      // If item exists, increase the quantity
      _cartItems[existingIndex]['quantity']++;
    } else {
      // If item doesn't exist, add it to the cart with a quantity of 1
      _cartItems.add({
        'item': item,
        'quantity': 1,
      });
    }
    notifyListeners();
  }

  void removeFromCart(int index) {
    if (_cartItems[index]['quantity'] > 1) {
      _cartItems[index]['quantity']--;
    } else {
      _cartItems.removeAt(index);
    }
    notifyListeners();
  }

  String calculateTotal() {
    double totalPrice = 0;
    for (var cartItem in _cartItems) {
      totalPrice += double.parse(cartItem['item'][1]) * cartItem['quantity'];
    }
    return totalPrice.toStringAsFixed(2);
  }

  // Method to move cartItems to history and clear cart
  void completePurchase() {
    if(_historyCartItems.isNotEmpty){
      _historyCartItems.clear();
    }
    // Move all current cart items to history
    _historyCartItems.addAll(List.from(_cartItems));
    // Clear the cart
    _cartItems.clear();

    notifyListeners();
  }
}
