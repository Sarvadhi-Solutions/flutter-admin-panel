import 'package:admin_dash/src/constant/color.dart';
import 'package:admin_dash/src/provider/theme/bloc/theme_mode_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  final String icon;
  final Color? color;
  final double? size;
  const SvgIcon({Key? key, required this.icon, this.color, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeModeBloc, ThemeModeState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          success: (themeMode) => SvgPicture.asset(
            icon,
            color: _color(themeMode),
            width: size ?? 20,
            height: size ?? 20,
          ),
        );
      },
    );
  }

  Color? _color(bool themeMode) {
    if (color == null) return themeMode ? ColorConst.white : ColorConst.black;
    return color;
  }
}
