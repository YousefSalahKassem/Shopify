import 'package:evira/components/text_field_app.dart';
import 'package:evira/controller/auth_controller.dart';
import 'package:evira/styles/dimensions.dart';
import 'package:evira/util/route.dart';
import 'package:evira/view/Authentication/screens/forgot_password.dart';
import 'package:evira/view/Authentication/screens/login_success.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/default_button.dart';

class SignForm extends StatelessWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<AuthController>(context);
    return Form(
      key: controller.loginKey,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: context.height10,
        ),
        height: context.height30 * 11,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFieldApp(
              label: 'email',
              hint: 'Enter your email',
              controller: controller.emailController,
              icon: Icons.email_outlined,
              type: TextInputType.emailAddress,
              valid: 'Email is Required',
            ),
            SizedBox(height: context.height30),
            TextFieldApp(
              label: 'password',
              hint: 'Enter your password',
              controller: controller.passwordController,
              icon: Icons.lock_outline,
              type: TextInputType.text,
              isPassword: true,
              valid: 'Password is Required',
            ),
            SizedBox(height: context.height15),
            GestureDetector(
              onTap: () {
                AppRoute.push(const ForgotPassword());
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.height10,
                ),
                child: const Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            ),
            const Spacer(),
            DefaultButton(
              text: "Login",
              press: () {
                if (controller.loginKey.currentState!.validate()) {
                  controller.isLoggedIn(context).then((value) {
                    if (value) {
                      AppRoute.pushReplacement(
                          LoginSuccess(routeType: 'Login'));
                    }
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
