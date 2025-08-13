import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:tawelty_app/Features/onboarding/views/welcome_view.dart';
import 'package:tawelty_app/globals.dart';

void logout(context) async {
  await FirebaseAuth.instance.signOut();

  currentUserLocality = '';
  currentUserId = '';
  currentUserLat = 0;
  currentUserLng = 0;
  var box = Hive.box('authBox');
  await box.delete('userUid');
  await box.delete('isLoggedIn');
  Navigator.pushNamedAndRemoveUntil(
    context,
    WelcomeView.ID,
    (Route<dynamic> route) => false,
  );
}
