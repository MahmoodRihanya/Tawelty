import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:tawelty_app/Features/explore/views/home/home_view.dart';
import 'package:tawelty_app/Features/onboarding/views/welcome_view.dart';

void checkLogin(context) async {
  var box =
      Hive.isBoxOpen('authBox')
          ? Hive.box('authBox')
          : await Hive.openBox('authBox');
  bool? loggedIn = box.get('isLoggedIn') as bool?;
  await Future.delayed(const Duration(seconds: 2));
  if (loggedIn == true) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      HomeView.ID,
      (Route<dynamic> route) => false,
    );
  } else {
    Navigator.pushNamedAndRemoveUntil(
      context,
      WelcomeView.ID,
      (Route<dynamic> route) => false,
    );
  }
}
