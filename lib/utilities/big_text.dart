import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? size;
  const BigText({Key? key, required this.text, this.color= Colors.black, this.size=16}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(color: color,fontSize: size,fontWeight: FontWeight.bold,letterSpacing: 0.5),);
  }
}
