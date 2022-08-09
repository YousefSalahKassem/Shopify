import 'package:evira/view/Authentication/widgets/success_body.dart';
import 'package:flutter/material.dart';

class LoginSuccess extends StatelessWidget {
  String routeType;
  LoginSuccess({Key? key, required this.routeType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Successfully $routeType",),
        centerTitle: true,
      ),
      body: SuccessBody(routeType: routeType,),
    );
  }
}
