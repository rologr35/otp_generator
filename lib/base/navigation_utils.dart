import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationUtils {
  static const homeRoute = '/';
  static const scanRoute = '/scan';

  static Future<dynamic> pushWithRouteAndMaterial(
      BuildContext context, Widget page, String widgetName) {
    final Route route = MaterialPageRoute(
        builder: (context) => page, settings: RouteSettings(name: widgetName));
    return Navigator.push(context, route);
  }

  static Future<dynamic> pushReplacementWithRouteAndMaterial(
      BuildContext context, Widget page, String widgetName) {
    final Route route = MaterialPageRoute(
        builder: (context) => page, settings: RouteSettings(name: widgetName));
    return Navigator.pushReplacement(context, route);
  }

  static popUntilWithRouteAndMaterial(BuildContext context, String widgetName) {
    Navigator.of(context)
        .popUntil((route) => route.settings.name == widgetName);
  }

  static Future<dynamic> push(BuildContext context, Widget page) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  static Future<dynamic> pushNamed(BuildContext context, String routeName,
          {Object? arguments}) =>
      Navigator.pushNamed(context, routeName, arguments: arguments);

  static Future<dynamic> pushModal(BuildContext context, Widget page) {
    return Navigator.push(
      context,
      CupertinoPageRoute(
        fullscreenDialog: true,
        builder: (context) => page,
      ),
    );
  }

  static pushReplacement(BuildContext context, Widget page) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  static pop<T>(BuildContext context, {T? result}) {
    return Navigator.pop(context, result);
  }

  static popUntil<T>(BuildContext context, Widget page) {
    return Navigator.of(context).popUntil(ModalRoute.withName(
        MaterialPageRoute(builder: (context) => page).toString()));
  }

  static pushAndRemoveUntil(BuildContext context, Widget page1, Widget page2) {
    return Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => page1),
        ModalRoute.withName(
            MaterialPageRoute(builder: (context) => page2).toString()));
  }
}
