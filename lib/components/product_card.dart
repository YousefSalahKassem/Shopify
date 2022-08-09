import 'package:animate_do/animate_do.dart';
import 'package:evira/controller/favourite_controller.dart';
import 'package:evira/styles/dimensions.dart';
import 'package:evira/util/route.dart';
import 'package:evira/view/Home/screens/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../model/product_model.dart';
import '../styles/colors.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.width = 150,
    this.aspectRetio = 1.02,
    required this.product,
  }) : super(key: key);

  final double width, aspectRetio;
  final Product product;

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<FavouriteController>(context);
    return BounceInUp(child: Container(
      margin: EdgeInsets.symmetric(horizontal: context.height10),
      padding: EdgeInsets.symmetric(
        horizontal: context.height20,
      ),
      child: GestureDetector(
        onTap: () {
          AppRoute.push(ProductDetails(product: product));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(context.height10),
                child: Hero(
                  tag: product.name!,
                  child: Image.network(product.imageUrl!, fit: BoxFit.cover),
                ),
              ),
            ),
            Text(
              product.name!,
              style: const TextStyle(color: Colors.black),
              maxLines: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${product.price}",
                  style: TextStyle(
                    fontSize: context.height20,
                    fontWeight: FontWeight.w600,
                    color: kPrimaryColor,
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    if(controller.checkFavourite(product)){
                      controller.removeFromFavourite(product);
                    }
                    else {
                      controller.addToFavourite(product);
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(context.height10),
                    height: context.height30,
                    width: context.height30,
                    decoration: BoxDecoration(
                      color: controller.checkFavourite(product)
                          ? kPrimaryColor.withOpacity(0.15)
                          : kSecondaryColor.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      "assets/icons/Heart Icon_2.svg",
                      color: controller.checkFavourite(product)
                          ? const Color(0xFFFF4848)
                          : const Color(0xFFDBDEE4),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
