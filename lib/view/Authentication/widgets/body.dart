import 'package:evira/styles/dimensions.dart';
import 'package:evira/view/Authentication/widgets/sing_form.dart';
import 'package:flutter/material.dart';

import '../../../components/no_account_text.dart';
import '../../../components/social_card.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  Column(
        children: [
          SizedBox(height: context.screenHeight * 0.04),
          Text(
            "Welcome Back",
            style: TextStyle(
              color: Colors.black,
              fontSize: context.height30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "Sign in with your email and password  \nor continue with social media",
            textAlign: TextAlign.center,
          ),
          SizedBox(height: context.screenHeight  * 0.08),
          const SignForm(),
          SizedBox(height: context.screenHeight  * 0.08),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocalCard(
                icon: "assets/icons/google-icon.svg",
                press: () {},
              ),
              SocalCard(
                icon: "assets/icons/facebook-2.svg",
                press: () {},
              ),
              SocalCard(
                icon: "assets/icons/twitter.svg",
                press: () {},
              ),
            ],
          ),
          SizedBox(height: context.height20 ),
          const NoAccountText(),
        ],
      ),
    );
  }
}