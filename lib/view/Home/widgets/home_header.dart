
import 'package:evira/styles/dimensions.dart';
import 'package:evira/util/route.dart';
import 'package:evira/view/Cart/screens/cart_screen.dart';
import 'package:evira/view/Home/widgets/search_field.dart';
import 'package:flutter/material.dart';

import 'icon_button_with_counter.dart';

class HomeHeader extends StatelessWidget {

  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.symmetric(horizontal: context.height10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SearchField(),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Cart Icon.svg",
            press: () => AppRoute.push(const CartScreen()),
          ),
        ],
      ),
    );
  }
}