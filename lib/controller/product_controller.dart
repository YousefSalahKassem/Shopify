import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import '../model/product_model.dart';
import '../services/remote/product_service.dart';
import 'error_controller.dart';

class ProductController with ChangeNotifier {

  ProductController(BuildContext context) {
    getAllProducts(context);
  }
  final _productService = ProductService();

  final _productList = <Product>[];

  List<Product> get productList => _productList;

  bool _isLoadingAllProducts = true;

  bool get isLoadingAllProducts => _isLoadingAllProducts;

  setIsLoadingAllProducts(bool value) {
    _isLoadingAllProducts = value;
    notifyListeners();
  }

  Future<List<Product>> getAllProducts(BuildContext context) async {
    try {
      _isLoadingAllProducts = true;
      _productList.clear();

      setIsLoadingAllProducts(false);
      var response = await _productService.getAllProducts();

      if (response.statusCode == 200) {
        var responseJsonStr = json.decode(response.body);
        var jsonProd = responseJsonStr['data']['products'];
        _productList.addAll(productFromJson(json.encode(jsonProd)));
        _isLoadingAllProducts = false;

        notifyListeners();
      } else {
        ErrorController.showErrorFromApi(context, response);
      }
    } on SocketException catch (_) {
      ErrorController.showNoInternetError(context);
    } on HttpException catch (_) {
      ErrorController.showNoServerError(context);
    } on FormatException catch (_) {
      ErrorController.showFormatExceptionError(context);
    } catch (e) {
      print("Error ${e.toString()}");
      ErrorController.showUnKownError(context);
    }
    return _productList;
  }

  Future<List<Product>> getProductByCategory(String value, BuildContext context) async {
    try {
      _isLoadingAllProducts = true;

      var response = value == 'All'
          ? await _productService.getAllProducts()
          : await _productService.getProductByCategory(value);

      if (response.statusCode == 200) {
        var responseJsonStr = json.decode(response.body);
        var jsonProd = value == 'All'
            ? responseJsonStr['data']['products']
            : responseJsonStr['data']['result'];

        _productList.clear();
        _productList.addAll(productFromJson(json.encode(jsonProd)));
        _isLoadingAllProducts = false;

        notifyListeners();
      } else {
        ErrorController.showErrorFromApi(context, response);
      }
    } on SocketException catch (_) {
      ErrorController.showNoInternetError(context);
    } on HttpException catch (_) {
      ErrorController.showNoServerError(context);
    } on FormatException catch (_) {
      ErrorController.showFormatExceptionError(context);
    } catch (e) {
      ErrorController.showUnKownError(context);
    }
    return _productList;
  }

  Future<List<Product>> getProductByCategoryOrName(String value) async {
    var finalSearchValue = value.trim();
    notifyListeners();
    try {
      _isLoadingAllProducts = true;

      var response = finalSearchValue == ''
          ? await _productService.getAllProducts()
          : await _productService.getProductByCategoryOrName(finalSearchValue);

      if (response.statusCode == 200) {
        var responseJsonStr = json.decode(response.body);
        var jsonProd = finalSearchValue == ''
            ? responseJsonStr['data']['products']
            : responseJsonStr['data']['result'];

        _productList.clear();
        _productList.addAll(productFromJson(json.encode(jsonProd)));
        _isLoadingAllProducts = false;
        notifyListeners();
      } else {
        _isLoadingAllProducts = true;
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoadingAllProducts = true;
      notifyListeners();
    } on HttpException catch (_) {
      _isLoadingAllProducts = true;
      notifyListeners();
    } catch (e) {
      _isLoadingAllProducts = true;
      notifyListeners();
    }
    return _productList;
  }
}
