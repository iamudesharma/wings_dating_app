// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SignOptionsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SignOptionsView(),
      );
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          SignOptionsRoute.name,
          path: '/',
        )
      ];
}

/// generated route for
/// [SignOptionsView]
class SignOptionsRoute extends PageRouteInfo<void> {
  const SignOptionsRoute()
      : super(
          SignOptionsRoute.name,
          path: '/',
        );

  static const String name = 'SignOptionsRoute';
}
