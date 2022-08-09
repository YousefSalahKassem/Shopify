import 'package:evira/view/Landing/widgets/custom_bottom_nav_bar.dart';
import 'package:evira/view/Landing/widgets/landing_body.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LandingBody(),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
