import 'package:flutter/material.dart';
import 'package:tawelty_app/constants.dart';

// ignore: must_be_immutable
class DetailsComponent extends StatelessWidget {
  DetailsComponent({
    required this.icon,
    required this.title,
    required this.description,
  });
  Icon icon;
  String title;
  String description;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Text(description, style: TextStyle(color: kgreyColor)),
          Spacer(flex: 1),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          icon,
        ],
      ),
    );
  }
}
