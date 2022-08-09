import 'package:evira/styles/dimensions.dart';
import 'package:evira/view/Authentication/widgets/forgot_form.dart';
import 'package:flutter/material.dart';

class ForgotBody extends StatelessWidget {
  const ForgotBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding:
          EdgeInsets.symmetric(horizontal: context.height20),
          child: Column(
            children: [
              SizedBox(height: context.screenHeight * 0.04),
              Text(
                "Forgot Password",
                style: TextStyle(
                  fontSize: context.height30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Please enter your email and we will send \nyou a link to return to your account",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: context.screenHeight * 0.1),
              const ForgotForm(),
            ],
          ),
        ),
      ),
    );
  }
}
