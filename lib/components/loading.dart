import 'package:evira/styles/colors.dart';
import 'package:evira/styles/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child:  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Loading',style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w700, fontSize: context.height20),),
        LottieBuilder.asset('assets/images/loading.json',width: context.height30*5,),
      ],
    ),);
  }
}
