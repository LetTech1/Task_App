import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String? text;
  final Color? color;
  final FontWeight? weight;
  final double? size;

  const TitleWidget({Key? key, this.text, this.color, this.size, this.weight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
        color: color,
        fontWeight: weight,
        fontSize: size,
      ),
    );
  }
}
