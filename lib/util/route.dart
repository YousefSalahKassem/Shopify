import 'package:flutter/cupertino.dart';

import '../view/Boarding/screens/boarding_screen.dart';
import 'global.dart';

class AppRoute {
  static const String onBoard = '/';


  static Route<dynamic> onGenerateRoutes(RouteSettings routeSettings) {
    Widget getPage(String? name) {
      switch (name) {
        default:
          return const BoardingScreen();
      }
    }

    return CupertinoPageRoute(
        settings: routeSettings,
        builder: (context) => getPage(routeSettings.name));
  }

  static Route<T> getRoute<T>(Widget widget, [String? name]) {
    return CupertinoPageRoute(
        settings: RouteSettings(name: name), builder: (context) => widget);
  }

  static Future<T?>? push<T extends Object?>(Widget page, {String? name}) =>
      Globals.instance.navigatorKey.currentState?.push<T>(getRoute(page, name));

  static Future<T?>? pushReplacement<T extends Object?, TO extends Object>(
      Widget page,
      {String? name,
        TO? result}) =>
      Globals.instance.navigatorKey.currentState
          ?.pushReplacement<T, TO>(getRoute(page, name), result: result);

  static Future<T?>? pushNamed<T extends Object?>(String page) =>
      Globals.instance.navigatorKey.currentState?.pushNamed<T>(page);

  static void pop<T extends Object?>() =>
      Globals.instance.navigatorKey.currentState?.pop<T>();
}