import 'package:flutter/material.dart';

class CostumText extends StatelessWidget {
  final FontWeight fontWeight;
  final double fontSize;
  final Color fontColor;
  final String Data;

  const CostumText(
      {Key? key,
      required this.fontWeight,
      required this.fontSize,
      required this.fontColor,
      required this.Data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      Data,
      style: TextStyle(
          color: fontColor, fontWeight: fontWeight, fontSize: fontSize),
    );
  }
}
