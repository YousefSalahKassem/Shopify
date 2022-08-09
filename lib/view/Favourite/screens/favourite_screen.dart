import 'package:evira/styles/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../components/product_card.dart';
import '../../../controller/favourite_controller.dart';
import '../widgets/favourite_bar.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<FavouriteController>(context);
    return Scaffold(
        appBar: favouriteBar(context),
        body: controller.productList.isEmpty
            ? SvgPicture.asset('assets/images/bookmark.svg')
            : Container(
                height: context.screenHeight,
                width: context.screenWidth,
                padding: EdgeInsets.symmetric(vertical: context.height10),
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: controller.productList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 1,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) => ProductCard(
                    product: controller.productList[index],
                  ),
                ),
              ));
  }
}
