import 'package:evira/components/text_field_app.dart';
import 'package:evira/controller/auth_controller.dart';
import 'package:evira/styles/dimensions.dart';
import 'package:evira/util/route.dart';
import 'package:evira/view/Authentication/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/default_button.dart';
import '../../../components/no_account_text.dart';

class ForgotForm extends StatelessWidget {
  const ForgotForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<AuthController>(context);
    return Form(
      key: controller.forgotPasswordKey,
      child: Column(
        children: [
          TextFieldApp(label: 'Email', hint: 'Enter your email', valid: 'email is required', controller: controller.emailController, icon: Icons.email_outlined, type: TextInputType.emailAddress),
          SizedBox(height: context.height30),
          SizedBox(height: context.screenHeight * 0.1),
          DefaultButton(
            text: "Reset Password",
            press: () {
              if (controller.forgotPasswordKey.currentState!.validate()) {
                controller.forgotPasswordKey.currentState!.save();
                controller.forgotPassword(context).whenComplete(() => AppRoute.pushReplacement(const LoginScreen()));
              }
            },
          ),
          SizedBox(height: context.screenHeight * 0.1),
          const NoAccountText(),
        ],
      ),
    );
  }
}
