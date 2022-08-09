import 'package:evira/controller/auth_controller.dart';
import 'package:evira/styles/dimensions.dart';
import 'package:evira/util/route.dart';
import 'package:evira/view/Authentication/screens/login_success.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../components/default_button.dart';
import '../../../components/text_field_app.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<AuthController>(context);
    return Form(
      key: controller.registerKey,
      child: Column(
      children: [
        TextFieldApp(label: 'userName', hint: 'Enter your userName', controller: controller.userNameController, icon: Icons.person, type: TextInputType.text, valid: 'UserName is Required',),
        SizedBox(height: context.height30),
        TextFieldApp(label: 'email', hint: 'Enter your email', controller: controller.emailController, icon: Icons.email_outlined, type: TextInputType.emailAddress, valid: 'Email is Required',),
        SizedBox(height: context.height30),
        TextFieldApp(label: 'password', hint: 'Enter your password', controller: controller.passwordController, icon: Icons.lock_outline, type: TextInputType.text, isPassword: true, valid: 'Password is Required',),
        SizedBox(height: context.height30),
        TextFieldApp(label: 'confirm password', hint: 'Enter your password', controller: controller.confirmPasswordController, icon: Icons.lock_outline, type: TextInputType.text, isPassword: true, valid: 'Password is Required',),
        SizedBox(height: context.height20*2),
        DefaultButton(
          text: "Register",
          press: () {
            if (controller.registerKey.currentState!.validate() && controller.passwordController.text == controller.confirmPasswordController.text) {
              controller.registerKey.currentState!.save();
              controller.isRegistered(context).then((value) {
                if (value) {
                  AppRoute.pushReplacement(
                      LoginSuccess(routeType: 'register'));
                }
              });
            }
          },
        ),
      ],
    ));
  }
}
