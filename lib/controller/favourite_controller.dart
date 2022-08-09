import 'package:evira/services/local/favourite_database.dart';
import 'package:flutter/cupertino.dart';
import '../model/product_model.dart';

class FavouriteController with ChangeNotifier{
  var dbHelper = FavoriteDatabase.db;

  final List<Product> _productList = [];
  List<Product> get productList => _productList;

  FavouriteController(){
    init();
    getFavourite();
  }

  init()async{
    await dbHelper.initDatabase();
    getFavourite();
    notifyListeners();
  }

  void addToFavourite(Product product) async {
    if( _productList.contains(product)){
      for (var element in _productList) {
        if(element.name == product.name){
        }
      }
    }
    else{
      _productList.add(product);
      await dbHelper.insertFavourite(product);
    }
    notifyListeners();
  }

  void removeFromFavourite(Product product) async {
    _productList.remove(product);
    await dbHelper.deleteFavourite(product.name!);
    notifyListeners();
  }

  Future<List<Product>> getFavourite() async {
    final List<Product> products = await dbHelper.getFavourite();
    _productList.clear();
    _productList.addAll(products);
    notifyListeners();
    return products;
  }

  checkFavourite(Product product)  {
    final List<Product> products = _productList;
    for (var element in products) {
      if(element.name == product.name){
        return true;
      }
    }
    return false;
  }


}