import 'package:animate_do/animate_do.dart';
import 'package:evira/model/product_model.dart';
import 'package:evira/styles/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/cart_controller.dart';

class Orders extends StatelessWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartController = Provider.of<CartController>(context);
    return SizedBox(
      height: context.screenHeight*.22,
      width: context.screenWidth,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: cartController.cart.length,
        itemBuilder: (context, index) {
          return OrderItem(product: cartController.cart[index]);
        },
      ),
    );
  }
}

class OrderItem extends StatelessWidget {
  final Product product;
  const OrderItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BounceInRight(child: Padding(
      padding: EdgeInsets.symmetric(horizontal: context.height20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: context.height30*3,
            child: AspectRatio(
              aspectRatio: 0.88,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(product.imageUrl!, fit: BoxFit.cover,),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            product.name!,
            style: const TextStyle(color: Colors.black, fontSize: 16),
            maxLines: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${product.price}',
                style: const TextStyle(color: Colors.black, fontSize: 16),
              ),
              SizedBox(width: context.height30,),
              Text(
                'X${product.quantity}',
                style: const TextStyle(color: Colors.black, fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}

