import 'package:evira/styles/dimensions.dart';
import 'package:flutter/material.dart';

AppBar favouriteBar(BuildContext context) {
  return AppBar(
    backgroundColor: const Color(0xFFFFECDF),
    title: Text("Favourite", style: TextStyle(color: Colors.black, fontSize: context.height20, fontWeight: FontWeight.bold),),
    centerTitle: true,
  );
}