import 'package:flutter/material.dart';

class TXIconButtonWidget extends StatelessWidget {
  final Widget icon;
  final Function()? onPressed;

  const TXIconButtonWidget({
    Key? key,
    required this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: 20,
      icon: icon,
      onPressed: onPressed,
    );
  }
}
