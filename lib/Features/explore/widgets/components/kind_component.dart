import 'package:flutter/material.dart';
import 'package:tawelty_app/constants.dart';

class KindComponent extends StatelessWidget {
  const KindComponent({super.key, required this.kind});
  final String kind;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(kind, style: TextStyle(color: kgreyColor, fontSize: 18)),
          Icon(Icons.expand_more, color: kgreyColor),
        ],
      ),
    );
  }
}
