import 'package:evira/styles/dimensions.dart';
import 'package:evira/util/route.dart';
import 'package:evira/view/Home/screens/home_screen.dart';
import 'package:evira/view/Landing/screens/landing_screen.dart';
import 'package:flutter/material.dart';
import '../../../components/default_button.dart';

class SuccessBody extends StatelessWidget {
  String routeType;
  SuccessBody({Key? key, required this.routeType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: context.screenHeight * 0.04),
        Image.asset(
          "assets/images/success.png",
          height: context.screenHeight * 0.4,
          fit: BoxFit.cover,//40%
        ),
        SizedBox(height: context.screenHeight * 0.08),
        Text(
          "Successfully $routeType",
          style: TextStyle(
            fontSize: context.height30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const Spacer(),
        SizedBox(
          width: context.screenWidth * 0.6,
          child: DefaultButton(
            text: "Back to home",
            press: () {
              AppRoute.pushReplacement(const LandingScreen());
            },
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
