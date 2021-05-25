import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sameer_flutter_portfolio/CORE/ProviderModels/CursorProvider.dart';
import 'package:provider/provider.dart';

class DefaultCursor extends StatelessWidget {
  final Color color;

  const DefaultCursor({Key key, this.color = Colors.black}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiModel = Provider.of<CursorProvider>(context);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      height: uiModel.isHoveringLinks ? 300 : 200,
      width: uiModel.isHoveringLinks ? 300 : 200,
      decoration: BoxDecoration(
          color: uiModel.isHoveringLinks
              ? color.withOpacity(0.2)
              : Colors.transparent,
          borderRadius: BorderRadius.all(
              Radius.circular(uiModel.isHoveringLinks ? 150 : 100)),
          border: Border.all(width: 4, color: color, style: BorderStyle.solid)),
    );
  }
}
