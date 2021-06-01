import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget name;

  const LoginButton({Key? key, this.onPressed, required this.name})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return RaisedButton(
      onPressed: onPressed == null ? null : onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      child: name,
      color: Theme.of(context).primaryColor,
      disabledColor: Theme.of(context).primaryColor.withAlpha(100),
      textColor: Colors.white,
    );
  }
}
