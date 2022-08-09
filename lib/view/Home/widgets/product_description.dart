import 'package:evira/controller/favourite_controller.dart';
import 'package:evira/styles/dimensions.dart';
import 'package:evira/util/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../components/default_button.dart';
import '../../../controller/cart_controller.dart';
import '../../../model/product_model.dart';
import '../../../styles/colors.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key? key,
    required this.product,
    this.pressOnSeeMore,
  }) : super(key: key);

  final Product product;
  final GestureTapCallback? pressOnSeeMore;

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<FavouriteController>(context);
    var cartController = Provider.of<CartController>(context);
    return Expanded(
        child: Container(
        color: Colors.white,
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: context.height30),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.height20),
            child: Text(
              product.name!,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: EdgeInsets.all(context.height15),
              width: context.height30 * 2.2,
              decoration: BoxDecoration(
                color: controller.checkFavourite(product)
                    ? const Color(0xFFFFE6E6)
                    : const Color(0xFFF5F6F9),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: SvgPicture.asset(
                "assets/icons/Heart Icon_2.svg",
                color: controller.checkFavourite(product)
                    ? const Color(0xFFFF4848)
                    : const Color(0xFFDBDEE4),
                height: context.height15,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: context.height20,
              right: context.height30 * 2.2,
            ),
            child: Text(
              product.details!,
              maxLines: 10,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.height20,
              vertical: 10,
            ),
            child: GestureDetector(
              onTap: () {},
              child: Row(
                children: const [
                  Text(
                    "See More Detail",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: kPrimaryColor),
                  ),
                  SizedBox(width: 5),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                    color: kPrimaryColor,
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: context.height20, vertical: context.height10),
              child: DefaultButton(
                text: "Add to Cart",
                press: () {
                  cartController.addToCart(product);
                  AppRoute.pop();
                },
              ),
          ),
        ],
      ),
    ));
  }
}
