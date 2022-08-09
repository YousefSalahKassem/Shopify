import 'package:evira/controller/auth_controller.dart';
import 'package:evira/util/route.dart';
import 'package:evira/view/Addresses/screens/add_address_screen.dart';
import 'package:evira/view/Addresses/screens/addresses_screen.dart';
import 'package:evira/view/Profile/widgets/profile_info.dart';
import 'package:evira/view/Profile/widgets/profile_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Authentication/screens/login_screen.dart';

class ProfileBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<AuthController>(context);
    return Column(
      children: [
        const ProfileInformation(),
        const SizedBox(height: 20),
        ProfileMenu(
          text: "My Account",
          icon: "assets/icons/User Icon.svg",
          press: () => {},
        ),
        ProfileMenu(
          text: "Addresses",
          icon: "assets/icons/Location point.svg",
          press: () {
            AppRoute.push(const AddressesScreen());
          },
        ),
        ProfileMenu(
          text: "Settings",
          icon: "assets/icons/Settings.svg",
          press: () {},
        ),
        ProfileMenu(
          text: "Help Center",
          icon: "assets/icons/Question mark.svg",
          press: () {},
        ),
        ProfileMenu(
          text: "Log Out",
          icon: "assets/icons/Log out.svg",
          press: () {
            controller.deleteUserDataAndLoginStatus();
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
              (Route<dynamic> route) => false,
            );
          },
        ),
      ],
    );
  }
}
