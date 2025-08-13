import 'package:flutter/material.dart';
import 'package:tawelty_app/constants.dart';

class CustomOnboardingAppbar extends StatelessWidget {
  const CustomOnboardingAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      decoration: BoxDecoration(
        color: kprimaryColor,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.elliptical(MediaQuery.of(context).size.width, 110),
        ),
      ),
    );
  }
}
