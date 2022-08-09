import 'dart:convert';
import 'dart:io';
import 'package:evira/services/remote/category_service.dart';
import 'package:flutter/cupertino.dart';
import 'error_controller.dart';
import '../model/category_model.dart';

class CategoryController with ChangeNotifier {
  final _categoryService = CategoryService();

  int _currentIndex=0;
  int get currentIndex => _currentIndex;

  final _categoryList = <CategoryModel>[];
  List<CategoryModel> get categoryList => _categoryList;

  CategoryController(BuildContext context) {
    getAllCategories(context);
  }

  Future<List<CategoryModel>> getAllCategories(BuildContext context) async {
    try {
      _categoryList.clear();
      var response = await _categoryService.getCategory();
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        var categories = jsonResponse['data']['categories'];
        _categoryList.addAll(categoryFromJson(json.encode(categories)));
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
    return _categoryList;
  }

  void setCurrentIndex(int index) {
    _currentIndex = index;
    print(currentIndex);
    notifyListeners();
  }

}
