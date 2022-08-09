import 'package:flutter/cupertino.dart';

import '../model/product_model.dart';
import '../services/local/cart_database.dart';

class CartController with ChangeNotifier{
  var dbHelper = CartDatabase.db;
  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;
  final List<Product> _cart = [];
  List<Product> get cart => _cart;
  int get cartCount => _cart.length;
  double get cartTotal => _cart.fold(0, (sum, product) => sum + product.price * product.quantity);

  CartController(){
    getCartProducts();
    init();
  }

  init()async{
    await dbHelper.initDatabase();
    getCartProducts();
    notifyListeners();
  }

  void addToCart(Product product) async {
    if(await dbHelper.checkProduct(product)){
    }
    else{
      _cart.add(product);
      _totalPrice += product.price * product.quantity;
      await dbHelper.insertCart(product);
    }
    notifyListeners();
  }

  void removeFromCart(Product product) async {
    _cart.remove(product);
    _totalPrice -= product.price * product.quantity;
    product.quantity=1;
    await dbHelper.updateQuantity(product);
    await dbHelper.deleteCart(product.name!);
    notifyListeners();
  }

  Future<List<Product>> getCartProducts() async {
    final List<Product> products = await dbHelper.getCart();
    _cart.clear();
    _cart.addAll(products);
    getTotalPrice();
    notifyListeners();
    return products;
  }

  void getTotalPrice() {
    _totalPrice = _cart.fold(0, (sum, product) => sum + product.price * product.quantity);
  }

  void incrementCart(Product product) {
    for (var element in _cart) {
      if(element.name == product.name){
        element.quantity += 1;
        _totalPrice += element.price;
      }
    }
    notifyListeners();
  }

  void decrementCart(Product product) {
    for (var element in _cart) {
      if(element.name == product.name && element.quantity > 1){
        element.quantity -= 1;
        _totalPrice -= element.price;
      }
    }
    notifyListeners();
  }

  void clearCart() {
    dbHelper.deleteAll();
    _cart.clear();
    _totalPrice = 0.0;
    notifyListeners();
  }

  int getNumberOfItems() {
    int total = 0;
    for (var element in _cart) {
      total += element.quantity;
    }
    return total;
  }

}