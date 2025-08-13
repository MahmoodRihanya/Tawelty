import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomSubtitle extends StatelessWidget {
  CustomSubtitle({required this.title, required this.ontap});
  GestureTapCallback ontap;
  String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: ontap,
            child: Text('عرض الكل', style: TextStyle(color: Colors.grey)),
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}
