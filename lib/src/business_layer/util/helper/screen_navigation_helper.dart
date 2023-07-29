import 'package:flutter/material.dart';
import 'package:green_spark_vendor/src/data_layer/res/numbers.dart';

class ScreenNavigation {
  /* Function used to create custom animated route */
  static Route createRoute({required Widget widget, String? routeNames}) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(d_0, d_0);
        var end = Offset.zero;
        var curve = Curves.ease;
        var tween = Tween(
          begin: begin,
          end: end,
        ).chain(
          CurveTween(
            curve: curve,
          ),
        );
        return FadeTransition(
          opacity: animation,
          child: child,
        );
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
      settings: RouteSettings(name: routeNames),
    );
  }
}
