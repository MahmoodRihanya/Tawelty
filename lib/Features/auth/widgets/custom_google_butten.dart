import 'package:flutter/material.dart';
import 'package:tawelty_app/Features/auth/services/register_with_google.dart';

import 'package:tawelty_app/Features/explore/views/home/home_view.dart';
import 'package:tawelty_app/globals.dart';

class CustomGoogleButten extends StatelessWidget {
  const CustomGoogleButten({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await RegisterwithGoogle().signInWithGoogle();
        currentUserId = RegisterwithGoogle.name!;
        Navigator.pushNamedAndRemoveUntil(
          context,
          HomeView.ID,
          (Route<dynamic> route) => false,
        );
      },
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Color(0xffF2F2F2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Google تسجيل دخول باستخدام ',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              Image.asset('assets/images/google.webp'),
            ],
          ),
        ),
      ),
    );
  }
}
