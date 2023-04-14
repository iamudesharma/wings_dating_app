import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wings_dating_app/helpers/logger.dart';

class MyObserver extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    logger.i('New route pushed: ${route.settings.name}');
  }

  // only override to observer tab routes
  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    logger.i('Tab route visited: ${route.name}');
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    logger.i('Tab route re-visited: ${route.name}');
  }
}
