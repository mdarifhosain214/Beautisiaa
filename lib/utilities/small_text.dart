import 'package:flutter/material.dart';
class SmallText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? size;
  const SmallText({Key? key, required this.text, this.color=Colors.black, this.size=12}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(fontSize: size,color: color),);
  }
}
