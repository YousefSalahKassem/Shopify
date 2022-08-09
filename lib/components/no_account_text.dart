import 'package:evira/styles/dimensions.dart';
import 'package:evira/util/route.dart';
import 'package:evira/view/Authentication/screens/register_screen.dart';
import 'package:flutter/material.dart';

import '../styles/colors.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don’t have an account? ",
          style: TextStyle(fontSize: context.height15),
        ),
        GestureDetector(
          onTap: () {
            AppRoute.push(const RegisterScreen());
          },
          child: Text(
            "Sign Up",
            style: TextStyle(
                fontSize: context.height15,
                color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}