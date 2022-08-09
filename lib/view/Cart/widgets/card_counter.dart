import 'package:evira/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import '../../../components/out_line_button.dart';

class CardCounter extends StatelessWidget {
  final CartController controller;
  int index;
  CardCounter({Key? key, required this.index, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            outLineButton(
              context,
              Icons.remove,
                  () => controller.decrementCart(controller.cart[index]),
            ),
            const SizedBox(width: 10),
            Text(
              controller.cart[index].quantity.toString(),
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 10),
            outLineButton(
              context,
              Icons.add,
                  () => controller.incrementCart(controller.cart[index]),
            ),
          ],
        ));
  }
}
