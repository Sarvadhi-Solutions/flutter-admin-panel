// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../views/dashboard/dashboard.dart' as _i2;
import '../views/menu_bar.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    MenuBar.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.MenuBar(),
      );
    },
    Dashboard.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.Dashboard(),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          MenuBar.name,
          path: '/',
          children: [
            _i3.RouteConfig(
              '#redirect',
              path: '',
              parent: MenuBar.name,
              redirectTo: 'dashboard',
              fullMatch: true,
            ),
            _i3.RouteConfig(
              Dashboard.name,
              path: 'dashboard',
              parent: MenuBar.name,
            ),
          ],
        )
      ];
}

/// generated route for
/// [_i1.MenuBar]
class MenuBar extends _i3.PageRouteInfo<void> {
  const MenuBar({List<_i3.PageRouteInfo>? children})
      : super(
          MenuBar.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'MenuBar';
}

/// generated route for
/// [_i2.Dashboard]
class Dashboard extends _i3.PageRouteInfo<void> {
  const Dashboard()
      : super(
          Dashboard.name,
          path: 'dashboard',
        );

  static const String name = 'Dashboard';
}
