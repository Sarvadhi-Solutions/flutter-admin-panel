import 'package:admin_dash/src/constant/theme.dart';
import 'package:admin_dash/src/provider/theme/bloc/theme_mode_bloc.dart';
import 'package:admin_dash/src/routes/routes.gr.dart';
import 'package:admin_dash/src/utils/hive/hive.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    await HiveUtils.init();
    themeModeBloc.add(const ThemeModeEvent.changeTheme(null));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => themeModeBloc,
      child: BlocBuilder<ThemeModeBloc, ThemeModeState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            success: (themeMode) {
              return MaterialApp.router(
                routerDelegate: _appRouter.delegate(
                  initialRoutes: [
                    const MenuBar(),
                  ],
                ),
                routeInformationParser: _appRouter.defaultRouteParser(),
                debugShowCheckedModeBanner: false,
                theme: ThemeClass.themeData(themeMode, context),
                scrollBehavior: const MaterialScrollBehavior().copyWith(
                  dragDevices: {
                    PointerDeviceKind.mouse,
                    PointerDeviceKind.touch,
                    PointerDeviceKind.stylus,
                    PointerDeviceKind.trackpad,
                    PointerDeviceKind.unknown
                  },
                ),
                title: 'AdminKit',
              );
            },
          );
        },
      ),
    );
  }
}
