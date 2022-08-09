import 'package:evira/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../widgets/cart_body.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: const CartBody(),
    );
  }
  AppBar buildAppBar(BuildContext context) {
    var controller = Provider.of<CartController>(context);
    return AppBar(
      title: Column(
        children: [
          const Text(
            "Your Cart",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "${controller.getNumberOfItems()} items",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(FontAwesomeIcons.trash,color: Colors.red,),
          onPressed: () {
            controller.clearCart();
          },
        ),
      ],
    );
  }
}
