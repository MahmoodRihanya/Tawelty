import 'package:flutter/material.dart';
import 'package:tawelty_app/constants.dart';

// ignore: must_be_immutable
class BottombarCombonent extends StatelessWidget {
  BottombarCombonent({
    required this.icon,
    required this.text,
    required this.ontap,
  });
  Icon icon;
  String text;
  GestureTapCallback ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Column(
        children: [
          Padding(padding: const EdgeInsets.only(top: 15), child: icon),
          Text(text, style: TextStyle(color: kgreyColor)),
        ],
      ),
    );
  }
}
