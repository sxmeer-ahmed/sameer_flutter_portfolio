import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sameer_flutter_portfolio/CORE/ProviderModels/CursorProvider.dart';
import 'package:provider/provider.dart';

typedef OnPressed = void Function();

class HoverableButton extends StatefulWidget {
  final Widget child;
  final OnPressed onPressed;
  final double height;
  final double width;

  const HoverableButton(
      {Key key, this.onPressed, this.child, this.height, this.width})
      : super(key: key);

  @override
  _HoverableButtonState createState() => _HoverableButtonState();
}

class _HoverableButtonState extends State<HoverableButton> {
  @override
  Widget build(BuildContext context) {
    final cursorProvider = Provider.of<CursorProvider>(context);
    return GestureDetector(
      child: MouseRegion(
        cursor: SystemMouseCursors.none,
        onEnter: (_) {
          cursorProvider.setIsHoveringLinks(true);
        },
        onExit: (_) {
          cursorProvider.setIsHoveringLinks(false);
        },
        child: Container(
          height: widget.height,
          width: widget.width,
          child: Center(
            child: AnimatedAlign(
              alignment: Alignment.bottomCenter,
              duration: const Duration(milliseconds: 400),
              child: widget.child,
            ),
          ),
        ),
      ),
      onTap: widget.onPressed,
    );
  }
}
