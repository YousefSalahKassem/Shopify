import 'package:evira/components/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/auth_controller.dart';
import '../widgets/register_body.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<AuthController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: controller.loading ? const LoadingScreen() : const RegisterBody(),
      resizeToAvoidBottomInset: false,
    );
  }
}
