import 'dart:convert';

import 'package:evira/styles/strings.dart';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    this.id,
    this.name,
    this.price,
    this.imageUrl,
    this.category,
    this.details,
    this.quantity=1,
    this.v,
  });

  String? id;
  String? name;
  var price;
  String? imageUrl;
  String? category;
  String? details;
  int quantity;
  int? v;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["_id"]??'',
    name: json["name"]??'',
    price: json["price"]??'',
    imageUrl: json["imageUrl"]??'',
    category: json["category"]??'',
    details: json["details"]??'',
    v: json["__v"]??'',
  );

  Map<String, dynamic> toMap() {
    return {
      AppProperties.columnId: id??'',
      AppProperties.columnName: name??'',
      AppProperties.columnImage: imageUrl??'',
      AppProperties.columnPrice: price??'',
      AppProperties.columnDescription: details??'',
    };
  }

  Map<String, dynamic> toCartMap() {
    return {
      AppProperties.columnId: id??'',
      AppProperties.columnName: name??'',
      AppProperties.columnImage: imageUrl??'',
      AppProperties.columnPrice: price??'',
      AppProperties.columnDescription: details??'',
      AppProperties.columnQuantity: quantity??'',
    };
  }

  Map<String, dynamic> toJson() => {
    "_id": id??'',
    "name": name??'',
    "price": price??'',
    "imageUrl": imageUrl??'',
    "category": category??'',
    "details": details??'',
    "__v": v??'',
  };
}