import 'package:evira/util/route.dart';
import 'package:flutter/material.dart';
import '../model/boarding_model.dart';
import '../styles/colors.dart';
import '../view/Authentication/screens/login_screen.dart';

class BoardingController with ChangeNotifier {
  int _currentIndex = 0;
  PageController pageController = PageController(initialPage: 0);



  int get currentIndex => _currentIndex;
  final List<Boarding> _boardings = [
    Boarding(
      title: "Welcome to Shopify, Lets shop!",
      image: "assets/images/splash_1.png",
    ),
    Boarding(
      title: "We help people to shop easily and fast",
      image: "assets/images/splash_2.png",
    ),
    Boarding(
      title: "Explore now!",
      image: "assets/images/splash_3.png",
    ),
  ];

  List<Boarding> get boardings => _boardings;

  set currentIndex(int value) {
    _currentIndex = value;
    notifyListeners();
  }

  void setCurrentIndex(int value) {
    _currentIndex = value;
    notifyListeners();
  }

  void nextPage(){
    if(currentIndex==boardings.length-1){
      AppRoute.pushReplacement( const LoginScreen());

    }
    else{
      pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }
    notifyListeners();
  }

  AnimatedContainer buildDot(int index) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: currentIndex == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentIndex == index ? kPrimaryColor : const Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
