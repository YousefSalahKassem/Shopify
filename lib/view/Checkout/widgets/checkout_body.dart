import 'package:evira/styles/dimensions.dart';
import 'package:evira/view/Checkout/widgets/addresses.dart';
import 'package:evira/view/Checkout/widgets/orders.dart';
import 'package:evira/view/Checkout/widgets/summary.dart';
import 'package:flutter/material.dart';

class CheckOutBody extends StatelessWidget {
  const CheckOutBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: context.height20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.height10),
            child: const Text(
              'Orders',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          const Orders(),
          SizedBox(
            height: context.height10,
          ),
          const Divider(
            thickness: 1,
          ),
          SizedBox(
            height: context.height10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.height10),
            child: const Text(
              'Pick Address',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          const Addresses(),
          const Divider(
            thickness: 1,
          ),
          SizedBox(
            height: context.height10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.height10),
            child: const Text(
              'Summary',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: context.height20,
          ),
          const Summary(),
        ],
      ),
    );
  }
}
