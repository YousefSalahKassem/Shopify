import 'package:evira/controller/product_controller.dart';
import 'package:evira/styles/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/product_card.dart';
import '../../../model/product_model.dart';

class PopularProduct extends StatelessWidget {
  const PopularProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<ProductController>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.height10),
          child: Text(
            'Popular Products',
            style: TextStyle(color: Colors.black, fontSize: context.height20),
          ),
        ),
        SizedBox(
          height: context.height15,
        ),
        SizedBox(
          height: context.screenHeight*.47,
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
        ),
        SizedBox(
          height: context.height20,
        ),
      ],
    );
  }
}
