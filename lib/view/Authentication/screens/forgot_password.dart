import 'package:evira/components/loading.dart';
import 'package:evira/view/Authentication/widgets/forgot_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controller/auth_controller.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<AuthController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forgot Password"),
      ),
      body: controller.loading==true?const LoadingScreen():const ForgotBody(),
      resizeToAvoidBottomInset: false,
    );
  }
}
