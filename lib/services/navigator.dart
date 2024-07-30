import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigatorService {
  ///Navigate to a page
  Future<Object?> navigate(BuildContext context, Widget page) {
    return Navigator.of(context).push(CupertinoPageRoute(
        builder: (context) => page,
        settings: RouteSettings(name: page.toString())));
  }

  ///Navigate to a page with slide routing
  void pop(BuildContext context, {Object? obj}) {
    if (ModalRoute.of(context)!.isFirst) {
      Navigator.of(context).pop(obj);
    } else {
      Navigator.of(context).pop(obj);
    }
  }

  ///Pop current page and navigate to a page
  Future<Object?> replaceNavigate(BuildContext context, Widget page) {
    return Navigator.of(context).pushReplacement(CupertinoPageRoute(
        builder: (context) => page,
        settings: RouteSettings(name: page.toString())));
  }

  ///Pop to first page and navigate to a page
  Future<Object?> clearNavigate(BuildContext context, Widget page) {
    Navigator.of(context).popUntil((route) => route.isFirst);
    return Navigator.of(context).pushReplacement(CupertinoPageRoute(
        builder: (context) => page,
        settings: RouteSettings(name: page.toString())));
  }

  ///Show a snackbar
  showSnackbar(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(msg, style: Theme.of(context).primaryTextTheme.bodyLarge),
        backgroundColor: Theme.of(context).colorScheme.secondary));
  }
}
