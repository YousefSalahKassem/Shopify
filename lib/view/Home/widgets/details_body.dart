
import 'package:evira/view/Home/widgets/product_description.dart';
import 'package:evira/view/Home/widgets/product_image.dart';
import 'package:flutter/material.dart';
import '../../../model/product_model.dart';

class DetailsBody extends StatelessWidget {
  final Product product;
  const DetailsBody({Key? key , required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductImage(product: product),
        ProductDescription(product: product),
      ],
    );
  }
}
