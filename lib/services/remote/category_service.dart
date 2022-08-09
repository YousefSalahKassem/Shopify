import 'package:http/http.dart' as http;

import '../../styles/strings.dart';

class CategoryService{
  static CategoryService? _categoryService;

  CategoryService._internal(){
    _categoryService = this;
  }

  factory CategoryService() => _categoryService ?? CategoryService._internal();

  Future getCategory () async {
    return await http.get(
      Uri.parse(AppProperties.categoryUrl),
    );
  }
}