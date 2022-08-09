import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

List<CategoryModel> categoryFromJson(String str) => List<CategoryModel>.from(
    json.decode(str).map((x) => CategoryModel.fromJson(x)));

String categoryToJson(List<CategoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryModel {
  CategoryModel({
    this.id,
    this.category,
    this.v,
  });

  String? id;
  String? category;
  int? v;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    id: json["_id"],
    category: json["category"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "category": category,
    "__v": v,
  };


}
List<IconData> listIcons = [
  FontAwesomeIcons.shop,
  Icons.phone_iphone,
  FontAwesomeIcons.shoePrints,
  FontAwesomeIcons.shirt,
  Icons.laptop_mac,
  FontAwesomeIcons.camera,
  Icons.shopping_bag,
  FontAwesomeIcons.bicycle,
  Icons.watch,
  Icons.toys_outlined,
  Icons.menu_book_sharp,
  Icons.bed_rounded,
  Icons.chair_rounded
];