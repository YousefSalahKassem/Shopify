import 'package:evira/styles/dimensions.dart';
import 'package:evira/util/route.dart';
import 'package:evira/view/Checkout/screens/checkout_screen.dart';
import 'package:evira/view/Home/widgets/top_rounded_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../../../components/default_button.dart';
import '../../../controller/cart_controller.dart';
import 'cart_item.dart';

class CartBody extends StatelessWidget {
  const CartBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartController = Provider.of<CartController>(context);
    return Column(
      children: [
        cartController.cart.isEmpty
            ? SvgPicture.asset(
                'assets/images/cart.svg',
                width: context.screenHeight * .5,
              )
            : Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: context.height20, vertical: context.height20),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: cartController.cart.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                        key: Key(cartController.cart[index].name!),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          cartController
                              .removeFromCart(cartController.cart[index]);
                        },
                        background: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFE6E6),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            children: [
                              const Spacer(),
                              IconButton(
                                icon: const Icon(
                                  FontAwesomeIcons.trash,
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  cartController.removeFromCart(
                                      cartController.cart[index]);
                                },
                              ),
                            ],
                          ),
                        ),
                        child:
                            CartItem(controller: cartController, index: index));
                  },
                )),
        const Spacer(),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: context.height20, vertical: context.height10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    "\$${cartController.totalPrice}",
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Colors.black,
                        ),
                  ),
                ],
              ),
              SizedBox(height: context.height10),
              DefaultButton(
                text: 'Checkout',
                press: () {
                  if (cartController.cart.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Cart is empty'),
                      ),
                    );
                  } else {
                    AppRoute.push(const CheckOutScreen());
                  }
                },
              )
            ],
          ),
        )
      ],
    );
  }
}
