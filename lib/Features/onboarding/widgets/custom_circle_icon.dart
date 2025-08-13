import 'package:flutter/material.dart';

class CustomCircleIcon extends StatelessWidget {
  const CustomCircleIcon({super.key, required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: CircleAvatar(backgroundColor: color, radius: 6),
    );
  }
}
