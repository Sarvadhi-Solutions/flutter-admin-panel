import 'package:admin_dash/src/views/menu_bar.dart';
import 'package:admin_dash/src/views/dashboard/dashboard.dart';
import 'package:auto_route/auto_route.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: MenuBar,
      children: [
        RedirectRoute(path: '', redirectTo: 'dashboard'),
        AutoRoute(path: 'dashboard', page: Dashboard),
      ],
    ),
  ],
)
class $AppRouter {}
