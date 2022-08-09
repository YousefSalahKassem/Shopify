import 'package:evira/styles/colors.dart';
import 'package:evira/styles/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controller/landing_controller.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30), topLeft: Radius.circular(30)),
        boxShadow: [
          BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 5),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(30), topLeft: Radius.circular(30)),
        child: BottomNavigationBar(
            backgroundColor: Colors.white,
            unselectedItemColor: inActiveIconColor,
            selectedItemColor: kPrimaryColor,
            currentIndex: Provider.of<LandingController>(context).tabIndex,
            onTap: (index) => Provider.of<LandingController>(context, listen: false).changeTab(index),
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined,size: context.height30,),
                  label: ''
              ),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_outlined),
                  label: ''
              ),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border_outlined),
                  label: ''
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline,size: context.height30,),
                  label: ''
              ),
            ]),
      ),
    );
  }
}
