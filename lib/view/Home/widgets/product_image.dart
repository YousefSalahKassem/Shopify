import 'package:evira/styles/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../controller/favourite_controller.dart';
import '../../../model/product_model.dart';
import '../../../styles/colors.dart';

class ProductImage extends StatelessWidget {
  final Product product;
  const ProductImage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<FavouriteController>(context);
    return Stack(
      children: [
        Hero(
          tag: product.name!,
          child: Image.network(product.imageUrl!, fit: BoxFit.cover, height: context.height30*10, width: context.screenWidth),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: context.height20, vertical: context.height20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: context.height20*2,
                width: context.height20*2,
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60),
                    ),
                    primary: kPrimaryColor,
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: SvgPicture.asset(
                    "assets/icons/Back ICon.svg",
                    height: 15,
                  ),
                ),
              ),
              Expanded(child: Container()),
            ],
          ),
        )
      ],
    );
  }
}
