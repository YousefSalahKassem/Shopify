import 'package:evira/styles/dimensions.dart';
import 'package:flutter/material.dart';
import '../../../styles/colors.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    this.text,
    this.image,
  }) : super(key: key);
  final String? text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Spacer(),
        Text(
          "Shopify",
          style: TextStyle(
            fontSize: context.height30,
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: context.height10),
        Text(
          text!,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: context.height20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(flex: 2),
        Image.asset(
          image!,
          width: context.height20*20,
        ),
      ],
    );
  }
}