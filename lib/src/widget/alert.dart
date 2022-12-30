import 'package:admin_dash/src/constant/text.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class FxAlert {
  FxAlert.showAlert({
    required BuildContext context,
    required String content,
    double radius = 8.0,
    required List<Widget> actions,
    bool barrierDismissible = true,
    TextStyle? contentTextStyle,
    Color barrierColor = Colors.black54,
    MainAxisAlignment actionsAlignment = MainAxisAlignment.spaceEvenly,
    EdgeInsetsGeometry intentPadding = const EdgeInsets.all(12.0),
  }) {
    showDialog(
      barrierColor: barrierColor,
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          child: Container(
            padding: intentPadding,
            width: 500.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FxBox.h20,
                ConstText.largeText(
                  text: content,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                ),
                FxBox.h20,
                Row(
                  mainAxisAlignment: actionsAlignment,
                  children: actions
                      .map((e) => Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: e,
                          ))
                      .toList(),
                ),
                FxBox.h20,
              ],
            ),
          ),
        );
      },
    );
  }
}
