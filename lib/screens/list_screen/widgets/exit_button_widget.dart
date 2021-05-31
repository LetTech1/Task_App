import 'package:flutter/material.dart';

class ExitButtonWidget extends StatelessWidget {
  final Widget iconButton;
  final Color? color;
  final VoidCallback? onPressed;

  const ExitButtonWidget(
      {Key? key, required this.iconButton, this.color, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: iconButton,
      color: color,
      onPressed: onPressed == null ? null : onPressed!,
    );
  }
}
