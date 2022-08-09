import 'package:animate_do/animate_do.dart';
import 'package:evira/controller/category_controller.dart';
import 'package:evira/controller/product_controller.dart';
import 'package:evira/model/category_model.dart';
import 'package:evira/styles/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<CategoryController>(context, listen: true);
    return Padding(
      padding: EdgeInsets.all(context.height10),
      child: SizedBox(
        height: context.screenHeight * 0.12,
        width: context.screenWidth,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: controller.categoryList.length,
            itemBuilder: (context,index) {
              return CategoryCard(
                  icon: listIcons[index],
                  text: controller.categoryList[index].category,
                  press: () {
                    if (index == 0) {
                      Provider.of<ProductController>(context, listen: false)
                          .getAllProducts(context);
                    }
                    else {
                      Provider.of<ProductController>(context, listen: false)
                          .getProductByCategory(
                          controller.categoryList[index].category!, context);
                    }
                  }
              );
            }),
      )
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String? text;
  final IconData icon;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return BounceInRight(child: GestureDetector(
      onTap: press,
      child: Container(
        width: context.height30*2.2,
        margin: EdgeInsets.only(right: context.height20),
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.all(context.height15),
                height: context.height30*2,
                width: context.height30*2,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFECDF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon)
            ),
            const SizedBox(height: 5),
            Text(text!, textAlign: TextAlign.center, maxLines: 1,)
          ],
        ),
      ),
    ));
  }
}