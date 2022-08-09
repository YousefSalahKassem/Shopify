import 'package:animate_do/animate_do.dart';
import 'package:evira/controller/cart_controller.dart';
import 'package:evira/styles/dimensions.dart';
import 'package:evira/view/Cart/widgets/card_counter.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  CartItem({
    Key? key,
    required this.controller,
    required this.index,
  }) : super(key: key);

  CartController controller;
  int index;


  @override
  Widget build(BuildContext context) {
    return BounceInUp(child: Padding(
      padding: EdgeInsets.symmetric(vertical: context.height10),
      child: Row(
        children: [
          SizedBox(
            width: context.height30*3,
            child: AspectRatio(
              aspectRatio: 0.88,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(controller.cart[index].imageUrl!, fit: BoxFit.cover,),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.cart[index].name!,
                style: const TextStyle(color: Colors.black, fontSize: 16),
                maxLines: 2,
              ),
              const SizedBox(height: 10),
              Text(
                '\$${controller.cart[index].price}',
                style: const TextStyle(color: Colors.black, fontSize: 16),
              ),
              const SizedBox(height: 10),
              CardCounter(index: index, controller: controller)
            ],
          )
        ],
      ),
    ));
  }
}