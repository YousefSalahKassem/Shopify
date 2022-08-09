import 'package:evira/styles/strings.dart';
import 'package:http/http.dart' as http;

class ProductService {
  static ProductService? _productService;

  ProductService._internal(){
    _productService = this;
  }

  factory ProductService() => _productService ??= ProductService._internal();

  static var httpClient = http.Client();

  Future getAllProducts() async {
    return await httpClient.get(Uri.parse(AppProperties.productUrl));
  }

  getProductByCategoryOrName(String category) async {
    return await httpClient.get(Uri.parse('${AppProperties.searchByCategoryOrNameUrl}$category'));
  }

  Future getProductByCategory(String category) async {
    return await http.get(Uri.parse('${AppProperties.searchByCategoryUrl}$category'));
  }

  Future getProductById(String id) async {
    return await http.get(Uri.parse('${AppProperties.productUrl}$id'));
  }



}