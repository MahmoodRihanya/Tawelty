import 'package:flutter/material.dart';
import 'package:tawelty_app/constants.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          semanticsLabel: 'جار التحميل',
          backgroundColor: Colors.white,
          color: kprimaryColor,
        ),
      ),
    );
  }
}
