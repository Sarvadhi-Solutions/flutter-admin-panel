import 'dart:math' as math;
import 'dart:ui' show lerpDouble;

import 'package:admin_dash/src/utils/hover.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class FxButton extends StatelessWidget {
  final bool fullWidth;
  final Widget? icon;
  final double borderWidth;
  final double borderRadius;
  final void Function()? onPressed;
  final void Function()? onLongPress;
  final void Function(bool)? onHighlightChanged;
  final MouseCursor? mouseCursor;
  final double? minWidth;
  final double? height;
  final FocusNode? focusNode;
  final bool autofocus;
  final String? text;
  final Color? textColor;
  final Color? hoverTextColor;
  final FontWeight? textWeight;
  final bool enableFeedback;
  final EdgeInsetsGeometry? padding;
  final double? elevation;
  final double? hoverElevation;
  final Color? color;
  final Color? hoverColor;
  final double? fontSize;

  const FxButton({
    Key? key,
    this.fullWidth = false,
    this.icon,
    this.borderWidth = 1.0,
    this.borderRadius = 12.0,
    required this.onPressed,
    this.onLongPress,
    this.onHighlightChanged,
    this.mouseCursor,
    this.minWidth,
    this.height,
    this.autofocus = false,
    this.focusNode,
    this.text,
    this.textColor,
    this.hoverTextColor,
    this.textWeight,
    this.enableFeedback = true,
    this.padding = const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
    this.elevation,
    this.hoverElevation,
    this.color,
    this.hoverColor,
    this.fontSize,
  })  : assert((fullWidth && minWidth == null) ||
            (!fullWidth && minWidth != null) ||
            (!fullWidth && minWidth == null)),
        assert(text != null || icon != null),
        assert(elevation == null || elevation >= 0.0),
        assert(hoverElevation == null || hoverElevation >= 0.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final double scale = MediaQuery.maybeOf(context)?.textScaleFactor ?? 1;
    final double gap =
        scale <= 1 ? 8 : lerpDouble(8, 4, math.min(scale - 1, 1))!;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return FxHover(
      builder: (isHover) {
        return MaterialButton(
          enableFeedback: enableFeedback,
          autofocus: autofocus,
          onPressed: onPressed,
          onLongPress: onLongPress,
          onHighlightChanged: onHighlightChanged,
          mouseCursor: mouseCursor,
          elevation: elevation,
          hoverElevation: hoverElevation,
          highlightElevation: 0.0,
          focusElevation: 0.0,
          padding: padding,
          colorBrightness: Theme.of(context).brightness,
          color: color ?? colorScheme.primary,
          hoverColor: hoverColor ??
              (colorScheme.brightness == Brightness.dark
                  ? colorScheme.inversePrimary
                  : colorScheme.onPrimaryContainer),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(
              width: borderWidth,
              color: color ?? colorScheme.primary,
            ),
          ),
          minWidth: fullWidth ? double.infinity : minWidth,
          height: height,
          textColor: isHover
              ? hoverTextColor ??
                  (colorScheme.brightness == Brightness.dark
                      ? colorScheme.onPrimaryContainer
                      : colorScheme.onPrimary)
              : textColor ?? colorScheme.onPrimary,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              icon ?? FxBox.shrink,
              icon != null && text != null
                  ? SizedBox(width: gap)
                  : FxBox.shrink,
              text != null
                  ? Flexible(
                      child: Text(
                      text!,
                      style: TextStyle(
                        fontWeight: textWeight,
                        fontSize: fontSize,
                      ),
                    ))
                  : FxBox.shrink,
            ],
          ),
        );
      },
    );
  }
}
