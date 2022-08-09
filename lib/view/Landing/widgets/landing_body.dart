import 'package:evira/view/Favourite/screens/favourite_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/landing_controller.dart';
import '../../Cart/screens/cart_screen.dart';
import '../../Home/screens/home_screen.dart';
import '../../Profile/screens/profile_screen.dart';

class LandingBody extends StatelessWidget {
  const LandingBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: Provider.of<LandingController>(context).tabIndex,
      children: const [
        HomeScreen(),
        CartScreen(),
        FavouriteScreen(),
        ProfileScreen(),
      ],
    );
  }
}
