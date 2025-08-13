import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tawelty_app/Features/auth/helper/show_snack_par.dart';
import 'package:tawelty_app/Features/auth/views/login_view.dart';

createUser(String email, String password, context) async {
  try {
    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    showSnackBar(context, '😊تم انشاء الحساب بنجاح');
    Navigator.pushNamed(context, LoginView.ID);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      showSnackBar(context, '😔كلمة سر ضعيفة');
    } else if (e.code == 'email-already-in-use') {
      showSnackBar(context, '😁هذا الرقم موجود فعلا');
    }
  } catch (e) {
    showSnackBar(context, '☹️حاول مرة اخرى لاحقا');
  }
}
