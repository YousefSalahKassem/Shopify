import 'package:evira/controller/add_address_controller.dart';
import 'package:evira/controller/address_controller.dart';
import 'package:evira/controller/auth_controller.dart';
import 'package:evira/controller/boarding_controller.dart';
import 'package:evira/controller/cart_controller.dart';
import 'package:evira/controller/landing_controller.dart';
import 'package:evira/controller/product_controller.dart';
import 'package:evira/controller/category_controller.dart';
import 'package:evira/styles/themes.dart';
import 'package:evira/util/global.dart';
import 'package:evira/util/route.dart';
import 'package:evira/view/Boarding/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/favourite_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => BoardingController(),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthController(),
        ),
        ChangeNotifierProvider(
          create: (_) => LandingController(),
        ),
        ChangeNotifierProvider(
          create: (_) => CategoryController(context),
        ),
        ChangeNotifierProvider(
          create: (_) => ProductController(context),
        ),
        ChangeNotifierProvider(
            create: (_) => CartController(),
        ),
        ChangeNotifierProvider(
            create: (_) => FavouriteController(),
        ),
        ChangeNotifierProvider(
            create: (_) =>AddressController(),
        ),
        ChangeNotifierProvider(
            create: (_) =>AddAddressController(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        navigatorKey: Globals.instance.navigatorKey,
        onGenerateRoute: (settings) => AppRoute.onGenerateRoutes(settings),
        theme: theme(),
        home: const SplashScreen(),
      ),
    );
  }
}
