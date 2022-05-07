import 'dart:ui';

import 'package:flutter/material.dart';

class _TXBlurDialog extends StatelessWidget {
  final Widget? child;
  final double blurX, blurY;

  const _TXBlurDialog({
    Key? key,
    this.child,
    this.blurX = 2.0,
    this.blurY = 2.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: blurX, sigmaY: blurY),
      child: child,
    );
  }
}

///the same as [showDialog()]
/// for every flutter upgrade, upgrade this function too. Current flutter: 2.8.x
Future<T?> showBlurDialog<T>({
  required BuildContext context,
  bool barrierDismissible = true,
  required WidgetBuilder builder,
  double blurX = 2.0,
  double blurY = 2.0,
}) async {
  assert(debugCheckHasMaterialLocalizations(context));

  final ThemeData theme = Theme.of(context);

  return showGeneralDialog(
    context: context,
    pageBuilder: (BuildContext buildContext, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      final Widget pageChild = _TXBlurDialog(
        blurX: blurX,
        blurY: blurY,
        child: Builder(builder: builder),
      );
      return SafeArea(
        child: Builder(builder: (BuildContext context) {
          return Theme(data: theme, child: pageChild);
        }),
      );
    },
    barrierDismissible: barrierDismissible,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Color(0x8A656C79),
    transitionDuration: const Duration(milliseconds: 150),
    transitionBuilder: _buildMaterialDialogTransitions,
  ) as T?;
}

Widget _buildMaterialDialogTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child) {
  return FadeTransition(
    opacity: CurvedAnimation(
      parent: animation,
      curve: Curves.easeOut,
    ),
    child: child,
  );
}
