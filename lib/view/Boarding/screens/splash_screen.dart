import 'dart:async';
import 'package:after_layout/after_layout.dart';
import 'package:animate_do/animate_do.dart';
import 'package:evira/styles/dimensions.dart';
import 'package:flutter/material.dart';
import '../../../util/functions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with AfterLayoutMixin {
  Future<String> updateSplash() async {
    await Future.delayed(const Duration(seconds: 3));
    return "-1";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
              color: Colors.deepOrangeAccent,
              gradient: LinearGradient(
                  colors: [Colors.deepOrangeAccent, Colors.orangeAccent],
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft)),
        ),
        FadeInDown(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/images/logo.png",
              width: 200,
              height: 200,
            ),
            const Padding(padding: EdgeInsets.only(top: 20.0)),
            Text(
              "Shopify",
              style: TextStyle(
                  fontSize: context.height30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ))
      ],
    ));
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    await updateSplash();
    await checkFirstSeen(context);
  }
}
