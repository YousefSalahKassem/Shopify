import 'package:evira/components/loading.dart';
import 'package:evira/controller/auth_controller.dart';
import 'package:evira/view/Authentication/widgets/body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<AuthController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
      ),
      body: controller.loading
          ? const LoadingScreen()
          : const LoginBody(),
      resizeToAvoidBottomInset: false,
    );
  }
}
