import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({
    required this.ontap,
    required this.text,
    required this.backGroundColor,
    required this.textColor,
    required this.width,
  });
  Color backGroundColor;
  Color textColor;
  String text;
  VoidCallback ontap;
  double width;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: width,
        height: 50,
        decoration: BoxDecoration(
          color: backGroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(text, style: TextStyle(fontSize: 20, color: textColor)),
        ),
      ),
    );
  }
}
