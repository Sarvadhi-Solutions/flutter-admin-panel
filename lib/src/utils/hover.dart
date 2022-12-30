import 'package:flutter/material.dart';

class FxHover extends StatefulWidget {
  final Widget Function(bool isHover) builder;
  const FxHover({Key? key, required this.builder}) : super(key: key);
  @override
  State<FxHover> createState() => _FxHoverState();
}

class _FxHoverState extends State<FxHover> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) => _mouserEnter(true),
      onExit: (e) => _mouserEnter(false),
      child: widget.builder(isHover),
    );
  }

  void _mouserEnter(bool isHovering) {
    setState(() {
      isHover = isHovering;
    });
  }
}
