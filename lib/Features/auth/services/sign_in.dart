import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive/hive.dart';
import 'package:tawelty_app/Features/auth/helper/show_snack_par.dart';

import 'package:tawelty_app/Features/explore/views/home/home_view.dart';
import 'package:tawelty_app/globals.dart';

signIn(String gmail, String password, context) async {
  await GoogleSignIn().signOut();
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: gmail,
      password: password,
    );
    String? userId = await credential.user!.getIdToken();
    var box = Hive.box('authBox');
    await box.put('userUid', credential.user!.uid);
    await box.put('isLoggedIn', true);
    showSnackBar(context, '😊أهلاًوسهلاً');
    currentUserId = gmail;
    Navigator.pushNamedAndRemoveUntil(
      context,
      HomeView.ID,
      (Route<dynamic> route) => false,
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'invalid-email') {
      showSnackBar(context, '🙂المستخدم غير موجود الرجاء إنشاء حساب أولا');
    } else if (e.code == 'wrong-password') {
      showSnackBar(context, '😔كلمة مرور خاطئة');
    }
  }
}
