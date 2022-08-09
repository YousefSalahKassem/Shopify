import 'package:evira/styles/dimensions.dart';
import 'package:evira/view/Home/widgets/home_header.dart';
import 'package:evira/view/Home/widgets/popular_product.dart';
import 'package:flutter/material.dart';

import '../widgets/categories.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: context.height20,),
                const HomeHeader(),
                SizedBox(height: context.height20,),
                const Categories(),
                SizedBox(height: context.height30,),
                const PopularProduct(),
              ],
            ),
          ),
        ),
        resizeToAvoidBottomInset: true,
    );
  }
}
