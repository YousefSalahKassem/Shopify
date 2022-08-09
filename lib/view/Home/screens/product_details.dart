import 'package:evira/view/Home/widgets/details_body.dart';
import 'package:flutter/material.dart';
import '../../../model/product_model.dart';

class ProductDetails extends StatelessWidget {
  final Product product;

  const ProductDetails({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F9),

      body: DetailsBody(product: product),
    );
  }
}
