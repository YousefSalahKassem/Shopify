import 'package:evira/controller/auth_controller.dart';
import 'package:evira/util/route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import '../view/Authentication/screens/login_screen.dart';
import '../view/Boarding/screens/boarding_screen.dart';
import '../view/Landing/screens/landing_screen.dart';

Future checkFirstSeen(BuildContext context) async {
  const storage = FlutterSecureStorage();
  String? result = await storage.read(key: "result")??"false";

  if(result == "true") {
    if(await Provider.of<AuthController>(context, listen: false).getUserToken()==false) {
      AppRoute.pushReplacement(const LandingScreen());
    }
    else {
      AppRoute.pushReplacement(const LoginScreen());
    }
  }
  else{
    await storage.write(key: "result", value: "true");
    AppRoute.pushReplacement(const BoardingScreen());
  }
}
