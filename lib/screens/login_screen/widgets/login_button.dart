import 'package:flutter/material.dart';

class LoginButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final Widget name;

  const LoginButton({Key? key, this.onPressed, required this.name})
      : super(key: key);

  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return RaisedButton(
      onPressed: widget.onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      child: widget.name,
      color: Theme.of(context).primaryColor,
      disabledColor: Theme.of(context).primaryColor.withAlpha(100),
      textColor: Colors.white,
    );
  }
}
